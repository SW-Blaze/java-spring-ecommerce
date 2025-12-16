package com.example.ecommerce.controller.admin;

import com.example.ecommerce.service.BrandService;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.service.UploadService;

import jakarta.validation.Valid;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce.domain.Brand;
import com.example.ecommerce.domain.Category;
import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.ProductAttribute;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;
    private final BrandService brandService;
    private final CategoryService categoryService;

    ProductController(ProductService productService, UploadService uploadService, BrandService brandService,
            CategoryService categoryService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.brandService = brandService;
        this.categoryService = categoryService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // Convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // Page = 1
            }
        } catch (Exception e) {
            // Page = 1
            // TODO: Handle exception
        }
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> listProducts = prs.getContent();
        model.addAttribute("products", listProducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());

        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        List<Brand> listBrands = brandService.getAllBrands();
        model.addAttribute("brands", listBrands);

        List<Category> listCategories = categoryService.getAllCategories();
        model.addAttribute("categories", listCategories);

        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String CreateProductPage(Model model, @ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newProductBindingResult, @RequestParam("zeryfFile") MultipartFile file) {

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            // Load lại dữ liệu cho Dropdown
            List<Brand> listBrands = brandService.getAllBrands();
            model.addAttribute("brands", listBrands);

            List<Category> listCategories = categoryService.getAllCategories();
            model.addAttribute("categories", listCategories);

            return "admin/product/create";
        }

        String image = this.uploadService.handleSaveUploadFile(file, "product");
        pr.setImage(image);

        if (pr.getAttributes() != null) {
            for (ProductAttribute attr : pr.getAttributes()) {
                attr.setProduct(pr); // Nói cho Attribute biết cha nó là ai
            }
        }

        this.productService.createProduct(pr);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.fetchProductById(id).get();
        model.addAttribute("newProduct", currentProduct);

        List<Brand> listBrands = brandService.getAllBrands();
        model.addAttribute("brands", listBrands);

        List<Category> listCategories = categoryService.getAllCategories();
        model.addAttribute("categories", listCategories);

        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateUser(Model model, @ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newProductBindingResult,
            @RequestParam("zeryfFile") MultipartFile file) {

        // Validate
        if (newProductBindingResult.hasErrors()) {
            // Load lại dữ liệu cho Dropdown
            List<Brand> listBrands = brandService.getAllBrands();
            model.addAttribute("brands", listBrands);

            List<Category> listCategories = categoryService.getAllCategories();
            model.addAttribute("categories", listCategories);

            return "admin/product/update";
        }

        Product currentProduct = this.productService.fetchProductById(pr.getId()).get();
        if (currentProduct != null) {
            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }
            if (pr.getAttributes() != null) {
                for (ProductAttribute attr : pr.getAttributes()) {
                    attr.setProduct(pr); // Nói cho Attribute biết cha nó là ai
                }
            }
            currentProduct.setName(pr.getName());
            currentProduct.setPrice(pr.getPrice());
            currentProduct.setDetailDesc(pr.getDetailDesc());
            currentProduct.setShortDesc(pr.getShortDesc());
            currentProduct.setQuantity(pr.getQuantity());
            currentProduct.setBrand(pr.getBrand());
            currentProduct.setTarget(pr.getTarget());
            currentProduct.setCategory(pr.getCategory());
            this.productService.createProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product product = new Product();
        product.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("newProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("newProduct") Product pr) {
        this.productService.deleteProduct(pr.getId());
        return "redirect:/admin/product";
    }

}

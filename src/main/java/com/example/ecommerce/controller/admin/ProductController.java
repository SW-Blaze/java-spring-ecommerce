package com.example.ecommerce.controller.admin;

import com.example.ecommerce.repository.ProductRepository;
import com.example.ecommerce.service.ProductService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ecommerce.domain.Product;

@Controller
public class ProductController {

    private final ProductService productService;

    private final ProductRepository productRepository;

    ProductController(ProductRepository productRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("product", products);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model, @ModelAttribute("newProduct") Product product) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String CreateProductPage(Model model, @ModelAttribute("newProduct") Product product) {
        model.addAttribute("newProduct", new Product());
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

}

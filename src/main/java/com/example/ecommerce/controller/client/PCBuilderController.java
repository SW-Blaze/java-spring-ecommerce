package com.example.ecommerce.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.service.BuildPCService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PCBuilderController {

    private final BuildPCService buildPCService;

    public PCBuilderController(BuildPCService buildPCService) {
        this.buildPCService = buildPCService;
    }

    @GetMapping("/build-pc")
    public String getBuildPCPage() {
        return "client/product/build-pc"; // Trang chính
    }

    // API trả về Fragment HTML
    @GetMapping("/product-list")
    public String getProductFragment(
            @RequestParam long categoryId,
            @RequestParam(required = false) Long baseProductId,
            @RequestParam(required = false) String criteriaName,
            Model model) {

        // Gọi Service lọc (Logic đã làm ở bước trước)
        List<Product> products = buildPCService.filterCompatibleProducts(categoryId, baseProductId, criteriaName);

        // --- THÊM DÒNG NÀY ĐỂ DEBUG ---
        System.out.println("DEBUG: Category ID = " + categoryId);
        if (products.isEmpty()) {
            System.out.println("DEBUG: Không tìm thấy sản phẩm nào! (List rỗng)");
        } else {
            System.out.println("DEBUG: Tìm thấy " + products.size() + " sản phẩm.");
            System.out.println("DEBUG: Tên SP đầu tiên: " + products.get(0).getName());
        }
        // -----------------------------

        model.addAttribute("products", products);

        return "client/fragments/product-list";
    }

    @PostMapping("/add-product-to-build/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        // this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/";
    }

}

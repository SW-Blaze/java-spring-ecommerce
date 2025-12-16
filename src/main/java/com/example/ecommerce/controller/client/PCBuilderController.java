package com.example.ecommerce.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ecommerce.domain.BuildPCSession;
import com.example.ecommerce.domain.Product;
import com.example.ecommerce.service.BuildPCService;
import com.example.ecommerce.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PCBuilderController {

    private final BuildPCService buildPCService;
    private final ProductService productService;

    public PCBuilderController(BuildPCService buildPCService, ProductService productService) {
        this.buildPCService = buildPCService;
        this.productService = productService;
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
            @RequestParam("page") Optional<String> pageOptional,
            Model model,
            HttpSession session) {

        BuildPCSession build = (BuildPCSession) session.getAttribute("BUILD_PC");

        if (baseProductId == null && build != null) {
            if (categoryId == 11) {
                baseProductId = build.getCpuId();
            }
            if (categoryId == 9) {
                baseProductId = build.getMainboardId();
            }
        }

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
        List<Product> products = prs.getContent();
        List<Product> listProduct = buildPCService.filterCompatibleProducts(categoryId, baseProductId, criteriaName);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("products", products);
        model.addAttribute("listProducts", listProduct);

        return "client/fragments/product-list";
    }

    @PostMapping("build-pc/select")
    public void selectProduct(@RequestParam long categoryId,
            @RequestParam long productId,
            HttpSession session) {
        BuildPCSession build = (BuildPCSession) session.getAttribute("BUILD_PC");

        if (build == null) {
            build = new BuildPCSession();
        }

        if (categoryId == 7)
            build.setCpuId(productId);
        if (categoryId == 11)
            build.setMainboardId(productId);
        if (categoryId == 9)
            build.setRamId(productId);

        session.setAttribute("BUILD_PC", build);
    }

}

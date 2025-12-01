package com.example.ecommerce.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("product")
    public String getAllProductPage(Model model) {

        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "client/product/show";

    }

    @GetMapping("product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {

        Product pr = this.productService.fetchProductById(id);
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";

    }

}

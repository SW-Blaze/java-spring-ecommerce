package com.example.ecommerce.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

    @GetMapping("product")
    public String getProductPage(Model model) {
        return "client/product/detail";
    }

    // @GetMapping("product/{id}")
    // public String getDetailProductPage(Model model, @PathVariable long id) {
    // return "client/product/detail";
    // }

}

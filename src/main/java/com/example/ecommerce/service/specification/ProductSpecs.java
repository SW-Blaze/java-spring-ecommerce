package com.example.ecommerce.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

}

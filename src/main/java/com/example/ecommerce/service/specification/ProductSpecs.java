package com.example.ecommerce.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> minPrice(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> maxPrice(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> matchbrand(String brand) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.BRAND), brand);
    }

    public static Specification<Product> matchListbrand(List<String> brand) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.BRAND)).value(brand);
    }

    public static Specification<Product> matchPriceRange(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.ge(root.get(Product_.PRICE), min), criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    public static Specification<Product> matchMultiplePriceRange(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }

}

package com.example.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ecommerce.domain.Product;

@Repository
public interface BuildPcRepository extends JpaRepository<Product, Long> {

}

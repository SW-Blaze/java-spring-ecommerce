package com.example.ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.Brand;
import com.example.ecommerce.repository.BrandRepository;

@Service
public class BrandService {

    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    // Lấy danh sách tất cả các hãng
    public List<Brand> getAllBrands() {
        return this.brandRepository.findAll();
    }

}

package com.example.ecommerce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.repository.BuildPcRepository;
import com.example.ecommerce.repository.ProductAttributeRepository;
import com.example.ecommerce.repository.ProductRepository;

@Service // IoC: Báo cho Spring biết đây là 1 Bean cần quản lý
public class BuildPCService {

    private final ProductRepository productRepository;
    private final ProductAttributeRepository productAttributeRepository;
    private final BuildPcRepository buildPcRepository;

    public BuildPCService(ProductRepository productRepository, ProductAttributeRepository productAttributeRepository,
            BuildPcRepository buildPcRepository) {
        this.productRepository = productRepository;
        this.productAttributeRepository = productAttributeRepository;
        this.buildPcRepository = buildPcRepository;
    }

    public Product fetchProductById(long id) {
        return this.buildPcRepository.findById(id).orElse(null);
    }

    public List<Product> filterCompatibleProducts(long categoryId, Long baseProductId, String criteriaName) {

        // Trường hợp 1: Người dùng chưa chọn linh kiện gốc (VD: Chưa chọn CPU)
        // -> Trả về toàn bộ danh sách của danh mục đích (VD: Toàn bộ Mainboard)
        if (baseProductId == null) {
            return productRepository.findByCategory_Id(categoryId);
        }

        // Trường hợp 2: Đã chọn linh kiện gốc -> Bắt đầu lọc

        // Bước 1: Lấy thông tin sản phẩm gốc từ DB
        Optional<Product> baseProductOpt = productRepository.findById(baseProductId);
        if (baseProductOpt.isEmpty()) {
            return new ArrayList<>();
        }
        Product baseProduct = baseProductOpt.get();

        // 1️⃣ CPU → không lọc
        if (categoryId == 7) {
            return productRepository.findByCategory_Id(7);
        }

        // 2️⃣ MAINBOARD → theo CPU socket
        if (categoryId == 11 && baseProductId != null) {

            String cpuSocket = productAttributeRepository.findValueByProductAndAttrName(
                    baseProductId, "Socket");

            return productRepository.findByCategoryAndAttribute(
                    11, "Socket", cpuSocket);
        }

        // 3️⃣ RAM → theo mainboard bus
        if (categoryId == 9 && baseProductId != null) {

            String busStr = productAttributeRepository.findValueByProductAndAttrName(
                    baseProductId, "Bus");

            return productRepository.findByCategoryAndAttribute(
                    9, "Bus", busStr);
        }

        return List.of();
    }

}

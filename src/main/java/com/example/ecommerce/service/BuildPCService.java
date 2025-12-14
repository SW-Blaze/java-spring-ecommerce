package com.example.ecommerce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.ProductAttribute;
import com.example.ecommerce.repository.ProductRepository;

@Service // IoC: Báo cho Spring biết đây là 1 Bean cần quản lý
public class BuildPCService {

    private final ProductRepository productRepository;

    public BuildPCService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> filterCompatibleProducts(long targetCategoryId, Long baseProductId, String criteriaName) {

        // Trường hợp 1: Người dùng chưa chọn linh kiện gốc (VD: Chưa chọn CPU)
        // -> Trả về toàn bộ danh sách của danh mục đích (VD: Toàn bộ Mainboard)
        if (baseProductId == null) {
            return productRepository.findByCategory_Id(targetCategoryId);
        }

        // Trường hợp 2: Đã chọn linh kiện gốc -> Bắt đầu lọc

        // Bước 1: Lấy thông tin sản phẩm gốc từ DB
        Optional<Product> baseProductOpt = productRepository.findById(baseProductId);
        if (baseProductOpt.isEmpty()) {
            return new ArrayList<>();
        }
        Product baseProduct = baseProductOpt.get();

        // Bước 2: Dùng Java Code để tìm giá trị của thuộc tính so sánh (VD: Tìm xem CPU
        // này Socket bao nhiêu?)
        // Sử dụng Stream API để xử lý nhanh gọn trên List<ProductAttribute>
        String baseValue = baseProduct.getAttributes().stream()
                .filter(attr -> attr.getAttributeDefinition().getName().equalsIgnoreCase(criteriaName))
                .map(ProductAttribute::getValue) // Lấy giá trị ra (VD: "LGA 1700")
                .findFirst()
                .orElse(null);

        // Nếu sản phẩm gốc không có thuộc tính này (VD: Chọn CPU nhưng CPU đó quên nhập
        // Socket)
        if (baseValue == null) {
            return new ArrayList<>();
        }

        // Bước 3: Gọi Repository để tìm các sản phẩm tương thích
        return productRepository.findByCategory_IdAndAttributes_AttributeDefinition_NameAndAttributes_ValueContaining(
                targetCategoryId,
                criteriaName,
                baseValue);
    }

}

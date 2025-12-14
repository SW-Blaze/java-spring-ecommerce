package com.example.ecommerce.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.ecommerce.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {

    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);

    // JPA tự động dịch hàm này thành câu lệnh SQL Join phức tạp
    // Ý nghĩa: Tìm Product thuộc Category ID này VÀ có Attribute Tên này VÀ có Giá
    // trị chứa đoạn text này
    List<Product> findByCategory_IdAndAttributes_AttributeDefinition_NameAndAttributes_ValueContaining(
            long categoryId,
            String attributeName,
            String attributeValue);

    // Hàm hỗ trợ tìm tất cả sản phẩm theo danh mục (khi chưa cần lọc)
    List<Product> findByCategory_Id(long categoryId);

}

package com.example.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.ecommerce.domain.ProductAttribute;

@Repository
public interface ProductAttributeRepository extends JpaRepository<ProductAttribute, Long> {

    // Lấy value của attribute theo product + attribute name
    @Query("""
                SELECT pa.value
                FROM ProductAttribute pa
                WHERE pa.product.id = :productId
                AND pa.attributeDefinition.name = :attrName
            """)
    String findValueByProductAndAttrName(
            @Param("productId") long productId,
            @Param("attrName") String attrName);

}

package com.example.ecommerce.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "product_attribute")
public class ProductAttribute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    // Liên kết với định nghĩa thuộc tính (VD: Đây là giá trị của "Socket")
    @ManyToOne
    @JoinColumn(name = "attribute_definition_id")
    private AttributeDefinition attributeDefinition;

    // Liên kết với sản phẩm (VD: Của con CPU i5-12400F)
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    // Giá trị thực tế (VD: "LGA 1700", "32GB")
    private String value;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public AttributeDefinition getAttributeDefinition() {
        return attributeDefinition;
    }

    public void setAttributeDefinition(AttributeDefinition attributeDefinition) {
        this.attributeDefinition = attributeDefinition;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "ProductAttribute [id=" + id + ", attributeDefinition=" + attributeDefinition + ", productId="
                + (product != null ? product.getId() : "null")
                + ", value=" + value + "]";
    }

}

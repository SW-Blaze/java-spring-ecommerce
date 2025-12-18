package com.example.ecommerce.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.Cart;
import com.example.ecommerce.domain.CartDetail;
import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.User;
import com.example.ecommerce.repository.CartDetailRepository;
import com.example.ecommerce.repository.CartRepository;

@Service
public class CartService {

    private final ProductService productService;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public CartService(ProductService productService, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository) {
        this.productService = productService;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Cart findById(Long id) {
        return cartRepository.findById(id).orElse(null);
    }

    public Cart saveCart(Cart cart) {
        return cartRepository.save(cart);
    }

    public Cart findByUser(User user) {
        return cartRepository.findByUser(user);
    }

    public void addToCart(Long productId, Cart cart) {
        if (productId == null || cart == null)
            return;

        Product product = productService.fetchProductById(productId).orElse(null);
        if (product == null)
            return;

        // 🔎 Tìm CartDetail trong DB (KHÔNG tìm trong list memory)
        CartDetail existing = cartDetailRepository.findByCartAndProduct(cart, product);

        if (existing != null) {
            // ✅ Đã có → tăng số lượng
            existing.setQuantity(existing.getQuantity() + 1);
            cartDetailRepository.save(existing);
        } else {
            // ✅ Chưa có → tạo mới
            CartDetail cd = new CartDetail();
            cd.setCart(cart);
            cd.setProduct(product);
            cd.setQuantity(1);
            cd.setPrice(product.getPrice());

            cartDetailRepository.save(cd);

            // (optional) update sum
            cart.setSum(cart.getSum() + 1);
            cartRepository.save(cart);
        }
    }

    public double calculateTotal(Cart cart) {
        return cart.getCartDetails()
                .stream()
                .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                .sum();
    }

}

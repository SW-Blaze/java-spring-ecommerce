package com.example.ecommerce.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.Cart;
import com.example.ecommerce.domain.CartDetail;
import com.example.ecommerce.domain.Order;
import com.example.ecommerce.domain.OrderDetail;
import com.example.ecommerce.domain.OrderStatus;
import com.example.ecommerce.domain.Product;
import com.example.ecommerce.domain.User;
import com.example.ecommerce.domain.dto.ProductCriteriaDTO;
import com.example.ecommerce.repository.CartDetailRepository;
import com.example.ecommerce.repository.CartRepository;
import com.example.ecommerce.repository.OrderDetailRepository;
import com.example.ecommerce.repository.OrderRepository;
import com.example.ecommerce.repository.ProductRepository;
import com.example.ecommerce.service.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public Page<Product> fetchAllProductsWithSpec(
            ProductCriteriaDTO criteria,
            Pageable page) {

        Specification<Product> spec = Specification.where(null);

        // 🔹 CATEGORY
        if (criteria.getCategory() != null && !criteria.getCategory().isBlank()) {
            spec = spec.and(
                    ProductSpecs.matchCategory(criteria.getCategory()));
        }

        // 🔹 TARGET
        if (criteria.getTarget() != null && !criteria.getTarget().isEmpty()) {
            spec = spec.and(
                    ProductSpecs.matchListTarget(criteria.getTarget()));
        }

        // 🔹 BRAND
        if (criteria.getBrand() != null && !criteria.getBrand().isEmpty()) {
            spec = spec.and(
                    ProductSpecs.matchListBrand(criteria.getBrand()));
        }

        // 🔹 PRICE
        // if (criteria.getPrice() != null && !criteria.getPrice().isBlank()) {
        // spec = spec.and(
        // ProductSpecs.matchPrice(criteria.getPrice()));
        // }

        return productRepository.findAll(spec, page);
    }

    // Case 1: Filter products with min price
    // public Page<Product> fetchAllProductsWithSpec(double min, Pageable page) {
    // return this.productRepository.findAll(ProductSpecs.minPrice(min), page);
    // }

    // Case 2: Filter products with max price
    // public Page<Product> fetchAllProductsWithSpec(double max, Pageable page) {
    // return this.productRepository.findAll(ProductSpecs.maxPrice(max), page);
    // }

    // Case 3: Filter products with brand
    // public Page<Product> fetchAllProductsWithSpec(String brand, Pageable page)
    // {
    // return this.productRepository.findAll(ProductSpecs.matchbrand(brand),
    // page);
    // }

    // Case 4: Filter products with brand
    // public Page<Product> fetchAllProductsWithSpec(List<String> brand, Pageable
    // page) {
    // return this.productRepository.findAll(ProductSpecs.matchListbrand(brand),
    // page);
    // }

    // Case 5: Filter products with rice range
    // public Page<Product> fetchAllProductsWithSpec(String price, Pageable page) {
    // if (price.equals("duoi-10-trieu")) {
    // double min = 0;
    // double max = 10000000;
    // return this.productRepository.findAll(ProductSpecs.matchPriceRange(min, max),
    // page);
    // } else if (price.equals("10-15-trieu")) {
    // double min = 10000000;
    // double max = 15000000;
    // return this.productRepository.findAll(ProductSpecs.matchPriceRange(min, max),
    // page);
    // } else if (price.equals("15-20-trieu")) {
    // double min = 15000000;
    // double max = 20000000;
    // return this.productRepository.findAll(ProductSpecs.matchPriceRange(min, max),
    // page);
    // } else if (price.equals("20-25-trieu")) {
    // double min = 20000000;
    // double max = 25000000;
    // return this.productRepository.findAll(ProductSpecs.matchPriceRange(min, max),
    // page);
    // } else if (price.equals("25-30-trieu")) {
    // double min = 25000000;
    // double max = 30000000;
    // return this.productRepository.findAll(ProductSpecs.matchPriceRange(min, max),
    // page);
    // } else
    // return this.productRepository.findAll(page);
    // }

    // Case 6: Filter products with price range
    // public Page<Product> fetchAllProductsWithSpec(List<String> price, Pageable
    // page) {
    // Specification<Product> combinedSpec = (root, query, criteriaBuilder) ->
    // criteriaBuilder.disjunction();
    // int count = 0;
    // for (String p : price) {
    // double min = 0;
    // double max = 0;

    // switch (p) {
    // case "duoi-10-trieu":
    // min = 0;
    // max = 10000000;
    // count++;
    // break;
    // case "10-15-trieu":
    // min = 10000000;
    // max = 15000000;
    // count++;
    // break;
    // case "15-20-trieu":
    // min = 15000000;
    // max = 20000000;
    // count++;
    // break;
    // case "20-25-trieu":
    // min = 20000000;
    // max = 25000000;
    // count++;
    // break;
    // case "25-30-trieu":
    // min = 25000000;
    // max = 30000000;
    // count++;
    // break;
    // }

    // if (min != 0 || max != 0) {
    // Specification<Product> priceSpec = ProductSpecs.matchMultiplePriceRange(min,
    // max);
    // combinedSpec = combinedSpec.or(priceSpec);
    // }
    // }

    // if (count == 0) {
    // return this.productRepository.findAll(page);
    // }

    // return this.productRepository.findAll(combinedSpec, page);
    // }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        // Check user đã có Cart chưa? Nếu chưa -> Tạo mới
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // Check user đã có Cart chưa? Nếu chưa -> Tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }

            // Save cart_detail
            // Tìm product by id
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
                // Check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);

                    // Update cart(sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }
            }

        }
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetaiOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetaiOptional.isPresent()) {
            CartDetail cartDetail = cartDetaiOptional.get();

            Cart currentCart = cartDetail.getCart();
            // Delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // Update cart
            if (currentCart.getSum() > 1) {
                // Update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // Delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currenCartDetail = cdOptional.get();
                currenCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currenCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {
        // Step 1: Get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                // Create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus(OrderStatus.PENDING);

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice() * cd.getQuantity();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // Create order detail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // Step 2: Delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // Step 3: Update session
                session.setAttribute("sum", 0);
            }
        }
    }

}

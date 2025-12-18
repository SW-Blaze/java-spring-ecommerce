package com.example.ecommerce.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.ecommerce.domain.BuildPCSession;
import com.example.ecommerce.domain.Product;
import com.example.ecommerce.service.BuildPCService;
import com.example.ecommerce.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PCBuilderController {

    private final BuildPCService buildPCService;
    private final ProductService productService;

    public PCBuilderController(BuildPCService buildPCService, ProductService productService) {
        this.buildPCService = buildPCService;
        this.productService = productService;
    }

    @GetMapping("/build-pc")
    public String getBuildPCPage(Model model, HttpSession session) {
        // 1. Lấy Session hiện tại
        BuildPCSession build = (BuildPCSession) session.getAttribute("BUILD_PC");

        // 2. Nếu Session chưa có thì tạo mới (để tránh lỗi null)
        if (build == null) {
            build = new BuildPCSession();
            session.setAttribute("BUILD_PC", build);
        }

        double totalPrice = 0; // Biến tính tổng tiền

        // 3. Kiểm tra, lấy sản phẩm và CỘNG TIỀN

        // CPU
        if (build.getCpuId() != null) {
            Product p = buildPCService.fetchProductById(build.getCpuId());
            if (p != null) {
                model.addAttribute("selectedCpu", p);
                totalPrice += p.getPrice(); // Cộng tiền
            }
        }

        // Mainboard
        if (build.getMainboardId() != null) {
            Product p = buildPCService.fetchProductById(build.getMainboardId());
            if (p != null) {
                model.addAttribute("selectedMainboard", p);
                totalPrice += p.getPrice();
            }
        }

        // RAM
        if (build.getRamId() != null) {
            Product p = buildPCService.fetchProductById(build.getRamId());
            if (p != null) {
                model.addAttribute("selectedRam", p);
                totalPrice += p.getPrice();
            }
        }

        // HDD
        if (build.getHddId() != null) {
            Product p = buildPCService.fetchProductById(build.getHddId());
            if (p != null) {
                model.addAttribute("selectedHdd", p);
                totalPrice += p.getPrice();
            }
        }

        // SSD
        if (build.getSsdId() != null) {
            Product p = buildPCService.fetchProductById(build.getSsdId());
            if (p != null) {
                model.addAttribute("selectedSsd", p);
                totalPrice += p.getPrice();
            }
        }

        // VGA
        if (build.getVgaId() != null) {
            Product p = buildPCService.fetchProductById(build.getVgaId());
            if (p != null) {
                model.addAttribute("selectedVga", p);
                totalPrice += p.getPrice();
            }
        }

        // PSU
        if (build.getPsuId() != null) {
            Product p = buildPCService.fetchProductById(build.getPsuId());
            if (p != null) {
                model.addAttribute("selectedPsu", p);
                totalPrice += p.getPrice();
            }
        }

        // Case
        if (build.getCaseId() != null) {
            Product p = buildPCService.fetchProductById(build.getCaseId());
            if (p != null) {
                model.addAttribute("selectedCase", p);
                totalPrice += p.getPrice();
            }
        }

        // 3. Gửi tổng tiền sang JSP
        model.addAttribute("totalPrice", totalPrice);

        return "client/product/build-pc"; // Trang chính
    }

    // API trả về Fragment HTML
    @GetMapping("/product-list")
    public String getProductFragment(
            @RequestParam long categoryId,
            @RequestParam(required = false) Long baseProductId,
            @RequestParam(required = false) String criteriaName,
            @RequestParam("page") Optional<String> pageOptional,
            Model model,
            HttpSession session) {

        BuildPCSession build = (BuildPCSession) session.getAttribute("BUILD_PC");

        if (baseProductId == null && build != null) {
            if (categoryId == 11) {
                baseProductId = build.getCpuId();
            }
            if (categoryId == 9) {
                baseProductId = build.getMainboardId();
            }
        }

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // Convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // Page = 1
            }
        } catch (Exception e) {
            // Page = 1
            // TODO: Handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();
        List<Product> listProduct = buildPCService.filterCompatibleProducts(categoryId, baseProductId, criteriaName);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("products", products);
        model.addAttribute("listProducts", listProduct);

        return "client/fragments/product-list";
    }

    @PostMapping("build-pc/select")
    @ResponseBody
    public String selectProduct(
            @RequestParam long categoryId,
            @RequestParam long productId,
            HttpSession session) {
        BuildPCSession build = (BuildPCSession) session.getAttribute("BUILD_PC");

        if (build == null) {
            build = new BuildPCSession();
        }

        // Cập nhật session dựa trên Category ID
        if (categoryId == 7) {
            // 1. Chọn CPU
            build.setCpuId(productId);
            // -> Bắt buộc Reset Mainboard và RAM trong Session
            build.setMainboardId(null);
            build.setRamId(null);
        } else if (categoryId == 11) {
            // 2. Chọn Mainboard
            build.setMainboardId(productId);
            // -> Bắt buộc Reset RAM (để tránh lệch DDR4/DDR5)
            build.setRamId(null);
        } else if (categoryId == 9)
            build.setRamId(productId);
        else if (categoryId == 20)
            build.setHddId(productId);
        else if (categoryId == 6)
            build.setSsdId(productId);
        else if (categoryId == 12)
            build.setVgaId(productId);
        else if (categoryId == 10)
            build.setPsuId(productId);
        else if (categoryId == 8)
            build.setCaseId(productId);

        session.setAttribute("BUILD_PC", build);

        return "SUCCESS";
    }

    @PostMapping("/build-pc/reset")
    @ResponseBody
    public String resetBuildPc(HttpSession session) {
        session.removeAttribute("BUILD_PC");
        return "RESET_OK";
    }

}

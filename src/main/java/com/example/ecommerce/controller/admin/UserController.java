package com.example.ecommerce.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce.domain.Order;
import com.example.ecommerce.domain.User;
import com.example.ecommerce.service.UploadService;
import com.example.ecommerce.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
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
        Page<User> users = this.userService.getAllUser(pageable);
        List<User> listUsers = users.getContent();
        model.addAttribute("user", listUsers);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", users.getTotalPages());

        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getDetailUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User zeryf,
            BindingResult newUserBindingResult,
            @RequestParam("zeryfFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(zeryf.getPassword());
        zeryf.setAvatar(avatar);
        zeryf.setPassword(hashPassword);
        zeryf.setRole(this.userService.getRoleByName(zeryf.getRole().getName()));
        // save
        this.userService.handleSaveUser(zeryf);
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User zeryf,
            @RequestParam("zeryfFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(zeryf.getId());
        if (currentUser != null) {
            currentUser.setFullName(zeryf.getFullName());
            currentUser.setRole(zeryf.getRole());
            currentUser.setPhone(zeryf.getPhone());
            currentUser.setAddress(zeryf.getAddress());
            currentUser.setAvatar(zeryf.getAvatar());

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("newUser") User zeryf) {
        this.userService.deleteAUser(zeryf.getId());
        return "redirect:/admin/user";
    }

}

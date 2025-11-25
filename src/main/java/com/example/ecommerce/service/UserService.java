package com.example.ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce.domain.User;
import com.example.ecommerce.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        User zeryf = this.userRepository.save(user);
        return zeryf;
    }

    public User handleUpdateUser(User user) {
        User zeryf = this.userRepository.save(user);
        return zeryf;
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }
}

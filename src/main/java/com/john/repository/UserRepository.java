package com.john.repository;

import com.john.entity.User;

import java.util.List;

public interface UserRepository {
    void addUser(User user);
    User findByUsername(String username);
    String findPasswordByUsername(String username);
}

package com.john.repository;

import com.john.entity.User;

public interface UserRepository {
    void addUser(User user);
    User findByUsername(String username);
    String findPasswordByUsername(String username);
}

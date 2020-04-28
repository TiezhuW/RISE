package com.john.service;

import com.john.entity.User;

import java.util.List;

public interface UserService {
    boolean register(User user);
    boolean login(String username, String password);
    User getUser(String username);
}

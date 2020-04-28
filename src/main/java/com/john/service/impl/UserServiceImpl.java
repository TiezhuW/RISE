package com.john.service.impl;

import com.john.entity.User;
import com.john.repository.UserRepository;
import com.john.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean register(User user) {
        User userResult = userRepository.findByUsername(user.getUsername());
        if (userResult == null){
            userRepository.addUser(user);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean login(String username, String password) {
        if (password.equals(userRepository.findPasswordByUsername(username))){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User getUser(String username) {
        return userRepository.findByUsername(username);
    }
}

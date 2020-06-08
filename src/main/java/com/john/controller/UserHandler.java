package com.john.controller;

import com.john.entity.House;
import com.john.entity.User;
import com.john.service.HouseService;
import com.john.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserHandler {
    @Autowired
    private UserService userService;

    @Autowired
    private HouseService houseService;

    @GetMapping("/loginPage")
    public String loginPage(){
        return "login";
    }

    @PostMapping(value = "/login", params = {"username", "password"})
    public String login(String username, String password, Model model, HttpSession session){
        String msg;
        boolean ret = userService.login(username, password);
        if (ret == true && !username.equals("Administrator")) {
            User user = userService.getUser(username);
            session.setAttribute("username",username);
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());
            return "index";
        } else if (ret == true && username.equals("Administrator")) {
            session.setAttribute("username",username);
            return "index";
        } else {
            msg = "用户名或密码错误";
            model.addAttribute("msg",msg);
            return "login";
        }
    }

    @GetMapping("/registerPage")
    public String registerPage(){
        return "register";
    }

    @PostMapping("/register")
    public ModelAndView register(User user){
        String usernameMsg = "";
        String passwordMsg = "";
        String emailMsg = "";
        String phoneMsg = "";
        String msg;
        ModelAndView modelAndView = new ModelAndView("register");

        //数据校验
        String emailRegEx = "[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}";
        Pattern emailPattern = Pattern.compile(emailRegEx);
        Matcher emailMatcher = emailPattern.matcher(user.getEmail());
        String phoneRegEx = "[0-9]{11}";
        Pattern phonePattern = Pattern.compile(phoneRegEx);
        Matcher phoneMatcher = phonePattern.matcher(user.getPhone());
        if (user.getUsername().equals("")){
            usernameMsg = "用户名不能为空";
        } else if (user.getPassword().length() < 6 || user.getPassword().length() > 14) {
            passwordMsg = "密码长度必须在 6 - 14 位之间";
        } else if (!emailMatcher.matches()) {
            emailMsg = "电子邮箱地址不正确";
        } else if (!phoneMatcher.matches()) {
            phoneMsg = "手机号必须为11位数字";
        }

        modelAndView.addObject("usernameMsg",usernameMsg);
        modelAndView.addObject("passwordMsg",passwordMsg);
        modelAndView.addObject("emailMsg",emailMsg);
        modelAndView.addObject("phoneMsg",phoneMsg);

        if((usernameMsg + passwordMsg + emailMsg + phoneMsg).equals("")){
            boolean ret = userService.register(user);
            if (ret == true){
                msg = "注册成功";
            } else {
                msg = "用户名已存在";
            }
            modelAndView.addObject("msg",msg);
        }

        return modelAndView;
    }

    @GetMapping(value = "/info", params = {"username"})
    public ModelAndView info(String username){
        ModelAndView modelAndView = new ModelAndView("userInfo");
        User user = userService.getUser(username);
        if (user.getCollection() == null) {
            return modelAndView;
        }
        List<House> collection = user.getCollection();
        List<House> outputCollection = new ArrayList<>();
        for (House house:collection){
            house = houseService.findByUrl(house.getUrl());
            outputCollection.add(house);
        }
        modelAndView.addObject("collection", outputCollection);
        return modelAndView;
    }

    @GetMapping("/quit")
    public String quit(HttpSession session){
        session.invalidate();
        return "index";
    }
}

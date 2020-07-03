package com.john.controller;

import com.john.entity.Comment;
import com.john.entity.House;
import com.john.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/house")
public class HouseHandler {

    @Autowired
    private HouseService houseService;

    @GetMapping("/homepage")
    public String homepage() {
        return "index";
    }

    @GetMapping(value = "/get", params = {"city", "domain", "minPrice", "maxPrice", "minArea", "maxArea", "order"})
    public ModelAndView getHouse(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea, String order){
        ModelAndView modelAndView = new ModelAndView("index");
        if (city.equals("") || domain.equals("")){
            String msg = "请选择城市和区域";
            modelAndView.addObject("nullCityAndDomain",msg);
            return modelAndView;
        }
        List<House> houses = new ArrayList<>();
        switch (order) {
            case "disorder":
                houses = houseService.findAll(city, domain, minPrice, maxPrice, minArea, maxArea);
                break;
            case "areaOrderAsc":
                houses = houseService.findAllInAreaOrderAsc(city, domain, minPrice, maxPrice, minArea, maxArea);
                break;
            case "areaOrderDesc":
                houses = houseService.findAllInAreaOrderDesc(city, domain, minPrice, maxPrice, minArea, maxArea);
                break;
            case "priceOrderAsc":
                houses = houseService.findAllInPriceOrderAsc(city, domain, minPrice, maxPrice, minArea, maxArea);
                break;
            case "priceOrderDesc":
                houses = houseService.findAllInPriceOrderDesc(city, domain, minPrice, maxPrice, minArea, maxArea);
                break;
        }
        modelAndView.addObject("houses", houses);
        return modelAndView;
    }

    @PostMapping(value = "/moreInfo", params = {"url"})
    public String moreInfo(String url){
        houseService.moreInfo(url);
        return "index";
    }

    @PostMapping(value = "/collect", params = {"username", "url"})
    @ResponseBody
    public String collect(String username, String url){
        int ret;
        try{
            ret = houseService.collect(username, url);
        } catch (Exception e) {
            ret = 0;
        }
        if (ret == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

    @PostMapping(value = "/cancelCollect", params = {"username", "url"})
    @ResponseBody
    public String cancelCollect(String username, String url){
        int ret;
        try{
            ret = houseService.cancelCollect(username, url);
        } catch(Exception e) {
            ret = 0;
        }
        if (ret == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

    @GetMapping(value = "/comment/look", params = {"url"})
    public ModelAndView commentLook(String url){
        ModelAndView modelAndView = new ModelAndView("comment");
        House house = houseService.findByUrl(url);
        modelAndView.addObject("house", house);
        List<Comment> comments = houseService.findCommentByUrl(url);
        modelAndView.addObject("comments", comments);
        return modelAndView;
    }

    @PostMapping(value = "/comment/submit")
    @ResponseBody
    public String commentSubmit(@RequestBody Comment comment){
        String username = comment.getUser().getUsername();
        String url = comment.getHouse().getUrl();
        String time = comment.getTime();
        String commentContent = comment.getComment();

        int ret;
        try{
            ret = houseService.addComment(username, url, time, commentContent);
        } catch(Exception e) {
            ret = 0;
        }
        if (ret == 1){
            return "success";
        } else {
            return "fail";
        }
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }

    @PostMapping("/add")
    public ModelAndView addHouse(House house) {
        ModelAndView modelAndView = new ModelAndView("admin");
        int ret;
        try{
            ret = houseService.addHouse(house);
        } catch(Exception e) {
            ret = 0;
        }
        if (ret == 1) {
            modelAndView.addObject("msg","添加成功");
        } else if(ret == 0) {
            modelAndView.addObject("msg","添加失败");
        }
        return modelAndView;
    }

    @PostMapping(value = "/delete", params = {"url"})
    @ResponseBody
    public String deleteHouse(String url) {
        int ret;
        try {
            ret = houseService.deleteHouse(url);
            System.out.println("返回值： " + ret);
        } catch(Exception e) {
            ret = 0;
        }
        if (ret == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

    @PostMapping(value = "/comment/delete", params = {"username", "url"})
    @ResponseBody
    public String deleteComment(String username, String url) {
        int ret;
        try{
            ret = houseService.deleteComment(username, url);
        } catch(Exception e) {
            ret = 0;
        }
        if (ret == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

    @PostMapping(value = "/update")
    public String updateHouse() {
        //call crawler
        return "admin";
    }
}

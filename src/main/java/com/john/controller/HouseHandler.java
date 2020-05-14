package com.john.controller;

import com.john.entity.House;
import com.john.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/house")
public class HouseHandler {

    @Autowired
    private HouseService houseService;

//    @GetMapping(value = "/test", params = {"a", "b"})
//    public String test(String a, String b){
//        System.out.println(a + " " + b);
//        return "index";
//    }

    @GetMapping("/homepage")
    public String homepage() {
        return "index";
    }

    @GetMapping(value = "/get", params = {"city", "domain", "minPrice", "maxPrice", "minArea", "maxArea", "order"})
    public ModelAndView getHouse(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea, String order){
        ModelAndView modelAndView = new ModelAndView("index");
        if (city.equals("") || domain.equals("")){
            String msg = "请选择城市和区域";
            modelAndView.addObject("msg",msg);
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

    @PostMapping(value = "/inc", params = {"url"})
    public String clickTimesInc(String url){
        System.out.println(url);
        houseService.clickTimesInc(url);
        return "index";
    }
}

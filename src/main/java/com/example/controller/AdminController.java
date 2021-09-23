package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class AdminController {
    //관리자 페이지 
    @RequestMapping(value ="/admin.do", method=RequestMethod.GET)
    public ModelAndView admin() {
        return new ModelAndView("admin");
    }
    @RequestMapping(value ="/admin_users.do", method=RequestMethod.GET)
    public ModelAndView admin_users() {
        return new ModelAndView("admin_users");
    }
    @RequestMapping(value ="/admin_shared_posts.do", method=RequestMethod.GET)
    public ModelAndView admin_shared_posts() {
        return new ModelAndView("admin_shared_posts");
    }
    @RequestMapping(value ="/admin_posts.do", method=RequestMethod.GET)
    public ModelAndView admin_posts() {
        return new ModelAndView("admin_posts");
    }
    @RequestMapping(value ="/admin_departments.do", method=RequestMethod.GET)
    public ModelAndView admin_departments() {
        return new ModelAndView("admin_departments");
    }
    @RequestMapping(value ="/admin_followings.do", method=RequestMethod.GET)
    public ModelAndView admin_followings() {
        return new ModelAndView("admin_followings");
    }   
    @RequestMapping(value ="/admin_hashtags.do", method=RequestMethod.GET)
    public ModelAndView admin_hashtags() {
        return new ModelAndView("admin_hashtags");
    }   
    @RequestMapping(value ="/admin_recentFavorite.do", method=RequestMethod.GET)
    public ModelAndView admin_recentFavorite() {
        return new ModelAndView("admin_recentFavorite");
    }
    @RequestMapping(value ="/admin_modify.do", method=RequestMethod.POST)
    public ModelAndView admin_modify() {
        return new ModelAndView("admin_modify");
    }   
    @RequestMapping(value ="/admin_query.do", method=RequestMethod.GET)
    public ModelAndView admin_query() {
        return new ModelAndView("admin_query");
    }   
    @RequestMapping(value ="/admin_returnQuery.do", method=RequestMethod.GET)
    public ModelAndView admin_returnQuery() {
        return new ModelAndView("admin_returnQuery");
    }       
}
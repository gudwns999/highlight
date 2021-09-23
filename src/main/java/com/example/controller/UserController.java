package com.example.controller;

import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.FollowingDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
import com.example.service.UserService;
import com.example.service.UserServiceImpl;
 
@Controller
public class UserController {
    UserService userService;
    //회원 가입 처리 POST으로 올때는 처리
    @RequestMapping(value ="/register_h.do" ,method=RequestMethod.POST)
    public ModelAndView registPOST(HttpServletRequest req) throws Exception {
        req.setCharacterEncoding("UTF-8");
        String user_id = req.getParameter("user_id");
        String user_email = req.getParameter("user_email");
        String user_name = req.getParameter("user_name");
        String user_passwd = req.getParameter("user_passwd");   
        String department_id = req.getParameter("department_id");       
         
        //들어온 값이 제대로 된 값인가... 확인은... 나중에.....
        UserDTO userDTO = new UserDTO(user_id, user_email,user_name,user_passwd, department_id);
        userService = new UserServiceImpl();
        userService.register(userDTO);
        return new ModelAndView("login").addObject("state","regist");
    }
    //회원등록 처리
    //회원가입
    @RequestMapping(value ="/register.do")
    public ModelAndView fail() {
        return new ModelAndView("register");
    }
     
    //로그인 확인
    @RequestMapping(value ="/authentication.do", method=RequestMethod.POST)
    public ModelAndView authenticationPOST(HttpServletRequest req, HttpSession httpSession) throws Exception {
        userService = new UserServiceImpl();
        String user_id = req.getParameter("user_id");
        String user_passwd = req.getParameter("user_passwd");
        UserSessionDTO userSessionDTO = new UserSessionDTO();
        if(userService.findUser(user_id, user_passwd,  httpSession, userSessionDTO)) {
            //로그인 성공
            userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
            return new ModelAndView("authentication").addObject("session", httpSession.getAttribute("login_user").toString());
        }else{
            //로그인 실패시
            return new ModelAndView("login").addObject("state", "fail");            
        }
     
    }
    //로그아웃
    @RequestMapping(value ="/logout.do", method=RequestMethod.POST)
    public ModelAndView admin(HttpSession httpSession) {
        userService = new UserServiceImpl();
        userService.logOutUser(httpSession);
        return new ModelAndView("authentication").addObject("session",null);
    }
    //유저팔로우
    @RequestMapping(value ="/follow.do", method=RequestMethod.POST)
    public boolean follow(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        String following_id = req.getParameter("following_id");
        FollowingDTO followerDTO = new FollowingDTO();
        followerDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        followerDTO.setFollowing_id(following_id);      
         
        return userService.followUser(followerDTO);
    }
    //유저 검색
    @RequestMapping(value ="/search_user.do")
    public ModelAndView search_user(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        UserDTO searchUser = new UserDTO();
        String user_name = req.getParameter("user_name");
        searchUser.setUser_name(user_name);
        List<UserDTO> searchUserList =  userService.searchUser(searchUser);
         
        return new ModelAndView("body3").addObject("searchUserList",searchUserList);
    }
}
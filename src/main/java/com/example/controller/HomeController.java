package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dto.FollowingDTO;
import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.HashtagsDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RecentDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
import com.example.service.UserService;
import com.example.service.UserServiceImpl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class HomeController {
    UserService userService;
    UserSessionDTO userSessionDTO;


    @RequestMapping(value = "/home.do")
    public ModelAndView home() {
        return new ModelAndView("login");
    }
 
    // 로그인 GET으로 올때는 받고t
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView loginGET() {
        return new ModelAndView("login");
    }
 
    // 메인화면
    @RequestMapping(value = "/index.do")
    public ModelAndView mainDo(HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
 
        List<RecentDTO> recentList = userService.recentList();
        userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        List<PostsDTO> newFollowerList = userService.newFollowerList(userSessionDTO);
 
        List<HashtagsDTO> newFollowerHashList = userService.newFollowerHashList(userSessionDTO);
 
        mav.setViewName("index");
        mav.addObject("recentList", recentList);
        mav.addObject("newFollowertList", newFollowerList);
        mav.addObject("newFollowerHashList", newFollowerHashList);
        return mav;
    }
 
    @RequestMapping(value = "/postHashtag.do")
    public ModelAndView postHashtag() {
        return new ModelAndView("postHashtag");
    }
 
    @RequestMapping(value = "/headerShared.do")
    public ModelAndView headerShared() {
        return new ModelAndView("headerShared");
    }
 
    @RequestMapping(value = "/sideBar.do")
    public ModelAndView side() {
        List<RecentDTO> recentList = userService.realTimeList();
        return new ModelAndView("sideBar").addObject("recentList", recentList);
 
    }
 
    @RequestMapping(value = "/header.do")
    public ModelAndView header() {
        return new ModelAndView("header");
    }
 
    // mydata
    @RequestMapping(value = "/myposts.do", method = RequestMethod.GET)
    public ModelAndView myposts(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
 
        String keyword = "";
        keyword = req.getParameter("keyword");
 
        userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        userSessionDTO.setUser_passwd(keyword);
 
        List<HashtagsDTO> myHashtagsList = userService.myHashtagsList(userSessionDTO);
        UserDTO userDTO = userService.dtoUser(userSessionDTO);
 
        mav.setViewName("body1");
        mav.addObject("follow",userDTO);
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString());     
        mav.addObject("udto",udto);
        mav.addObject("userDTO", userDTO);
        mav.addObject("hashtagsList", myHashtagsList);
        if (keyword.equals(".all")) {
            List<PostsDTO> myPostsList = userService.myPostsList(userSessionDTO);
            List<HashtagsDTO> myPostHashList = userService.myPostHashList(userSessionDTO);
 
            mav.addObject("myPostsList", myPostsList);
            mav.addObject("myPostHashList", myPostHashList);
 
        } else {
            // keyword로 검색
            List<PostsDTO> myPostsList = userService.myKeywordPostsList(userSessionDTO);
            List<HashtagsDTO> myPostHashList = userService.myKeywordPostHashList(userSessionDTO);
 
            mav.addObject("myPostsList", myPostsList);
            mav.addObject("myPostHashList", myPostHashList);
        }
 
        return mav;
    }
 
    @RequestMapping(value = "/sharedposts.do", method = RequestMethod.GET)
    public ModelAndView sharedposts(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
        String keyword = "";
        keyword = req.getParameter("keyword");
        List<PostsDTO> myPostsList;
        userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        List<HashtagsDTO> sharedHashtagsList = userService.sharedHashtagsList(userSessionDTO);
        if (keyword.equals(".all")) {
            myPostsList = userService.sharedPostsList(userSessionDTO);      
        }else {
            GetParameterDTO getParameterDTO = new GetParameterDTO();
            getParameterDTO.setUser_id(httpSession.getAttribute("login_user").toString());
            getParameterDTO.setKeyword(keyword);
            myPostsList = userService.sharedSpecKeyPostsList(getParameterDTO);                  
        }
        UserDTO userDTO = userService.dtoUser(userSessionDTO);
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString());     
        mav.addObject("udto",udto);
        mav.setViewName("body1");
        mav.addObject("follow",userDTO);
        mav.addObject("userDTO", userDTO);
        mav.addObject("myPostsList", myPostsList);      
        mav.addObject("hashtagsList", sharedHashtagsList);
 
        return mav;
    }
 
    // groupdata
    @RequestMapping(value = "/team.do", method = RequestMethod.GET)
    public ModelAndView team(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
 
        String keyword = "";
        keyword = req.getParameter("keyword");
        GetParameterDTO getParameterDTO = new GetParameterDTO();
        userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        userSessionDTO.setUser_passwd(keyword);
 
        UserDTO userDTO = userService.dtoTeam(userSessionDTO);
        getParameterDTO.setTeam_name(userDTO.getTeam_name());
        getParameterDTO.setKeyword(keyword);
        getParameterDTO.setDepartment_id(userDTO.getDepartment_id());
         
        List<HashtagsDTO> teamHashtagsList = userService.teamHashtagsList(getParameterDTO);
 
        mav.setViewName("body1");
        userDTO.setUser_name(userDTO.getTeam_name());
        mav.addObject("userDTO", userDTO);
        mav.addObject("follow",userDTO);
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString());     
        mav.addObject("udto",udto);
        mav.addObject("hashtagsList", teamHashtagsList);
        if (keyword.equals(".all")) {
            List<PostsDTO> teamPostsList = userService.teamPostsList(getParameterDTO);
            List<HashtagsDTO> teamHashList = userService.teamHashtagsList(getParameterDTO);
 
            mav.addObject("myPostsList", teamPostsList);
            mav.addObject("myPostHashList", teamHashList);
 
        } else {
            // keyword로 검색
            List<PostsDTO> teamPostsList = userService.teamKeywordPostsList(getParameterDTO);
            List<HashtagsDTO> teamHashList = userService.teamHashtagsList(getParameterDTO);
 
            mav.addObject("myPostsList", teamPostsList);
            mav.addObject("myPostHashList", teamHashList);
        }
        return mav;
    }
 
    @RequestMapping(value = "/listHashtag.do", method = RequestMethod.POST)
    public ModelAndView listHashtag(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        String hashtag = req.getParameter("hashtag");
 
        ModelAndView mav = new ModelAndView();
        userSessionDTO = new UserSessionDTO(); // user_id를 hashtag로 쓸 예정
        userSessionDTO.setUser_id(hashtag);
 
        mav.setViewName("listHashtag");
 
        return mav;
    }
 
    @RequestMapping(value = "/following.do", method = RequestMethod.GET)
    public ModelAndView following(HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
 
        userSessionDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        UserDTO userDTO = userService.dtoUser(userSessionDTO);
        List<FollowingDTO> myFollowerList = userService.myFollowerList(userSessionDTO);
        List<FollowingDTO> myFollowingList = userService.myFollowingList(userSessionDTO);
 
        mav.setViewName("body2");
        mav.addObject("userDTO", userDTO);
        mav.addObject("myFollowerList", myFollowerList);
        mav.addObject("myFollowingList", myFollowingList);
        return mav;
    }
    @RequestMapping(value = "/followFunction.do", method = RequestMethod.POST)
    public ModelAndView followFunction(HttpSession httpSession) {
        ModelAndView mav = new ModelAndView();
        return mav;
    }
 
    @RequestMapping(value = "/sharedFunction.do", method = RequestMethod.POST)
    public ModelAndView sharedFunction(HttpSession httpSession) {
        ModelAndView mav = new ModelAndView();
        return mav;
    }
 
    //그룹에서 넘어오는 그룹(팀) 정보들.
    @RequestMapping(value = "/group.do", method = RequestMethod.GET)
    public ModelAndView group(HttpServletRequest req, HttpSession httpSession) {
        String department_id = req.getParameter("department_id");
        String team_id = req.getParameter("team_id");
        String lab_id = req.getParameter("lab_id");
        String bus_id = req.getParameter("bus_id");
        String field_id = req.getParameter("field_id");
        String keyword = req.getParameter("keyword");
        String name = req.getParameter("name");
         
        GroupsDTO groupsDTO = new GroupsDTO();
        groupsDTO.setDepartment_id(department_id);
        groupsDTO.setTeam_id(team_id);
        groupsDTO.setLab_id(lab_id);
        groupsDTO.setBus_id(bus_id);
        groupsDTO.setField_id(field_id);
        groupsDTO.setKeyword(keyword);
     
        ModelAndView mav = new ModelAndView();
        UserDTO userDTO = new UserDTO();
        userDTO.setUser_name(name);
        userDTO.setUser_id("groups");
        mav.addObject("follow",userDTO);
        mav.addObject("userDTO",userDTO);
        mav.setViewName("body1");
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString()); 
        mav.addObject("udto",udto);
//      mav.addObject("hashtagsList", teamHashtagsList);
         
        //나중에 이 코드 서비스로 옮겨야 함.
        //department_id로 검색 안되는 부분:
         
        List<PostsDTO> groupPostsList;
        List<HashtagsDTO> groupHashList;
         
        if(field_id.equals("99")) {
            //삼성전자 all 검색
            if(keyword.equals(".all")) {
                //모든 키워드가 검색
                 groupPostsList = userService.groupAllAllKeyPostsList(groupsDTO);
            }else {
                //특정 키워드 검색
                 groupPostsList = userService.groupAllSpecKeyPostsList(groupsDTO);
            }                       
             groupHashList = userService.groupAllAllKeyHashtagsList(groupsDTO);
 
        }else {
            if(bus_id.equals("99")){
                //부분 검색
                if(keyword.equals(".all")) {
                    //모든 키워드가 검색
                    groupPostsList = userService.groupFieldAllKeyPostsList(groupsDTO);
                     
                }else {
                    //특정 키워드 검색
                    groupPostsList = userService.groupFieldSepcKeyPostsList(groupsDTO);
         
                }
            groupHashList = userService.groupFieldAllKeyHashtagsList(groupsDTO);
            }else {
                if(lab_id.equals("99")) {
                    System.out.println("사업부 검색");               
 
                    //사업부 검색
                    if(keyword.equals(".all")) {
                        //모든 키워드가 검색
                        groupPostsList = userService.groupBusiAllKeyPostsList(groupsDTO);
                    }else {
                        //특정 키워드 검색
                        groupPostsList = userService.groupBusiSpecKeyPostsList(groupsDTO);
                    }
                    groupHashList = userService.groupBusiAllKeyHashtagsList(groupsDTO);
                }else {
                    if(team_id.equals("99")){
                        //실 검색
                        if(keyword.equals(".all")) {
                            //모든 키워드가 검색
                            groupPostsList = userService.groupLabAllKeyPostsList(groupsDTO);
                        }else {
                            //특정 키워드 검색
                            groupPostsList = userService.groupLabSpecKeyPostsList(groupsDTO);
                        }
                        groupHashList = userService.groupLabAllKeyHashtagsList(groupsDTO);
                         
                    }else {
                        //부서 검색 department_id로 검색하면 됨.
                        if(keyword.equals(".all")) {
                            //모든 키워드가 검색
                            groupPostsList = userService.groupTeamAllKeyPostsList(groupsDTO);
                        }else {
                            //특정 키워드 검색
                            groupPostsList = userService.groupTeamSpecKeyPostsList(groupsDTO);
                        }
                        groupHashList = userService.groupTeamAllKeyHashtagsList(groupsDTO);                 
                    }
                }
            }
        }
 
        mav.addObject("myPostsList", groupPostsList);
        mav.addObject("hashtagsList", groupHashList);
         
        return mav;
    }
    @RequestMapping(value = "/groups.do", method = RequestMethod.GET)
    public ModelAndView groups(HttpSession httpSession) {
         
        return new ModelAndView("body4");
    }
 
    @RequestMapping(value = "/search.do", method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest req, HttpSession httpSession) {
        String search = req.getParameter("search");
        userService = new UserServiceImpl();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("body5");
        if (search.charAt(0) == '#') {
            int length = search.length();
            search  = search.substring(1, length);
            List<PostsDTO> hashtagsDTO = userService.searchHashs(search);
            mav.addObject("result", hashtagsDTO);
            System.out.println(search);
        } else {
            List<PostsDTO> postDTO = userService.searchPosts(search);
            mav.addObject("result", postDTO);
            System.out.println(search);
        }
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString()); 
        mav.addObject("udto",udto);     
        return mav;
    }
 
    @RequestMapping(value = "/othersPosts.do")
    public ModelAndView otherPosts(HttpServletRequest req, HttpSession httpSession) {
        userService = new UserServiceImpl();
        userSessionDTO = new UserSessionDTO();
        ModelAndView mav = new ModelAndView();
 
        String name = "", keyword="", user_id;
        user_id = req.getParameter("user_id");
        name = req.getParameter("othername");
        keyword = req.getParameter("keyword");
         
        GetParameterDTO getParameterDTO  = new GetParameterDTO();
        userSessionDTO.setUser_id(user_id);
        getParameterDTO.setUser_id(user_id);
        getParameterDTO.setUser_name(name);
        getParameterDTO.setKeyword(keyword);
         
 
        List<HashtagsDTO> otherHashtagsList = userService.otherHashtagsList(getParameterDTO);
        UserDTO teamDTO = userService.dtoTeam(userSessionDTO);
        UserDTO userDTO = new UserDTO();
        userDTO.setUser_id(httpSession.getAttribute("login_user").toString());
        mav.setViewName("body1");
        mav.addObject("userDTO",teamDTO);
        mav.addObject("follow",userDTO);
         
        mav.addObject("hashtagsList", otherHashtagsList);
        if (keyword.equals(".all")) {
            List<PostsDTO> otherPostsList = userService.otherPostsList(getParameterDTO);
            List<HashtagsDTO> otehrPostHashList = userService.otherPostHashList(getParameterDTO);
 
            mav.addObject("myPostsList", otherPostsList);
            mav.addObject("myPostHashList", otehrPostHashList);
 
        } else {
            // keyword로 검색
            List<PostsDTO> otherPostsList = userService.otherKeywordPostsList(getParameterDTO);
            List<HashtagsDTO> otehrPostHashList = userService.otherKeywordPostHashList(getParameterDTO);
 
            mav.addObject("myPostsList", otherPostsList);
            mav.addObject("myPostHashList", otehrPostHashList);
        }
        UserSessionDTO udto = new UserSessionDTO();     
        udto.setUser_id(httpSession.getAttribute("login_user").toString()); 
        mav.addObject("udto",udto);
        return mav;
    }
 
    @RequestMapping(value = "/test.do")
    public ModelAndView test(HttpSession httpSession) {
        return new ModelAndView("test");
    }
    //hightlight 작업
    @RequestMapping(value = "/highlight_insert.do", method = RequestMethod.POST)
    public ModelAndView highlight_insert() {
        return new ModelAndView("highlight_insert");
    }
 
    //hightlight 작업
    @RequestMapping(value = "/highlight_insert.do", method = RequestMethod.GET)
    public ModelAndView highlight_insertGET() {
        return new ModelAndView("highlight_insert");
    }
    //hightlight 작업
    @RequestMapping(value = "/highlight_execute.do", method = RequestMethod.GET)
    public ModelAndView highlight_execute() {
        return new ModelAndView("highlight_execute");
    }
    //hightlight 작업
    @RequestMapping(value = "/highlight_execute.do", method = RequestMethod.POST)
    public ModelAndView highlight_executePost() {
        return new ModelAndView("highlight_execute");
    }
 
    //hightlight 작업
    @RequestMapping(value = "/findHash.do", method = RequestMethod.POST)
    public ModelAndView findHash() {
        return new ModelAndView();
    }
     
}
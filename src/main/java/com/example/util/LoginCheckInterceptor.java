package com.example.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dto.UserDTO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hander) throws Exception{
        HttpSession session = request.getSession(false);
        if(session == null) {
            response.sendRedirect("/loginfail.do");
            return false;
        }
        UserDTO userDTO = (UserDTO)session.getAttribute("login_user");
        if(userDTO == null) {
            response.sendRedirect("/loginfail.do");
            return false;
        }
        return true;
    }
}
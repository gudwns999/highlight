package com.example.dto;

public class UserSessionDTO {
    private String user_id;
    private String user_passwd;
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getUser_passwd() {
        return user_passwd;
    }
    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }
}
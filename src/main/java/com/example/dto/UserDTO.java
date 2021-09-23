package com.example.dto;

public class UserDTO {
    private String user_id;
    private String user_email;  
    private String user_name;
    private String user_passwd;
    private String department_id;
     
     
    private String team_name;
    public String getTeam_name() {
        return team_name;
    }
 
    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }
 
    public UserDTO() {
         
    }
     
    public UserDTO(String user_id, String user_email, String user_name, String user_passwd, String department_id) {
        this.user_id = user_id;
        this.user_email = user_email;       
        this.user_name = user_name;
        this.user_passwd = user_passwd;
        this.department_id = department_id;
    }
 
    public String getUser_id() {
        return user_id;
    }
 
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
 
    public String getUser_email() {
        return user_email;
    }
 
    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
 
    public String getUser_name() {
        return user_name;
    }
 
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
 
    public String getUser_passwd() {
        return user_passwd;
    }
 
    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }
 
    public String getDepartment_id() {
        return department_id;
    }
 
    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }
 
}
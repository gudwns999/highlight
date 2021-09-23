package com.example.dto;

public class FollowingDTO {
    private String user_id;
    private String user_name;
    private String department_id;
    private String team_name;
    private String department_name;
     
    private String following_id;
    private String following_name;
     
     
     
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getFollowing_id() {
        return following_id;
    }
    public void setFollowing_id(String following_id) {
        this.following_id = following_id;
    }
    public String getFollowing_name() {
        return following_name;
    }
    public void setFollowing_name(String following_name) {
        this.following_name = following_name;
    }
    public String getTeam_name() {
        return team_name;
    }
    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }
    public String getDepartment_name() {
        return department_name;
    }
    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getDepartment_id() {
        return department_id;
    }
    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }
 
}
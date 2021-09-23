package com.example.dto;

public class GetParameterDTO {
    private String user_id;
    private String user_name;
    private String department_id;
 
    private String keyword;
    private String team_name;
     
    private String hashtag;
     
    public String getHashtag() {
        return hashtag;
    }
 
    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }
 
    public String getTeam_name() {
        return team_name;
    }
 
    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }
 
    public String getUser_id() {
        return user_id;
    }
 
    public void setUser_id(String user_id) {
        this.user_id = user_id;
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
 
    public String getKeyword() {
        return keyword;
    }
 
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
 
}
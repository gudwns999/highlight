package com.example.dto;

public class PostsDTO {
    private String post_id;
    private String post_name;
    private String post_contents;
    private String scrap_uri;
    private String scrap_highlights;
    private String post_date;
    private int post_like;
    private int post_shared;
    private String user_id;
    private String department_id;
    private String delete_yn;
     
    private String user_name;
    private String team_name;
     
    public String getTeam_name() {
        return team_name;
    }
    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getPost_id() {
        return post_id;
    }
    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }
    public String getPost_name() {
        return post_name;
    }
    public void setPost_name(String post_name) {
        this.post_name = post_name;
    }
    public String getPost_contents() {
        return post_contents;
    }
    public void setPost_contents(String post_contents) {
        this.post_contents = post_contents;
    }
    public String getScrap_uri() {
        return scrap_uri;
    }
    public void setScrap_uri(String scarp_uri) {
        this.scrap_uri = scarp_uri;
    }
    public String getScrap_highlights() {
        return scrap_highlights;
    }
    public void setScrap_highlights(String scrap_highlights) {
        this.scrap_highlights = scrap_highlights;
    }
    public String getPost_date() {
        return post_date;
    }
    public void setPost_date(String post_date) {
        this.post_date = post_date;
    }
    public int getPost_like() {
        return post_like;
    }
    public void setPost_like(int post_like) {
        this.post_like = post_like;
    }
    public int getPost_shared() {
        return post_shared;
    }
    public void setPost_shared(int post_shared) {
        this.post_shared = post_shared;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getDepartment_id() {
        return department_id;
    }
    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }
    public String getDelete_yn() {
        return delete_yn;
    }
    public void setDelete_yn(String delete_yn) {
        this.delete_yn = delete_yn;
    }   
}
 
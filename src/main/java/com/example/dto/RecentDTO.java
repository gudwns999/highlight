package com.example.dto;

public class RecentDTO {
    private String post_hashtag;
    private int count;
    private String user_id;
    private int post_id;
     
    private String hashtag;
     
    public String getHashtag() {
        return hashtag;
    }
    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }
    public int getPost_id() {
        return post_id;
    }
    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getPost_hashtag() {
        return post_hashtag;
    }
    public void setPost_hashtag(String post_hashtag) {
        this.post_hashtag = post_hashtag;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
}
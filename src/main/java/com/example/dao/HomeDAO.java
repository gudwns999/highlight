package com.example.dao;

import com.example.dto.HomeDTO;
 
public interface HomeDAO {
    public int getUser_id();
    public boolean insertUser(HomeDTO dto);
}
 

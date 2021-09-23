//HomeDAOImpl.java
package com.example.dao;
 
import com.example.dto.HomeDTO;
import com.example.mybatis.HomeMapper;
 
public class HomeDAOImpl implements HomeDAO{
    @Override
    public int getUser_id() {
        return HomeMapper.getUser_id();
    }
     
    @Override
    public boolean insertUser(HomeDTO dto) {
        return HomeMapper.insertUser(dto);
    }
}
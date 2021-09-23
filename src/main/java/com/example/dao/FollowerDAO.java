package com.example.dao;

import java.util.List;

import com.example.dto.FollowingDTO;
import com.example.dto.UserSessionDTO;
import com.example.mybatis.BoardMapper;
 
public class FollowerDAO {
    public List<FollowingDTO> selectMyFollower(UserSessionDTO userSessionDTO){
        return BoardMapper.selectMyFollower(userSessionDTO);
    }
    public List<FollowingDTO> selectMyFollowing(UserSessionDTO userSessionDTO){
        return BoardMapper.selectMyFollowing(userSessionDTO);
    }
     
}
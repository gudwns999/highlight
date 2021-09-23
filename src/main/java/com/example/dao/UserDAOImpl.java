package com.example.dao;

import java.util.List;

import com.example.dto.FollowingDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
import com.example.mybatis.UserMapper;
 
public class UserDAOImpl implements UserDAO {
    UserMapper mapper;
    @Override
    public boolean findUser(String user_id, String user_passwd) {
        return UserMapper.findUser(user_id, user_passwd);
    }
    @Override
    public boolean registerUser(UserDTO userDTO) {
        //등록 성공 여부 리턴
        return UserMapper.registerUser(userDTO);
    }
    @Override
    public boolean insertFollowing(FollowingDTO followingDTO) {
        //등록 성공 여부 리턴
        return UserMapper.insertFollowing(followingDTO);
    }   
    @Override
    public UserDTO selectUserDTO(UserSessionDTO userSessionDTO) {
        return UserMapper.selectUser(userSessionDTO);
    }
    @Override
    public UserDTO selectTeamDTO(UserSessionDTO userSessionDTO) {
        return UserMapper.selectTeam(userSessionDTO);
    }
     
    @Override
    public List<UserDTO> selectSearchUser(UserDTO userDTO) {
        return UserMapper.selectSearchUser(userDTO);
    }     
}
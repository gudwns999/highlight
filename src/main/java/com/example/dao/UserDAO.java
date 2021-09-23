package com.example.dao;

import java.util.List;

import com.example.dto.FollowingDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
 
public interface UserDAO {
    //회원 검색
    public boolean findUser(String user_id, String user_passwd);
    //회원가입 처리
    public boolean registerUser(UserDTO userDTO);
     
    public UserDTO selectUserDTO(UserSessionDTO userSessionDTO);
    public UserDTO selectTeamDTO(UserSessionDTO userSessionDTO);
     
    public boolean insertFollowing(FollowingDTO followingDTO);
     
    public List<UserDTO> selectSearchUser(UserDTO userDTO);
}
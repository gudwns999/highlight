package com.example.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dto.FollowingDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
 
public class UserMapper {
    private static SqlSessionFactory sqlMapper;
     
    static {
        try {
            String resource = "/SqlMapConfig.xml";
            Reader reader = Resources.getResourceAsReader(resource);
             
            sqlMapper = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        }catch(IOException e) {
            throw new RuntimeException("error: "+e,e);
        }
    }
    //유저 검색
    public static boolean findUser(String user_id, String user_passwd) {
        SqlSession session = sqlMapper.openSession();
        Map<String, Object> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("user_passwd", user_passwd);
        int res = (int) session.selectOne("findUser",param);
        session.close();
         
        return res==1?true:false;
    }
    //유저 등록
    public static boolean registerUser(UserDTO userDTO) {
        SqlSession session = sqlMapper.openSession();
        int res = session.insert("registerUser", userDTO);
        session.commit();
        session.close();
        return res>0?true:false;
    }
    //유저 등록
    public static boolean insertFollowing(FollowingDTO followingDTO) {
        SqlSession session = sqlMapper.openSession();
        int res = session.insert("insertFollowing", followingDTO);
        session.commit();
        session.close();
        return res>0?true:false;
    }
     
    //유저 DTO에 넣을
    public static UserDTO selectUser(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        Map<String, Object> param = new HashMap<>();
        param.put("user_id", userSessionDTO.getUser_id());
        UserDTO userDTO = (UserDTO) session.selectOne("selectUser",param);
        return userDTO;
    }
    //유저 DTO에 넣을
    public static UserDTO selectTeam(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        UserDTO userDTO = (UserDTO) session.selectOne("selectTeam",userSessionDTO);
        return userDTO;
    }
     
    //유저 DTO에 넣을
    public static List<UserDTO> selectSearchUser(UserDTO userDTO) {
        SqlSession session = sqlMapper.openSession();
        List<UserDTO> userDTOList = session.selectList("selectSearchUser",userDTO);
        return userDTOList;
    }
     
     
}
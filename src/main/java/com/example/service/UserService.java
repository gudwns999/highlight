package com.example.service;

import java.util.List;
 
import javax.servlet.http.HttpSession;

import com.example.dto.FollowingDTO;
import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.HashtagsDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RecentDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
 
public interface UserService {
 
    //회원 가입 처리
    void register(UserDTO userDTO) throws Exception;
    //로그인 시 유저 있는지 검색
    boolean findUser(String user_id, String user_passwd , HttpSession httpSession, UserSessionDTO userSessionDTO) throws Exception;
    boolean followUser(FollowingDTO followingDTO);
     
    List<RecentDTO> recentList();
    List<RecentDTO> realTimeList();
     
     
    List<PostsDTO> newFollowerList(UserSessionDTO userSessionDTO);
    List<PostsDTO> searchHashs(String search);
    List<PostsDTO> searchPosts(String search);
    List<PostsDTO> myPostsList(UserSessionDTO userSessionDTO);
    List<PostsDTO> otherPostsList(GetParameterDTO getParameterDTO);
     
    List<PostsDTO> teamPostsList(GetParameterDTO getParameterDTO);
 
    List<PostsDTO> sharedPostsList(UserSessionDTO userSessionDTO);
    List<PostsDTO> sharedSpecKeyPostsList(GetParameterDTO getParameterDTO);
     
     
     
    List<UserDTO> searchUser(UserDTO userDTO);
     
     
    List<PostsDTO> myKeywordPostsList(UserSessionDTO userSessionDTO);
    List<PostsDTO> teamKeywordPostsList(GetParameterDTO getParameterDTO);
    List<PostsDTO> otherKeywordPostsList(GetParameterDTO getParameterDTO);
     
    List<PostsDTO> dynamicPostsList(UserSessionDTO userSessionDTO);   
     
    void logOutUser(HttpSession httpSession);
     
    List<HashtagsDTO> myHashtagsList(UserSessionDTO userSessionDTO);
    List<HashtagsDTO> teamHashtagsList(GetParameterDTO getParameterDTO);
    List<HashtagsDTO> otherHashtagsList(GetParameterDTO getParameterDTO);
    List<HashtagsDTO> otherKeywordPostHashList(GetParameterDTO getParameterDTO);
 
     
     
    List<HashtagsDTO> myKeywordPostHashList(UserSessionDTO userSessionDTO);
    List<HashtagsDTO> teamKeywordPostHashList(GetParameterDTO getParameterDTO);
 
    List<HashtagsDTO> teamPostHashList(GetParameterDTO getParameterDTO);
    List<HashtagsDTO> otherPostHashList(GetParameterDTO getParameterDTO);
     
 
    List<HashtagsDTO> sharedHashtagsList(UserSessionDTO userSessionDTO);
    List<HashtagsDTO> myPostHashList(UserSessionDTO userSessionDTO);
    List<HashtagsDTO> newFollowerHashList(UserSessionDTO userSessionDTO);
     
     
    List<FollowingDTO> myFollowerList(UserSessionDTO userSessionDTO);
    List<FollowingDTO> myFollowingList(UserSessionDTO userSessionDTO);
 
 
     
    UserDTO dtoUser(UserSessionDTO userSessionDTO);
    UserDTO dtoTeam(UserSessionDTO userSessionDTO);
 
    //그룹
    List<PostsDTO> groupAllAllKeyPostsList(GroupsDTO groupsDTO);
    List<HashtagsDTO> groupAllAllKeyHashtagsList(GroupsDTO groupsDTO);
    List<PostsDTO> groupAllSpecKeyPostsList(GroupsDTO groupsDTO);
//  List<HashtagsDTO> groupAllSpecKeyHashtagsList(GroupsDTO groupsDTO);
 
    List<PostsDTO> groupFieldAllKeyPostsList(GroupsDTO groupsDTO);
    List<HashtagsDTO> groupFieldAllKeyHashtagsList(GroupsDTO groupsDTO);
    List<PostsDTO> groupFieldSepcKeyPostsList(GroupsDTO groupsDTO);
//  List<HashtagsDTO> groupFieldSepcKeyHashtagsList(GroupsDTO groupsDTO);
 
    List<PostsDTO> groupBusiAllKeyPostsList(GroupsDTO groupsDTO);
    List<HashtagsDTO> groupBusiAllKeyHashtagsList(GroupsDTO groupsDTO);
    List<PostsDTO> groupBusiSpecKeyPostsList(GroupsDTO groupsDTO);
//  List<HashtagsDTO> groupBusiSpecKeyHashtagsList(GroupsDTO groupsDTO);
 
    List<PostsDTO> groupLabAllKeyPostsList(GroupsDTO groupsDTO);
    List<HashtagsDTO> groupLabAllKeyHashtagsList(GroupsDTO groupsDTO);
    List<PostsDTO> groupLabSpecKeyPostsList(GroupsDTO groupsDTO);
//  List<HashtagsDTO> groupBusiSpecKeyHashtagsList(GroupsDTO groupsDTO);
     
    List<PostsDTO> groupTeamAllKeyPostsList(GroupsDTO groupsDTO);
    List<HashtagsDTO> groupTeamAllKeyHashtagsList(GroupsDTO groupsDTO);
    List<PostsDTO> groupTeamSpecKeyPostsList(GroupsDTO groupsDTO);
//  List<HashtagsDTO> groupTeamSepcKeyHashtagsList(GroupsDTO groupsDTO);
 
}
package com.example.dao;

import java.util.List;

import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RecentDTO;
import com.example.dto.UserSessionDTO;
import com.example.mybatis.BoardMapper;
 
public class BoardDAO {
    public List<RecentDTO> selectRecent(){
        return BoardMapper.selectRecent();
    };
    public List<RecentDTO> selectrealTimeList(){
        return BoardMapper.selectrealTimeList();
    };
     
    public List<PostsDTO> selectMyposts(UserSessionDTO userSessionDTO){
        return BoardMapper.selectMyposts(userSessionDTO);
    };  
    public List<PostsDTO> selectSharedPostsList(UserSessionDTO userSessionDTO){
        return BoardMapper.selectSharedPostsList(userSessionDTO);
    };      
     
    public List<PostsDTO> selectOtherPostsLists(GetParameterDTO getParameterDTO){
        return BoardMapper.selectOtherPostsLists(getParameterDTO);
    };      
    public List<PostsDTO> selectSharedSpecKeyPostsList(GetParameterDTO getParameterDTO){
        return BoardMapper.selectSharedSpecKeyPostsList(getParameterDTO);
    };      
     
     
    public List<PostsDTO> selectNewFollower(UserSessionDTO userSessionDTO){
        return BoardMapper.selectNewFollowerPostList(userSessionDTO);
    };
 
    public List<PostsDTO> selectSearchHashs(String search){
        return BoardMapper.selectSearchHashs(search);
    };
    public List<PostsDTO> selectDynamicPostsList(UserSessionDTO userSessionDTO){
        return BoardMapper.selectDynamicPostsList(userSessionDTO);
    };  
     
    public List<PostsDTO> selectSearchPosts(String search){
        return BoardMapper.selectSearchPosts(search);
    };  
    public List<PostsDTO> selectMyKeywordPosts(UserSessionDTO userSessionDTO){
        return BoardMapper.selectMyKeywordPosts(userSessionDTO);
    };  
    public List<PostsDTO> selectTeamposts(GetParameterDTO getParameterDTO){
        return BoardMapper.selectselectTeamposts(getParameterDTO);
    };      
    public List<PostsDTO> selectTeamKeywordPosts(UserSessionDTO userSessionDTO){
        return BoardMapper.selectTeamKeywordPosts(userSessionDTO);
    };      
    public List<PostsDTO> teamKeywordPostsList(GetParameterDTO getParamterDTO){
        return BoardMapper.selectTeamKeywordPostsList(getParamterDTO);
    };          
    public List<PostsDTO> selectOtherKeywordPostsList(GetParameterDTO getParameterDTO){
        return BoardMapper.selectOtherKeywordPostsList(getParameterDTO);
    };          
 
    //보드
    public List<PostsDTO> selectGroupAllAllKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupAllAllKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupAllSpecKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupAllSpecKeyPostsList(groupsDTO);
    };  
    public List<PostsDTO> selectGroupFieldAllKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupFieldAllKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupFieldSpecKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupFieldSpecKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupBusiAllKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupBusiAllKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupBusiSpecKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupBusiSpecKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupLabAllKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupLabAllKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupLabSpecKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupLabSpecKeyPostsList(groupsDTO);
    };
     
     
    public List<PostsDTO> selectGroupTeamAllKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupTeamAllKeyPostsList(groupsDTO);
    };
    public List<PostsDTO> selectGroupTeamSpecKeyPostsList(GroupsDTO groupsDTO){
        return BoardMapper.selectGroupTeamSpecKeyPostsList(groupsDTO);
    };
     
     
}
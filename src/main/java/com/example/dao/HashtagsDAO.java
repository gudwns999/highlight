package com.example.dao;

import java.util.List;

import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.HashtagsDTO;
import com.example.dto.UserSessionDTO;
import com.example.mybatis.BoardMapper;
 
public class HashtagsDAO {
 
    public List<HashtagsDTO> selectMyHashtags(UserSessionDTO userSessionDTO) {
        return BoardMapper.selectMyHashtags(userSessionDTO);
    };
 
    public List<HashtagsDTO> selectTeamHashtags(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectTeamHashtags(getParameterDTO);
    };
    public List<HashtagsDTO> selectOtherHashtags(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectOtherHashtags(getParameterDTO);
    };
 
    public List<HashtagsDTO> selectSharedHashtags(UserSessionDTO userSessionDTO) {
        return BoardMapper.selectSharedHashtags(userSessionDTO);
    };
 
    public List<HashtagsDTO> selectMyPostHashList(UserSessionDTO userSessionDTO) {
        return BoardMapper.selectMyPostHashList(userSessionDTO);
    };
 
    public List<HashtagsDTO> selectNewFollowerHashList(UserSessionDTO userSessionDTO) {
        return BoardMapper.selectNewFollowerHashList(userSessionDTO);
    };
 
    public List<HashtagsDTO> selectMyKeywordPostHashList(UserSessionDTO userSessionDTO) {
        return BoardMapper.selectMyKeywordPostHashList(userSessionDTO);
    };
    public List<HashtagsDTO> selectTeamPostHashList(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectTeamPostHashList(getParameterDTO);
    };
    public List<HashtagsDTO> selectOtherPostHashList(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectOtherPostHashList(getParameterDTO);
    };  
     
    public List<HashtagsDTO> selectTeamKeywordPostHashList(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectTeamKeywordPostHashList(getParameterDTO);
    };
    public List<HashtagsDTO> selectOtherKeywordPostHashList(GetParameterDTO getParameterDTO) {
        return BoardMapper.selectOtherKeywordPostHashList(getParameterDTO);
    };  
 
    //그룹
    public List<HashtagsDTO> selectGroupAllAllKeyHashtagsList(GroupsDTO groupsDTO) {
        return BoardMapper.selectGroupAllAllKeyHashtagsList(groupsDTO);
    };  
    public List<HashtagsDTO> selectGroupFieldAllKeyHashtagsList(GroupsDTO groupsDTO) {
        return BoardMapper.selectGroupFieldAllKeyHashtagsList(groupsDTO);
    };      
    public List<HashtagsDTO> selectGroupBusiAllKeyHashtagsList(GroupsDTO groupsDTO) {
        return BoardMapper.selectGroupBusiAllKeyHashtagsList(groupsDTO);
    };  
    public List<HashtagsDTO> selectGroupLabAllKeyHashtagsList(GroupsDTO groupsDTO) {
        return BoardMapper.selectGroupLabAllKeyHashtagsList(groupsDTO);
    };  
    public List<HashtagsDTO> selectGroupTeamAllKeyHashtagsList(GroupsDTO groupsDTO) {
        return BoardMapper.selectGroupTeamAllKeyHashtagsList(groupsDTO);
    };      
}
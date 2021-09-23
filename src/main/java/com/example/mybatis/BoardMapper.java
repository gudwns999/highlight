package com.example.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dto.FollowingDTO;
import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.HashtagsDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RecentDTO;
import com.example.dto.UserSessionDTO;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
 
public class BoardMapper {
    private static SqlSessionFactory sqlMapper;
 
    static {
        try {
            String resource = "SqlMapConfig.xml";
            Reader reader = Resources.getResourceAsReader(resource);
            sqlMapper = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        } catch (IOException e) {
            throw new RuntimeException("error: " + e, e);
        }
    }
 
    public static List<RecentDTO> selectRecent() {
        SqlSession session = sqlMapper.openSession();
        List<RecentDTO> recentList = session.selectList("selectRecent");
        session.close();
        return recentList;
    }
    public static List<RecentDTO> selectrealTimeList() {
        SqlSession session = sqlMapper.openSession();
        List<RecentDTO> recentList = session.selectList("selectrealTimeList");
        session.close();
        return recentList;
    }
     
    public static List<PostsDTO> selectSharedSpecKeyPostsList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> newFollowerList = session.selectList("selectSharedSpecKeyPostsList", getParameterDTO);
        session.close();
        return newFollowerList;
    };
    public static List<PostsDTO> selectSharedPostsList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> newFollowerList = session.selectList("selectSharedPostsList", userSessionDTO);
        session.close();
        return newFollowerList;
    };
     
    public static List<PostsDTO> selectNewFollowerPostList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> newFollowerList = session.selectList("selectNewFollowerPostList", userSessionDTO);
        session.close();
        return newFollowerList;
    };
 
    public static List<PostsDTO> selectSearchHashs(String search) {
        SqlSession session = sqlMapper.openSession();
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("search", search);
        List<PostsDTO> searchHashsList = session.selectList("selectSearchHashs", parameters);
        session.close();
        return searchHashsList;
    };
 
    public static List<PostsDTO> selectSearchPosts(String search) {
        SqlSession session = sqlMapper.openSession();
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("search", search);
        List<PostsDTO> searchPostsList = session.selectList("selectSearchPosts", parameters);
        session.close();
        return searchPostsList;
    };
    public static List<PostsDTO> selectOtherKeywordPostsList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> searchPostsList = session.selectList("selectOtherKeywordPostsList", getParameterDTO);
        session.close();
        return searchPostsList;
    };
     
    public static List<PostsDTO> selectMyposts(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myPostsList = session.selectList("selectMyPosts", userSessionDTO);
        session.close();
        return myPostsList;
    }
    public static List<PostsDTO> selectOtherPostsLists(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myPostsList = session.selectList("selectOtherPostsLists", getParameterDTO);
        session.close();
        return myPostsList;
    }
     
    public static List<PostsDTO> selectTeamKeywordPostsList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myPostsList = session.selectList("selectTeamKeywordPostsList", getParameterDTO);
        session.close();
        return myPostsList;
    }
     
    public static List<PostsDTO> selectDynamicPostsList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectDynamicPostsList", userSessionDTO);
        session.close();
        return myDynamicList;
    }
 
    public static List<PostsDTO> selectMyKeywordPosts(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectMyKeywordPosts", userSessionDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectselectTeamposts(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectTeamposts", getParameterDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectTeamKeywordPosts(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectTeamKeywordPosts", userSessionDTO);
        session.close();
        return myDynamicList;
    }   
    public static List<HashtagsDTO> selectMyHashtags(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectMyHashtags", userSessionDTO);
        session.close();
        return myHashtagsList;
    }
 
    public static List<HashtagsDTO> selectTeamHashtags(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectTeamHashtags", getParameterDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectOtherHashtags(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectOtherHashtags", getParameterDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectOtherPostHashList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectOtherPostHashList", getParameterDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectSharedHashtags(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectSharedHashtags", userSessionDTO);
        session.close();
        return myHashtagsList;
    }
 
    public static List<HashtagsDTO> selectMyPostHashList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectMyPostHashList", userSessionDTO);
        session.close();
        return myHashtagsList;
    }
 
    public static List<HashtagsDTO> selectNewFollowerHashList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectNewFollowerHashList", userSessionDTO);
        session.close();
        return myHashtagsList;
    }
 
    public static List<HashtagsDTO> selectMyKeywordPostHashList(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectMyKeywordPostHashList", userSessionDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectTeamPostHashList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectTeamPostHashList", getParameterDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectTeamKeywordPostHashList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectTeamKeywordPostHashList", getParameterDTO);
        session.close();
        return myHashtagsList;
    }
    public static List<HashtagsDTO> selectOtherKeywordPostHashList(GetParameterDTO getParameterDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectOtherKeywordPostHashList", getParameterDTO);
        session.close();
        return myHashtagsList;
    }   
     
         
 
    public static List<FollowingDTO> selectMyFollower(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<FollowingDTO> myFollowerList = session.selectList("selectMyFollower", userSessionDTO);
        session.close();
        return myFollowerList;
    }
 
    public static List<FollowingDTO> selectMyFollowing(UserSessionDTO userSessionDTO) {
        SqlSession session = sqlMapper.openSession();
        List<FollowingDTO> myFollowingList = session.selectList("selectMyFollowing", userSessionDTO);
        session.close();
        return myFollowingList;
    }
     
    //그룹
    public static List<PostsDTO> selectGroupAllAllKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupAllAllKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupAllSpecKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupAllSpecKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupFieldAllKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupFieldAllKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }   
    public static List<PostsDTO> selectGroupFieldSpecKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupFieldSpecKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupBusiAllKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupBusiAllKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupLabAllKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupLabAllKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupLabSpecKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupLabSpecKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }   
     
    public static List<PostsDTO> selectGroupBusiSpecKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupBusiSpecKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupTeamAllKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupTeamAllKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    public static List<PostsDTO> selectGroupTeamSpecKeyPostsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<PostsDTO> myDynamicList = session.selectList("selectGroupTeamSpecKeyPostsList", groupsDTO);
        session.close();
        return myDynamicList;
    }
    //그룹 해시태그
    public static List<HashtagsDTO> selectGroupAllAllKeyHashtagsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectGroupAllAllKeyHashtagsList", groupsDTO);
        session.close();
        return myHashtagsList;
    }   
    public static List<HashtagsDTO> selectGroupFieldAllKeyHashtagsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectGroupFieldAllKeyHashtagsList", groupsDTO);
        session.close();
        return myHashtagsList;
    }       
    public static List<HashtagsDTO> selectGroupBusiAllKeyHashtagsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectGroupBusiAllKeyHashtagsList", groupsDTO);
        session.close();
        return myHashtagsList;
    }           
    public static List<HashtagsDTO> selectGroupLabAllKeyHashtagsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectGroupLabAllKeyHashtagsList", groupsDTO);
        session.close();
        return myHashtagsList;
    }               
    public static List<HashtagsDTO> selectGroupTeamAllKeyHashtagsList(GroupsDTO groupsDTO) {
        SqlSession session = sqlMapper.openSession();
        List<HashtagsDTO> myHashtagsList = session.selectList("selectGroupTeamAllKeyHashtagsList", groupsDTO);
        session.close();
        return myHashtagsList;
    }           
}
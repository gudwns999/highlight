package com.example.service;

import java.util.List;
 
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.dao.FollowerDAO;
import com.example.dao.HashtagsDAO;
import com.example.dao.UserDAO;
import com.example.dao.UserDAOImpl;
import com.example.dto.FollowingDTO;
import com.example.dto.GetParameterDTO;
import com.example.dto.GroupsDTO;
import com.example.dto.HashtagsDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RecentDTO;
import com.example.dto.UserDTO;
import com.example.dto.UserSessionDTO;
 
@Service
public class UserServiceImpl implements UserService {
    @Override
    public void register(UserDTO userDTO) throws Exception {
        UserDAO userDAO = new UserDAOImpl();
        userDAO.registerUser(userDTO);
    }
 
    @Override
    public boolean findUser(String user_id, String user_passwd, HttpSession httpSession,
            UserSessionDTO userSessionDTO) {
        UserDAO userDAO = new UserDAOImpl();
        // 찾으면 true, 못찾으면 false
        boolean result = userDAO.findUser(user_id, user_passwd);
        if (result) {
            // 찾으면 여기서 세션을 등록해줌.
            // 로그인 성공시 세션에 유저 정보 삽입.
            userSessionDTO.setUser_id(user_id);
            userSessionDTO.setUser_passwd(user_passwd);
            httpSession.setAttribute("login_user", userSessionDTO.getUser_id());
        }
        return result;
    }
    @Override
    public boolean followUser(FollowingDTO followingDTO) {
        UserDAO userDAO = new UserDAOImpl();
        return userDAO.insertFollowing(followingDTO);       
    }
     
    @Override
    public void logOutUser(HttpSession httpSession) {
        httpSession.invalidate();
    }
 
    @Override
    public List<UserDTO> searchUser(UserDTO userDTO){
        UserDAO userDAO = new UserDAOImpl();
        return userDAO.selectSearchUser(userDTO);
    }   
    @Override
    public List<PostsDTO> sharedSpecKeyPostsList(GetParameterDTO getParameterDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.selectSharedSpecKeyPostsList(getParameterDTO);
    }
     
    @Override
    public List<RecentDTO> recentList() {
        BoardDAO recentDAO = new BoardDAO();
        return recentDAO.selectRecent();
    }
    @Override
    public List<RecentDTO> realTimeList() {
        BoardDAO recentDAO = new BoardDAO();
        return recentDAO.selectrealTimeList();
    }
    @Override
    public List<PostsDTO> myPostsList(UserSessionDTO userSessionDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.selectMyposts(userSessionDTO);
    }
    @Override
    public List<PostsDTO> teamPostsList(GetParameterDTO getParameterDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.selectTeamposts(getParameterDTO);
    }
    @Override
    public List<PostsDTO> otherPostsList(GetParameterDTO getParameterDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.selectOtherPostsLists(getParameterDTO);
    }
     
    @Override
    public List<PostsDTO> myKeywordPostsList(UserSessionDTO userSessionDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.selectMyKeywordPosts(userSessionDTO);
    }
    @Override
    public List<PostsDTO> teamKeywordPostsList(GetParameterDTO getParameterDTO) {
        BoardDAO myPostsDAO = new BoardDAO();
        return myPostsDAO.teamKeywordPostsList(getParameterDTO);
    }
     
    @Override
    public List<PostsDTO> newFollowerList(UserSessionDTO userSessionDTO) {
        BoardDAO newFollowerDAO = new BoardDAO();
 
        return newFollowerDAO.selectNewFollower(userSessionDTO);
    }
 
    @Override
    public List<PostsDTO> searchHashs(String search) {
        BoardDAO searchDAO = new BoardDAO();
 
        return searchDAO.selectSearchHashs(search);
    }
 
    @Override
    public List<PostsDTO> searchPosts(String search) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectSearchPosts(search);
    }
 
    @Override
    public List<PostsDTO> dynamicPostsList(UserSessionDTO userSessionDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectDynamicPostsList(userSessionDTO);
    }
    @Override
    public List<PostsDTO> sharedPostsList(UserSessionDTO userSessionDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectSharedPostsList(userSessionDTO);
    }
     
     
    @Override
    public List<PostsDTO> otherKeywordPostsList(GetParameterDTO getParameterDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectOtherKeywordPostsList(getParameterDTO);
    }
 
    @Override
    public UserDTO dtoUser(UserSessionDTO userSessionDTO) {
        UserDAO userDAO = new UserDAOImpl();
 
        return userDAO.selectUserDTO(userSessionDTO);
    }
    @Override
    public UserDTO dtoTeam(UserSessionDTO userSessionDTO) {
        UserDAO userDAO = new UserDAOImpl();
 
        return userDAO.selectTeamDTO(userSessionDTO);
    }
 
    @Override
    public List<HashtagsDTO> myHashtagsList(UserSessionDTO userSessionDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectMyHashtags(userSessionDTO);
    }
 
    @Override
    public List<HashtagsDTO> teamHashtagsList(GetParameterDTO getParameterDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectTeamHashtags(getParameterDTO);
    }
 
     
    @Override
    public List<HashtagsDTO> otherHashtagsList(GetParameterDTO getParameterDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectOtherHashtags(getParameterDTO);
    }
 
    @Override
    public List<HashtagsDTO> sharedHashtagsList(UserSessionDTO userSessionDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectSharedHashtags(userSessionDTO);
    }
 
    @Override
    public List<HashtagsDTO> myPostHashList(UserSessionDTO userSessionDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectMyPostHashList(userSessionDTO);
    }
    @Override
    public List<HashtagsDTO> teamPostHashList(GetParameterDTO getParameterDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectTeamPostHashList(getParameterDTO);
    }
    @Override
    public List<HashtagsDTO> otherPostHashList(GetParameterDTO getParameterDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectOtherPostHashList(getParameterDTO);
    }
         
    @Override
    public List<HashtagsDTO> myKeywordPostHashList(UserSessionDTO userSessionDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectMyKeywordPostHashList(userSessionDTO);
    }
    @Override
    public List<HashtagsDTO> otherKeywordPostHashList(GetParameterDTO getParameterDTO){
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectOtherKeywordPostHashList(getParameterDTO);
    }
 
    @Override
    public List<HashtagsDTO> newFollowerHashList(UserSessionDTO userSessionDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectNewFollowerHashList(userSessionDTO);
    }
 
    @Override
    public List<HashtagsDTO> teamKeywordPostHashList(GetParameterDTO getParameterDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectTeamKeywordPostHashList(getParameterDTO);
    }
     
    @Override
    public List<FollowingDTO> myFollowerList(UserSessionDTO userSessionDTO) {
        FollowerDAO followerDAO = new FollowerDAO();
        return followerDAO.selectMyFollower(userSessionDTO);
    }
 
    @Override
    public List<FollowingDTO> myFollowingList(UserSessionDTO userSessionDTO) {
        FollowerDAO followerDAO = new FollowerDAO();
        return followerDAO.selectMyFollowing(userSessionDTO);
    }
 
    //그룹
    @Override
    public List<PostsDTO> groupAllAllKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupAllAllKeyPostsList(groupsDTO);
    }   
    @Override
    public List<HashtagsDTO> groupAllAllKeyHashtagsList(GroupsDTO groupsDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectGroupAllAllKeyHashtagsList(groupsDTO);
    }
    @Override
    public List<PostsDTO> groupAllSpecKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupAllSpecKeyPostsList(groupsDTO);
    }   
 
    @Override
    public List<PostsDTO> groupFieldAllKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupFieldAllKeyPostsList(groupsDTO);
    }   
    @Override
    public List<HashtagsDTO> groupFieldAllKeyHashtagsList(GroupsDTO groupsDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectGroupFieldAllKeyHashtagsList(groupsDTO);
    }   @Override
    public List<PostsDTO> groupFieldSepcKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupFieldSpecKeyPostsList(groupsDTO);
    }   
    @Override
    public List<PostsDTO> groupBusiAllKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupBusiAllKeyPostsList(groupsDTO);
    }   
    @Override
    public List<HashtagsDTO> groupBusiAllKeyHashtagsList(GroupsDTO groupsDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectGroupBusiAllKeyHashtagsList(groupsDTO);
    }   @Override
    public List<PostsDTO> groupBusiSpecKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupBusiSpecKeyPostsList(groupsDTO);
    }   
    @Override
    public List<PostsDTO> groupLabAllKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupLabAllKeyPostsList(groupsDTO);
    }   
    @Override
    public List<HashtagsDTO> groupLabAllKeyHashtagsList(GroupsDTO groupsDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectGroupLabAllKeyHashtagsList(groupsDTO);
    }   @Override
    public List<PostsDTO> groupLabSpecKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupLabSpecKeyPostsList(groupsDTO);
    }       
    @Override
    public List<PostsDTO> groupTeamAllKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupTeamAllKeyPostsList(groupsDTO);
    }   
    @Override
    public List<HashtagsDTO> groupTeamAllKeyHashtagsList(GroupsDTO groupsDTO) {
        HashtagsDAO hashtagsDAO = new HashtagsDAO();
        return hashtagsDAO.selectGroupTeamAllKeyHashtagsList(groupsDTO);
    }   @Override
    public List<PostsDTO> groupTeamSpecKeyPostsList(GroupsDTO groupsDTO) {
        BoardDAO searchDAO = new BoardDAO();
        return searchDAO.selectGroupTeamSpecKeyPostsList(groupsDTO);
    }   
}
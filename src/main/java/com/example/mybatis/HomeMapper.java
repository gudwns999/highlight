package com.example.mybatis;

 
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import com.example.dto.HomeDTO;
import com.example.dto.RecentDTO;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
 
public class HomeMapper {
    private static SqlSessionFactory sqlMapper;
     
    static {
        try {
            String resource = "SqlMapConfig.xml";
            Reader reader = Resources.getResourceAsReader(resource);
            sqlMapper = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        }catch(IOException e) {
            throw new RuntimeException("error: "+e,e);
        }
    }
     
    public static int getUser_id() {
        SqlSession session = sqlMapper.openSession();
        int user_id = (int) session.selectOne("getUser");
        session.close();
        return user_id;     
    }
    public static boolean insertUser(HomeDTO dto) {
        SqlSession session = sqlMapper.openSession();
        int res = session.insert("insertUser", dto);
        session.commit();
        session.close();
        return res>0?true:false;
    }
 
}
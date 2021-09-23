<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%    
 
    String param1 = request.getParameter("hashtag");
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    try{
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  
        String id = "oracle";                                 
        String pw = "oracle";                                 
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
 
        String sql = "SELECT p.*, u.user_name from posts p, hashtags h, users u where p.post_id=h.post_id and p.user_id =u.user_id and h.hashtag='"+ param1+ "'";
        System.out.println(param1);
        pstmt = conn.prepareStatement(sql);   
        ResultSet rs = pstmt.executeQuery();
//      out.println(sql);
        while(rs.next()){
            int post_id = rs.getInt("post_id");
            String post_name = rs.getString("post_name");
            String post_contents = rs.getString("post_contents");
            String user_name = rs.getString("user_name");
            String scrap_highlights = rs.getString("scrap_highlights");
            String post_date = rs.getString("post_date");
            String post_shared = rs.getString("post_shared");
            String user_id = rs.getString("user_id");
            String department_id = rs.getString("department_id");
            String delete_yn = rs.getString("delete_yn");
             
 
            out.println(post_contents);
            out.println(post_name);
            out.println(user_name);
            out.println(post_date);
 
        }
    }
    catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
        e.printStackTrace();
    }
    finally{
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
 
 
%>
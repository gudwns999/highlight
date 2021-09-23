<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
 
<%  request.setCharacterEncoding("UTF-8");
    String post_name = request.getParameter("post_name");
    String post_contents = request.getParameter("post_contents");
    String hashtag1 = request.getParameter("hashtag1");
    String hashtag2 = request.getParameter("hashtag2");
    String hashtag3 = request.getParameter("hashtag3");
    String hashtag4 = request.getParameter("hashtag4");
 
    String scrap_highlights = request.getParameter("scrap_highlights");
    String scrap_uri = request.getParameter("scrap_uri");
    String user_id = request.getParameter("user_id");
    String user_passwd = request.getParameter("user_passwd");
    String department_id = "null";
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String post_date = dateFormat.format(date);
 
    System.out.println("post_date: "+post_date);
    System.out.println("post_name: "+post_name);
    System.out.println("post_content: "+post_contents);
    System.out.println("hashtag1: "+hashtag1);
    System.out.println("hashtag2: "+hashtag2);
    System.out.println("hashtag3: "+hashtag3);
    System.out.println("hashtag4: "+hashtag4);
     
    System.out.println(scrap_highlights);
    System.out.println(scrap_uri);
 
    System.out.println(user_id);
    System.out.println(user_passwd);
     
     
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
//    PreparedStatement pstmt2 = null;
 
    try{
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  
        String id = "oracle";                                 
        String pw = "oracle";                                 
        Class.forName("oracle.jdbc.driver.OracleDriver");                 
        conn=DriverManager.getConnection(url,id,pw);     
         
        String sql = "select department_id from users where user_id ="+user_id;
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            department_id = rs.getString(1);            
        }
        System.out.println(department_id);
        rs.close();
        pstmt.close();
         
        sql = "insert into posts (post_id, post_name, post_contents, scrap_uri, scrap_highlights, post_date, post_like, post_shared, delete_yn, user_id, department_id) values (post_seq.NEXTVAL, '"+post_name+ "', '"+post_contents+ "', '"+scrap_uri+ "', '"+scrap_highlights+ "', '"+ post_date+ "', '0', '0', '0', '"+user_id+ "', '" +department_id+ "')";     
        System.out.println(sql);
 
//      sql = "insert into posts (post_id, post_name, post_contents, scrap_uri, scrap_highlights, post_date, post_like, post_shared, delete_yn, user_id, department_id) values (post_seq.NEXTVAL, '"+post_name+ "', '"+post_contents+ "', '"+scrap_uri+ "', '"+scrap_highlights+ "', '"+ post_date+ "', '0', '0', '0', '"+user_id+ "', '" +department_id+ "')";     
        pstmt = conn.prepareStatement(sql);     
        pstmt.executeUpdate();
        pstmt.close();
         
        if(!hashtag1.isEmpty()){
 
            sql = "insert into hashtags (hashtag, user_id, post_id) values ( '"+hashtag1+ "', '"+user_id +"', post_seq.CURRVAL)";     
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);     
            pstmt.executeUpdate();
            pstmt.close();          
        }
        if(!hashtag2.isEmpty()){
            sql = "insert into hashtags (hashtag, user_id, post_id) values ( '"+hashtag2+ "', '"+user_id +"', post_seq.CURRVAL)";     
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);     
            pstmt.executeUpdate();
            pstmt.close();  
        }
        if(!hashtag3.isEmpty()){
            sql = "insert into hashtags (hashtag, user_id, post_id) values ( '"+hashtag3+ "', '"+user_id +"', post_seq.CURRVAL)";     
            pstmt = conn.prepareStatement(sql);     
            pstmt.executeUpdate();
            pstmt.close();
             
        }    
        if(!hashtag4.isEmpty()){
            sql = "insert into hashtags (hashtag, user_id, post_id) values ( '"+hashtag4+ "', '"+user_id +"', post_seq.CURRVAL)";     
            pstmt = conn.prepareStatement(sql);     
            pstmt.executeUpdate();
            pstmt.close();          
        }
    }
    catch(Exception e){  
        e.printStackTrace();
    }
    finally{
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}   
    }
    %>
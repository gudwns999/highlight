<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%    
    String state = request.getParameter("state");
    String post_id = request.getParameter("post_id");
    String user_id = request.getParameter("user_id");
    String result = "";
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try{
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  
        String id = "oracle";                                 
        String pw = "oracle";                                 
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection(url,id,pw);
         
        if(state.equals("shared")){
            String sql = "insert into shared_posts (user_id, post_id) values ('"+user_id+"', '"+post_id+"')";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);   
            pstmt.executeUpdate();          
            out.println("shared 완료");                       
        }else if(state.equals("unshared")){
            String sql = "delete from shared_posts where user_id='"+user_id+"' and post_id='"+post_id+"'";
            pstmt = conn.prepareStatement(sql);   
            pstmt.executeUpdate();          
            out.println("unshared 완료");         
        }else if(state.equals("find")){
            String sql = "select * from shared_posts where user_id='"+user_id+"' and post_id='"+post_id+"'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);   
            ResultSet rs = pstmt.executeQuery();
            if(!rs.next()){
                //없으면 shared 가능
                result = "noo";
            }else{
                //있으면 shared 불가능
                result = "yes";
            }
 
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
<%=result %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%    
    String state = request.getParameter("state");
    String following_id = request.getParameter("following_id");
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
         
        if(state.equals("find")){
            String sql = "select * from followings where user_id='"+user_id+"' and following_id='"+following_id+"'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);   
            ResultSet rs = pstmt.executeQuery();
            if(!rs.next()){
                //없으면
                result = "noo";
//              out.print("no");
            }else{
                //있으면
                result = "yes";     
//              out.print("yes");               
            }
             
        }else if(state.equals("follow")){
            String sql = "insert into followings (following_id,user_id) values ('"+following_id+"' , '"+user_id+"')";
            pstmt = conn.prepareStatement(sql);   
            pstmt.executeUpdate();          
            out.println("팔로우 완료");          
        }else if(state.equals("unfollow")){
            String sql = "delete from followings where following_id ='"+following_id+"' and user_id = '"+user_id+"'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);   
            pstmt.executeUpdate();          
            out.println("팔로우 취소");                      
             
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
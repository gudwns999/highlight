<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%    
    String param1 = request.getParameter("param1");
    String param2 = request.getParameter("param2");
    String param3 = request.getParameter("param3");
    String param4 = request.getParameter("param4");
    String param5 = request.getParameter("param5");
 
     
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    try{
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  
        String id = "oracle";                                 
        String pw = "oracle";                                 
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
 
        String sql = "UPDATE "+param1+" SET "+param2+"= '"+param3+"' WHERE "+param4+" = '"+param5+"'";
        System.out.println(sql);
        pstmt = conn.prepareStatement(sql);   
        pstmt.executeUpdate();
    }
    catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
        e.printStackTrace();
    }
    finally{
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }    
%>
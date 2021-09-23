<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%    
    String sqls = request.getParameter("sql");  
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try{
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  
        String id = "oracle";                                 
        String pw = "oracle";                                 
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
 
//      String sql = "select * from users";
        pstmt = conn.prepareStatement(sqls); 
        rs = pstmt.executeQuery();
         
        ResultSetMetaData rsmd = rs.getMetaData();
        int cols = rsmd.getColumnCount();
        System.out.println(cols);
        while(rs.next()){
            String result = "";
            for(int i=1;i<=cols;i++){
                result += rs.getString(i);
                result += " ";
            }
            out.println(result);
             
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "admin.jsp" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<%int cnt = 1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="../../js/jquery-3.4.1.js"></script>
<script>
    function update_users(v1, v2){
        var p3, p4, p5;
        p1 = "posts";
        p2 = v2.previousSibling.getAttribute('id').toString();
        p3 = v2.previousSibling.value.toString();
        p4 = "user_id";
        p5 = v1;
            $.ajax({
                url:'/admin_modify.do',
                type:'post', // 메소드(get, post, put 등)
                data:{
                        param1:p1, 
                        param2:p2,
                        param3:p3,
                        param4:p4,
                        param5:p5
                    },
                success: function(data) {
                    alert("수정 완료");
                },
                error: function(err) {
                    alert(err);             
                    }
            });
    }
</script>
</head>
<body>
<table width="850" border="1">
<tr>
<td width="50">순번</td>
<td width="150">post_id</td>
<td width="200">post_name</td>
<td width="150">post_contents</td>
<td width="150">scrap_URI</td>
<td width="150">scrap_highlights</td>
<td width="150">post_date</td>
<td width="150">post_like</td>
<td width="150">post_shared</td>
<td width="150">user_id</td>
<td width="150">department_id</td>
<td width="150">delete_yn</td>
 
</tr>
<%
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
 
 
//String sql = "select * from users where user_id = ?";
String sql = "select * from posts";
pstmt = conn.prepareStatement(sql);   
//pstmt.setString(1,"12341234");
rs = pstmt.executeQuery();
while(rs.next()){          
    String post_id = rs.getString("post_id");
    String post_name = rs.getString("post_name");   
    String post_contents = rs.getString("post_contents");
    String scrap_URI = rs.getString("scrap_uri");   
    String scrap_highlights = rs.getString("scrap_highlights"); 
    String post_date = rs.getString("post_date");   
    String post_like = rs.getString("post_like");   
    String post_shared = rs.getString("post_shared");   
    String user_id = rs.getString("user_id");   
    String department_id = rs.getString("department_id");   
    String delete_yn = rs.getString("delete_yn");   
 
%>
<tr>
<td width="50"><%=cnt++%></td>
<td width="150"><input id="post_id" type="text" value=<%=post_id%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="200"><input id="post_name" type="text" value=<%=post_name%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="post_contents" type="text" value=<%=post_contents%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="scrap_URI" type="text" value=<%=scrap_URI%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="scrap_highlights" type="text" value=<%=scrap_highlights%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="post_date" type="text" value=<%=post_date%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id=post_like type="text" value=<%=post_like%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="post_shared" type="text" value=<%=post_shared%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="user_id" type="text" value=<%=user_id%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="department_id" type="text" value=<%=department_id%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
<td width="150"><input id="delete_yn" type="text" value=<%=delete_yn%>><button type="button" onclick="update_users('<%=user_id%>',this)" >수정</button></td>
 
</tr>
<%
    }
}
catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
    e.printStackTrace();
}
finally{
    if(rs != null) try{rs.close();}catch(SQLException sqle){}
    if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
    if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
 
 
%>
</body>
</html>
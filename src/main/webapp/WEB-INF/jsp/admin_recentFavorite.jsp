<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "admin.jsp" %>  
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
        p1 = "recentFavorite";
        p2 = v2.previousSibling.getAttribute('id').toString();
        p3 = v2.previousSibling.value.toString();
        p4 = "post_hashtag";
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
<table width="450" border="1">
<tr>
<td width="50">순번</td>
<td width="200">post_hashtag</td>
<td width="200">count</td>
 
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
 
 
String sql = "select * from recentFavorite";
pstmt = conn.prepareStatement(sql);   
rs = pstmt.executeQuery();
while(rs.next()){          
    String post_hashtag = rs.getString("post_hashtag");
    String count = rs.getString("count");   
 
%>
<tr>
<td width="50"><%=cnt++%></td>
<td width="150"><input id="post_hashtag" type="text" value=<%=post_hashtag%>><button type="button" onclick="update_users('<%=post_hashtag%>',this)" >수정</button></td>
<td width="200"><input id="count" type="text" value=<%=count%>><button type="button" onclick="update_users('<%=post_hashtag%>',this)" >수정</button></td>
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
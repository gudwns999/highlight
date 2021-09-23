<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#header {
    border: 2px solid gray;
    margin: 20px auto;
    text-align: center;
}
 
#header a {
    display: inline-block;
    text-decoration: none;
    border: 2px solid gold;
    padding: 10px;
    margin: 20px;
}
 
.menuContent {
    margin: 20px auto;
    padding: 20px;
    text-align: center;
}
 
</style>
<script>
var menu1, menu2, menu3, menu4, menu5, menu6, menu7, menu8;
var active;
 
function menuHandler(event) {
    var target = event.target.toString();
    target = target.substring(target.indexOf('#') + 1);
     
//  active.style.display = 'none';
     
    if(target === 'menu1') {
        active = menu1;
    }
    else if(target === 'menu2') {
        active = menu2;
    }
    else if(target === 'menu3') {
        active = menu3;
    }
    else if(target === 'menu4') {
        active = menu4;
    }
    else if(target === 'menu5') {
        active = menu5;
    }
    else if(target === 'menu6') {
        active = menu6;
    }   
    else if(target === 'menu7') {
        active = menu7;
    }   
    else if(target === 'menu8') {
        active = menu8;
    }   
//  active.style.display = 'block';
}
 
function init() {
    menu1 = document.querySelector('#menu1');
    menu2 = document.querySelector('#menu2');
    menu3 = document.querySelector('#menu3');
    menu4 = document.querySelector('#menu4');
    menu5 = document.querySelector('#menu5');
    menu6 = document.querySelector('#menu6');
    menu7 = document.querySelector('#menu7');   
    menu8 = document.querySelector('#menu8');   
 
/*  
    menu1.style.display = 'block';
    active = menu1;
     
    menu2.style.display = 'none';
    menu3.style.display = 'none';
    menu4.style.display = 'none';
    menu5.style.display = 'none';
    menu6.style.display = 'none';
    menu7.style.display = 'none';   
*/ 
    document.querySelector('#menus').addEventListener('click', menuHandler);
}
 
window.addEventListener('load', init);
 
</script>
</head>
<body>
 
    <div id="header">
        <div id="menus">
            <a href="/admin_users.do">users table</a>
            <a href="/admin_shared_posts.do">shared_posts table</a>
            <a href="/admin_posts.do">posts table</a>
            <a href="/admin_departments.do">departments table</a>
            <a href="/admin_followings.do">followings table</a>
            <a href="/admin_hashtags.do">hashtags table</a>
            <a href="/admin_recentFavorite.do">recentFavorite table</a>
            <a href="/admin_query.do">admin_query table</a>
        </div>
    </div>
 
//admin_departments.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
        p1 = "departments";
        p2 = v2.previousSibling.getAttribute('id').toString();
        p3 = v2.previousSibling.value.toString();
        p4 = "department_id";
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
<td width="150">department_id</td>
<td width="200">team_id</td>
<td width="150">lab_id</td>
<td width="150">bus_id</td>
<td width="150">field_id</td>
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
String sql = "select * from departments";
pstmt = conn.prepareStatement(sql);   
//pstmt.setString(1,"12341234");
rs = pstmt.executeQuery();
while(rs.next()){          
    String department_id = rs.getString("department_id");
    String team_id = rs.getString("team_id");   
    String lab_id = rs.getString("lab_id");
    String bus_id = rs.getString("bus_id"); 
    String field_id = rs.getString("field_id"); 
%>
<tr>
<td width="50"><%=cnt++%></td>
<td width="150"><input id="department_id" type="text" value=<%=department_id%>><button type="button" onclick="update_users('<%=department_id%>',this)" >수정</button></td>
<td width="200"><input id="team_id" type="text" value=<%=team_id%>><button type="button" onclick="update_users('<%=department_id%>',this)" >수정</button></td>
<td width="150"><input id="lab_id" type="text" value=<%=lab_id%>><button type="button" onclick="update_users('<%=department_id%>',this)" >수정</button></td>
<td width="150"><input id="bus_id" type="text" value=<%=bus_id%>><button type="button" onclick="update_users('<%=department_id%>',this)" >수정</button></td>
<td width="150"><input id="field_id" type="text" value=<%=field_id%>><button type="button" onclick="update_users('<%=department_id%>',this)" >수정</button></td>
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
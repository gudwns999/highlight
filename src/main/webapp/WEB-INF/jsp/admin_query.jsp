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
    function update_users(){
        var query = $('#sql_value').val();
            $.ajax({
                url:'/admin_returnQuery.do',
                type:'get', // 메소드(get, post, put 등)
                data:{
                        sql:query, 
                    },
                success: function(data) {
                    $('#result').text(data);
                },
                error: function(err) {
                    alert(err);             
                    }
            });
    }
</script>
</head>
<body>
 
    <input id = "sql_value" type="text">
    <button value="SUBMIT" onclick="update_users()" ></button>
 
<p id="result"> result </p>
</body>
</html>
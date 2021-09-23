<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form id="form"></form>
 
    <c:choose>
        <c:when test="${session == null}">
            <script>
                window.onload = function() {
                    var f = document.querySelector('#form');
                    f.action = "login.do";
                    f.method = "get";
                    f.submit();
                }
            </script>
        </c:when>
        <c:otherwise>
            <script>
                window.onload = function() {
                    var f = document.querySelector('#form');
                    f.action = "index.do";
                    f.method = "post";
                    f.submit();
                }
            </script> 
        ${userSessionDTO.user_id}
        login successs.......
    </c:otherwise>
    </c:choose>
 
</body>
</html>
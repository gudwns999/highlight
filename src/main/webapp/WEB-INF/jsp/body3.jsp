<%@ page contentType="text/html; charset=UTF-8"    import="java.util.*"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
 
<head>
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
 
<title>SB Admin - Dashboard</title>
 
<!-- Custom fonts for this template-->
<link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"  type="text/css">
 
<!-- Page level plugin CSS-->
<link href="../../vendor/datatables/dataTables.bootstrap4.css"   rel="stylesheet">
 
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
 
<jsp:include page ="/headerShared.do"/>
 
<%
    int cnt=1;
%>
<link rel="import" href="/fontStyle.do">
<script>
var tr;
var td;
var params;
 
function getUrlParams() {
    var p = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { p[key] = value; });
    return p;
}
 
window.onload = function(){
     
    params = getUrlParams();
}
 
//(4) 게시판 글 (Ajax 이벤트)
$(function(){
    $("#dataTable tr").click(function(){ 
        if($(this).closest('thead').prop('tagName') != 'THEAD'){
        tr = $(this);
        td = tr.children();
        location.href = "othersPosts.do?othername=".concat(td.eq(1).text()+"&keyword=.all&user_id="+td.eq(3).text());
        }
    });
});
 
</script>
 
<%-- (4) 게시판 글 (css)--%>
<style>
.followPosts {
    clear: both;
    float: left;
    padding: 10px;
    cursor: pointer;
    margin-bottom: 5px
}
</style>
 
</head>
 
<body class="jg" style="background: linear-gradient(#E4E4E4, #BEBEBE)"
    id="page-top">
    <%-- 1. header --%>
    <jsp:include page="/header.do" />
 
    <div id="wrapper">
 
        <%-- 2. sideBar --%>
        <jsp:include page="/sideBar.do" />
 
        <div id="content-wrapper" style="width: 100%">
            <!-- Current Page Path -->
            <ol class="breadcrumb" style="width: 30%">
                <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
            </ol>
 
            <div class="container-fluid" style="font-size: small;">
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-users"></i> 사람 찾기
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered followPosts" id="dataTable"
                                width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>순번</th>                                 
                                        <th>친구 이름</th>
                                        <th>소속</th>
                                        <td style="display:none;">id</td>                                           
                                         
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${searchUserList}" var="searchUserList">
                                        <tr>
                                            <td><%=cnt++ %></td>
                                            <td>${searchUserList.user_name}</td>
                                            <td>${searchUserList.team_name}</td>                                            
                                            <td style="display:none;">${searchUserList.user_id}</td>                                            
                                             
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
 
            </div>
 
        </div>
        <!-- /#wrapper -->
 
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"> <i
            class="fas fa-angle-up"></i>
        </a>
 
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
        <!-- Page level plugin JavaScript-->
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
 
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin.min.js"></script>
 
        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>
        <script src="js/demo/chart-area-demo.js"></script>
</body>
 
</html>
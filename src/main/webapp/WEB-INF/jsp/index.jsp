<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%int cnt = 1; %>
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
<link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
    type="text/css">
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
    rel="stylesheet">
 
<!-- Custom styles for this template-->
<link href="../../css/sb-admin.css" rel="stylesheet">
<%-- 1. header --%>
<jsp:include page="/headerShared.do" />
<jsp:include page="/header.do" />
 
 
<script>
    window.onload = function() {
        $(function() {
            $("#followBtn").click(function() {
                alert(td.eq(1).text());
            });
        });
    }
     
    // (4) 게시판 글 (Ajax 이벤트)
    $(function() {
        $("#dataTable tr").click(function() {
            //현재 클릭된 Row(<tr>)
            var tr = $(this);
            var td = tr.children();
 
            if($(this).closest('thead').prop('tagName') != 'THEAD'){
            $('#summaryModal').modal("show");
            }
            $('#mTitle').text(td.eq(0).text());
            $('#mWriter').text("작성자 : ".concat(td.eq(1).text()));
            $('#mSummary').text(td.eq(3).text());
 
            $('#urlID').text(td.eq(4).text());
            $('#highPath').text(td.eq(6).text());
             
            $.ajax({
                url: "/postHashtag.do",
                type: "post",
                data: {
                    post_id:td.eq(5).text()
                    },
                success: function(data){
 
                    $('#mHashTagID').text(data.toString());
                },
                error: function (request, status, error){        
 
                }
              });
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
<body class="jg" style="background: linear-gradient(#E3E3E3, #EEEEEE)"
    id="page-top">
    <!-- 모달 19.08.17 -->
    <div class="modal fade" id="summaryModal" style="font-size: small;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="mHead" style="color: white;background:#8977ad">게시글</div>
                <div class="modal-body" id="mBody"
                    style="opacity: 0.9; background: #9B9B9B; color: white">
                    <div class="container-fluid">
                        <label><i class="fas fa-fw fa-chevron-right"></i>제목</label><br>
                        <div id="mTitle"></div>
                        <div id="mWriter" align="right"></div>
                    </div>
                    <hr style="border: solid 1px white;">
 
                    <div align="right">
                        <button class="btn btn-danger btn-sm" id="shareBtn"
                            style="color: white">Unshare</button>
                        <button class="btn btn-danger btn-sm" id="followBtn"
                            style="color: white">Unfollow</button>
                    </div>
                    <div class="container-fluid">
                        <label><i class="fas fa-fw fa-chevron-right"></i>요약 내용</label><br>
                        <div id="mSummary"
                            style="overflow-y: scroll; width: 100%; height: 150px; color: black; padding: 4px; background: #FFFFFF;"></div>
 
                    </div>
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                        <label><i class="fas fa-fw fa-chevron-right"></i>해시 태그</label><br>
                        <div id="mHashTagID"
                            style="overflow-y: scroll; width: 100%; height: 80px; color: black; padding: 4px; background: #FFFFFF;"></div>
                    </div>
 
                    <div id="highPath" style="display: none;">highPath</div>
 
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                        <label><i class="fas fa-fw fa-chevron-right"
                            style="font-size: small"></i>URL</label><br>
                        <div
                            style="overflow-y: scroll; width: 100%; height: 50px; color: black; padding: 4px; background: #FFFFFF;">
                            <a id="urlID"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
 
    <div id="wrapper">
 
        <%-- 2. sideBar --%>
        <jsp:include page="/sideBar.do" />
 
        <div id="content-wrapper">
            <!-- Current Page Path -->
            <ol class="breadcrumb" style="width: 50%">
                <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
                <li class="breadcrumb-item active">Home</li>
            </ol>
 
            <form action="search_user.do">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-header" style="color: white;background:#8977ad">
                            <i class="fas fa-fw fa-users"></i> 사람 찾기
                        </div>
 
                        <!-- Navbar Search -->
                        <div class="input-group">
                            <input type="text" class="form-control" id="user_name"
                                name="user_name" placeholder="get your friends..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" id="searchPeople" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
 
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-fw fa-hashtag"></i> 주간 해시태그 순위
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="weekRank" width="100%"
                                cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>순위</th>
                                        <th>해시태그</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${recentList}" var="recentDTO">
                                        <tr>
                                            <td><%=cnt++ %></td>
                                            <td>${recentDTO.post_hashtag}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
 
            </div>
        </div>
 
        <div id="content-wrapper">
            <div class="container-fluid">
 
                <ol class="breadcrumb" style="width: 50%; visibility: hidden">
                    <li class="breadcrumb-item"></li>
                    <li class="breadcrumb-item active" style="visibility: hidden"></li>
                </ol>
 
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-table"></i> 내 팔로워들의 최신 글
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered followPosts" id="dataTable"
                                width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>날짜</th>
                                        <th style="display: none;"></th>
                                        <th style="display: none;"></th>
                                        <th style="display: none;"></th>
 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${newFollowertList}" var="newFollowerDTO">
                                        <tr>
                                            <td>${newFollowerDTO.post_name}</td>
                                            <td>${newFollowerDTO.user_name}</td>
                                            <td>${newFollowerDTO.post_date}</td>
                                            <td style="display: none;">${newFollowerDTO.post_contents}</td>
                                            <td style="display: none;">${newFollowerDTO.scrap_uri}</td>
                                            <td style="display: none;">${newFollowerDTO.post_id}</td>
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
 
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to
                            Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">Ã</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are
                        ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button"
                            data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
 
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
        <!-- Page level plugin JavaScript-->
        <script src="../../vendor/chart.js/Chart.min.js"></script>
        <script src="../../vendor/datatables/jquery.dataTables.js"></script>
        <script src="../../vendor/datatables/dataTables.bootstrap4.js"></script>
 
        <!-- Custom scripts for all pages-->
        <script src="../../js/sb-admin.min.js"></script>
 
        <!-- Demo scripts for this page-->
        <script src="../../js/demo/datatables-demo.js"></script>
        <script src="../../js/demo/chart-area-demo.js"></script>
</body>
 
</html>
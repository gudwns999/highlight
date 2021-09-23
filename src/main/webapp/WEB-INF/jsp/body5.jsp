<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 
 
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
    rel="stylesheet">
 
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
 
<jsp:include page="/headerShared.do" />
 
<%-- 1. header --%>
<jsp:include page="/header.do" />
 
<link rel="import" href="/fontStyle.do">
 
<script>
    // script for modal
    var tr;
    var td;
    var params;
     
    function getUrlParams() {
        var id = window.location.toString();
        var p = id.substr(id.lastIndexOf('/') + 1);     
        return p;
    }
    function ggetUrlParams() {
        var pp = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });
        return pp;
    }   
    window.onload = function(){
         
        params = getUrlParams();
        var strArray = params.split('.');
         
        if(strArray[0]  == "myposts"){
            $('#shareBtn').attr('style', 'display:none');
            $('#followBtn').attr('style', 'display:none');
            $('#pageName').text("My Posts");
        }
        else if(strArray[0]  == "othersPosts"){
            params = ggetUrlParams();
             
            $('#user_id').text(decodeURI(params['othername'])+'님의 페이지');
            $('#mainFollowBtn').attr('style', 'display:inline');
            //mainFollowBtn 버튼 text판단해서 출력하기
            $('#pageName').text("Others Posts");
        }
         
        $(function(){
            $("#followBtn").click(function(){
                alert(td.eq(1).text());
            });
        });
         
         
    }
    // (4) 게시판 글 (Ajax 이벤트)
    $(function(){
        $("#dataTable tr").click(function(){ 
            //현재 클릭된 Row(<tr>)
            tr = $(this);
            td = tr.children();
             
            if($(this).closest('thead').prop('tagName') != 'THEAD'){
            $('#summaryModal').modal("show");
            }
            $('#mTitle').text(td.eq(0).text());
            $('#mWriter').text("작성자 : ".concat(td.eq(1).text()));
            //shared, follow버튼 text 판단해서 출력하기
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
 
<body class ="jg" style="background-color: #E6E6E6" id="page-top">
    <%-- modal 창 포맷 --%>
    <div class="modal fade" id="summaryModal" style="font-size: small;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="mHead" style="color:white;background:#8977ad">게시글</div>
                <div class="modal-body" id="mBody" style="opacity: 0.9;background:#9B9B9B;color:white">
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
                        <div id="mSummary" style="overflow-y:scroll;width:100%;height:150px;color:black;padding:4px;background:#FFFFFF;"></div>
                         
                    </div>
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                        <label><i class="fas fa-fw fa-chevron-right"></i>해시 태그</label><br>
                        <div id="mHashTagID" style="overflow-y:scroll;width:100%;height:80px;color:black;padding:4px;background:#FFFFFF;"></div>
                    </div>    
                     
                    <div id="highPath" style="display:none;">highPath</div>
                 
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                    <label><i class="fas fa-fw fa-chevron-right" style="font-size:small"></i>URL</label><br>
                    <div style="overflow-y:scroll;width:100%;height:50px;color:black;padding:4px;background:#FFFFFF;">
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
            <div class="container-fluid">
 
                <ol class="breadcrumb" style="width: 50%">
                    <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
                    <li id="pageName" class="breadcrumb-item active"></li>
                </ol>
 
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-fw fa-chevron-right"></i> 게시 글
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered followPosts" id="dataTable"
                            width="100%" cellspacing="0" style="font-size: small">
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>날짜</th>
                                    <th style="display: none;">내용</th>
                                    <th style="display: none;">해시태그</th>
                                    <th style="display: none;">url</th>
                                    <th style="display: none;">highlights</th>
                                     
                                </tr>
                            </thead>
                            <tbody id="bodyTable">
                                <c:forEach items="${result}" var="result">
                                    <tr>
                                        <td>${result.post_name}</td>
                                        <td>${result.user_name}</td>
                                        <td>${result.post_date}</td>
                                        <td style="display: none;">${result.post_contents}</td>
                                        <td style="display: none;">${result.scrap_uri}</td>
                                        <td style="display: none;">${result.post_id}</td>
                                        <td style="display: none;">${result.scrap_highlights}</td>
                                         
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
 
                    </div>
                </div>
            </div>
        </div>
        <!-- /#wrapper -->
 
    </div>
 
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top"> <i
        class="fas fa-angle-up"></i>
    </a>
 
 
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
    <!-- Core plugin JavaScript-->
    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>
 
    <!-- Page level plugin JavaScript-->
    <script src="../../vendor/chart.js/Chart.min.js"></script>
    <script src="../../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../../vendor/datatables/dataTables.bootstrap4.js"></script>
 
    <!-- Custom scripts for all pages-->
    <script src="../../js/sb-admin.min.js"></script>
 
    <!-- Demo scripts for this page-->
    <script src="../../js/demo/datatables-demo.js"></script>
    <script src="../../js/demo/chart-area-demo.js"></script>
 
    <!-- for word cloud -->
    <link rel="stylesheet" type="text/css" href="../../css/jqcloud.css" />
    <script type="text/javascript" src="../../js/jqcloud-1.0.4.js"></script>
</body>
 
</html>
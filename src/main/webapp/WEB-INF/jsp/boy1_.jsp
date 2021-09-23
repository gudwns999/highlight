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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
    type="text/css">
 
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
    rel="stylesheet">
 
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
 
<jsp:include page="/headerShared.do" />
 
<%-- 1. header --%>
<jsp:include page="/header.do" />
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
            $('#user_id').text(params['othername']+'님의 페이지');
            $('#mainFollowBtn').attr('style', 'display:inline');
            //mainFollowBtn 버튼 text판단해서 출력하기
            $('#pageName').text("Others Posts");
        }
         
        $(function(){
            $("#followBtn").click(function(){
                alert(td.eq(1).text());
            });
        });
         
        // (4) 게시판 글 (Ajax 이벤트)
        $(function(){
            $("#dataTable tr").click(function(){ 
                //현재 클릭된 Row(<tr>)
                tr = $(this);
                td = tr.children();
                 
                $('#summaryModal').modal("show");
                $('#mTitle').text("1) 제목 : ".concat(td.eq(0).text()));
                $('#mWriter').text("작성자 : ".concat(td.eq(1).text()));
                //shared, follow버튼 text 판단해서 출력하기
                $('#mSummary').text(td.eq(3).text());
                $('#urlID').text(td.eq(4).text());
                $('#urlID').attr("href", "http://" + td.eq(4).text());
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
    }
 
      var word_list = [
        <c:forEach items="${hashtagsList}" var ="myhashtags">
            {text : "${myhashtags.hashtag}", weight: ${myhashtags.count}, handlers: {
                click: function() {
                    var hashtags = $(this).text();
                    $.ajax({
                        url: "/listHashtag.do",
                        type: "post",
                        data: {
                            hashtag:hashtags
                            },
                        success: function(data){
                            $('#bodyTable').empty();
                            //alert(data);
                            var arrStr = data.toString().split('\n');
                            mytable = document.getElementById('bodyTable');  //행을 추가할 테이블
                             
 
                             for(var a=4; a<arrStr.length; a++){
                                 row = mytable.insertRow(mytable.rows.length);  //추가할 행
                         
                                 cell0 = row.insertCell(0);
                                 cell1 = row.insertCell(1);                        
                                 cell2 = row.insertCell(2);                              
                                 cell0.innerHTML = arrStr[a++];
                                 cell1.innerHTML = arrStr[a++];
                                 cell2.innerHTML = arrStr[a++]; 
                                  
                                 row.onclick = function() {
                                        //현재 클릭된 Row(<tr>)
                                        tr = $(this);
                                        td = tr.children();
                                        var arrStr = tr.text().split('\n');
                                        $('#summaryModal').modal("show");
                                        $('#mTitle').text(arrStr[0]);
                                        $('#mWriter').text(arrStr[1]);
                                        //shared, follow버튼 text 판단해서 출력하기
                                        $('#mSummary').text(arrStr[2]);
                                        $('#urlID').text(td.eq(4).text());
                                        $('#urlID').attr("href", "http://" + td.eq(4).text());
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
                                      }
                             }  
 
                        },
                        error: function (request, status, error){        
 
                        }
                      });   
                  }
                }},
        </c:forEach>
            {text: " ", weight: 0}          
      ];
      $(function() {
        $("#wordCloudBody").jQCloud(word_list,{autoResize:true});
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
 
<body style="background-color: #E6E6E6" id="page-top">
    <%-- modal 창 포맷 --%>
    <div class="modal fade" id="summaryModal" style="font-size: small;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="mHead">
                    <div id="mTitle"></div>
                    <div id="mWriter" align="right"></div>
                </div>
                <div class="modal-body" id="mBody">
                    <div align="right">
                        <button class="btn btn-danger btn-sm" id="shareBtn"
                            style="color: white">Unshare</button>
                        <button class="btn btn-danger btn-sm" id="followBtn"
                            style="color: white">Unfollow</button>
                    </div>
                    <div id="mBodyHead">2) 요약 내용</div>
                    <div class="card mb-3">
                        <div class="card-body" id="mSummary"></div>
                    </div>
 
                    <div id="mHashHead">3) 해시태그</div>
                    <div class="card mb-3">
                        <div class="card-body" id="mHashTagID"></div>
                    </div>
                </div>
 
                <div class="modal-footer">
                    URL: <a id="urlID"></a>
                </div>
            </div>
        </div>
    </div>
 
 
    <div id="wrapper">
        <%-- 2. sideBar --%>
        <jsp:include page="/sideBar.do" />
 
        <div id="content-wrapper">
            <div class="container-fluid">
                <!-- Current Page Path -->
                <ol class="breadcrumb" style="width: 50%">
                    <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
                    <li id="pageName" class="breadcrumb-item active"></li>
                </ol>
 
                <div class="card mb-4">
                    <div class="card-header bg-info" style="color: white">
                        <i class="fas fa-fw fa-chevron-right"></i> Information
                    </div>
                    <div class="card-body" id="informationData">
                        <button class="btn btn-danger btn-sm" id="mainFollowBtn"
                            style="color: white; display: none">Unfollow</button>
                        &nbsp;&nbsp;&nbsp;
                        <h id="user_id">${userDTO.user_name} 님 환영합니다.</h>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header bg-info" style="color: white">
                        <i class="fab fa-cloudversify"></i> 워드 크라우드
                    </div>
                    <div class="btn-group btn-group-toggle btn-sm"
                        data-toggle="buttons">
                        <label class="btn btn-primary"
                            style="border-right: 2px solid #FFFFFF;"> <input
                            type="radio" name="radioButton" checked="checked" value="week"
                            id="radioWeek"> 일주일
                        </label> <label class="btn btn-primary"
                            style="border-right: 2px solid #FFFFFF;"> <input
                            type="radio" name="radioButton" value="month" id="radioMonth">
                            한 달
                        </label> <label class="btn btn-primary"> <input type="radio"
                            name="radioButton" value="year" id="radioYear"> 일 년
                        </label>
                    </div>
                    <div class="card-body" style="width: 100%; height: 500px">
                        <div id="wordCloudBody" style="width: 100%; height: 100%"></div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday
                        at 11:59 PM</div>
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
                    <div class="card-header bg-info" style="color: white">
                        <i class="fas fa-table"></i> 게시 글
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
                                </tr>
                            </thead>
                            <tbody id="bodyTable">
                                <c:forEach items="${myPostsList}" var="myPostsList">
                                    <tr>
                                        <td>${myPostsList.post_name}</td>
                                        <td>${myPostsList.user_name}</td>
                                        <td>${myPostsList.post_date}</td>
                                        <td style="display: none;">${myPostsList.post_contents}</td>
                                        <td style="display: none;">${myPostsList.scrap_uri}</td>
                                        <td style="display: none;">${myPostsList.post_id}</td>
                                         
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
 
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday
                        at 11:59 PM</div>
                </div>
                <button type="button" class="btn btn-primary btn-sm"
                    style="margin: 0.5% 75%; width: 25%; font-size: small">모든
                    게시글</button>
            </div>
            <!-- /.container-fluid -->
 
            <!-- Sticky Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright Â© Your Website 2019</span>
                    </div>
                </div>
            </footer>
 
 
            <!-- /.content-wrapper -->
 
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
 
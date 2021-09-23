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
 
<link rel="import" href="./fontStyle.do">
 
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
    function showAll(){
        var id = window.location.toString();
        var p = id.substr(id.lastIndexOf('/') + 1);
        var arrSty = p.split('.');
        if(arrSty[0] == "othersPosts"){
            var pp ={};
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });                      
            window.location = arrSty[0].toString()+".do?othername="+pp.othername+"&keyword=.all&user_id="+pp.user_id;
        }else if(arrSty[0] =="group"){
            var pp ={};
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });                      
            window.location = arrSty[0].toString()+".do?department_id="+pp.department_id+"&team_id="+pp.department_id+"&lab_id="+pp.lab_id+"&bus_id="+pp.bus_id+"&field_id="+pp.field_id+"&keyword=.all&name="+pp.name;                     
        }                   
        else{
            window.location = arrSty[0].toString()+".do?keyword=.all&user_id="+pp.user_id;                      
        }
    }
    window.onload = function(){
 
    $(function(){
        //find follow
            var pp ={};
                window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });      
                var follow = pp.user_id;
                 
                var id = window.location.toString();
                var p = id.substr(id.lastIndexOf('/') + 1);
                var arrSty = p.split('.');
                if(arrSty[0] == "othersPosts"){
                    $.ajax({
                        url: "/followFunction.do",
                        type: "post",
                        data: {
                            state : "find"                 ,
                            user_id : ${follow.user_id}    ,
                            following_id : follow
                            },
                        success: function(data){
                            var arr = data.split('\n');
                            if(arr[4].substring(0,3) == "yes"){
                                    $('#mainFollowBtn').attr('style', 'display:none');
                                    $('#mainUnFollowBtn').attr('style', 'display:inline');          
                                    $('#followBtn').attr('style', 'display:none');
                                    $('#unFollowBtn').attr('style', 'display:inline');      
                            }else{
                                //앞으로 팔로우할 상태
                                $('#mainFollowBtn').attr('style', 'display:inline');
                                $('#mainUnFollowBtn').attr('style', 'display:none');                        
                                $('#followBtn').attr('style', 'display:inline');
                                $('#unFollowBtn').attr('style', 'display:none');
                            }
                        },
                        error: function (request, status, error){        
 
                        }
                      });                                           
                    }else{
                        $('#followBtn').attr('style', 'display:none');
                        $('#unFollowBtn').attr('style', 'display:none');
                    }
                                         
                })
                 
 
         
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
                     
                    $('#mHashTagID').text(data);
                },
                error: function (request, status, error){        
 
                }
              });               
 
 
 
$.ajax({
                url: "/sharedFunction.do",
                type: "post",
                data: {
                    state : 'find'          ,
                    post_id:td.eq(5).text() ,
                    user_id:${udto.user_id}
                    },
                success: function(data){
                    var arr = data.split('\n');
                    if(arr[4].substring(0,3) == "yes"){
                        //un shared 가능
                        $('#sharedBtn').attr('style', 'display:none');
                        $('#unSharedBtn').attr('style', 'display:inline');
                    }else{
                        //shared 가능
                        $('#sharedBtn').attr('style', 'display:inline');
                        $('#unSharedBtn').attr('style', 'display:none');
                    }
                },
                error: function (request, status, error){
                }
              });           
        });
    });
     
 
      var word_list = [
        <c:forEach items="${hashtagsList}" var ="myhashtags">
            {text : "${myhashtags.hashtag}", weight: ${myhashtags.count}, handlers: {
                click: function() {
                    var hashtags = $(this).text();
                    var id = window.location.toString();
                    var p = id.substr(id.lastIndexOf('/') + 1);
                    var arrSty = p.split('.');
                    if(arrSty[0] == "othersPosts"){
                        var pp ={};
                        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });                      
                        window.location = arrSty[0].toString()+".do?othername="+pp.othername+"&keyword="+hashtags+"&user_id=${myhashtags.user_id}";
                    }else if(arrSty[0] =="group"){
                        var pp ={};
                        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });                      
                        window.location = arrSty[0].toString()+".do?department_id="+pp.department_id+"&team_id="+pp.department_id+"&lab_id="+pp.lab_id+"&bus_id="+pp.bus_id+"&field_id="+pp.field_id+"&keyword=${myhashtags.hashtag}&name="+pp.name;                        
                    }                   
                    else{
                        window.location = arrSty[0].toString()+".do?keyword="+hashtags+"&user_id=${myhashtags.user_id}";                        
                    }
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
 
<body class="jg" style="background-color: #E6E6E6" id="page-top">
    <%-- modal 창 포맷 --%>
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
                        <script>
                        function shared(){
                            $.ajax({
                                url: "/sharedFunction.do",
                                type: "post",
                                data: {
                                    state : "shared"               ,                                        
                                    post_id:td.eq(5).text()        ,
                                    user_id:${udto.user_id}
                                    },
                                success: function(data){
                                    alert(data);
                                    $('#sharedBtn').attr('style', 'display:none');
                                    $('#unSharedBtn').attr('style', 'display:inline');  
                                },
                                error: function (request, status, error){        
 
                                }
                              });                                           
                            }   
                         
                         
                            function unShared(){
                                $.ajax({
                                    url: "/sharedFunction.do",
                                    type: "post",
                                    data: {
                                        state : "unshared"               ,                                      
                                        post_id:td.eq(5).text()        ,
                                        user_id:${udto.user_id}
                                        },
                                    success: function(data){            
                                        alert(data);                                        
                                        $('#sharedBtn').attr('style', 'display:inline');
                                        $('#unSharedBtn').attr('style', 'display:none');    
                                    },
                                    error: function (request, status, error){        
 
                                    }
                                  });                                           
                                }   
                        </script>                 
                     
                        <button class="btn btn-danger btn-sm" id="sharedBtn" onclick="shared()" style="display: none; color: white">share</button>
                        <button class="btn btn-danger btn-sm" id="unSharedBtn" onclick="unShared()" style="display: none; color: white">Unshare</button>
 
                        <script>
                        function unfollow(){
                            var pp ={};
                                window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });      
                                var follow = pp.user_id;
                            $.ajax({
                                url: "/followFunction.do",
                                type: "post",
                                data: {
                                    state : "unfollow"               ,                                      
                                    user_id : ${follow.user_id}    ,
                                    following_id : follow
                                    },
                                success: function(data){
                                    $('#mainFollowBtn').attr('style', 'display:inline');
                                    $('#mainUnFollowBtn').attr('style', 'display:none');    
                                    $('#followBtn').attr('style', 'display:inline');
                                    $('#unFollowBtn').attr('style', 'display:none');    
                                },
                                error: function (request, status, error){        
 
                                }
                              });                                           
                            }   
                         
                         
                            function follow(){
                                var pp ={};
                                    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { pp[key] = value; });      
                                    var follow = pp.user_id;
                                $.ajax({
                                    url: "/followFunction.do",
                                    type: "post",
                                    data: {
                                        state : "follow"               ,                                        
                                        user_id : ${follow.user_id}    ,
                                        following_id : follow
                                        },
                                    success: function(data){                            
                                        $('#mainFollowBtn').attr('style', 'display:none');
                                        $('#mainUnFollowBtn').attr('style', 'display:inline');  
                                        $('#followBtn').attr('style', 'display:none');
                                        $('#unFollowBtn').attr('style', 'display:inline');                                          
                                    },
                                    error: function (request, status, error){        
 
                                    }
                                  });                                           
                                }   
                        </script>
 
                        <button class="btn btn-danger btn-sm" id="followBtn"
                            onclick="follow();" style="color: white" style="display:none;">follow</button>
                        <button class="btn btn-danger btn-sm" id="unFollowBtn"
                            onclick="unfollow();" style="color: white" style="display:none;">unfollow</button>
 
 
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
            <div class="container-fluid">
                <!-- Current Page Path -->
                <ol class="breadcrumb" style="width: 50%">
                    <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
                    <li id="pageName" class="breadcrumb-item active"></li>
                </ol>
 
                <div class="card mb-4">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-fw fa-chevron-right"></i> Information
                    </div>
                    <div class="card-body" id="informationData">
                        <button class="btn btn-danger btn-sm" id="mainFollowBtn"
                            onclick="follow();" style="color: white; display: none">follow</button>
                        <button class="btn btn-danger btn-sm" id="mainUnFollowBtn"
                            onclick="unfollow();" style="color: white; display: none">Unfollow</button>
 
                        &nbsp;&nbsp;&nbsp;
                        <h id="user_id">${userDTO.user_name} </h>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-fw fa-chevron-right"></i> 워드 크라우드
                    </div>
                    <div class="btn-group btn-group-toggle btn-sm"
                        data-toggle="buttons">
                        <label class="btn btn-primary"
                            style="border-right: 2px solid #FFFFFF;"> <input
                            type="radio" name="radioButton" checked="checked" value="week"
                            onclick="range()" id="radioWeek"> 일주일
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
                                <c:forEach items="${myPostsList}" var="myPostsList">
                                    <tr>
                                        <td>${myPostsList.post_name}</td>
                                        <td>${myPostsList.user_name}</td>
                                        <td>${myPostsList.post_date}</td>
                                        <td style="display: none;">${myPostsList.post_contents}</td>
                                        <td style="display: none;">${myPostsList.scrap_uri}</td>
                                        <td style="display: none;">${myPostsList.post_id}</td>
                                        <td style="display: none;">${myPostsList.scrap_highlights}</td>
 
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
 
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"
                    style="margin: 0.5% 75%; width: 25%; font-size: small"
                    onclick="showAll()">모든 게시글</button>
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
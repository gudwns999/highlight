<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8"); %>
 
 
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
 
 
<script>
var availableTags = new Array();
     
    //new Array();
 
    $(document).ready(function() {
        $.ajax ({
            type:"POST",
            url:"/findHash.do",
            success:function(data) {
                var str = data.split('\n');
                for(var i=3; i< str.length; i++){
                    availableTags.push(str[i]); 
                }
                availableTags1 = availableTags;
                availableTags2 = availableTags;
 
                $("#hashtag1").autocomplete(availableTags2,{ 
                    matchContains: true,
                    selectFirst: false
                });                 
                $("#hashtag2").autocomplete(availableTags2,{ 
                    matchContains: true,
                    selectFirst: false
                }); 
                $("#hashtag3").autocomplete(availableTags,{ 
                    matchContains: true,
                    selectFirst: false
                }); 
                $("#hashtag4").autocomplete(availableTags,{ 
                    matchContains: true,
                    selectFirst: false
                });                 
            }                                    
        });
        
    });
     
     
    
</script>
 
 
</head>
  <!--  
   <form name="form1" method="post" action="">
      <input type="text" id="searchbox">
      <input type="submit" id="sumit" value="검색">
    </form>
-->
<body style="background-color: #E6E6E6" id="page-top">
    <%-- modal 창 포맷 --%>
 
    <div id="wrapper">
        <%-- 2. sideBar --%>
        <div id="content-wrapper">
    <form action="/highlight_execute.do" method="POST">
        <div class="card mb-4" style="margin-top:5%; margin-left:20%;margin-right:20%">
                <div class="card-header bg-info" align="center" style="color: white;font-size: large;">HighWriter</div>
                 
                <div class="card-body" style="opacity: 0.5;background:#000000;color:white">
                 
                    <div class="container-fluid">
                        <label for="titleBox"><i class="fas fa-fw fa-chevron-right"></i>제목</label><input class="container-fluid" type="text" id="titleBox" name="post_name">
                    </div>                
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                        <label for="contentsBox"><i class="fas fa-fw fa-chevron-right"></i>내용</label><textarea class="container-fluid" style="height:150px" id='contentsBox' name="post_contents"></textarea>
                    </div>
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
                        <label for="hashtagBox"><i class="fas fa-fw fa-chevron-right"></i>해시태그</label><br> 
                        #&nbsp;<input class="text" style="margin-bottom:8px;margin-right:10px" size="8" id='hashtag1' name = 'hashtag1' id = 'hashtag1'>
                        #&nbsp;<input class="text" style="" size="8" id='hashtag2' name='hashtag2'><br>
                        #&nbsp;<input class="text" style="margin-bottom:8px;margin-right:10px" size="8" id='hashtag3' name = 'hashtag3'>                      
                        #&nbsp;<input class="text" style="" size="8" id='hashtag4' name='hashtag4'>
                    </div>
                    <hr style="border: solid 1px white;">
                    <div class="container-fluid">
<!--                     <button class="btn btn-primary container-fluid" id="send" onclick="sendData()" style="color:white;">저장</button> -->
                    <input type="submit" class="btn btn-primary container-fluid"style="color:white;" ></button>
                     
                    </div>
                    <input type="hidden" name="scrap_highlights" id="scrap_highlights"/>
                    <input type="hidden" name="scrap_uri" id="scrap_uri"/>        
                    <input type="hidden" name="user_id" id="user_id"/>
                    <input type="hidden" name="user_passwd" id="user_passwd"/>
                </div>
            </div>
    </form>
 
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 
 
        </div>
 
 
        <!-- /#wrapper -->
 
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src= "https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
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
<script type="text/javascript" src="../../jquery/lib/jquery.js"></script>
<script type='text/javascript' src='../../jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='../../jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../../jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="../../jquery/jquery.autocomplete.css" />
</html>
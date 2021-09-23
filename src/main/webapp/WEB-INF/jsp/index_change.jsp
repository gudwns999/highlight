<%@ page contentType="text/html; charset=UTF-8"
    import="java.util.*"%>
 
<!DOCTYPE html>
 
<head>
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
 
  <title>SB Admin - Dashboard</title>
 
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
 
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
   
  <link rel="import" href="headerShared.html">
 
<%-- 1. header --%>
  <jsp:include page="header.jsp"/>
     
    <script>
     
    // (4) 게시판 글 (Ajax 이벤트)
    $(function(){
        $("#dataTable tr").click(function(){ 
            //현재 클릭된 Row(<tr>)
            var tr = $(this);
            var td = tr.children();
             
            $('#summaryModal').modal("show");
            $('#mTitle').text("1) 제목 : ".concat(td.eq(0).text()));
            $('#mWriter').text("작성자 : ".concat(td.eq(1).text()));
            $('#mSummary').text("요약내용이지롱".concat(td.eq(1).text()));
            $('#mHashTagID').text("#해시태그".concat(td.eq(1).text()));
            $('#urlID').text(td.eq(1).text());
        });
    });
     
    </script>
     
    <%-- (4) 게시판 글 (css)--%>
    <style>
    .followPosts{clear:both; float:left; padding:10px; cursor:pointer; margin-bottom:5px}
    </style>
     
</head>
 
<body style="background-color:#E6E6E6;" id="page-top">
 
  <div class="modal fade" id="summaryModal" style="font-size: small;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" id="mHead">
        <div  id = "mTitle"></div> 
        <div  id = "mWriter" align="right"></div>
      </div>
      <div class="modal-body" id ="mBody">
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
        URL: <a id = "urlID"></a>
      </div>
    </div>
  </div>
  </div>
 
  <div id="wrapper">
 
    <%-- 2. sideBar --%>
    <jsp:include page="sideBar.jsp"/>
     
    <div id="content-wrapper">
    <!-- Current Page Path -->
        <ol class="breadcrumb" style="width:50%">
          <li class="breadcrumb-item">
            <a href="#">HighWriter</a>
          </li>
          <li class="breadcrumb-item active">Home</li>
        </ol>
         
    <form action="">    
        <div class="container-fluid" >
        <div class="card mb-3">
              <div class="card-header bg-info" style="color:white">
                <i class="fas fa-fw fa-users"></i>
                    사람 찾기
              </div>
               
              <!-- Navbar Search -->
              <div class="input-group">
                <input type="text" class="form-control" id="peopleName" name="peopleName" placeholder="get your friends..." aria-label="Search" aria-describedby="basic-addon2">
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
          <div class="card-header bg-info" style="color:white">
            <i class="fas fa-fw fa-hashtag"></i>
                주간 해시태그 순위
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="weekRank" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>순위</th>
                    <th>해시태그</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>JSP</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>웹프로그래밍</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>반도체</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>부도체</td>
                  </tr>
                  <tr>
                    <td>5</td>
                    <td>머신러닝</td>
                  </tr>
                  <tr>
                    <td>6</td>
                    <td>딥러닝</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>자율주행</td>
                  </tr>
                  <tr>
                    <td>8</td>
                    <td>Excel</td>
                  </tr>
                  <tr>
                    <td>9</td>
                    <td>Servlet</td>
                  </tr>
                  <tr>
                    <td>10</td>
                    <td>이미지센서</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
         
    </div>
    </div>
     
    <div id="content-wrapper">
      <div class="container-fluid">
       
        <ol class="breadcrumb" style="width:50%;visibility:hidden">
          <li class="breadcrumb-item">
             
          </li>
          <li class="breadcrumb-item active" style="visibility:hidden"></li>
        </ol>
         
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header bg-info" style="color:white">
            <i class="fas fa-table"></i>
                내 팔로워들의 최신 글</div>
          <div class="card-body">
             
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>나의 워라밸에 대하여1</td>
                    <td>기명준</td>
                    <td>2019/08/15</td>
                  </tr>
                  <tr>
                    <td>나의 워라밸에 대하여2</td>
                    <td>기명준</td>
                    <td>2019/08/15</td>
                  </tr>
                </tbody>
              </table>
           
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
 
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
 
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
 
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
<%@ page contentType="text/html; charset=UTF-8"    import="java.util.*"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   
  <jsp:include page="/headerShared.do"/>
  <%-- 1. header --%>
  <jsp:include page="/header.do"/>
 
</head>
 
<body style="background-color:#E6E6E6" id="page-top">
 
  <div id="wrapper">
 
    <%-- 2. sideBar --%>
    <jsp:include page="sideBar.jsp"/>
 
    <div id="content-wrapper">
        <!-- Current Page Path -->
        <ol class="breadcrumb" style="width:30%">
          <li class="breadcrumb-item">
            <a href="#">HighWriter</a>
          </li>
          <li class="breadcrumb-item active"> 검색</li>
        </ol>
     
      <div class="container-fluid" style="width:70%">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header bg-info" style="color:white">
            <i class="fas fa-users"></i>
                검색 결과</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>결과 시작</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>결과 종료</th>
                  </tr>
                </tfoot>
                <tbody>
                    <c:forEach items="${result}" var ="result">
                    <tr>
                        <td>${result.post_name} : ${result.post_contents} </td>
                    </tr>
                    </c:forEach>                
                </tbody>
              </table>
            </div>
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
  <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <!-- Core plugin JavaScript-->
  <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>
 
  <!-- Page level plugin JavaScript-->
  <script src="../../vendor/chart.js/Chart.min.js"></script>
  <script src="../../vendor/datatables/jquery.dataTables.js"></script>
  <script src="../../vendor/datatables/dataTables.bootstrap4.js"></script>
 
  <!-- Custom scripts for all pages-->
  <script src="../../js/sb-admin.min.js"></script>
 
</body>
 
</html>
 
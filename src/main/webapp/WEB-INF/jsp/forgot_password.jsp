<%@ page contentType="text/html; charset=UTF-8"
    import="java.util.*"
%>
 
<!DOCTYPE html>
 
<head>
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
 
  <title>HighWriter-Forgot Password</title>
 
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
 
</head>
 
<body class="bg-info">
 
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">비밀번호 찾기</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>비밀번호를 잊으셨나요?</h4>
          <p>메일을 입력해주시면 비밀번호를 보내드리겠습니다.</p>
        </div>
        <form action="" method="POST">
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="user_email" name = "user_email" class="form-control" placeholder="user_email" required="required" autofocus="autofocus">
              <label for="user_email">이메일 입력</label>
            </div>
          </div>
          <input type="submit" id="submit" value = "Reset Password"/>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register.jsp">Register an Account</a>
          <a class="d-block small" href="login.jsp">Login Page</a>
        </div>
      </div>
    </div>
  </div>
 
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
</body>
 
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
// 로그인 상태이면 index.jsp로 이동한다.
/*
if(session.getAttribute("login") != null){
    response.sendRedirect("index.jsp");
}
*/
%>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.jg{font-family: 'Jeju Gothic', sans-serif;}
</style>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>정보의 바다속 한줄기 빛</title>
   
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <script>
  var state = "${state}";
  if(state == "fail"){
      alert("로그인에 실패했습니다.");
  }
  if(state=="regist"){
      alert("회원가입 완료. 로그인 해주세요.");
  }
  </script>
    <style>
     
    .member {
        font-size: 150px;
        text-shadow: 0 0 10px #666;
        color: #fff;
        margin: 0 auto;
        text-align: center;
        text-transform: capitalize;
        font-style: italic;
    }
    body {
        font-family: "맑은 고딕";
        font-size: 12px;
    }
     
    #floater {
      float: left; 
      height: 50%; 
      margin-bottom: -120px;
    }
    #content  {
      clear: both; 
      height: 240px; 
      position: relative;
    }
     
    </style>
     
    <script type="text/javascript" src="../js/typeCheck.js" ></script> 
    <script>
 
    function checkSubmit(event){
        var user_id = $('#user_id').val();
        var user_password = $('#user_password').val();
         
        // 
        if(!isNum(user_id) || user_id.length != 8){
            event.preventDefault();
            document.getElementById("alert").innerHTML="사번은 8자리 숫자여야 합니다.<br/>";
        }
        else
        {
            document.getElementById("alert").innerHTML="";
        }
        if(!isEng(user_password) || user_password.length < 4){
            event.preventDefault();
            document.getElementById("alert").innerHTML += "비밀번호 형식을 확인해주세요. (4자리 이상 영문자만 가능)";
        }
    }
     
    function init(){
        document.querySelector('#loginForm').addEventListener('submit', checkSubmit);
    }
     
    window.addEventListener('load',init);
    </script>
 
</head>
 
<body class="jg" style="background:linear-gradient( #8977ad, #95ad77 )">
 
  <div class="container">
  <h1 class="member" style="margin-top:10%">HighWriter</h1>
    <div class="card card-login mx-auto " style="margin-top:10%">
      <div class="card-header" align = "center" style="font-size:large">로그인</div>
      <div class="card-body">
       
        <form id = "loginForm" action = "/authentication.do" method = "POST">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="user_id" class="form-control" name = "user_id" placeholder="user_id" required="required" autofocus="autofocus">
              <label for="user_id">사번</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="user_password" name = "user_passwd" class="form-control" placeholder="user_password" required="required">
              <label for="user_password">비밀번호</label>
            </div>
          </div>
          <label id = "alert" name = "alert" style="color:red"></label>
           
          <input type = "submit" class = "btn btn-primary btn-block" value = "Login">
           
        </form>
         
        <div class="text-center">
          <a class="d-block small mt-3" href="/register.do"  style="font-size:small">회원가입</a>
          <a class="d-block small" href="forgot_password.do" style="font-size:small">비밀번호 찾기</a>
        </div>
         
      </div>
    </div>
  </div>
 
  <!-- Bootstrap core JavaScript-->
  <script src="../../vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
</body>
 
</html>
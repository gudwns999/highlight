<%@ page contentType="text/html; charset=UTF-8"    import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<style>
    @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
    .jg{font-family: 'Jeju Gothic', sans-serif;}
</style>
 
<head>
<!-- autocomplete from jQuery Ui -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
 
  <title>HighWriter-Register</title>
 
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet"> 
   
  <script type="text/javascript" src="../js/typeCheck.js" ></script> 
    <script>
     
    function register(event){
        var data = $('#department_name').val();
        for(var i = 1; i<=20; i++ )
        {
                if(availableTags[i] == data)
                    $('#department_id').val(i);
        }
    }
    function checkSubmit(event){
        var user_id = $('#user_id').val();
        var user_name = $('#user_name').val();
        var user_password = $('#user_password').val();
        var user_confirm_password=$('#user_confirm_password').val();
        // 사번 형식 확인하기.
        if(!isNum(user_id) || user_id.length != 8)
            event.preventDefault();
        // 이름 형식 확인하기
        if(pattern_num.test(user_name) || pattern_spc.test(user_name) || (pattern_kor.test(user_name) && pattern_eng.test(user_name)) || user_name.length < 1)
            event.preventDefault();
        // 비밀번호 형식 확인하기
        if(!isEng(user_password) || user_password.length < 4)
            event.preventDefault();
        if(user_password != user_confirm_password)
            event.preventDefault();
         
    }
    /*-------------------------------------------------------------------------------------------------*/
    // 각 칸의 형식 체크
    function checkUserID(event){
        var user_id = $('#user_id').val();
        if(!isNum(user_id) || user_id.length != 8){
            document.getElementById("user_id_alert").innerHTML="※ 사번은 8자리 숫자여야 합니다.";
        }
        else
            document.getElementById("user_id_alert").innerHTML="";
        }
     
    function checkUserName(event){
        var user_name = $('#user_name').val();
        if(pattern_num.test(user_name) || pattern_spc.test(user_name) || (pattern_kor.test(user_name) && pattern_eng.test(user_name))
                || user_name.length < 1){
            document.getElementById("user_name_alert").innerHTML="※ 이름은 한글 또는 영어로만 입력하세요.";
        }
        else
            document.getElementById("user_name_alert").innerHTML="";
    }
     
    function checkUserPassword(event){
        var user_passwd = $('#user_password').val();
        if(!isEng(user_passwd) || user_passwd.length < 4)
            document.getElementById("user_password_alert").innerHTML="※ 비밀번호는 4자이상 영어로만 해주세요";
        else
            document.getElementById("user_password_alert").innerHTML="";
    }
     
    function checkUserConfirmPassword(event){
        var user_password = $('#user_password').val();
        var user_confirm_password = $('#user_confirm_password').val();
        if(user_password != user_confirm_password)
            document.getElementById("user_confirm_password_alert").innerHTML="※ 비밀번호가 일치하지 않아요.";
        else
            document.getElementById("user_confirm_password_alert").innerHTML="";
    }
     
    function init(){
        document.querySelector('#registerForm').addEventListener('submit', checkSubmit);
        document.querySelector('#user_id').addEventListener('blur',checkUserID);
        document.querySelector('#user_name').addEventListener('blur',checkUserName);
        document.querySelector('#user_password').addEventListener('blur',checkUserPassword);
        document.querySelector('#user_confirm_password').addEventListener('blur',checkUserConfirmPassword);
    }
     
    window.addEventListener('load',init);
     
     
     
    var availableTags = [
        '###',
        'DRAM 설계팀 : DRAM 개발실',
        'DRAM PA팀 : DRAM 개발실',
        'DRAM PE팀 : DRAM 개발실',
        'DT팀 : DRAM 개발실',
        'FLASH 설계팀 : FLASH 개발실',
        'FLASH PA팀 : FLASH 개발실',
        'FLASH PE팀 : FLASH 개발실',
        'SW 개발팀 : 솔루션 개발실',
        '컨트롤러 개발팀 : 솔루션 개발실',
        '솔루션 PE팀 : 솔루션 개발실',
        '모뎀 개발팀 : SOC개발실',
        '플랫폼 개발팀 : SOC개발실',
        'Display Solution 개발팀 : LSI 개발실',
        '시큐리티 제품 개발팀 : LSI 개발실',
        'Design Technology 팀 : 디자인 플랫폼 개발실',
        'PKG기술기획팀 : 패키지 개발실',
        'UX 혁신팀 : Mobile UX센터',
        'SW 개발팀 : Mobile UX센터',
        '시스템 설계 그룹 : 개발팀',
        'NL 개발 그룹 : 선행개발팀'
    ];
     $(document).ready(function() {
         document.querySelector('#registerForm').addEventListener('submit', register);
        $('#department_name').autocomplete(availableTags,{
            matchContains: true,
            selectFirst: false     
            })
        }); 
    </script>
      
</head>
 
<body class="jg" style="background:linear-gradient( #8977ad, #95ad77 )">
 
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원 가입</div>
      <div class="card-body">
         
        <form id = "registerForm" action = "/register_h.do" method = "POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="user_id" name = "user_id" class="form-control" placeholder="user_id" required="required" autofocus="autofocus">
                  <label for="user_id">사번</label>
                </div>
                <label id="user_id_alert" style="font-size: x-small; color:red"></label>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="user_name" name = "user_name" class="form-control" placeholder="user_name" required="required">
                  <label for="user_name">이름</label>
                </div>
                <label id="user_name_alert" style="font-size: x-small; color:red"></label>
              </div>
            </div>
          </div>
           
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="user_email" name ="user_email" class="form-control" placeholder="user_email" required="required">
              <label for="user_email">E-mail</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="user_password" name="user_passwd" class="form-control" placeholder="user_password" required="required">
                  <label for="user_password">비밀번호</label>
                </div>
                <label id="user_password_alert" style="font-size: x-small; color:red"></label>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="user_confirm_password" name = "user_confirm_passwd" class="form-control" placeholder="user_confirmPassword" required="required">
                  <label for="user_confirm_password">비밀번호 확인</label>
                </div>
                <label id="user_confirm_password_alert" style="font-size: x-small; color:red"></label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
              <div class="input-group">
                <input type="text" class="form-control" id="department_name" name="department_name" placeholder="팀 이름을 검색하세요..." aria-label="Search" aria-describedby="basic-addon2" required="required">
                <input type="text" class="form-control" id="department_id" name="department_id"style="display:none;">
                 
                <div class="input-group-append">
                  <button class="btn btn-primary" id = "teamSearch" type="button"/>
                    <i class="fas fa-search"></i>
                  </button>
                </div>
                </div>
              </div>
            </div>
          </div>
          <input type = "submit" class="btn btn-primary btn-block"/>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/login.do" style="font-size:small">로그인 페이지로 가기</a>
          <a class="d-block small" href="/forgot-password.do" style="font-size:small">비밀번호 찾기</a>
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
 
<script type="text/javascript" src="../../jquery/lib/jquery.js"></script>
<script type='text/javascript' src='../../jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='../../jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../../jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="../../jquery/jquery.autocomplete.css" />
 
</html>
 
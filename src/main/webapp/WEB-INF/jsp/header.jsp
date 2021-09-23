<%@ page contentType="text/html; charset=UTF-8"
    import="java.util.*"
%>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.jg{font-family: 'Jeju Gothic', sans-serif;}
</style>
<form id="form"></form>
<script>
function logoutHandler(){
    var f= document.querySelector('#form');           
    f.action= "/logout.do";
    f.method="post";
    f.submit();
}
 
function init(){
    document.querySelector("#logout").addEventListener('click',logoutHandler);
}
window.addEventListener('load',init);
</script>
 
    <nav class="navbar navbar-expand navbar-dark static-top" style="background:#8977ad">
      <script> function go2Post(url){
            var f= document.querySelector('#form');           
            f.action= url;
            f.method="post";
            f.submit();
      }</script>
      <form id="form"></form>
    <a class="navbar-brand mr-1" href="javascript:go2Post('index.do');">HighWriter</a>
     
    <%-- side bar 들락날락하게 하는 버튼 --%>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="/search.do">
      <i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="/search.do">
      <div class="input-group">
        <input type="text" class="form-control" name="search" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" id="search" type="submit" href="/search.do">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
 
    <!-- Navbar -->
     
    <ul class="navbar-nav bg-primary ml-auto ml-md-0" style="color:white;border-radius: 20%;">
      <li class="nav-item">
        <button class="btn btn-primary bg-primary" id ="logout" type="button">로그아웃</button>
      </li>
    </ul>
     
  </nav>
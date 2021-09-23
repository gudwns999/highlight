<%@ page contentType="text/html; charset=UTF-8"    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<% int cnt=1; %>
    <!-- Sidebar -->
    <ul class="sidebar navbar-nav bg-secondary" style="background:linear-gradient( #9B9B9B, #EFEFEF )">
        <li class="nav-item active" style="margin:20px 10px;color:white;">
        <div align="center">
        <i class="fas fa-fw fa-hashtag"></i>
        <span>실시간 해시태그 순위</span>
        </div>
        <div class="container-fluid block" style="color:black;width:90%;border:2px solid #FFFFFF;">
            <ul id="ticker">
                <c:forEach items="${recentList}" var ="recentDTO">
                    <li><a><span style="background:#8977ad"><%=cnt++ %></span>${recentDTO.post_hashtag}</a></td>
                </c:forEach>                      
            </ul>
        </div>
        </li>
     
      <li class="nav-item active" style="width:90%;border-top:2px solid #FFFFFF;">
      <script> function go2Post(url, state){
            var f= document.querySelector('#form');           
            f.action= url;
            f.method="post";
            f.submit();
      }</script>
      <form id="form"><p name="hereIs" ></p></form>
        <a class="nav-link" href="javascript:go2Post('/index.do');">
           
          <i class="fas fa-fw fa-home"></i>
          <span>Home</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-database"></i>
          <span>My Data</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="/myposts.do?keyword=.all">My Posts</a>
          <a class="dropdown-item"  href="/following.do">Following</a>
          <a class="dropdown-item" href="/sharedposts.do?keyword=.all">Shared Posts</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-globe"></i>
          <span>Group Data</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="/team.do?keyword=.all">Team</a>
          <a class="dropdown-item" href="/groups.do">Groups</a>
        </div>
      </li>    
       
    </ul>
     
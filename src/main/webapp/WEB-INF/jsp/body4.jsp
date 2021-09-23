<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
 
<!DOCTYPE html>
<head>
 
 
    <%-- 1. header --%>
 
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
<link href="../../css/sb-admin.css" rel="stylesheet">
 
<jsp:include page="/headerShared.do"/>
<jsp:include page="/header.do" />
 
 
<link rel="stylesheet" href="../../tree_fontello/css/fontello.css">
<style>
.tree {
    color: #393939;
}
 
.tree, .tree ul {
    list-style: none;
    padding-left: 45px;
    padding-top : 5px;
}
 
.tree *:before {
    width: 25px;
    height: 25px;
    display: inline-block;
}
 
.tree label {
    cursor: pointer;
}
 
.tree label:before {
    content: '\e802';
    font-family: fontello;
}
 
.tree input[type="checkbox"] {
    display: none;
}
 
.tree input[type="checkbox"]:checked ~ul {
    display: none;
}
 
.tree input[type="checkbox"]:checked+label:before {
    content: '\e801';
    font-family: fontello;
}
</style>
</head>
 
<body class="jg" style="background: linear-gradient( #E3E3E3, #EEEEEE )" id="page-top">
 
    <div id="wrapper">
        <%-- 2. sideBar --%>
        <jsp:include page="/sideBar.do" />
 
        <div id="content-wrapper" style="width: 100%">
            <!-- Current Page Path -->
            <ol class="breadcrumb" style="width: 30%">
                <li class="breadcrumb-item"><a href="#">HighWriter</a></li>
                <li class="breadcrumb-item active"></li>
            </ol>
 
            <div class="container-fluid">
                 
                <div class="card mb-4">
                    <div class="card-header" style="color: white;background:#8977ad">
                        <i class="fas fa-fw fa-chevron-right"></i> 회사 조직도
                    </div>
                    <div class="card-body">
                        <ul class="tree text-primary" style = "font-size: medium">
                            <li><input type="checkbox" id="root"> <label for="root"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=99&field_id=99&keyword=.all&name=삼성전자">삼성전자</a>
                            <hr>
                            <ul>
                                <li><input type="checkbox" id="node1"> <label for="node1"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=99&field_id=01&keyword=.all&name=DS부문">DS 부문</a>
                                <hr>
                                    <ul>
                                        <li><input type="checkbox" id="node2"> <label for="node2"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=01&field_id=01&keyword=.all&name=메모리사업부">메모리사업부</a>
                                        <ul>
                                            <li><input type="checkbox" id="node3"> <label for="node3"></label><a href="/group.do?department_id=99&team_id=99&lab_id=01&bus_id=01&field_id=01&keyword=.all&name=DRAM개발실">DRAM 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=1&team_id=01&lab_id=01&bus_id=01&field_id=01&keyword=.all&name=DRAM설계팀">DRAM 설계팀</a></li>  
                                                <li><a href="/group.do?department_id=2&team_id=02&lab_id=01&bus_id=01&field_id=01&keyword=.all&name=DRAMPA팀">DRAM PA팀</a></li>  
                                                <li><a href="/group.do?department_id=3&team_id=03&lab_id=01&bus_id=01&field_id=01&keyword=.all&name=DRAMPE팀">DRAM PE팀</a></li>  
                                                <li><a href="/group.do?department_id=4&team_id=04&lab_id=01&bus_id=01&field_id=01&keyword=.all&name=DRAMDT팀">DRAM DT팀</a></li>  
                                            </ul>
                                            </li>
                                            <li><input type="checkbox" id="node4"> <label for="node4"></label><a href="/group.do?department_id=99&team_id=99&lab_id=02&bus_id=01&field_id=01&keyword=.all&name=FLASH개발실">FLASH 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=5&team_id=05&lab_id=02&bus_id=01&field_id=01&keyword=.all&name=FLASH설계팀">FLASH 설계팀</a></li>    
                                                <li><a href="/group.do?department_id=6&team_id=06&lab_id=02&bus_id=01&field_id=01&keyword=.all&name=FLASHPA팀">FLASH PA팀</a></li>    
                                                <li><a href="/group.do?department_id=7&team_id=07&lab_id=02&bus_id=01&field_id=01&keyword=.all&name=FLASHPE팀">FLASH PE팀</a></li>        
                                            </ul>
                                            <li><input type="checkbox" id="node5"> <label for="node5"></label><a href="/group.do?department_id=99&team_id=99&lab_id=03&bus_id=01&field_id=01&keyword=.all&name=Solution개발실">Solution 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=8&team_id=08&lab_id=03&bus_id=01&field_id=01&keyword=.all&name=SW개발팀">SW 개발팀</a></li>  
                                                <li><a href="/group.do?department_id=9&team_id=09&lab_id=03&bus_id=01&field_id=01&keyword=.all&name=컨트롤러개발팀">컨트롤러 개발팀</a></li>  
                                                <li><a href="/group.do?department_id=10&team_id=10&lab_id=03&bus_id=01&field_id=01&keyword=.all&name=SolutionPE팀">Solution PE팀</a></li>     
                                            </ul>
                                            </li>
                                        </ul>
                                        </li>
                                        <li><input type="checkbox" id="node6"> <label for="node6"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=02&field_id=01&keyword=.all&name=S.LSI사업부">S.LSI사업부</a>
                                        <ul>
                                            <li><input type="checkbox" id="node7"> <label for="node7"></label><a href="/group.do?department_id=99&team_id=99&lab_id=04&bus_id=02&field_id=01&keyword=.all&name=SOC개발실">SOC 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=11&team_id=11&lab_id=04&bus_id=02&field_id=01&keyword=.all&name=모뎀개발팀">모뎀 개발팀</a></li> 
                                                <li><a href="/group.do?department_id=12&team_id=12&lab_id=04&bus_id=02&field_id=01&keyword=.all&name=플랫폼개발팀">플랫폼 개발팀</a></li>   
                                            </ul>
                                            </li>
                                            <li><input type="checkbox" id="node8"> <label for="node8"></label><a href="/group.do?department_id=99&team_id=99&lab_id=05&bus_id=02&field_id=01&keyword=.all&name=LSI개발실">LSI 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=13&team_id=13&lab_id=05&bus_id=02&field_id=01&keyword=.all&name=Display Solution개발실">Display Solution 개발실</a></li> 
                                                <li><a href="/group.do?department_id=14&team_id=14&lab_id=05&bus_id=02&field_id=01&keyword=.all&name=시큐리티제품개발팀">시큐리티 제품 개발팀</a></li>    
                                            </ul>
                                        </ul>
                                        </li>
                                        <li><input type="checkbox" id="node9"> <label for="node9"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=03&field_id=01&keyword=.all&name=Foundary사업부">Foundary 사업부</a>
                                        <ul>
                                            <li><input type="checkbox" id="node10"> <label for="node10"></label><a href="/group.do?department_id=99&team_id=99&lab_id=06&bus_id=03&field_id=01&keyword=.all&name=디자인플랫폼개발실">디자인 플랫폼 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=15&team_id=15&lab_id=06&bus_id=03&field_id=01&keyword=.all&name=DT팀">DT 팀</a></li>
                                            </ul>
                                            </li>
                                        </ul>
                                        </li>
                                        <li><input type="checkbox" id="node11"> <label for="node11"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=04&field_id=01&keyword=.all&name=TSP총괄">TSP 총괄</a>
                                        <ul>
                                            <li><input type="checkbox" id="node12"> <label for="node12"></label><a href="/group.do?department_id=99&team_id=99&lab_id=07&bus_id=04&field_id=01&keyword=.all&name=패키지개발실">패키지 개발실</a>
                                            <ul>
                                                <li><a href="/group.do?department_id=16&team_id=16&lab_id=07&bus_id=04&field_id=01&keyword=.all&name=PKG기술기획팀">PKG 기술기획팀</a></li>
                                            </ul>
                                            </li>
                                        </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><input type="checkbox" id="node13"> <label for="node13"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=99&field_id=02&keyword=.all&name=IM부문">IM 부문</a>
                                <hr>
                                <ul>
                                    <li><input type="checkbox" id="node14"> <label for="node14"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=05&field_id=02&keyword=.all&name=무선사업부">무선 사업부</a>
                                    <ul>
                                        <li><input type="checkbox" id="node15"> <label for="node15"></label><a href="/group.do?department_id=99&team_id=99&lab_id=08&bus_id=05&field_id=02&keyword=.all&name=MobileUX센터">Mobile UX센터</a>
                                        <ul>
                                            <li><a href="/group.do?department_id=17&team_id=17&lab_id=08&bus_id=05&field_id=02&keyword=.all&name=UX혁신팀">UX 혁신팀</a></li> 
                                            <li><a href="/group.do?department_id=18&team_id=18&lab_id=08&bus_id=05&field_id=02&keyword=.all&name=SW개발팀">SW 개발팀</a></li>
                                        </ul>
                                        </li>
                                    </ul>
                                    </li>
                                    <li><input type="checkbox" id="node16"> <label for="node16"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=06&field_id=02&keyword=.all&name=네트워크사업부">네트워크 사업부</a>
                                    <ul>
                                        <li><input type="checkbox" id="node17"> <label for="node17"></label><a href="/group.do?department_id=99&team_id=99&lab_id=09&bus_id=06&field_id=02&keyword=.all&name=개발팀">개발팀</a>
                                        <ul>
                                            <li><a href="/group.do?department_id=19&team_id=19&lab_id=09&bus_id=06&field_id=02&keyword=.all&name=시스템설계그룹">시스템 설계 그룹</a></li>
                                        </ul>
                                        </li>
                                    </ul>
                                    </li> 
                                </ul>
                                </li>
                                <li><input type="checkbox" id="node18"> <label for="node18"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=99&field_id=03&keyword=.all&name=CE부문">CE 부문</a>
                                <hr>
                                <ul>
                                    <li><input type="checkbox" id="node19"> <label for="node19"></label><a href="/group.do?department_id=99&team_id=99&lab_id=99&bus_id=07&field_id=03&keyword=.all&name=생활가전사업부">생활가전사업부</a>
                                    <ul>
                                        <li><input type="checkbox" id="node20"> <label for="node20"></label><a href="/group.do?department_id=99&team_id=10&lab_id=99&bus_id=07&field_id=03&keyword=.all&name=선행개발팀">선행개발팀</a>
                                        <ul>
                                            <li><a href="/group.do?department_id=20&team_id=20&lab_id=99&bus_id=07&field_id=03&keyword=.all&name=NL개발그룹">NL 개발 그룹</a></li>
                                        </ul>
                                        </li>
                                    </ul>
                                    </li> 
                                </ul>
                                </li>
                            </ul>
                            </li>
                        </ul>
                    </div>
                </div>
 
 
            </div>
 
        </div>
 
 
 
 
        <!-- Bootstrap core JavaScript-->
        <script src="../../vendor/jquery/jquery.min.js"></script>
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
</body>
 
</html>
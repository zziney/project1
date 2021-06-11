<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.Lesson" %> 
<%@ page import="java.util.*" %>
<%
	String m_id = (String)session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<title>베이직헬스</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="../resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/jquery-ui.css">
  <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="../resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="../resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="../resources/css/aos.css">
  <link href="../resources/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../resources/css/style.css">
  <style>
  		.container{
  			margin-top: 50px;
  			}
  		 .table{
  			align-items: center; width:90%;
  			margin-top: 30px; margin-left: 50px;
  		}
  	
  </style>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 강좌를 삭제합니다.") == true)
			location.href = ".././deleteLesson?id="+id;
		else 
			return;
	}
</script>  
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">
  
<div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body">
      </div>
    </div>

    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <div class="site-logo"><a href="../main.jsp">베이직헬스</a>
          </div>
          <div class="ml-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="../main.jsp#classes-section" class="nav-link">레슨</a></li>
                <li><a href="../main.jsp#schedule-section" class="nav-link">시간표</a></li>
                <li><a href="../main.jsp#trainer-section" class="nav-link">트레이너</a></li>
                <li><a href="../notice/list">공지사항</a></li>                               
              </ul>
            </nav>
          </div>
          
          <div class="ml-auto">
          	<c:if test="${ empty m_id }">
	            <nav class="site-navigation position-relative text-right" role="navigation">         
	              <ul class="site-menu main-menu site-menu-dark js-clone-nav mr-auto d-none d-lg-block">
	                <li class="cta"><a href="../member/login.jsp" class="nav-link"><span class="rounded border border-primary">로그인</span></a></li>                      
	                <li class="cta"><a href="../member/register.jsp" class="nav-link"><span class="rounded border border-primary">회원가입</span></a></li>                      
	              </ul>
	            </nav>
	         </c:if>
	         
	         <c:if test="${not empty m_id }">
	            <nav class="site-navigation position-relative text-right" role="navigation">         
	              <ul class="site-menu main-menu site-menu-dark js-clone-nav mr-auto d-none d-lg-block">
	                <li class="cta"><p><%=m_id %>님<p></li>
	                <li class="cta"><a href="../member/logOut.jsp" class="nav-link" ><span class="rounded border border-primary">로그아웃</span></a></li>                      
	                <li class="cta"><a href="#" class="nav-link"><span class="rounded border border-primary">회원정보</span></a></li>                      
	                <li class="cta"><a href="../admin/manage.jsp" class="nav-link"><span class="rounded border border-success">관리자</span></a></li>                      
	              </ul>
	            </nav>
	         </c:if>
	         
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span
                	     class="icon-menu h3"></span></a>	
          </div>
        </div>
      </div>

    </header>

    <div class="site-section section-1">
		<div class="container">
			<h3 class="main title"  style="text-align:center">레슨수정/삭제하기</h3>		     			     		     		     
		     	<div class="col-md-12">
		     	<a href="regLesson.jsp" role="button" class="btn btn-primary"> 등록하기 &raquo;</a>
		     		<table class="table" style="text-align:center">
		     		<thead>
						<tr>
							<th  style=width:15% >레슨</th>
							<th colspan="expand" style=width:10%>트레이너</th>
							<th colspan="expand" style=width:15%>경력</th>
							<th colspan="w100" style=width:15%>월회비</th>
							<th colspan="w100" style=width:15%>연회비</th>
							<th colspan="w100" style=width:15%>수정</th>
							<th colspan="w60" style=width:15%>삭제</th>
						</tr>
					</thead>

	<%-- <%
		List<Lesson> list = (List<Lesson>) request.getAttribute("list");
			for(Lesson ls : list){
			pageContext.setAttribute("ls", ls);
	%> --%>

					<tbody>
					<c:forEach var="ls" items="${list}" varStatus="vn">
						<tr>
							<td>${ls.lesson}</td>
							<td> ${ls.trainer}</td>
							<td> ${ls.trainer_career}</td>
							<td>${ls.price1}</td>
							<td>${ls.price2}</td>
							<td><a href="editLessonView?id=${ls.l_id }" role="button" class="btn btn-success"> 수정 &raquo;</a></td>	
							<td><a href="#" onclick="deleteConfirm('${ls.l_id}')" role="button" class="btn btn-danger" > 삭제 &raquo;</a></td>	
						</tr>
					</c:forEach>
					</tbody>
<%-- 				<%  } %>   --%>
		     	</table>
		
			</div>
		</div>
	</div>
</div>

</body>
</html>
<%@page import="mvc.model.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.jmx.snmp.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String m_id = (String)session.getAttribute("m_id");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베이직헬스</title>
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
  			margin-top: 100px; margin-left: 50px;
  		}
  	
  </style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="100">
<!-- 네비게이션 바 -->
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
	                <li class="cta"><a href="#" class="nav-link"><span class="rounded border border-success">관리자</span></a></li>                      
	              </ul>
	            </nav>
	         </c:if>
	         
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span
                	     class="icon-menu h3"></span></a>	
          </div>
        </div>
      </div>

    </header>
<!-- 본문시작 --> 	
    	<div class="site-section section-1">
		     <div class="container">
		     	<h2 class="main title"  style="text-align:center">공지사항</h2>		     			     		     		     
		     	<div class="col-md-12">
		     		<table class="table">
		     		<thead>
						<tr>
							<th class="w60" style=width:10%>번호</th>
							<th colspan="expand" style=width:35%>제목</th>
							<th colspan="w100" style=width:20%>작성자</th>
							<th colspan="w100" style=width:25%>작성일</th>
							<th colspan="w60" style=width:10%>조회수</th>
						</tr>
					</thead>
<%-- <% List<Notice> li = (List<Notice>)request.getAttribute("list"); 
						  for(Notice n : li) {
						  pageContext.setAttribute("n", n);%> --%>
					<tbody>
					<c:forEach var="n" items="${list}" varStatus="vn">
						<tr>
							<td>${vn.index} / ${n.id}</td>
							<td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
							<td>${n.writer }</td>
							<td>${n.r_date}</td>
							<td>${n.hit}</td>	
						</tr>
					</c:forEach>
					</tbody>
<%-- 					<% } %> --%>
		     	</table>
		     	</div>
		     </div>
		 </div>
		 
	
	 

</body>
</html>
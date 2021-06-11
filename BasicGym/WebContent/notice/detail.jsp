<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  			align-items: center; width:100%;
  			margin-top: 100px; margin-left: 200px;
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
		     	<h2 class="main title"  style=text-align:center>공지사항</h2>		     			     		     		     
		     	<div class="col-md-8" >
		     		<table class="table">
						<tr>
							<th>제목</th>
							<td class="text-align-left text-indent text-strong text-orange" colspan="3">${notice.title}</td>
						</tr>
						<tr>	
							<th>날짜</th>
							<td class="text-align-left text-indent" colspan="3">${notice.r_date}</td>
						</tr>
						<tr>	
							<th>작성자</th>
							<td>${notice.writer}</td>
							<th>조회수</th>
							<td>${notice.hit}</td>							
						</tr>
						<tr class="content" >
							<td colspan="4">${notice.content}</td>
						</tr>
					</table>
				</div>
				
				<div class="margin-top text-align-center" style=margin-left:750px>
					<a class="btn btn-primary"  href="list">목록보기</a>									
				</div>
				
				<div class="margin-top col-md-8">
					<table class="table border-top-defualt">
						<tr>
							<th>다음글</th>
							<td class="text-align-left text-indent" colspan="3">다음 글이 없습니다.</td>	
						</tr>
						<tr>
							<th>이전글</th>
							<td class="text-align-left text-indent" colspan="3">
								<a class="text-blue text-strong" href="before"></a></td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>


</body>
</html>
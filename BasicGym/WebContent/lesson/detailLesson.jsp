<%@page import="com.sun.webkit.ContextMenu.ShowContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.Lesson" %>    
<%@ page import="mvc.model.DAO" %> 
<%@ page import="java.util.ArrayList" %>
<%
	String m_id = (String)session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

  <script type="text/javascript">
  	function addToCart(){
  		if(confirm("클래스 수강권을 주문하시겠습니까?")){
  			location.href="addCart.jsp"
  		}else {
  			document.addForm.reset();
  		}
  	}</script>
</head>

<body>
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
    
  	<img src="../resources/images/yoga_bg.jpg" name="yoga_bg"  style="height:400px; width:100%; opacity:0.3;"/>
  	
     
    <div class="site-section section-1" >
     <% 
        DAO dao = new DAO();
     	String getid = request.getParameter("id");
     	int l_id=Integer.parseInt(getid);
        Lesson ls = dao.showLessonById(l_id);
        pageContext.setAttribute("ls", ls);
      %>
    
      <div class="container" id=" ${ls.l_id}">
      
		<!-- <form name="addForm" action="addCart.jsp?lesson=${ls.lesson}" method="post"> -->
        <div class="row">       
          <div class="col-lg-6 mr-auto mb-5 align-self-center">
            <div class="mb-5">
              <h2 class="section-title">${ls.lesson}</h2>
              <div class="table">
               
                <table>                     
                <tbody>
                    <tr>
                        <th scope="row">TRAINER</th>
                        <td>${ls.trainer }</td>
                        <td>${ls.trainer_career }</td>
                    </tr>
                    <tr>
                        <th scope="row">SCHEDULE</th>
                        <td>${ls.scheduler1}</td>
                        <td>${ls.scheduler2}</td>
                    </tr>
                    <tr>
                        <th scope="row">PRICE</th>
                        <td>월 ${ls.price1 }원</td>
                        <td>연간이용권 ${ls.price2 }원</td>
                    </tr>
                   
                    <tr>
                      <td></td>
                      <td><a href="#" class="btn btn-info" onclick="addToCart()">이용권구매&raquo;</a></td>
                      <td><a href="#" class="btn btn-info" onclick="addToCart()">이용권구매&raquo;</a></td>
                    </tr>                   
                </tbody>                   
                </table>
                              
              <p class="mb-5">${ls.descript}</p>
              </div>
            </div>
          </div>
          </div>

          <div class="col-lg-6">
            <div class="image-absolute-box" style="margin-bottom:50px;">
              <img src="../resources/images/${ls.filename }" alt="Image" class="img-fluid img-shadow" />
            </div>
          </div>
          
        </div>
     
      </div>
    
</body>
</html>
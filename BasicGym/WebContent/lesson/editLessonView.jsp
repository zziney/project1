<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.DAO" %>
<%@ page import="mvc.model.Lesson" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="mvc.database.DBConnection" %>
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
  			margin-top: 50px; margin-left: 30px;
  		}
  	
  </style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">
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
    
<!-- 본문 -->
    <div class="site-section section-1">
		<div class="container">
			<h3 class="main title"  style="text-align:center">레슨수정/삭제하기</h3>
			
				<form action="../editLessonPro" method="post" enctype="multipart/form-data">	     			     		     		     
		     	<div class="col-md-12">
		     		No. <input type="text" name="l_id" size="2" value="${ls.l_id}">
		     		<table class="table">
		     			<tbody>
		     				<tr>
		     					<th>레슨</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="2">${ls.lesson}</td>
		     					<th>트레이너</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="5"><input type="text" name="trainer"  size="10" value="${ls.trainer}"></td>
		     					<th>경력</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="5"><input type="text" name="trainer_career" size="10" value="${ls.trainer_career}"></td>
		     				</tr>
		     				<tr>
		     					<th>강좌시간(요일)</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="4"><input type="text" name="scheduler1" size="10" value="${ls.scheduler1}"></td>
		     					<th>강좌시간(시간)</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="8"><input type="text" name="scheduler2" size="20" value="${ls.scheduler2}"></td>
		     				</tr>
		     				<tr>
		     					<th>월회비</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="4"><input type="text" name="price1" size="10" value="${ls.price1}"></td>
		     					<th>연회비</th>
		     					<td class="text-align-left text-indent text-strong text-orange" colspan="8"><input type="text" name="price2" size="10" value="${ls.price2}"></td>
		     				</tr>
		     				<tr>
		     					<th>이미지</th>
		     					<td colspan="12"><input type="file" name="filename" class="upload-hidden" value="${ls.filename}"></td>
		     				</tr>
		     			</tbody>
					</table>
					<p>강좌상세설명</p>
					<textarea rows="5" cols="100%" >${ls.descript}</textarea>
				
				<div class="container">
					<div class="button" style="margin-left:40%; margin-top:10%">
							<input type="submit" class="btn btn-danger" name="edit" value="수정">
							<a href="./admin/manage.jsp" ><input type="button" class="btn btn-primary"  name="redirect" value="취소"></a>
					</div>
				</div>
				
			</div>
			</form>
			
		</div>
	</div>
</div>

</body>
</html>
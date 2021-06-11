<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.Lesson" %>
<%
	String m_id = (String)session.getAttribute("m_id");
%> 
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
        table, tr, th{border:black solid 10px; margin-bottom: 20px;}
        .filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
        .filebox label { display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; } /* named upload */ 
        .filebox .upload-name { display: inline-block; padding: .5em .75em; /* label의 패딩값과 일치 */ font-size: inherit; font-family: inherit; line-height: normal; vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; } 
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
		     	<form name="newLesson" action="../lesson.servlet"  method="post" enctype="multipart/form-data">
		     	<input type="hidden" name="action" value="regLesson">
		        	<div class="row justify-content-center">
		        	
		          		<div class="col-md-6">      
		            	<h5 class="redit">New Lesson 등록하기</h5>
		            	<p class="redit">추가할 레슨을 입력해주세요</p>
		            		<table>
		              		<colgroup>
		                	<col width="30%" />
		                	<col width="70%" />                 
		              		</colgroup>
		              			<tr>
		                  			<th scope="row">No.</th>
		                  			<td><input type="text" name="l_id" size="3"  autofocus="autofocus"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">레슨명</th>
		                  			<td><input type="text" name="lesson" placeholder="필라테스"  ></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">트레이너</th>
		                  			<td><input type="text" name="trainer" placeholder="트레이너이름"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">경력사항</th>
		                  			<td><input type="text" name="trainer_career" placeholder="경력25년"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">스케줄</th>
		                  			<td><input type="text" name="scheduler1" placeholder="주중 월,수"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">시간</th>
		                  			<td><input type="text" name="scheduler2" placeholder="월~금 7:00am ~ 9:00am"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">1회/1개월 가격</th>
		                  			<td><input type="text" name="price1" placeholder="월이용권"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">연회원 가격</th>
		                  			<td><input type="text" name="price2" placeholder="연이용권"></td>
		                		</tr>
		                		<tr>
		                  			<th scope="row">레슨상세설명</th>
		                  			<td><textarea rows="3" name="descript" cols="20"></textarea></td>
		                		</tr> 		               		                                                
		            		</table>
		            		<hr>
		            		<div class="filebox">이미지업로드 <input class="upload-name" value="파일선택" disabled="disabled">
		            		 <label for="ex_filename">업로드</label>
		            		 <input type="file" name="filename" id="ex_filename" class="upload-hidden">
		            		</div>
		            		<hr>
		                                                       
		            	<div class="form-group row">
		              		<div class="col-md-3">
		                		<input type="submit" class="btn btn-primary btn-block" value="등록">
		              		</div>
		            	</div>
		            	
		            	            	           
		          	</div>
		          	
		        </div>
		        </form>
		        
		    </div>            
  		</div>
  
 	</div>
 
   
  
  <!-- .site-wrap -->

 

</body>

</html>
    
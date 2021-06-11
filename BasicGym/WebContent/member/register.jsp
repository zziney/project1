<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베이직헬스</title>

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
  </style>

</head>

<body>
 <!-- 별도 nav bar -->
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
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu site-menu-dark js-clone-nav mr-auto d-none d-lg-block">
                <li class="cta"><a href="login.jsp" class="nav-link"><span class="rounded border border-primary">로그인</span></a></li>                      
                <li class="cta"><a href="register.jsp" class="nav-link"><span class="rounded border border-primary">회원가입</span></a></li>                      
              </ul>
            </nav>
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span
                	     class="icon-menu h3"></span></a>	
          </div>
        </div>
      </div>

    </header> 
<!--     본문    -->	
	<div class="site-section section-1">
     	<div class="container-fluid">
     	
     		<form class="form-register" action="../member.servlet" method="post" >
     			<input type="hidden" name="action" value="register">
            	<h2 class=" redit"  style="text-align:center">회원가입</h2>
            	<p style="text-align:center">회원가입 시 1개월 레슨 무료이용</p>
          
        	<div class="col-md-6" style="position:absolute; top:20%; left:30%">
        		<div class="row justify-content-center" >
            		<table>
               		 <tr>
                 		 <th scope="row">아이디</th>
                  		<td><input type="text" name="m_id" required autofocus></td>
                	</tr>
               		<tr>
                  		<th scope="row">이름</th>
                  		<td><input type="text" name="m_name" ></td>
                	</tr>
                	<tr>
                  		<th scope="row">비밀번호</th>
                  		<td><input type="password" name="m_pw" ></td>
                	</tr>
                	<tr>
                  		<th scope="row">전화번호</th>
                  		<td><input type="text" name="p_number" placeholder="-없이 입력해주세요"></td>
                	</tr>
                	<tr>
	                  	<th scope="row">이메일주소</th>
                  		<td><input type="text" name="e_address1" ></td>
                  		<td>@</td>
                  		<td><select name="e_address2"  size="1">
                  			<option value="naver">naver.com</option>
                  			<option value="daum">daum.net</option>
                  			<option value="gmail">gmail.com</option>
                  			<option value="nate">nate.com</option>
                  			<option value="hotmail">hotmail.com</option>
                  			</select>
                  		</td>
                	</tr>               
            	 </table>             
               </div>
           </div>
                                        
           <div class="form-group row" >
           <div class="col-md-2 " style="position:absolute; top:50%; left:45%">
              <input type="submit" class="btn btn-primary btn-block" value="가입">
           </div>
           </div> 
                      
          
        </form>
          
        </div>
    </div>            


  
  <!-- .site-wrap -->

  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.stellar.min.js"></script>
  <script src="resources/js/jquery.countdown.min.js"></script>
  <script src="resources/js/bootstrap-datepicker.min.js"></script>
  <script src="resources/js/jquery.easing.1.3.js"></script>
  <script src="resources/js/aos.js"></script>
  <script src="resources/js/jquery.fancybox.min.js"></script>
  <script src="resources/js/jquery.sticky.js"></script>
  <script src="resources/js/jquery.mb.YTPlayer.min.js"></script>




  <script src="resources/js/main.js"></script>



</body>
</html>
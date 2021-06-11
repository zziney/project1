<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html lang="ko">

<head>
  <title>베이직헬스</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/jquery-ui.css">
  <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="resources/css/aos.css">
  <link href="resources/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="resources/css/style.css">
  <style>
  .row{text-align:center; justify-content:center;}
  
  </style>
 
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<jsp:include page="../admin/nav.jsp"></jsp:include>
	
    <div class="site-section section-1" style="dispay:flex; justify-content:center;"> 
      <div class="container"> 
         
			<c:if test="${result == 1 }" >
				<script type="text/javascript">
					alert("로그인 성공했습니다.\n환영합니다.");
					location.href = 'main.jsp';
				</script>
			</c:if>
			<c:if test="${result == 0 }">
				<script type="text/javascript">
					alert("비밀번호를 다시 확인해주세요.");
					history.go(-1);
				</script>
			</c:if>   
			<c:if test="${result == -1 }">
				<script type="text/javascript">
					alert("존재하지 않는 아이디입니다.");
					history.go(-1);
				</script>
			</c:if>
		        
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

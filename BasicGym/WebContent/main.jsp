<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="mvc.model.Lesson" %>    
<%@ page import="mvc.model.DAO" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="mvc.database.DBConnection" %>


<html>

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
            h3{color: blanchedalmond;}
            a,p{color:rgba(248, 208, 194, 0.877);}
  </style>   

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

	<jsp:include page="/admin/nav.jsp"></jsp:include>
	
  	<img src="resources/images/main_1920.jpg" name="main_1920" />

    <div class="intro-section" id="home-section" style="background-color: #ccc;">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-8 mx-auto text-center" data-aos="fade-up">
            <h3>베이직헬스에 오신 것을 환영합니다</h3>
          </div>
        </div>
      </div>
    </div>


    <div class="site-section section-1">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 mr-auto mb-5 align-self-center">
            <div class="mb-5">
              <h2 class="section-title">Step Up Your Fitness</h2>
              <p class="mb-5">일반적으로는 적당, 적합, 건강 상태의 양호 등을 말하나 체육에서는 환경의 변화에 알맞게 적응하는 것을 이르는 말이다.
                외국에서는 '신체 적성(physical fitness)'을 이르는 말로 통용되고 있다. 우리 나라에서는 흔히 '체력(physical fitness)'과 같은 뜻으로도 이해되고 있다.
                피트니스의 상태를 얻기 위해서는 생리적으로는 신경 계통과 근육 활동의 조정을 할 필요가 있다.
                일반적으로 환경의 급격한 변화에 대하여 반사적으로 적절히 순응하여 위험 방지를 하는 것이 매우 중요하다.교육의 근본적인 목적은 이 상태를 얻는 데 있다.</p>              
            </div>
          </div>
          <div class="col-lg-6">
            <div class="image-absolute-box">
              <img src="resources/images/sports.jpg" alt="Image" class="img-fluid img-shadow">
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section section-2" id="classes-section">
      <div class="container">
            
        <div class="row">
          <div class="col-lg-6 mb-5">
            <h2 class="section-title">Your lesson</h2>
            <p>배우고자 하는 레슨을 선택해주세요</p>
          </div>
        </div>
        
      	<div class="owl-carousel nonloop-block-13">
        <% 
        DAO dao = new DAO();
        ArrayList<Lesson> li = (ArrayList<Lesson>)dao.showLesson();
        for(Lesson ls : li){
        	pageContext.setAttribute("ls", ls);
        %>
        	             
      		<form class="form-detail" action="lesson/detailLesson.jsp?id=<%=ls.getL_id() %>" method="post">
      			<div class="test">
      				<img src="./resources/images/<%=ls.getFilename()%>" alt="Image" class="img-fluid" style=height:300px; >	
        			<input type="submit" class="btn btn-secondary"  value="<%=ls.getLesson() %> &raquo; ">       	
      	 		</div>
       		</form>
       			
 		<% } %>   
      	</div>
     </div>
    </div>


    <div class="site-section section-2" id="schedule-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5">
            <h2 class="section-title">Schedule</h2>
            <p>최근 covid-19로 인해 클래스 휴강이 많았습니다.회원 여러분의 양해부탁드리고 2021년 9월부터 정상 개강합니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <ul class="nav nav-tabs mb-5 border-bottom-0 justify-content-center tab-list-custom" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="monday-tab" data-toggle="tab" href="#monday" role="tab" aria-controls="monday"
                  aria-selected="true">Monday</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="tuesday-tab" data-toggle="tab" href="#tuesday" role="tab" aria-controls="tuesday"
                  aria-selected="false">Tuesday</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="wednesday-tab" data-toggle="tab" href="#wednesday" role="tab" aria-controls="wednesday"
                  aria-selected="false">Wednesday</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="Thursday-tab" data-toggle="tab" href="#Thursday" role="tab" aria-controls="Thursday"
                  aria-selected="false">Thursday</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="Friday-tab" data-toggle="tab" href="#Friday" role="tab" aria-controls="Friday"
                  aria-selected="false">Friday</a>
              </li>              
            </ul>
            
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="monday" role="tabpanel" aria-labelledby="monday-tab">
                <table class="table table-bordered table-custom table-striped ">
                  <tbody>
                    <tr>
                      <td>요가</td>
                      <td>8:00am - 10:00am</td>
                      <td>무디</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>싸이클</td>
                      <td>1:00pm - 4:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>                                       
                    <tr>
                      <td>집중PT</td>
                      <td>8:00am - 9:00am  / 5:00pm - 6:00pm</td>
                      <td>매미킴</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>헬스장이용</td>
                      <td>7:00am - 11:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="tab-pane fade" id="tuesday" role="tabpanel" aria-labelledby="tuesday-tab">
                <table class="table table-bordered table-custom table-striped ">
                  <tbody>                    
                    <tr>
                      <td>크로스핏</td>
                      <td>9:00am - 10:00am / 7:00pm - 8:00pm</td>
                      <td>장성규</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>싸이클</td>
                      <td>1:00pm - 4:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>집중PT</td>
                      <td>8:00am - 9:00am  / 5:00pm - 6:00pm</td>
                      <td>매미킴</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>헬스장이용</td>
                      <td>7:00am - 11:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="tab-pane fade" id="wednesday" role="tabpanel" aria-labelledby="wednesday-tab">
                <table class="table table-bordered table-custom table-striped ">
                  <tbody>
                    <tr>
                      <td>요가</td>
                      <td>8:00am - 10:00am</td>
                      <td>무디</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>                   
                    <tr>
                      <td>싸이클</td>
                      <td>1:00pm - 4:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>집중PT</td>
                      <td>8:00am - 9:00am  / 5:00pm - 6:00pm</td>
                      <td>매미킴</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>헬스장이용</td>
                      <td>7:00am - 11:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="tab-pane fade" id="thursday" role="tabpanel" aria-labelledby="thursday-tab">
                  <table class="table table-bordered table-custom table-striped ">
                  <tbody>                  
                    <tr>
                      <td>크로스핏</td>
                      <td>9:00am - 10:00am / 7:00pm - 8:00pm</td>
                      <td>장성규</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>싸이클</td>
                      <td>1:00pm - 4:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>집중PT</td>
                      <td>8:00am - 9:00am  / 5:00pm - 6:00pm</td>
                      <td>매미킴</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>헬스장이용</td>
                      <td>7:00am - 11:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="tab-pane fade" id="friday" role="tabpanel" aria-labelledby="friday-tab">
                <table class="table table-bordered table-custom table-striped ">
                  <tbody>
                    <tr>
                      <td>요가</td>
                      <td>8:00am - 10:00am</td>
                      <td>무디</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>                   
                    <tr>
                      <td>싸이클</td>
                      <td>1:00pm - 4:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>집중PT</td>
                      <td>8:00am - 9:00am  / 5:00pm - 6:00pm</td>
                      <td>매미킴</td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                    <tr>
                      <td>헬스장이용</td>
                      <td>7:00am - 11:00pm</td>
                      <td></td>
                      <td class="text-center"><a href="#contact-section" class="smoothscroll">Join Now</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="site-section" id="trainer-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5">
            <h2 class="section-title">Trainers</h2>
            <p>탄탄한 기본기와 생활체육지도교사 자격을 갖춘 전문 코치진이 여러분을 도와드립니다.</p>
          </div>
        </div>
        <div class="row large-gutters">
          <div class="col-md-6 person col-lg-4 mb-4 mb-lg-0">
            <img src="resources/images/person_1.jpg" alt="Image" class="img-fluid mb-5">
            <h3>김요가</h3>
            <p class="mb-4 opacity-7">요가클래스 코치<br>테라피요가</p>
            <p>인도 전통 의학인 아유르베다를 접목한 것으로 수련자의 맥박을 짚고 몸 상태를 살핀다.
              또한 정신적인 기운도 고려해 개개인의 특별한 상태에 적합한 동작, 호흡법, 명상 등을 처방하는 요가다.
              일종의 맞춤 요가라 할 수 있으며 따라서 1:1 교습으로 진행되는 것이 일반적이다. 비니 요가(Vini Yoga)라고도 한다</p>
          </div>
          <div class="col-md-6 person col-lg-4 mb-4 mb-lg-0 mt-5">
            <img src="resources/images/person_2.jpg" alt="Image" class="img-fluid mb-5">
            <h3>장성규</h3>
            <p class="mb-4 opacity-7">크로스핏클래스 코치</p>
            <p>크로스핏은 어느 한 분야에 특화된 피트니스 프로그램이 아니다.
              10가지 영역의 육체능력을 골고루 극대화하려는 시도이다. 이 열가지 능력에는 심폐지구력, 최대근력, 유연성, 협응력, 민첩성, 균형감각, 정확성, 파워, 스태미너, 속도가 들어간다.</p>
          </div>
          <div class="col-md-6 person col-lg-4 mb-4 mb-lg-0">
            <img src="resources/images/person_3.jpg" alt="Image" class="img-fluid mb-5">
            <h3>매미킴</h3>
            <p class="mb-4 opacity-7">집중PT클래스 코치</p>
            <p>의도된 주요 근육에 균형적이고 적절한 부하를 주는 것이 관건인 코어 근육 운동은
               지속성에서뿐만 아니라 안전성 때문에 잘못된 습관을 방지하고 부적절한 근육 사용을 피하기 위해서
                올바른 자세와 단계적인 과학적 동작으로 신체기능의 이해를 전제로 행하는 것이 중요하다.</p>
          </div>
        </div>
      </div>
    </div>
	
	<jsp:include page="footer.jsp" />
   
    
   

	

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

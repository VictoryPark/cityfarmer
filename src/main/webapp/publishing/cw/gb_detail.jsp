<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
    </script>
    <c:import url="/resources/css/groupbuy/gb_detail.css" />
</head>
<body>
   <header>
            <h1><span>City</span>Farmer</h1>
            <nav>
                <a href="">About</a>
                <a href="">물물교환</a>
                <a href="">공동구매</a>
                <a href="">꿀팁</a>
                <a href="">갤러리</a>
                <a href="">나만의 일기</a>
            </nav>
        </header>
        <div class="top-section">
            
	  
	  <!-- <div class="main-image"><img src="https://cdn.pixabay.com/photo/2015/02/26/09/16/shopping-650046_960_720.png" style="height: 50%;" /></span>  -->
	  <div class="main-image"><img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" /></span> 
	  <!-- <div class="main-image"><img src="happy-kids-set-of-four-illustrated-cartoon-kids-holding-blank-signs-image_csp54465470.jpg" style="width:500px; height:200px;"/></span>  -->
            </div>
            <div class="main-title">
                <h1>공동구매 게시판</h1>
            </div>
        </div>
        <div class="bottom-section">
            <div class="section-one">
                <div class="panel panel-default" style="text-align: left;">
                    <div class="panel-heading">
                      <h3 class="panel-title" style="text-align: left; font-weight: bold;">토마토 종자 공구해요</h3>
                      <div id="writer" style="display: inline-block;"><h3 class="panel-title">토마토맨 &nbsp&nbsp&nbsp<span id="reg_time">18-10-22 16:40:30</span></h3></div>
                      <div id="detail_info">
                            <span id="view_cnt">조회수 10</span> |
                            <span id="cmt_count">댓글수 10</span>
                      </div>
                    </div>
                    <div class="panel-body">
                            <img src="https://steptohealth.co.kr/wp-content/uploads/2017/09/consumir-tomate-500x332.jpeg" />
                            <div id="timeLimit"></div>
                    </div>
                    <div class="panel-footer">댓글 목록</div>
                    <div class="panel-body">
                        <div id="cmt_container">
                            <ul id="cmt_list">
                               <li>
                                   <div class="cmt_nickbox">작성자1</div>
                                   <div class="cmt_txtbox">공구하고 싶습니다.</div>
                                   <div class="cmt_reg">18-10-12 16:36:40</div>
                                </li>
                               <li>
                                   <div class="cmt_nickbox">작성자1</div>
                                   <div class="cmt_txtbox">공구하고 싶습니다.</div>
                                   <div class="cmt_reg">18-10-12 16:36:40</div>
                                </li>
                               <li>
                                   <div class="cmt_nickbox">작성자1</div>
                                   <div class="cmt_txtbox">공구하고 싶습니다.</div>
                                   <div class="cmt_reg">18-10-12 16:36:40</div>
                                </li>
                               <li>
                                   <div class="cmt_nickbox">작성자1</div>
                                   <div class="cmt_txtbox">공구하고 싶습니다.</div>
                                   <div class="cmt_reg">18-10-12 16:36:40</div>
                                </li>
                               <li>
                                   <div class="cmt_nickbox">작성자1</div>
                                   <div class="cmt_txtbox">공구하고 싶습니다.</div>
                                   <div class="cmt_reg">18-10-12 16:36:40</div>
                                </li>
                               
                            </ul> 
                        </div>
                        
                        <div id="cmt_writeform">
                            <div id="cmt_writer">댓글작성자</div>
                            <div id="cmt_textarea"><textarea></textarea></div>
                            <div id="cmt_regbtn"><button type="button" class="btn btn-success">등록</button></div>
                        </div>
                    </div>
                </div> 
                                <div id="writebtn">
                                        <button type="button" class="btn btn-default">수정</button>
                                        &nbsp;
                                        <button type="button" class="btn btn-default">삭제</button>
                                </div>
            </div>
        </div>

        <footer>
            <h4>Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
            
            <h4>with AR, CW, HK, SY, BG</h4>
        </footer>

        <script>
           // 날짜 등록 
           var countDownDate = new Date("2018-10-29 10:00:00").getTime(); 
           
           //1초마다 갱신되도록 함수 생성,실행 
           var x = setInterval(function() { 

            // 오늘 날짜 등록 
           var now = new Date().getTime(); 
           
           // 종료일자에서 현재일자를 뺀 시간 
           var distance = countDownDate - now; 
           
           // 각 변수에 일, 시, 분, 초를 등록 
           var d = Math.floor(distance / (1000 * 60 * 60 * 24)); 
           var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
           var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); 
           var s = Math.floor((distance % (1000 * 60)) / 1000); 

            if(s<10) {
                s = "0" + s;
            }

            if(m<10) {
                m = "0" + m;
            }

           //id가 d-day인 HTML코드에 내용 삽입 
           $("#timeLimit").html(d +"일" + h + ":" + m + ":" + s + "남았습니다.");
           });

           if(countDownDate => now) {
               $("#timeLimit").html("날짜가 만료 되었습니다.")
           }

        </script>
</body>
</html>
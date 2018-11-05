<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
    <link rel="stylesheet" href="<c:url value="/resources/css/groupbuy/gb_detail.css" />">
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
                      <h3 class="panel-title" style="text-align: left; font-weight: bold;">${gbb.gbTitle}</h3>
                      <div id="writer" style="display: inline-block;"><h3 class="panel-title">${gbb.writer} &nbsp&nbsp&nbsp<span id="reg_time"><fmt:formatDate value="${gbb.gbRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span></h3></div>
                      <div id="detail_info">
                            <span id="view_cnt">조회수 ${gbb.gbViewCnt}</span> |
                            <span id="cmt_count">댓글수 </span>
                      </div>
                    </div>
                    <div class="panel-body">
<!--                             <img src="https://steptohealth.co.kr/wp-content/uploads/2017/09/consumir-tomate-500x332.jpeg" /> -->
                            ${gbb.gbContent}
                            <div style="font-weight: bold;">공구종료날짜: ${gbb.gbEndDay} ${gbb.gbEndTime}</div>
                            <div id="timeLimit" style="color: red;"></div>
                    </div>
                    <div class="panel-footer">댓글 목록</div>
                    <div class="panel-body">
                        <div id="cmt_container">
                            <ul id="cmt_list">
                              <!-- 댓글 들어가는부분 -->
                            </ul> 
                        </div>
                        
                        <form id="commentForm">
                        <div id="cmt_writeform">
                        	<input type="hidden" name="gbNo" value="${gbb.gbNo}" />
                            <div id="cmt_writer">${user.id}</div>
                            <input type="hidden" name="gbcWriter" value="${user.id}" />
                            <div id="cmt_textarea"><textarea id="gbcTxtarea" name="gbcContent"></textarea></div>
                            <div id="cmt_regbtn"><button id="cmtRegBtn" type="button" class="btn btn-success">등록</button></div>
                        </div>
                        </form>
                    </div>
                </div> 
        				<div id="listbtn">
      						<button type="button" id="listButton" class="btn btn-default">목록</button>
        				</div>        
                        <div id="writebtn">
                            <button type="button" id="updateBtn" data-writer="${gbb.writer}" class="btn btn-default">수정</button>
                            &nbsp;
                            <button type="button" id="deleteBtn" data-writer="${gbb.writer}" class="btn btn-default">삭제</button>
                        </div>
            </div>
        </div>

        <footer>
            <h4>Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
            
            <h4>with AR, CW, HK, SY, BG</h4>
        </footer>

        <script>
        // 댓글 리스트 함수
        var commentList = function() {
        	  $.ajax({
	            	url: "<c:url value='/groupbuy/gb_commentList.cf'/>",
	            	type: "POST",
	            	data: "no=${gbb.gbNo}"
	            }).done(function (result) {
	            	console.log(result)
	            	
	            	$("#cmt_count").html("댓글수  "+ result.length);
	    
	            	$("ul#cmt_list").html("");
	            	for(let i=0; i<result.length; i++) {
		            	$("ul#cmt_list").append(
		            		 "<li>"
                            +      "<div class='cmt_nickbox'>" + result[i].gbcWriter + "</div>"
		            		+	   "<div class='cmt_box'>" 
                            +      "<div class='cmt_txtbox' data-writer=" + result[i].gbcWriter + " data-no=" + result[i].gbcNo + ">" + result[i].gbcContent + "</div>"
                            +	   "<div class='cmt_updateForm'" + " data-no=" + result[i].gbcNo + " style='display: none;'>"
                			+		"<textarea class='cmt_updatetxtarea' name='gbcContent' style='width:90%;' data-no=" + result[i].gbcNo + ">" + result[i].gbcContent + "</textarea>"
                			+ 		"<div style='text-align:right; width:90%;'>"
                			+		"<input type='hidden' name='gbcNo' value=" + result[i].gbcNo + "/>"
                			+ 		"<button type='button' class='btn btn-default btn-xs cmtUpdateBtn' data-no=" + result[i].gbcNo + ">수정</button> "
                			+ 		"<button type='button' class='btn btn-default btn-xs cmtCancelBtn' data-no=" + result[i].gbcNo + ">취소</button>"
                			+ 		"</div>"
                            +	   "</div>"	
                            +	   "</div>" 
                            +      "<div class='cmt_reg'>" + result[i].gbcRegDate + "</div>"
                            +	   "<div class='cmt_btns'>"
                            +	   "<a href=" + result[i].gbcNo + " data-writer=" + result[i].gbcWriter + "><img src='<c:url value='/resources/img/groupbuy/edit-512.png' />' /></a>&nbsp;"
                            +	   "<a href=" + result[i].gbcNo + " data-writer=" + result[i].gbcWriter + "><img src='<c:url value='/resources/img/groupbuy/v-42-512.png' />' /></a>"
                            +	   "</div>"
                            +"</li>"
		            	);
	            	}
	            });
        };
        
        
        	// 댓글리스트 뿌리기
        	commentList();
        	
            // 댓글작성 ajax
            $("#cmtRegBtn").click(function() {
            	var formData = $("#commentForm").serialize();
//             	console.log(formData)
	            $.ajax({
	            	url: "<c:url value='/groupbuy/gb_writeComment.cf' />",
	            	type: "POST",
	            	data: formData
	            }).done(function (result) {
	            	console.log(result)
	            	commentList();
	            	$("#gbcTxtarea").val("");	            
	            });
            });
            
            
            // 댓글삭제 ajax
            $(document).on("click", "div.cmt_btns > a:odd" , function(e) {
            	e.preventDefault();
            	var cmtNo = $(this).attr("href");
            	if('${user.id}' !== $(this).data("writer")) {
            		alert("본인이 작성한 댓글만 삭제할 수 있습니다.")
        			return;
            	}
            	
            	$.ajax({
	            	url: "<c:url value='/groupbuy/gb_deleteComment.cf' />",
	            	type: "POST",
	            	data: "cmtNo=" + cmtNo
	            }).done(function (result) {
	            	/* console.log(result) */
	            	commentList();
	            });
            })
            
            // 댓글 수정 버튼
            $(document).on("click", ".cmtUpdateBtn" ,function() {
            	$.ajax({
	            	url: "<c:url value='/groupbuy/gb_updateComment.cf' />",
	            	type: "POST",
	            	data: "gbcNo=" + $(this).data("no") + "&gbcContent=" + $(".cmt_updatetxtarea[data-no=" + $(this).data("no") + "]").val()
	            }).done(function (result) {
	            	commentList();
	            });
            });
            
            // 댓글 수정 취소 버튼
            $(document).on("click", ".cmtCancelBtn", function(e) {
            	commentList();
            });
            
            // 댓글 수정 폼 띄우기
            $(document).on("click", "div.cmt_btns > a:even" , function(e) {
            	e.preventDefault()
            	
            	console.log($(this).attr("href"))
            	
            	// 조건문 추가 로그인한 아이디와 댓글 작성자 아이디가 같아야함.
            	console.log("${user.id}")
            	console.log($(this).data("writer"))
            	if('${user.id}' !== $(this).data("writer")) {
            		alert("본인이 작성한 댓글만 수정할 수 있습니다.")
            		return;
            	}
//             	commentList();
//             	$(document).on("toggle", "div.cmt_txtbox[data-no=" + $(this).attr("href") + "]");
//             	$(document).on("toggle", "div.cmt_updateForm[data-no=" + $(this).attr("href") + "]");

				console.log(this)

			    	$("div.cmt_txtbox[data-no=" + $(this).attr("href") + "]").toggle();
	            	$("div.cmt_updateForm[data-no=" + $(this).attr("href") + "]").toggle();
            });
            
            
            
           // 날짜 등록 
           var countDownDate = new Date('${gbb.gbEndDay}' + ' ' + '${gbb.gbEndTime}').getTime();  
           var checkExpire = false;
           
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
           
           
           if(d<=0&h<=0&m<=0&s<=0) {
                    clearInterval(x);
                    $("#timeLimit").html("날짜가 만료 되었습니다.");
                    
                    checkExpire = true;

                    if(checkExpire == true) return;
                }
           
            if(h<10) h = "0" + h;
            if(s<10) s = "0" + s;
            if(m<10) m = "0" + m;
            
            //id가 d-day인 HTML코드에 내용 삽입 
            $("#timeLimit").html(d +"일" + h + ":" + m + ":" + s + "남았습니다.");
            });
            
            $("#deleteBtn").click(function() {
              if($(this).data("writer") != '${user.id}') {
            	  alert("글 작성자만 삭제할 수 있습니다.")
            	  return;
              }
         	  location.href="gb_delete.cf?no=${gbb.gbNo}" 
            });
     
            $("#updateBtn").click(function() {
            	if($(this).data("writer") != '${user.id}') {
            	  console.log($(this).data("writer"))
              	  alert("글 작성자만 수정할 수 있습니다.")
              	  return;
                }
         	   location.href="gb_updateForm.cf?no=${gbb.gbNo}&"
            });
            
            $("#listButton").click(function() {
         	   location.href="gb_board.cf"
            });
   
        </script>
</body>
</html>
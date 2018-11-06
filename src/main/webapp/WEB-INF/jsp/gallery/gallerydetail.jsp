<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <link href="<c:url value="/resources/css/gallery/gallerydetail.css"/>" rel="stylesheet">
        
</head>
<body>
 <header id="header">
            <h1><span>City</span>Farmer</h1>
            <nav>
                <a href="">About</a>
                <a href="">물물교환</a>
                <a href="">꿀팁</a>
                <a href="">공동구매</a>
                <a href="">갤러리</a>
                <a href="">나만의 갤러리</a>
            </nav>
        </header>
        <div class="top-section">
            <div class="main-image">   
                <!--
                    
                    <iframe width="100%" height="600px" src="https://www.youtube.com/embed/rRzxEiBLQCA?rel=0;amp;autoplay=1?rel=0;amp;autoplay=1"
                    frameborder="1" gesture="media" allow="encrypred-media" allowfullscreen></iframe>
                --> 
                    <!-- <img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" /> -->
               
            </div>
            <div class="main-title"> 
                <h3>글제목 : ${map.b.gaTitle} <button class="rec-button" aria-hidden="true" style="float: right;"></button><span id="rc" style="float:right;">${map.b.gaRecCnt}</span></h3><br>
                <p>작성자 : ${map.b.writer}</p>
                <div id="carousel" >
                    <figure id="spinner" >
						${map.b.gaContent}
                     	<!--    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
                        <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt>
 -->
                    </figure>
                </div>
                 <div id="myModal" class="modal fade" role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-body">
                                  </div>
                                </div>
                              </div>
                            </div>
                <span style="float:left" class="ss-icon" onclick="galleryspin('-')">&lt;</span>
                <span style="float:right" class="ss-icon" onclick="galleryspin('')">&gt;</span>
                
                <div>
               		<div class="form-control" rows="10" readonly></div><br>
                 
                </div>
                
                <button type="button" class="btn" id="blist" style="float: left;">목록</button>
                <div style="float: right;">
                
                <button type="button" class="btn btn-warning" id="update" >수정</button> 
                <button type="button" class="btn btn-danger" id="delete">삭제 </button> 
                
                </div>

            </div>
            <div>
                <h3 class="heading">Comment</h3>
                  <div class="container">
                    <form method="POST">
                      <div class="form-group">
                        <textarea id="writecomment" class="form-control status-box" rows="3" placeholder="Enter your comment here..."></textarea>
                      </div>
                    </form>
                    <div class="button-group pull-right">
                      <p class="counter">250</p>
                      <a href="#" class="btn btn-primary" id="post">Post</a>
                    </div>
                    <ul class="posts">
                    	
                    </ul>
                  </div>
              
            </div>
            
            </div>
        </div><br>
        <script>
                       var angle = 0;
               function galleryspin(sign) {
                spinner = document.querySelector("#spinner");
              if (!sign) {
                angle = angle + 45;
              } else {
                angle = angle - 45;
              }
              spinner.setAttribute(
                "style",
                "-webkit-transform: rotateY(" +
                  angle +
                  "deg); -moz-transform: rotateY(" +
                  angle +
                  "deg); transform: rotateY(" +
                  angle +
                  "deg);"
              );
            }
               
            //----------삭제------------------
             $("#delete").click(function() {
         	  location.href="gallerydelete.cf?no=${map.b.gaNo}" 
            });
            //-------------목록---------------------
              $("#blist").click(function () {
				location.href="/cityFarmer/gallery/gallerylist1.cf"	
              })
			//----------수정-----------------------------
              $("#update").click(function () {
				location.href="galleryupdate.cf?no=${map.b.gaNo}"	
              })
     
               
            // 댓글
                      var main = function() {
              $('#post').click(function() {
                var post = $('.status-box').val();
                $('<li class="comment">').text(post).prependTo('.posts');
                $('.status-box').val('');
                $('.counter').text('250');
                $('#post').addClass('disabled');
              });
              $('.status-box').keyup(function() {
                var postLength = $(this).val().length;
                var charactersLeft = 200 - postLength;
                $('.counter').text(charactersLeft);
                if (charactersLeft < 0) {
                  $('#post').addClass('disabled');
                } else if (charactersLeft === 200) {
                  $('#post').addClass('disabled');
                } else {
                  $('#post').removeClass('disabled');
                }
              });
            }
            $('#post').addClass('dis abled');
            $(document).ready(main)
	//--------------------------------------------------------------------------
	//-----사진 상세 -------------------------------------------------------
	   var elem = document.querySelector('.m-p-g');

             document.addEventListener('DOMContentLoaded', function() {
/*                 var gallery = new MaterialPhotoGallery(elem);
 */             });

             $(document).ready(function () {
                $("img").click(function(){
                var t = $(this).attr("src");
                 $(".modal-body").html("<img src='"+t+"' class='modal-img'>");
                 $("#myModal").modal();
                 });

                });
             
             
   //--------------------------------------------------------------------------
  		  
   		//댓글작성
   		$("#post").click(function() {
    		$.ajax({
    			url : "<c:url value='/gallery/comment/write.cf'/>",
    			data : {
    				"gacContent" :  $('.status-box').val(),
    				"gacWriter" : "${user.id}",
    				"gaNo" : "${map.b.gaNo}"
    				   },
    			type : "POST"
    		}).done(function(result){
            	commentList();

    		});
  		 });
   		//댓글삭제
   		 $(document).on("click", "ul > a" , function(e) {
            	e.preventDefault();
            	var gacNo = $(this).attr("href");
            	if('${user.id}' !== $(this).data("writer")) {
            		alert("본인이 작성한 댓글만 삭제할 수 있습니다.")
        			return;
            	}
            	
            	$.ajax({
	            	url: "<c:url value='/gallery/comment/delete.cf' />",
	            	type: "POST",
	            	data: "gacNo=" + gacNo
	            }).done(function (result) {
	            	/* console.log(result) */
	            	commentList();
	            });
            })
   
   			//댓글 조회
    		var commentList = function(){
    			$.ajax({
    				url : "<c:url value='/gallery/comment/list.cf'/>",
    				type : "POST",
    				data : "gano=${map.b.gaNo}"
    			}).done(function(result){
    				console.log(result);
    				$("ul.posts").html("");
    				for(let i=0; i<result.length; i++){
  			  				$("ul.posts").append(
								"<li class='comment' data-writer=" + result[i].gacWriter + " data-no=" + result[i].gacNo +">"
								+"작성자:"+ result[i].gacWriter 
								+"<br>"+
								"내용:"+ result[i].gacContent+"</li>"+
	                           	"<a href=" + result[i].gacNo + " data-writer=" + result[i].gacWriter + "><img id='deleteicon' src='<c:url value='/resources/img/groupbuy/v-42-512.png'/>' /></a>"

  			  				);
    					
    				}
    			})
    			
    		};
    		
    		//댓글뿌려주기
         	commentList();
         	recCount();
    		
//--------------------------------------------------------------------------------------------------
		var gaRecCnt = ${map.b.gaRecCnt};
	/* 
		$(document).ready(function() {
		if (gaRecCnt == 1){
			$(".rec-button").html("<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>")
		} else {
			$(".rec-button").html("<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>")
		}
		});
 */		
		$(".rec-button").click(function(){
			var rUrl = "insertRec";
		if (gaRecCnt == 1) {
			rUrl = "deleteRec";
		}
		
		$.ajax({
			url : '/cityFarmer/gallery/' + rUrl + '.cf',
			data : {"gaNo" : "${map.b.gaNo}","id":"${user.id}"}
		
		}).done(function(){
			if (gaRecCnt == 0){
				alert("추천되었습니다.");
				gaRecCnt = 1;
				$(".rec-button").html("<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>");
			} else {
				alert("추천이 취소되었습니다.")
				gaRecCnt = 0;
				$(".rec-button").html("<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>");
			}
			rec();
		});
		
		function rec () {			
		$.ajax({
			url: "<c:url value='/gallery/rec.cf'/>",
			data : {"gaNo" : "${map.b.gaNo}"}
		}).done(function(result){
			$("#rc").html(result);
		});
		}
		
	});
		function recCount(){
			$.ajax({
				url: "<c:url value='/gallery/recount.cf'/>",
				data : {"gaNo" : "${map.b.gaNo}","id":"${user.id}"}
			}).done(function(result){
				if (result == 1){
					$(".rec-button").html("<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>")
				} else {
					$(".rec-button").html("<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>")
				}
			})
		}
        </script>
</body>
</html>
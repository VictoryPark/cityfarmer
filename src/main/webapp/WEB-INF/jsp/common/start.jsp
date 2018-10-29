<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login/SignUp</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <script src="<c:url value="/resources/js/common/bootstrap.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/common/bootstrap.min.css"/>">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/common/bootstrap-theme.min.css"/>">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/common/login.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:700|Do+Hyeon|Sunflower:300" rel="stylesheet">
</head>
<body>
	 <div class="hero" style="background-image: url(<c:url value="/resources/img/common/sunflower.jpg"/>)">
	    <div class="hero__content">
	        <h1>Welcome to CityFarm</h1>
	        <a class="btn" data-toggle="modal" data-target="#signUpModal" 
	            data-whatever="@getbootstrap">Sign up</a>
	        <a class="btn" data-toggle="modal" data-target="#logInModal" 
	            data-whatever="@getbootstrap" href="#">Log in</a> 
	    </div>
	</div>
	
	<!-- 회원 가입 모달-->
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	            <h4 class="modal-title" id="exampleModalLabel">회원 가입</h4>
	        </div>
	        <div class="modal-body">
	            <form action="<c:url value="/member/signup.cf"/>" method="POST">
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">이름</label>
	                <input type="text" class="form-control" name="name">
	            </div>
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">아이디</label>
	                <input type="text" class="form-control" name="id">
	            </div>
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">비밀번호</label>
	                <input type="password" class="form-control" name="pass">
	            </div>
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">비밀번호 확인</label>
	                <input type="password" class="form-control" name="passcheck">
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">창 닫기</button>
	                <button class="btn btn-default">회원가입 하기</button>
	            </div>
	        	</form>
	        </div>
	        </div>
	    </div>
	</div>
	
	<!-- 로그인 모달-->
	<div class="modal fade" id="logInModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	            <h4 class="modal-title" id="exampleModalLabel">로그인</h4>
	        </div>
	        <div class="modal-body">
	            <form action="<c:url value="/member/login.cf"/>" method="POST">
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">아이디</label>
	                <input type="text" class="form-control" name="id">
	            </div>
	            <div class="form-group">
	                <label for="recipient-name" class="control-label">비밀번호</label>
	                <input type="password" class="form-control" name="pass">
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">창 닫기</button>
	                <button class="btn btn-default">로그인</button>
	            </div>
	            </form>
	        </div>
	        </div>
	    </div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$("button#login").click(function(){
	var f = document.login;
	//alert(f.loginid.value)
	//alert(f.loginpass.value)
	$.ajax({
		url : "<c:url value='/member/login.cf'/>",
		data : {
				"id" : f.loginid.value,
				"pass" : f.loginpass.value
				},
		type : "POST"
	}).done(function(result){
		if(result == false) {
			swal({
			  type: 'error',
			  title: '아이디와 비밀번호를 다시 입력해주세요.',
			  timer : 3000
			}) //sweetalert
			setTimeout(function() {
				f.loginpass.value = "";
				f.loginid.focus();
				f.loginid.select();
			}, 1500)
		} else {
			location.href = "<c:url value='/main.cf'/>"
		}
	}) //done
})


</script>
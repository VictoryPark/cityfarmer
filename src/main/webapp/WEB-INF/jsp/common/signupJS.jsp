<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$("input[name='name']").blur(function(){
	//console.log($(this).val())
	//alert($(this).val().length)
	if(isValidName($(this).val()) == false) {
		 $("span#warnname").text("잘못된 형식의 이름입니다.")
	} else {
		$("span#warnname").text("")
	}
}) //이름 유효성에 따른 경고창

$("input[name='id']").blur(function(){
	//console.log($(this).val())
	if(isValidId($(this).val()) == false) {
		 $("span#warnid").text("영문 대소문자, 숫자만 가능합니다.")
	} else {
		$.ajax({
			url : "<c:url value='/member/checkid.cf'/>",
			data : "id="+$(this).val(),
			type : "POST"
		}).done(function(result) {
			if(result) {
				$("span#warnid").text("이미 등록되어있는 아이디 입니다.")
			} else {
				$("span#warnid").addClass("green")
				$("span#warnid").text("사용가능한 아이디 입니다.")
			}
		}) //done
	}  //if-else
}) //id 유효성에 따른 경고창

$("input[name='passcheck']").blur(function(){
	var form = document.signup;
	if(form.pass.value != form.passcheck.value) {
		$("span#warnpasscheck").text("입력된 패스워드가 서로 다릅니다.")
		form.passcheck.value ="";
		form.pass.focus();
		form.pass.select();
		
		return;
	} //비밀번호와 확인과 서로 다른지 확인
})

function isValidName(name) {
  if(name.length > 20 ){
    return false;
  }
 if(name.length <2){
	 return false;
 }
  let regx = /[^a-zA-Z가-힣]/;
  return !regx.test(name);      // 유효하면 true반환
}

function isValidId(emailId){
  let regx = /[^\w]/;
  return !regx.test(emailId);   // 유효하면 true반환
}
</script>
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
	$warnid = $("span#warnid");
	if(isValidId($(this).val()) == false) {
		$warnid.removeClass("green")
		$warnid.text("영문 대소문자, 숫자만 가능합니다.")
	} else if(isValidId($(this).val()) == true) {
		$.ajax({
			url : "<c:url value='/member/checkid.cf'/>",
			data : "id="+$(this).val(),
			type : "POST"
		}).done(function(result) {
			if(result) {
				$warnid.removeClass("green")
				$warnid.text("이미 등록되어있는 아이디 입니다.")
			} else {
				$warnid.addClass("green")
				$warnid.text("사용가능한 아이디 입니다.")
			}
		}) //done
	} else if(isValidId($(this).val()) == 0){
		$warnid.text("3글자 이상 입력해주세요.")
	}  
	//if-else
}) //id 유효성에 따른 경고창

$("input[name='passcheck']").blur(function(){
	let form = document.signup;
	if(form.pass.value != form.passcheck.value) {
		$("span#warnpasscheck").text("입력된 패스워드가 서로 다릅니다.")
		form.passcheck.value ="";
		form.pass.focus();
		form.pass.select();
		
		return;
	} //비밀번호와 확인과 서로 다른지 확인
	else {
		$("span#warnpasscheck").text("")
	}
})

$("button#newmember").click(function(){
	let f = document.signup;
	if(f.name.value==""){
        alert("이름을 입력하세요")
        f.name.focus()
        return;
    }
	
	if(f.id.value==""){
        alert("아이디를 입력하세요")
        f.id.focus()
        return;
    }
	
    if(f.pass.value==""){
        alert("비밀번호를 입력하세요")
        f.pass.focus()
        return;
    }

    if(f.passcheck.value==""){
        alert("비밀번호 확인을 입력하세요")
        f.passcheck.focus()
        return;
    }
  
    alert("회원가입이 완료되었습니다.")
	
	f.submit()

})

function isValidName(name) {	//이름 유효성 확인..정규식으로
  if(name.length > 20 ){
    return false;
  }
 if(name.length <2){
	 return false;
 }
  let regx = /[^가-힣]/;
  return !regx.test(name);      // 유효하면 true반환
}


function isValidId(emailId){ 	//아이디 유효성 확인..정규식으로
	if(emailId.length < 2) {
		return 0;
	}
  let regx = /[^\w]/;
  return !regx.test(emailId);   // 유효하면 true반환
}


</script>
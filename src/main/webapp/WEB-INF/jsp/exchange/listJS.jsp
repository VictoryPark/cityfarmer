<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	/* $(document).ready(function() {
		alert("${map.pageResult.lastPage}")
	}) */

	$("button#search").click(function(){
		
		var f = document.searchForm;
		
		if(f.keyword.value == "") {
			alert("검색할 키워드를 입력해주세요.")
		} else {
			f.submit();
		}
	}) //buttonclick

</script>
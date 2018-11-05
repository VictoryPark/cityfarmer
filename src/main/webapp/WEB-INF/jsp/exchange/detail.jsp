<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Detail_Exchange</title>
<c:import url="./detailCSSJS.jsp" />
<script>
$(document).ready(function(){
	$.ajax({
		url : "<c:url value='/exchange/comment/list.cf'/>",
		type : "POST",
		data : "exno=${map.board.exNo}"
	}).done(function(list){
		if(list != null) {
			showcommentList(list);
		} //not null
	}) //done
})//document.ready
</script>

</head>
<body>
	<c:import url="../common/header.jsp" />
    <div class="top-section">
        <div class="main-image"><img id="title-img" src="<c:url value="/resources/img/exchange/exchange3_1.jpg"/>" /></div>
    </div>
    <br>
    <div class="bottom-section">
        <div id="inner">
            <table id="detail">
                <tr>
                    <th>제목</td>
                    <td colspan="5">${map.board.exTitle}
                   	<c:if test="${user.id ==map.board.writer }">
                        <span id="check">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox1 complete" 
				                   	<c:if test="${map.board.exComplete =='y'}">
				                   		checked = "checked"
				                   	</c:if>
                                > 거래완료
                            </label>
                        </span>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${map.board.writer}</td>
                    <th>작성일</th>
                    <td>${map.board.regDate}</td>
                    <th>조회수</th>
                    <td>${map.board.exViewCnt}</td>
                </tr>
                <tr id="content">
                    <td  colspan="6"><div id="boardContent">${map.board.exContent}</div></td>
                </tr>
                <!-- <tr>
                    <button type="button" class="btn btn-success list">목록</button>
                    <button type="button" class="btn btn-info update">수정</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </tr> -->
            </table>
            <div id="buttonbox">
                <button type="button" class="btn btn-success list">목록</button>
                <c:if test="${map.board.writer == user.id }">
	                <button type="button" value="${map.board.exNo}" class="btn btn-info update">수정</button>
	                <button type="button" value="${map.board.exNo}" class="btn btn-danger delete">삭제</button>
                </c:if>
            </div>
            <div id="reply">
                <div id="listreply">
                	<div id="listsummary">
                		<table id="replysummary">
                			<tr>
                				<th><span id="count">댓글 : ${map.count} </span></th>
                				<th>
                					<select class="form-control input-sm">
                					<option value="asc">등록순</option>
                					<option value="decs">최신순</option>
                					</select>
                				</th>
                			</tr>
                		</table>
                	</div>
                    <table id="reply">
                       
                    </table>
                </div>
                <form id="reply" method="POST">
                
                    <table>
                        <tr>
                            <td id="write">
                                <textarea id="writereply" 
                                        class="form-control" rows="5" name="repl"
                                        >댓글을 입력해주세요.</textarea>
                                <div id="submitbutton">
                                    <a class="btn btn-default submit" href="#" role="button">등록</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>
    </div>
	<c:import url="./detailJS.jsp" />
</body>
</html>
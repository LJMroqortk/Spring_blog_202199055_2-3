<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../includes/header.jsp" %>
<div id="Main_content">
	<div class="panel-body">
		<form id="register" method="post">
	       	<div class="form-group">
	        	<label id="texts_kr">제목</label>
	        	<input id="texts_kr" class="form-control" name="title"/>
	        </div>
	        <br>	
	       	<div class="form-group">
	            <label id="texts_kr">내용</label>
	        	<textarea id="texts_kr" class="form-control" rows="3" name="content"></textarea>
	        </div>
	        <br>
	        <div class="form-group">
	            <label>작성자</label>
	        	<input id="texts_kr" class="form-control" name="writer" readonly value="<c:out value='${client.userid}'/>">
	       	</div>
	    	<button class="btn btn-info" id="registerIn">등록하기</button>
	    	<button class="btn btn-default listBtn"><a href="/controller/boards/list">돌아가기</a></button>                             												
		</form>
	</div>
</div>
<!-- 해당 id을 찾아서 조건문에 맞으면 이벤트을 발생시켜라는 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		//변경 버튼(회원변경 기능 작동)
		$("#registerIn").click(function(){
				$("#register").attr("action", "/controller/boards/register");
				$("#register").submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp" %>

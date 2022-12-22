<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- Client Profile page -->
<div id="Main_content">
	<div class="panel-body">
		<form id="change" method="post">
	       	<div class="form-group">
	        	<label id="texts_kr">아이디</label>
	        	<input id="texts_kr" class="form-control" name="userid" readonly value="<c:out value='${client.userid}'/>"/>
	        </div>
	        <br>	
	       	<div class="form-group">
	            <label id="texts_kr">비밀번호</label>
	        	<input id="texts_kr" class="form-control" name="passwd" value="<c:out value='${client.passwd}'/>"/>
	        </div>
	        <br>
	        <div class="form-group">
	            <label>닉네임</label>
	        	<input id="texts_kr" class="form-control" name="name" value="<c:out value='${client.name}'/>">
	       	</div>
	       	<div class="form-group">
	            <label>이메일</label>
	        	<input id="texts_kr" class="form-control" name="email" value="${client.email}">
	       	</div>
	       	<div class="form-group">
	            <label>생성일</label>
	        	<input id="texts_kr" class="form-control" name="join_date" readonly value="<c:out value='${client.join_date}'/>">
	       	</div>
	    	<button class="btn btn-default listBtn" id="changeIn">프로필 수정</button>
	    	<button class="btn btn-default listBtn" id="deleteIn">계정탈퇴</button>
	    	<button class="btn btn-default listBtn"><a href="/controller/boards/list">돌아가기</a></button>                             												
		</form>
	</div>
</div>
<!-- 해당 id을 찾아서 조건문에 맞으면 이벤트을 발생시켜라는 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		//변경 버튼(회원변경 기능 작동)
		$("#changeIn").click(function(){
				$("#change").attr("action", "/controller/boards/change");
				$("#change").submit();
		});
		//삭제 버튼(회원탈퇴 기능 작동)
		$("#deleteIn").click(function(){
			$("#change").attr("action", "/controller/boards/removes");
			$("#change").submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp" %>

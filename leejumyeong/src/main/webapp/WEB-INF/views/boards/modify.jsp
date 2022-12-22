<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../includes/header.jsp" %>
<!-- board modify page  -->
<div id="Main_content">
	<div class="panel-body">
		<form>
	       	<div class="form-group">
	        	<label id="texts_kr">제목</label>
	        	<input id="texts_kr" class="form-control" name="title" value="<c:out value='${board.title}'/>">
	        </div>
	        <br>	
	       	<div class="form-group">
	            <label id="texts_kr">내용</label>
	        	<textarea id="texts_kr" class="form-control" rows="3" name="content" ><c:out value='${board.content}'/></textarea>
	        </div>
	        <br>
	        <div class="form-group">
	            <label>작성자</label>
	        	<input id="texts_kr" class="form-control" name="writer" readonly value="<c:out value='${board.writer}'/>">
	       	</div>
	        <button class="btn btn-default" data-oper='modify'>수정</button>
			<button class="btn btn-danger" data-oper='remove'>삭제</button>
	    	<button class="btn btn-info" data-oper='list'>돌아가기</button>	                              												
		</form>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	// 해당 form을 가져와서 그 안의 .btn을 가진 데이터 중 커스텀 속성값을 가진 데이터을 비교하여 해당 속성값이면 action 경로을 설정하여 POST 해주는 방식 
	var myform = $("form");
	
	$('.btn').click(function(e){
		
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		console.log(oper);
		
		if(oper==='list'){
			self.location = "/controller/boards/list";
		}else if(oper ==='remove'){
			myform.attr("action", "/controller/boards/remove?bno=${board.bno}").attr("method", "post");
			myform.submit();
		}else if(oper ==='modify'){
			myform.attr("action", "/controller/boards/modify?bno=${board.bno}").attr("method", "post");
			myform.submit();
		}
		
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>

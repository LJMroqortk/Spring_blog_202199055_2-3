<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../includes/header.jsp" %>
<div id="Main_content">
	<div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <div class="form-group">
                               <label id="texts_kr">제목</label>
                               <input id="texts_kr" class="form-control" name="title" readonly value="<c:out value='${board.title}'/>">
                           </div>	
                           <br>
                           <div class="form-group">
                                <textarea id="texts_kr" class="form-control" rows="3" name="content" readonly><c:out value='${board.content}'/></textarea>
                           </div>
                           <br>
                           <div class="form-group">
                               <label id="texts_kr">작성자</label>
                               <input id="texts_kr" class="form-control" name="writer" readonly value="<c:out value='${board.writer}'/>">
                           </div>
                           <form id="pageForm" action="/controller/boards/list"  method="get">
															<input type="hidden" name="pageNum" value="${cri.pageNum}">
															<input type="hidden" name="amount" value="${cri.amount}">
															<input type="hidden" name="bno" value="${board.bno}">
							</form>
                           <c:if test="${client.userid eq board.writer}">
                           <button class="btn btn-default modBtn" data-oper="modify">
                           		<a href="/controller/boards/modify?bno=<c:out value='${board.bno}'/>">수정</a>
                           </button>
                           </c:if>
                           <button class="btn btn-default listBtn"><a href="/controller/boards/list">돌아가기</a></button>
           			</div>
	</div>
</div>     
<!-- 해당 id 혹은 class을 찾아서 조건문에 맞으면 이벤트을 발생시켜라는 스크립트 -->       	                              												
			<script type="text/javascript">
				// form에 대한 위치을 찾기 위해 id로 표시한 pageForm을 pageForm 변수에 저장
				var pageForm = $("#pageForm");  
					$(".listBtn").on("click", function(e){
						e.preventDefault();
						// listBtn을 가진 클래스을 찾아 해당 태그와 input 속성값을 가진 것을 찾아 remove을 시전									
						pageForm.find("input[name='bno']").remove();
						pageForm.submit();
					});
					$(".modBtn").on("click", function(e){
						e.preventDefault();
						// modBtn을 가진 클래스을 찾아 action을 취해서 modify을 시전 									
						pageForm.attr("action", "/controller/boards/modify");
						pageForm.submit();									
					});
			</script>
<%@ include file="../includes/footer.jsp" %>

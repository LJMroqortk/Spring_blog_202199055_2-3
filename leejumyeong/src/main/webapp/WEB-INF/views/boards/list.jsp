<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../includes/header.jsp" %>
<!-- Main Content-->
		<div id="Main_content" class="table-responsive text-nowrap">
		<%@ include file="../includes/banner.jsp" %>
		  <br>
			<div style="text-align: center;">
			 <img src="../resources/assets/img/banner_3.png" style="width: 10%;height: auto;">
			 </div>
			  <table class="table table-striped">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>작성일</th>
			        <th>수정일</th>
			        <th>조회수</th>
			      </tr>
			    </thead>
			    <tbody>
			    <!-- model에서 가져온 애트리뷰트을 가져와 반복문으로 게시글 10개 정도 출력함-->
			    <c:forEach var="board" items="${list}">
			      <tr>
			        <td>${board.bno}</td>
			      	<td><a class="move" href="<c:out value='${board.bno}'/>"><c:out value='${board.title}'/></a></td>
			        <td><c:out value="${board.writer}"/></td>
			        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
			        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
			        <td>${board.count}</td>
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>
			  <!-- model로 가져온 PageDTO을 뿌려서 페이지네이션 작성-->
			  <div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.startPage-1}">Previous</a>
							</li>
						</c:if>									    
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
								<a class="page-link" href="${num}"> ${num} </a>
							</li>
						</c:forEach>	
						<c:if test="${pageMaker.next}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div><!-- end of pagination -->								
				<form id="pageForm" action="/controller/boards/list"  method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
			  </div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

	$(document).ready(function(){
		// rttr로 가져온 애트리뷰트의 데이터을 가져와 비교하고 이벤트 발생 시 Modal 창으로 어떤 걸 했는지 확인 시켜줌
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		history.replaceState({}, null, null); //브라우저 주소창에 보관하고 있는 정보 지우기
		
		function checkModal(result){
			
			if(result ===''|| history.state){ //브라우저 기록 스택의 맨위에 있는 상태값 가져오기. 상태값이 있으면 return
				return;
				
			}else if(result ==='registered'){
				$(".modal-title").html("게시글 등록");
				$(".modal-body").html("새 게시글이 등록되었습니다.");
				
			}else if(result ==='modified'){
				$(".modal-title").html("게시글 수정");
				$(".modal-body").html("게시글이 수정되었습니다.");
				
			}else if(result ==='removed'){
				$(".modal-title").html("게시글 삭제");
				$(".modal-body").html("게시글이 삭제되었습니다.");
			}
			$("#myModal").modal("show");
		}
	//page 클릭 이벤트로 이동
		var pageForm = $("#pageForm");
		
		$(".page-link").on("click", function(e){
			
			e.preventDefault(); //기본 동작 막기 : a태그의 기본동작은 이동 -> 이동을 막음
			
			var targetPage = $(this).attr("href");
			
			console.log(targetPage);
			
			pageForm.find("input[name='pageNum']").val(targetPage);
			pageForm.submit();
			
		});
		// move을 누르면 이벤트 발생하여 숨겨져 있던 bno의 값을 가져와 form으로 해당 게시글의 정밀 조회을 할 수 있는 방식
		$(".move").on("click", function(e){
			e.preventDefault();
			
			var targetBno = $(this).attr("href");
			console.log(targetBno);
			pageForm.append("<input type='hidden' name='bno' value='" + targetBno + "'>");
			pageForm.attr("action", "/controller/boards/get");
			pageForm.submit();
		});
	});
	
</script>  
<%@ include file="../includes/footer.jsp" %>

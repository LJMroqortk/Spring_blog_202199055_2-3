<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../includes/header.jsp" %>
        <!-- Main Content-->
		<div id="Main_content" class="table-responsive text-nowrap">
			<div style="text-align: center;">
			 <img src="../resources/assets/img/banner_1.png" style="width: 10%;height: auto;">
			 </div>
			  <table class="table table-striped">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>날짜</th>
			        <th>조회수</th>
			      </tr>
			    </thead>
			    <tbody>
			     <!-- model에서 가져온 애트리뷰트을 가져와 반복문으로 새 게시글을 5개 정도 출력함-->
			    <c:forEach var="listi" items="${i_list}">
			      <tr>
			        <td>${listi.bno}</td>
			      	<td><a href='<c:out value="/controller/boards/get?bno=${listi.bno}"></c:out>'>${listi.title}</a></td>
			        <td><c:out value="${listi.writer}"/></td>
			        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${listi.regdate}"/></td>
			        <td>${listi.count}</td>
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>
			 <div style="text-align: center;">
			 <img src="../resources/assets/img/banner_2.png" style="width: 10%;height: auto;">
			 </div>
			  <table class="table table-striped">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>날짜</th>
			        <th>조회수</th>
			      </tr>
			    </thead>
			    <tbody>
			     <!-- model에서 가져온 애트리뷰트을 가져와 반복문으로 조회수가 가장 높은 5개 정도 출력함-->
			       <c:forEach var="listp" items="${p_list}">
			      <tr>
			        <td>${listp.bno}</td>
			        <td><a href='<c:out value="/controller/boards/get?bno=${listp.bno}"></c:out>'>${listp.title}</a></td>
			        <td><c:out value="${listp.writer}"/></td>
			        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${listp.regdate}"/></td>
			        <td>${listp.count}</td>
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>
		</div>
         <!-- Main Content-->
        
<%@ include file="../includes/footer.jsp" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- login modal page -->
<div class="modal fade" id="modalloginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Login</h4>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="login" method="post">
      <div class="modal-body mx-3">
        <div class="md-form mb-3">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" name="userids" id="orangeForm-name" class="form-control validate" required/>
          <label data-error="wrong" data-success="right" for="orangeForm-name"></label>
        </div>
        <div class="md-form mb-3">
          <i class="fas fa-lock prefix grey-text"></i>
          <input type="password" name="passwds" id="orangeForm-pass" class="form-control validate" required/>
          <label data-error="wrong" data-success="right" for="orangeForm-pass"></label>
        </div>
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-deep-orange" id="logincheck">로그인</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- 해당 id을 찾아서 조건문에 맞으면 이벤트을 발생시켜라는 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		//로그인 버튼(로그인 기능 작동)
		$("#logincheck").click(function(){
			if($("#orangeForm-name").val() != null && $("#orangeForm-pass").val() != null ){
				$("#login").attr("action", "/controller/boards/logins");
				$("#login").submit();
			}
		});
	});
</script>
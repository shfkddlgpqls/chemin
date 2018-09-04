<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>    

<script>
	$(function(){
		$("#userId_").on('keyup',function(){
			var inputUserId=$(this).val().trim();
			if(inputUserId.length<4)
			{
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				return;
			}
</script>

<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		</style>
		<div id="enroll-container" >
		<br><br>
		<h3>회원가입</h3>
		<br><br>
			<form name="memberEnrollFrm" action="${pageContext.request.contextPath}/memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" placeholder="아이디" name="userId" id="userId_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" class="form-control" placeholder="영문, 숫자" name="password" id="password_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드확인</th>
						<td>	
							<input type="password" class="form-control" id="password2" required>
						</td>
					</tr>  
					<tr>
						<th>이름</th>
						<td>	
						<input type="text" class="form-control" name="userName" id="userName" required>
						</td>
					</tr>
					<tr>
						<th>성별 </th>
						<td>
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked>
								<label for="gender0">남</label>
								<input type="radio" class="form-check-input" name="gender" id="gender1" value="F">
								<label for="gender1">여</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>	
						<input type="#" class="form-control" name="#" id="#">
						</td>
					</tr> 
					<tr>
						<th>이메일</th>
						<td>	
							<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>	
							<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>	
							<input type="text" class="form-control" placeholder="" name="hobby" id="hobby">
						</td>
					</tr>
					
				</table>
				<input type="submit" value="가입" >
				<input type="reset" value="취소">
			</form>
		</div>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
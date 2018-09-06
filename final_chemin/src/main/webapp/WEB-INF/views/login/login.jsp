<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.chemin.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>   
<title>Bootstrap Classic Modal Login Modal Form with Avatar Icon</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
<%
	Member memberLoggedIn=(Member)session.getAttribute("memberLoggedIn");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c:cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
			}
		}
	}
%>





    body {
		font-family: 'Varela Round', sans-serif;
		background-color: #e9d6f3;
	}
    .form-control {
        box-shadow: none;
        border-color: #ddd;
    }
    .form-control:focus {
		border-color: #FB6E9D;
        box-shadow: 0 0 8px rgba(251,110,157,0.4);
	}
	.modal-login {
        color: #434343;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 1px;
		border: none;
        position: relative;
	}
	.modal-login .modal-header {
		border-bottom: none;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 22px;
        margin-bottom: -10px;
	}
    .modal-login .avatar {
        color: #fff;
		margin: 0 auto;
        text-align: center;
		width: 100px;
		height: 100px;
		border-radius: 50%;
		z-index: 9;
		background: #FB6E9D;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
    .modal-login .avatar i {
        font-size: 62px;
    }
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 1px; 
        transition: all 0.5s;
	}    
	.modal-login .hint-text {
		text-align: center;
		padding-top: 10px;
	}
	.modal-login .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
	.modal-login .btn {
		background: #FB6E9D;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #fb3c7a;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>

</head>
<body>

<!-- Modal HTML -->
	<!-- <div id="myModal" class="modal fade" > -->
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
                <div class="avatar"><i class="material-icons">&#xE7FD;</i></div>
                <!-- 엑스버튼<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/login/loginCheck.do"  method="post" >
					<div class="form-group">
						<input type="text" class="form-control" id="userId" name="userId" placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login!">
					</div>
				</form>				
				<!-- <div class="hint-text small"><a href="#">Forgot Your Password?</a></div> -->
				<input type="checkbox" class="saveId" name="saveId" checked>Remember
			</div>
		</div>
 	</div>
<!-- </div> --> 
</body>
</html>           
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
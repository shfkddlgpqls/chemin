<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set value="${pageContext.request.contextPath}" var="path"/>

<!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Free Fleuri</title>
    
    <!-- favicon -->
    <link rel="icon" href="${path }/resources/upload/icon.ico">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">


    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" >
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" type='text/css' rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Pacifico" type='text/css' rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" type='text/css' rel="stylesheet">


    <!-- Plugin CSS -->

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/base/css/main.css">
    
    <!--fileLoad에 필요한 css  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/vendor/file/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/resources/vendor/file/js/fileinput.min.js" type="text/javascript"></script>
	
	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- Sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- mall css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/fonts/themify/themify-icons.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/fonts/elegant-font/html-css/style.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/animate/animate.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/slick/slick.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/lightbox2/css/lightbox.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/noui/nouislider.min.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">

  </head>

  <body id="page-top">

<header>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger handwriteFont" href="${path }">Free Fleuri</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${path }/map/mapView.do">Map</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${path }/mall/mainMall.do">Mall</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${path }/mall/cartList.do">cart</a>
            </li>
            <li class="nav-item">
             <a class="nav-link js-scroll-trigger" href="${path}/community/communityList.do">Good Tip</a>
            </li>
            
            
            <!-- 세션에 로그인한 정보가 없으면 보여지게 -->
            <%-- <c:if test="${memberLoggedIn==null }"> --%>
                <li class="nav-item">
           		  <a class="nav-link js-scroll-trigger" href="#">Login</a>
        	    </li>      
            <%-- </c:if> --%>
            
            <%-- <c:if test="${memberLoggedIn!=null }"> --%>
               <li class="nav-item">
           		  <a class="nav-link js-scroll-trigger" href="#">MyPage</a>
        	    </li> 
        	    <li class="nav-item">
           		  <a class="nav-link js-scroll-trigger" href="#">LogOut</a>
        	    </li> 
           <%--  </c:if>
             --%>
             
             <li class="nav-item">
           		  <a class="nav-link js-scroll-trigger" href="#">Admin</a>
        	    </li> 
            
          </ul>
        </div>
      </div>
    </nav>
</header>
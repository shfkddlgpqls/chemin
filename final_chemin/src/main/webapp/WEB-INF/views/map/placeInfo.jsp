<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
 <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<c:set value="${pageContext.request.contextPath }" var="path"/>
<script>
/* font-size 자동조절 함수 */
/* $(function () {
    var autoFont = function () {
        $("h1").css('font-size', Math.max(Math.min($("h1").width() / (1.1 * 10))));
    }
    autoFont();
    $(window).resize(function () {
        autoFont();
    });
}); */
/* function fn_sweet(){
	swal({
		  title: "Good job!",
		  text: "You clicked the button!",
		  icon: "success",
		});
} */

$(function() {
    $('.carousel').each(function(){
        $(this).carousel({
            interval: false
        });
    });
})​

</script>
<style>
      .box {
        min-height: 150px;
         margin-left:auto;
  		margin-right:auto;
  		
      }

      .detail_box {
        background-color: white;
       /*  color: #efefef; */
        margin-bottom:3%;
        height:35%;
        border:solid 1px #E5E8E8;
      }
      .menu_box{
       background-color: white;
       /*  color: #efefef; */
        margin-bottom:3%;
        height:30%;
        border:solid 1px #E5E8E8;
      }

 	   .title_box{
 	   	 margin-left:auto;
  		margin-right:auto;
 	   	 background:white;
 	   	 width:70%;
 	   	 height:25%;
 	   	 position:relative; top:50px;
 	   	 box-shadow: 0px 2px 5px #BDBDBD;
 	   	 border:solid 1px #E5E8E8;
 	   }
      /*
      These are the responsive styles. Throw some breakpoints in here!
      */
     /*  .container {
        display: flex;
        flex-wrap: wrap; 
      } */

      .box {
        width: 80%;      
      }

      @media screen and (max-width: 400px) {
        .detail_box {
          color: white;
        }
      }
     
      @media screen and (min-width:800px) {
        body{
          padding: 0 2em 0 2em;
        }
      }
	h1{
	text-align: center;
    font-family:"Impact";
    font-size:95px;
    text-transform:uppercase;
    display: block;    
	}
	h5{
		text-align: center;
		 font-family:"Impact";
	    font-size:60px;
	    text-transform:uppercase;
	    display: block;   
	}
/* 	span{
		/* font-family:"Impact"; */
   /**
/* Main carousel style */
.carousel {
    width: 600px;
}

/* Indicators list style */
.article-slide .carousel-indicators {
    bottom: 0;
    left: 0;
    margin-left: 5px;
    width: 100%;
}
/* Indicators list style */
.article-slide .carousel-indicators li {
    border: medium none;
    border-radius: 0;
    float: left;
    height: 54px;
    margin-bottom: 5px;
    margin-left: 0;
    margin-right: 5px !important;
    margin-top: 0;
    width: 100px;
}
/* Indicators images style */
.article-slide .carousel-indicators img {
    border: 2px solid #FFFFFF;
    float: left;
    height: 54px;
    left: 0;
    width: 100px;
}
/* Indicators active image style */
.article-slide .carousel-indicators .active img {
    border: 2px solid #428BCA;
    opacity: 0.7;
}
}  
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid" style="background:#F3F3F3;">
<section>
<div class="container">
      <div class="title_box">
      	<h1 style="margin-top:3%;font-size:50px"><strong>용호낙지 강남점</strong></h1>
      	<h5 style="margin-top:2%;">평점 5 · 리뷰(45)</h5>
      </div>
      
      <div class="box detail_box">
       <div style="height:10%; margin-top:90px; margin-bottom:2%">
	      	<div style="margin-left:13%; float:left">
	      		<span style="font-size:20px;text-transform:uppercase;"><strong>상세정보</strong></span>
	      	</div>
	      	<div style="float:right; color:#989898;font-size:5px;margin-right:13%">
	      		<span style="font-size:15px;text-transform:uppercase;">업데이트 2018.08.27</span>
	      	</div>
      	</div>

      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<i class="fa fa-map-marker" style="font-size:20px;color:#989898;"></i>
      		<span >서울 강남구 테헤란로 119 (우)21574</span>
      		 <p>(지번) 역삼동 649-14 1층</p> 
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<i class="fa fa-clock-o" style="font-size:20px;color:#989898;"></i>
      		<span >영업시간 영업종료</span>
      		<p>매일 11:00 ~ 23:00 연중무휴</p> 
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left">
      		<i class="fa fa-phone" style="font-size:20px;color:#989898"></i>
      		<span >02-1564-5441</span>
      	</div> 
      	</div>	
      </div> 
      
      <!-- 메뉴  content -->
      <div class="box menu_box">
      	<div style="height:10%; margin-top:5%; margin-bottom:2%">
		      <div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>메뉴</strong></span>
		      </div>
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<table>
      			<tr>
	      			<th></th>
	      			<th></th>
	      			<th></th>
      			</tr>
      			<tr>
      				<td>낙곱새</td>
      				<td>&nbsp;---------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>용호전골</td>
      				<td>&nbsp;---------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>낙새</td>
      				<td>&nbsp;---------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>라면 · 우동</td>
      				<td>&nbsp;---------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      			<tr>
      				<td>사이다 · 콜라</td>
      				<td>&nbsp;---------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      		</table>
      	</div> 
      	</div>
      		
      </div> 
      
      
       <div class="box detail_box">
	       <div style="height:10%; margin-top:5%; margin-bottom:2%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>사진</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row">
	      	<div style="margin-left:15%;float:left;">
				<div class="carousel slide article-slide" id="article-photo-carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner cont-slider">

    <div class="item active">
      <img alt="" title="" src="http://placehold.it/600x400">
    </div>
    <div class="item">
      <img alt="" title="" src="http://placehold.it/600x400">
    </div>
    <div class="item">
      <img alt="" title="" src="http://placehold.it/600x400">
    </div>
    <div class="item">
      <img alt="" title="" src="http://placehold.it/600x400">
    </div>
  </div>
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
      <img alt="" src="http://placehold.it/250x180">
    </li>
    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
      <img alt="" src="http://placehold.it/250x180">
    </li>
    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
      <img alt="" src="http://placehold.it/250x180">
    </li>
    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
      <img alt="" src="http://placehold.it/250x180">
    </li>
  </ol>
</div>d
	      	</div> 
	      </div>
      </div> 
      
    </div>

</section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

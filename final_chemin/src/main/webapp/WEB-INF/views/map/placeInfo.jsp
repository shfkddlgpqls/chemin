<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<c:set value="${pageContext.request.contextPath }" var="path"/>
<script src="jquery.star-rating-svg.js"></script>
<link rel="stylesheet" type="text/css" href="star-rating-svg.css">

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
	.review_box{
		background-color: white;
       /*  color: #efefef; */
        margin-bottom:3%;
        height:45%;
        border:solid 1px #E5E8E8;
	}
	.review_sub_box{
		border:solid 1px #E5E8E8;
		  margin-left:auto;
  		margin-right:auto;
  		
  		height:70%;
	}
}

.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}
</style>

<script>

$(function(){
	  /* 1. Visualizing things on Hover - See next part for action on click */
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
	   
	    // Now highlight all the stars that's not after the current hovered star
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  
	  /* 2. Action to perform on click */
	  $('#stars li').on('click', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
	    var stars = $(this).parent().children('li.star');
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	    }
	    
	    // JUST RESPONSE (Not needed)
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
	    var msg = "";
	    if (ratingValue > 1) {
	        msg =  ratingValue;
	    }
	    else {
	        msg =ratingValue ;
	    }
	    responseMessage(msg);
	    
	  });
	  
	  
	});


	 function responseMessage(msg) {
	  $('.success-box').fadeIn(200);  
	/*    $('.success-box div.text-message').html("<span>" + msg + "</span>");   */
	 $('[name=star]').val(msg);
	 }
</script>
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
      				<td>&nbsp;--------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>용호전골</td>
      				<td>&nbsp;--------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>낙새</td>
      				<td>&nbsp;--------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>라면 · 우동</td>
      				<td>&nbsp;--------------------------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      			<tr>
      				<td>사이다 · 콜라</td>
      				<td>&nbsp;--------------------------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      		</table>
      	</div> 
      	</div>
      		
      </div> 
      
      
     <!-- 사진 내용 -->
       <div class="box detail_box">
	       <div style="height:10%; margin-top:5%; margin-bottom:2%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>사진</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row" style="width:80%;margin-left:auto;margin-right:auto;">
	      	<div style="float:left;">

    <!-- main slider carousel -->
    
        <div id="ThumbnailCarousel" class="carousel slide col-xs-12" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <div class="row">
			          <div class="col-md-3 col-sm-6"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-md-3 col-sm-6"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-md-3"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <div class="row">
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/vardagen-baleudagen-gyelyangkeob__0462815_PE608339_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/tokig-tokigeu-chaesotalsugi-hwaiteu__0095891_PE235176_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/plastis-peullaseutiseu-eol-eumteul-teokwoijeu__0092975_PE229787_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			           <div class="col-md-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/dekad-dekadeu-allamsigye-beullaeg__0110719_PE262840_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <div class="row">
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/PIAimages/0566046_PE664563_S3.JPG" alt="Image" class="img-fluid img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/fado-pado-tagsangseutaendeu-pingkeu__0606975_PE682644_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/koarp-koaleupeu-amcheeo-beiji__0522280_PE643185_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/bumerang-bumelang-osgeol-i-hwaiteu__0192382_PE347080_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
			  </div>
			  
			  <a class="carousel-control-prev "  href="#ThumbnailCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon " aria-hidden="true"></span>
			    <span class="sr-only ">Previous</span>
			  </a>
			  
			  <a class="carousel-control-next" href="#ThumbnailCarousel" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
		</div>
        	</div>
	      	</div> 
	      </div>
	      
	      
	      <!-- 평가 리뷰 -->
	      <div class="box review_box">
	       <div style="height:10%; margin-top:5%; margin-bottom:2%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>평가하기</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row">
	     
				<div class="review_sub_box" style="width:80%;margin-left:13%; float:left;">
					
					<div style="width:100%;height:20%; float:left;border-bottom:solid 1px #E5E8E8;">
						<section class='rating-widget'>
  
					  <!-- Rating Stars Box -->
					  <div class='rating-stars col'>
					    <ul id='stars'>
					      <li class='star'  title='Poor' data-value='1'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star' title='Fair' data-value='2'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star'  title='Good' data-value='3'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star'  title='Excellent' data-value='4'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star'  title='WOW!!!' data-value='5'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      
					    </ul>
						     <div class='success-box'>
						    <div class='clearfix'></div>
						    
						    <div class='text-message'></div>
						    <input type="hidden" name="star" value=""/>
						    <div class='clearfix'></div>
						  </div>
					  </div>
					  
					</section>
					</div>
				</div>		
    
	      	</div> 
	      </div>
	      
      </div> 
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

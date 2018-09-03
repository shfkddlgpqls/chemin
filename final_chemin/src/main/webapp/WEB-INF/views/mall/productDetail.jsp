<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 상세보기 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mall.css">

<section>
<div class="container single_product_container">
		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
							
									<img src="${path}/resources/base/img/banana.jpg">
								
							</div>
						</div>
					</div>
				</div>
			</div> 

			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>바나나</h2>
						<p>이 바나나는 멕시코에서 왔습니다. 배타고 왔을까요 아님 비행기타고 왔을까요. 나보다 여권 도장이 많이 찍혀있는 이 바나나는 3개입니다.</p>
					</div>
					
					<div class="product_price">₩4,000</div>
					<!-- <ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul> -->

					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span>수량</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
							<span id="quantity_value">1</span>
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
					</div>
					
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span style="margin-right:20px">공유하기</span>
							<div>
								<i class="fa fa-2x fa-instagram"  style="margin-right:10px" aria-hidden="true"></i>
								<i class="fa fa-2x fa-facebook-official"  style="margin-right:10px" aria-hidden="true"></i>
							</div>
					</div>

					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						 <div class="red_button add_to_cart_button"><a href="#">장바구니</a></div> 
						 <div class="red_button add_to_cart_button"><a href="#">바로구매</a></div> 
						 <div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>		
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<span>
		<h2>Review</h2>
		</span>
		<span>
		<h7>실제로 이 제품을 구입한 고객님들의 후기입니다.</h7>
		</span>
		<hr>
		
			<div class="table-responsive">
	   			 <table class="table">
				      <thead>
				        <tr>
				          <th>글 번호</th>
				          <th>제목</th>
				          <th>작성자(이름)</th>
				          <th>별점</th>
				          <th>등록일</th>
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				          <td>1</td>
				          <td>너무 맛있어요</td>
				          <td>원숭이</td>
				          <td>★★★★☆</td>
				          <td>2018-08-24</td>
				        </tr>
				        
				         <tr>
				          <td>2</td>
				          <td>제 입맛에는 별로네요</td>
				          <td>고릴라</td>
				          <td>★★☆☆☆</td>
				          <td>2018-08-24</td>
				        </tr>
				        
				        <tr>
				          <td>3</td>
				          <td>너무 맛있어요</td>
				          <td>원숭이</td>
				          <td>★★★★☆</td>
				          <td>2018-08-24</td>
				        </tr>
				        
				         <tr>
				          <td>4</td>
				          <td>제 입맛에는 별로네요</td>
				          <td>고릴라</td>
				          <td>★★☆☆☆</td>
				          <td>2018-08-24</td>
				        </tr>
				     </tbody>
	      
	    </table>
  </div>
</div>
	</div>
</section>



    
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
/* .scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
} */

.gallery{
  width: 100%;
  max-width: 960px;
  margin: 2rem auto;
  
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.gallery-item{
  box-shadow: 2px 2px 8px -1px #3498DB;
  width: 100%;
  height: 300px;
  background: #000;
  position: relative;
  cursor: pointer;
  overflow: hidden;
  border:0;
}

.gallery-item-image{
  position: absolute;
  width: 100%;
  height: 100%;
  z-index:20;
  -webkit-transition:all .5s ease;
  transition: all .5s ease;
  bottom:0;
  overflow: hidden;

}

.gallery-item:hover .gallery-item-image{
  bottom: 60%;
}

.gallery-item-description{
  color:black;
  font-size: .8rem;
  width: 100%;
  height: 60%;
  padding: .5rem .8rem;
  background: white;
  position: absolute;
  bottom:0;
}
</style>
<script>
function fn_modal(plaNo){
	$.ajax({
		url:"${path}/mypage/myPlaDetailList.do?",
		data:{plaNo:plaNo},
		dataType:"json",
		success:function(data)
		{
			console.log(data.attachList);
			console.log(data.menuList);
			alert
			  for(i=0; i<data.attachList.length; i++){
				 for(orImg in data.attachList[i]){
					 alert(data.attachList[i][orImg]);
				 }
				
			}  
			
			/*  if(data.trim()==false){
				alert('하하');
			 	$('[name=area]').val('하하'); 
			}  */
			
		}
	})
}
</script>
<!-- 마이페이지 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	
	<div class="mypage">
		<h2 class="text-center">마이페이지 입니당</h2>
	</div>
			
	<div class="container">
		<div class="row">
			
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myOrderList.do">주문 목록</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myBoardList.do">게시글 관리</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myShoppingCart.do">장바구니</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myWishList.do">찜 목록</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myPlaceList.do?userId=hyebeen">장소 등록 내역</a></strong>
						    </li>
						  </ul>
						  <hr>
				</div>
			</div>	
		</div>
		
		<section>
		<div class="container">
		<div class="row" style="margin-left:auto;margin-right:auto;width:100%">
		  	<div>
		  		<h3>장소 등록 내역</h3>
		  		<br>
		  	</div>		
		  	
	         <div class="row" style="margin-left:auto;margin-right:auto;width:95%">
	         	<c:forEach items="${list}" var="p">
				<div class="card shadow gallery-item" style="width:30%;margin-right:3%">
				
				  
				    <div class="gallery-item-image">
				    <img class="card-img-top scale" src="${path}/resources/upload/place/main/${p.REIMG}" alt="Card image" style="width:100%"> 
				    <%-- <img class="card-img-top" src="${path}/resources/mall/img/cake.jpg" alt="Card image" style="width:100%"> --%>
				    </div>
				    <div class="gallery-item-description">
				      <h4 class="card-title"><strong>${p.PLANAME}</strong></h4>
				      <p class="card-text" style="margin-bottom:0%">
				      	<i class="fa fa-map-marker" style="font-size:20px;color:#989898;"></i>
				      	<c:forTokens items="${p.PLAADDR}" delims="/" var="item" begin="0" end="0">
				      		${item}
				      	</c:forTokens>
				      </p>
				      <p class="card-text" style="margin-bottom:0%;margin-bottom:10%">
				      	<i class="fa fa-phone" style="font-size:20px;color:#989898;"></i>
				      	${p.PLAPHONE}
				      </p>
				      <!-- plaNo값에 해당되는 attach와 price 가격정보를 가져오기 위해 button name값에 장소번호를 넣어준다.-->
				     <button type="button" class="btn btn-primary plaBtn" onclick="fn_modal(${p.PLANO})"  data-toggle="modal" data-target="#place_modal" style="float:right">상세보기</button>
				     <c:if test="${p.PLASTATUS == 'N'}">
				     <button type="button" class="btn btn-danger"  style="float:right;margin-right:1%">승인요청중</button>  
				     </c:if>
				      <c:if test="${p.PLASTATUS == 'Y'}">
				     <button type="button" class="btn btn-success"  style="float:right;margin-right:1%">승인완료</button>  
				     </c:if>
				     <c:if test="${p.PLASTATUS == 'R'}">
				     <button type="button" class="btn btn-success"  style="float:right;margin-right:1%">승인거절</button>  
				     </c:if>
				    </div>
				</div>
				</c:forEach>
 			 </div>
		  </div>	  	
		</div> 	
		
		<!-- 리뷰하기 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="place_modal">
		    <div class="modal-dialog modal-dialog-centered modal-lg">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">상세보기</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div class="row">
		           <div class="col-md-1"></div>
		        	<div class="col-md-10">
		        	   <table style="border:1px solid black;width:100%">
		        	   	  <th></th>
		        	   	  <th></th>
		        	   	  <th></th>
		        	   	  <tr>
		        	   	  	<td>지역</td>
		        	   	  	<td>: &nbsp;&nbsp;</td>
		        	   	  	<td name="area">마포구</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>주소</td>
		        	   	  	<td>: </td>
		        	   	  	<td>서울시 논혀로 테헤란로 119</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>카테고리</td>
		        	   	  	<td>: </td>
		        	   	  	<td>식사</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>업체명</td>
		        	   	  	<td>: </td>
		        	   	  	<td>용순이네</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>전화번호</td>
		        	   	  	<td>: </td>
		        	   	  	<td>02-1548-1548</td>
		        	   	  </tr>
		        	   	    <tr>
		        	   	  	<td>영업시간</td>
		        	   	  	<td>: </td>
		        	   	  	<td>매일 00:00 ~ 01:00 연중무휴</td>
		        	   	  </tr>
		        	   </table>
		        		<!-- <p>지역 : 마포구</p>
		        		<p>주소 : 서울시 논혀로 테헤란로 119</p>
		        		<p>카테고리 : 식사</p>
		        		<p>업체명 : 용순이네</p>
		        		<p>대표 이미지</p>
		        		<p>전화번호 : 02-1548-1548</p>
		        		<p>영업시간 : 매일 00:00 ~ 01:00 연중무휴</p>
		        		<p>가격정보 : </p> -->
		        	</div>
		     		<div class="col-md-1"></div>
				  </div>
			    </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success">등록하기</button>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
		        
		      
		    </div>
		  </div>
		  </div>
		  <!-- 리뷰하기 모달 끝 -->
</section>

	<div class="text-center">
				<ul class="pagination justify-content-center" >
					<li class="page-item">
						<a href="#" class="page-link" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item active"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					
					<li class="page-item">
					<a href="#" class="page-link" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ul>
 	 	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
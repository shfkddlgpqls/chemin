<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 상세보기 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mall.css">

<!--  <script type="text/javascript">  
        $(document).ready(function(){
            $("#review tr:odd").addClass("odd");
            $("#review tr:not(.odd)").hide();
            $("#review tr:first-child").show();
            
            $("#review tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>        
 -->
 
 <script>
 
	// 상품 정보를 장바구니에 넘기기 위해서 해당 상품 정보 전달
 	function fn_goodsDetails() 
 	{

		var goodsName = $("#goodsName").text();
	    var goodsPrice = $("#goodsPrice").text(); //값을 이상하게 불러옴 
		var goodsQty =  $("#quantity_value").text();
		
		alert(goodsName);
		alert(goodsPrice);
		alert(goodsQty);
		
	}
 
	//찜 alert
	function fn_wishList() 
	{
		alert("해당 상품이 마이페이지 - 찜 목록에 정상적으로 담겼습니다. ");	
	}
	
	//문의하기 모달에 문의 유형 카테고리 값 받기
	function fn_selectbox()
	{
		 var target = $("#qna_option option:selected").val();
		 
		 if(target==1)
		{
			 $("#board_name").val("상품 문의 글입니다.");
		}
		 else if(target==2)
		{
			 $("#board_name").val("교환/환불 문의 글입니다.");
		}
		 else if(target==3)
		{
			 $("#board_name").val("반품 문의 글입니다.");
		}
		 else 
		{
			 $("#board_name").val("기타 문의 글입니다.");
		} 
	}
	
	//문의하기 비밀번호 창 띄워주기
	function fn_pwCheck() 
	{
		var userInputPw = prompt("문의 글 작성 시 입력했던 비밀번호를 적어주세요(4자리)");
	
		//만약에 그 당시 작성했던 비밀번호와 확인 작업하는 코드 필요 ▼
 
		
		
		if(userInputPw.length<4 && userInputPw.length>4)
		{
			alert("비밀번호는 4글자입니다. 다시 입력해주세요.");
			
			return;
		}	
		
		
		if(userInputPw!==1111)
		{
			alert("작성했던 비밀번호와 다릅니다. 다시 입력해주세요.");
		}	
		
		}
	

 </script>
 
 


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
					
						<h2 id="goodsName">바나나</h2>
						<p id="goodsDetails">이 바나나는 멕시코에서 왔습니다. 배타고 왔을까요 아님 비행기타고 왔을까요. 나보다 여권 도장이 많이 찍혀있는 이 바나나는 3개입니다.</p>
						
					</div>
					
					<!-- fmt tag : 원화 표시로 바꿔주기 -->
					<c:set var='price' value='8000' />

					<div id="goodsPrice" class="product_price">			
						<fmt:formatNumber value="${price }" type="currency"/>		
					</div>
					<!-- 포맷팅 끝 -->
					
					
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
						 <div class="red_button add_to_cart_button"><a href="javascript:void(0);" onclick="fn_goodsDetails(); return false;">장바구니</a></div> 
						 <div class="product_favorite d-flex flex-column align-items-center justify-content-center" onclick="fn_wishList();"></div>		
				
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	
		<div class="shadow-sm p-4 mb-4 bg-white">
		<h2>Review</h2>	
			<h7>실제로 이 제품을 구입한 고객님들의 후기입니다.</h7>
		</div>

			<div class="table-responsive">
	   			 <table id="review" class="table">
				      <thead>
				        <tr>
				          <th>글 번호</th>
				          <th>제목</th>
				          <th>작성자(이름)</th>
				          <th>별점</th>
				          <th>등록일</th>
				          <th></th>
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				          <td>1</td>
				          <td>너무 맛있어요</td>
				          <td>원숭이</td>
				          <td>

				          </td>
				          <td>2018-08-24</td>
				          <td><button type="button" class="btn btn-danger">삭제</button></td>	
				        </tr>
				 
				        
				     </tbody>
	      
		    </table>
		    </div>
		    
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
 	 	
 	 	<hr>
 	 	
 	 <div class="shadow-sm p-4 mb-4 bg-white">
		<h2>Q&A</h2>	
			<h7>상품에 대한 문의사항이 있다면 알려주세요.</h7>
		</div>
		
			<div class="table-responsive">
	   			 <table id="review" class="table">
				      <thead>
				        <tr>
				          <th>글 번호</th>
				          <th>카테고리</th>
				          <th>제목</th>
				          <th>작성자(이름)</th>				     
				          <th>등록일</th>
				           <th>답변 상태</th>
				          <th></th>
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				          <td>1</td>
				          <td>배송문의</td>
				          <td><a class="boardAtag" href="javascript:void(0);" onclick="fn_pwCheck(); return false;">너무 맛있어요!</a></td>
				          <td>원숭이</td>	        
				          <td>2018-08-24</td>
				          <td>
				          	<span class="badge badge-light">답변 대기</span>
				          	<span class="badge badge-secondary">답변 완료</span>
				          </td>
				          <td><button type="button" class="btn btn-danger">삭제</button></td>	
				        </tr>
				 
				        
				     </tbody>
				     
				     
		    </table>
		    </div>
		    
		    <div class="text-center">
		   
		    <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#question_modal" style="margin-left:90%">글 쓰기</button>
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
 	 	</div>
 	 	
 	 	
 	 	<!-- 	문의하기 비밀번호 입력창
 	 	The Modal
		  <div class="modal fade modal-sm" id="pwCheck">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        Modal Header
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        Modal body
		        <div class="modal-body">
		          Modal body..
		        </div>
		        
		        Modal footer
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>  -->
 	 	

 	   <!-- 문의하기 모달 시작 -->
		  <!-- The Modal -->
		  <div class="modal fade" id="question_modal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">문의하기</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		         	<div class="form-group row">
		      		 <div class="input-group col-6">
					      <div class="input-group-prepend">
					        <span class="input-group-text">제품 코드 </span>
					      </div>
					      <input type="text" class="form-control input-sm" placeholder="제품 코드" name="goods_code" readonly>
					  </div>
					  
					  <div class="input-group col-6">
					      <div class="input-group-prepend">
					        <span class="input-group-text">제품 이름</span>
					      </div>
					      <input type="text" class="form-control input-sm" placeholder="제품 이름" id="goods_name" name="goods_name" readonly>
					  </div>
		         </div>
		         
				<div class="row">
		         <div class="col-md-6"> 
				      <select class="form-control" id="qna_option" onchange="fn_selectbox();">
				      
				        <option value="1">상품 문의 </option>
				        <option value="2">교환/환불</option>		        
				        <option value="3">반품</option>
				        <option value="4">기타</option>
				      </select>
				      
			 
		         </div>
		     
		     <div class="col-md-6">
		         	<div class="form-group">
					 <input type="text" class="form-control" placeholder="좌측 문의유형 선택 " id="board_name" name="board_name" readonly>
					</div>
		         </div>
		         
		         </div>
		         
		         <div class="col-12">
		         	<div class="form-group">
					  <textarea class="form-control" rows="5" id="review_content" placeholder="문의 내용을 입력해주세요"></textarea>
					</div>
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
		  <!-- 문의하기 모달 끝 -->
		  

	
</section>



    
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    
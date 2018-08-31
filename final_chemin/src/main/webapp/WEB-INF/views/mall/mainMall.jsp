<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>    

    <!-- 헤더 (사진 슬라이드) -->
      <header class="slide1">
		<div class="wrap-slick1">
			<div class="slick1">
                <!-- 가구몰 -->
				<div class="item-slick1 item1-slick1" style="background-image: url(${path}/resources/mall/img/furniture.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2 class="caption1-slide1 xl-text1 t-center bo14 p-b-6 animated visible-false m-b-22" data-appear="fadeInUp">
							Furniture Mall
						</h2>

						<span class="caption2-slide1 m-text1 t-center animated visible-false m-b-33" data-appear="fadeInDown">
							New Collection 2018
						</span>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">
							<!-- Button -->
							<a href="#malllist" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4 js-scroll-trigger">
								Shopping Now
							</a>
						</div>
					</div>
				</div>
                <!-- 식료품몰 -->
				<div class="item-slick1 item2-slick1" style="background-image: url(${path}/resources/mall/img/food.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2 class="caption1-slide1 xl-text1 t-center bo14 p-b-6 animated visible-false m-b-22" data-appear="rollIn">
							Groceries Mall
						</h2>

						<span class="caption2-slide1 m-text1 t-center animated visible-false m-b-33" data-appear="lightSpeedIn">
							Fresh Food
						</span>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="slideInUp">
							<!-- Button -->
							<a href="#malllist" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4 js-scroll-trigger">
								Shopping Now
							</a>
						</div>
					</div>
				</div>
                <!-- 방범용품몰 -->
				<div class="item-slick1 item3-slick1" style="background-image: url(${path}/resources/mall/img/crime.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2 class="caption1-slide1 xl-text1 t-center bo14 p-b-6 animated visible-false m-b-22" data-appear="rotateInDownLeft">
							Crime Prevention Mall
						</h2>

						<span class="caption2-slide1 m-text1 t-center animated visible-false m-b-33" data-appear="rotateInUpRight">
							Effective
						</span>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="rotateIn">
							<!-- Button -->
							<a href="#malllist" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4 js-scroll-trigger">
								Shopping Now
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
    </header>

    <!-- mall product list -->
    <section id="malllist" class="tab_container">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                <h2 class="section-heading basicEngFont">MALL</h2>
                <hr class="hrmain my-4">
                </div>
            </div>
        </div>

        <!-- 전체 -->
        <input id="tab1" class="tabinput" type="radio" name="tabs" value="all" checked>
        <label for="tab1" style="margin-left: 10%">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/exicon.jpg">
            </div>ALL
        </label>
        <!-- 가구 -->
        <input id="tab2" class="tabinput" type="radio" name="tabs" value="fur">
        <label for="tab2">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/exicon.jpg">
            </div>가구
        </label>
        <!-- 식품 -->
        <input id="tab3" class="tabinput" type="radio" name="tabs" value="food">
        <label for="tab3">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/exicon.jpg">
            </div>식품
        </label>
        <!-- 방범 -->
        <input id="tab4" class="tabinput" type="radio" name="tabs" value="crime">
        <label for="tab4" style="margin-right: 10%">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/exicon.jpg">
            </div>방범	
        </label>

		<div class="row p-t-50 p-b-50 m-r-50" style="float: right;">
            <!-- filter 조건 -->
            <div class="flex-sb-m flex-w p-t-10">
                <div class="rs2-select2 of-hidden w-size12 m-t-5 m-b-5 m-r-10" style="width:150px">
                    <select class="selection-2" name="sorting">
                        <option selected>인기상품순</option>
                        <option>최신순</option>
                        <option>낮은가격순</option>
                        <option>높은가격순</option>
                    </select>
                </div>
                <input type="text" class="m-r-30 s-text2" placeholder="검색할 상품명" style="border:none;outline:none;border-bottom: 1px solid gray;">
            </div>

            <div class="wra-filter-bar">
                <h5 class="s-text3 p-t-10 p-b-17">
                    <span class="m-text10 p-b-17">price</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    \<span id="value-lower">10000</span> ~ \<span id="value-upper">1000000</span>
                </h5>
                <div id="filter-bar"></div>
            </div>
            
            <div class="flex-sb-m flex-w p-t-10 p-l-30">
                <div class="w-size11">
                    <button class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4">
                        search
                    </button>
                </div>
            </div>
        </div>

        <!-- 전체 클릭시! -->
        <div id="content1" class="tab-content tabdiv">
            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row">
                    
						<c:forEach items="${list }" var="m">
	                        <!-- 상품 하나 -->
	                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
	                            <!-- Block2 -->
	                            <div class="block2">
	                                <div id="furni" class="block2-img wrap-pic-w of-hidden pos-relative hov4">
	                                    <a href="${path }/mall/detail.do?no=${m.PNO }"><img src="${path}/resources/upload/productImg/${m.REIMG }" alt="IMG-PRODUCT" class="shopimg"></a>
	                                    <div class="block2-txt p-t-20">
	                                        <a href="${path }/mall/detail.do?no=${m.PNO }" class="block2-name dis-block s-text3 p-b-5 shoptext">
	                                           	${m.PNAME }
	                                        </a>
	                                    </div>
	                                </div>
	                                <span class="block2-price dis-block m-text6 p-r-5 shoptext">
	                                    <fmt:formatNumber value="${m.PRICE }" type="currency"/>
	                                </span>
	                            </div>
	                        </div>
            			</c:forEach>
            			
                    </div>
                </div>
            </div>

			<div class="row justify-content-center">
	            <div class="pagination flex-m flex-w p-t-26">
	                <a href="#" class="item-pagination flex-c-m trans-0-4"><</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">3</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">></a>
	            </div>
			</div>
        </div>

        <!-- 가구 클릭시! -->
        <div id="content2" class="tab-content tabdiv">

            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row">
                    
                        <c:forEach items="${list }" var="m">
	                        <!-- 상품 하나 -->
	                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
	                            <!-- Block2 -->
	                            <div class="block2">
	                                <div id="furni" class="block2-img wrap-pic-w of-hidden pos-relative hov4">
	                                    <a href="${path }/mall/detail.do?no=${m.PNO }"><img src="${path}/resources/upload/productImg/${m.REIMG }" alt="IMG-PRODUCT" class="shopimg"></a>
	                                    <div class="block2-txt p-t-20">
	                                        <a href="${path }/mall/detail.do?no=${m.PNO }" class="block2-name dis-block s-text3 p-b-5 shoptext">
	                                           	${m.PNAME }
	                                        </a>
	                                    </div>
	                                </div>
	                                <span class="block2-price dis-block m-text6 p-r-5 shoptext">
	                                    <fmt:formatNumber value="${m.PRICE }" type="currency"/>
	                                </span>
	                            </div>
	                        </div>
            			</c:forEach>

                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
	            <div class="pagination flex-m flex-w p-t-26">
	                <a href="#" class="item-pagination flex-c-m trans-0-4"><</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">3</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">></a>
	            </div>
			</div>

        </div>

        <!-- 식품 클릭시! -->
        <div id="content3" class="tab-content tabdiv">

            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row">
                        <!-- 상품 하나 -->
                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
                            <!-- Block2 -->
                            <div class="block2">
                                <div id="furni" class="block2-img wrap-pic-w of-hidden pos-relative hov4">
                                    <a href="#"><img src="${path}/resources/mall/img/cake.jpg" alt="IMG-PRODUCT" class="shopimg"></a>
                                    <div class="block2-txt p-t-20">
                                        <a href="product-detail.html" class="block2-name dis-block s-text3 p-b-5 shoptext">
                                            	도시락
                                        </a>
                                    </div>
                                </div>
                                <span class="block2-price dis-block m-text6 p-r-5 shoptext">
                                    200,000원
                                </span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        
            <div class="row justify-content-center">
	            <div class="pagination flex-m flex-w p-t-26">
	                <a href="#" class="item-pagination flex-c-m trans-0-4"><</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">3</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">></a>
	            </div>
			</div>

        </div>

        <!-- 방범 클릭시! -->
        <div id="content4" class="tab-content tabdiv">
            
            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row">
                        <!-- 상품 하나 -->
                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
                            <!-- Block2 -->
                            <div class="block2">
                                <div id="furni" class="block2-img wrap-pic-w of-hidden pos-relative hov4">
                                    <a href="#"><img src="${path}/resources/mall/img/room1.jpg" alt="IMG-PRODUCT" class="shopimg"></a>
                                    <div class="block2-txt p-t-20">
                                        <a href="product-detail.html" class="block2-name dis-block s-text3 p-b-5 shoptext">
                                            	방범
                                        </a>
                                    </div>
                                </div>
                                <span class="block2-price dis-block m-text6 p-r-5 shoptext">
                                    200,000원
                                </span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
	            <div class="pagination flex-m flex-w p-t-26">
	                <a href="#" class="item-pagination flex-c-m trans-0-4"><</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">3</a>
	                <a href="#" class="item-pagination flex-c-m trans-0-4">></a>
	            </div>
			</div>

        </div>

        <div id="dropDownSelect2"></div>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="<c:url value="/resources/mall/vendor/select2/select2.min.js"/>"></script>
    <script type="text/javascript">
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
    <script src="<c:url value="/resources/mall/vendor/noui/nouislider.min.js"/>"></script>
	<script type="text/javascript">
		/*[ No ui ]
	    ===========================================================*/
	    var filterBar = document.getElementById('filter-bar');

	    noUiSlider.create(filterBar, {
	        start: [ 10000, 1000000 ],
	        connect: true,
	        range: {
	            'min': 10000,
	            'max': 1000000,
	        }
	    });

	    var skipValues = [
	    document.getElementById('value-lower'),
	    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle]) ;
	    });
    </script>
    
    <script>
	   	$(document).ready(function(){
	   		// 전체 리스트 클릭시
	   		$("input:radio[name='tabs']:radio[value='all']").click(function(){
	   			var cate
	   			alert("all");
	   		});
	   		// 가구 리스트 클릭시
	   		$("input:radio[name='tabs']:radio[value='fur']").click(function(){
	   			$.ajax({
	   				type:"get",
	   				url:"mall/mainMall.do?cate="+${list.CNO}
	   			});
	   		});
	   		// 식품 리스트 클릭시
	   		$("input:radio[name='tabs']:radio[value='food']").click(function(){
	   			alert("food");
	   		});
	   		// 방범 리스트 클릭시
	   		$("input:radio[name='tabs']:radio[value='crime']").click(function(){
	   			alert("crime");
	   		});
	   	});
    </script>
    
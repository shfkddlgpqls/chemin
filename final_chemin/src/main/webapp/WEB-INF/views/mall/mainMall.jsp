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
				<div class="item-slick1 item1-slick1" style="background-image: url(${path}/resources/mall/img/furniture.jpg)">
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
        <input id="tab1" class="tabinput" type="radio" name="tabs" checked onclick="list_ck()" value="0">
        <label for="tab1" style="margin-left: 10%">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/0.PNG">
            </div>
        </label>
        <!-- 가구 -->
        <input id="tab2" class="tabinput" type="radio" name="tabs" onclick="list_ck()" value="1">
        <label for="tab2">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/1.PNG">
            </div>
        </label>
        <!-- 식품 -->
        <input id="tab3" class="tabinput" type="radio" name="tabs" onclick="list_ck()" value="2">
        <label for="tab3">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/2.PNG">
            </div>
        </label>
        <!-- 방범 -->
        <input id="tab4" class="tabinput" type="radio" name="tabs" onclick="list_ck()" value="3">
        <label for="tab4" style="margin-right: 10%">
            <div class="block1 hov-img-zoom pos-relative m-b-30">
                <img src="${path}/resources/mall/img/3.PNG">
            </div>
        </label>

		<form name="productSearchFrm">
			<div class="row p-t-50 p-b-50 m-r-50" style="float: right;">
	            <!-- filter 조건 -->
	            <div class="flex-sb-m flex-w p-t-10">
	                <div class="rs2-select2 of-hidden w-size12 m-t-5 m-b-5 m-r-10" style="width:150px">
	                    <select class="selection-2" name="sorting" id="sorting">
	                        <option value="hit" selected>인기상품순</option>
	                        <option value="new">최신순</option>
	                        <option value="low">낮은가격순</option>
	                        <option value="high">높은가격순</option>
	                    </select>
	                </div>
	                <input id="searchData" name="searchData" type="text" class="m-r-30 s-text2" placeholder="검색할 상품명" style="border:none;outline:none;border-bottom: 1px solid gray;">
	            </div>
	
	            <div class="wra-filter-bar">
	                <h5 class="s-text3 p-t-10 p-b-17">
	                    <span class="m-text10 p-b-17">price</span>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    \<span id="value-lower"></span> ~ \<span id="value-upper"></span>
	                </h5>
	                <div id="filter-bar"></div>
	            </div>
	            
	            <div class="flex-sb-m flex-w p-t-10 p-l-30">
	                <div class="w-size11">
	                    <button onclick="list_ck();return false;" class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4">
	                        search
	                    </button>
	                </div>
	            </div>
	        </div>
        </form>

        <!-- 전체 클릭시! -->
        <div id="content1" class="tab-content tabdiv">
            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row" id="p0">
                    
						<c:forEach items="${list }" var="m">
	                        <!-- 상품 하나 -->
	                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
	                            <!-- Block2 -->
	                            <div class="block2">
	                                <div class="block2-img wrap-pic-w of-hidden pos-relative hov4">
	                                    <a href="${path }/mall/detail.do?no=${m.PNO }" draggable="false"><img src="${path}/resources/upload/productImg/${m.REIMG }" alt="IMG-PRODUCT" class="shopimg" draggable="false"></a>
	                                    <div class="block2-txt p-t-20">
	                                        <a href="${path }/mall/detail.do?no=${m.PNO }" class="block2-name dis-block s-text3 p-b-5 shoptext" draggable="false">
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
	            ${pageBar }
			</div>
        </div>

        <!-- 가구 클릭시! -->
        <div id="content2" class="tab-content tabdiv">

            <div class="tab-content p-t-35">
                <div class="tab-pane fade show active" id="best-seller" role="tabpanel">
                    <div class="row" id="p1">
						<!-- ajax로 상품 출력 -->
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
                    <div class="row" id="p2">
						<!-- ajax로 상품 출력 -->
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
                    <div class="row" id="p3">
						<!-- ajax로 상품 출력 -->
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
	        start: [ 0, 1000 ],
	        connect: true,
	        range: {
	            'min': 0,
	            'max': 1000,
	        }
	    });

	    var skipValues = [
		    document.getElementById('value-lower'),
		    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle])*1000 ;
	    });
    </script>
    
    <script>    
	    function list_ck(){
	   		var cno = $('input[name="tabs"]:checked').val();
	   		var searchType = $('#sorting').val();
	   		var searchData = $('#searchData').val();
	   		var lowValue = $('#value-lower').text();
	   		var highValue = $('#value-upper').text();
	   		$.ajax({
   				type:"get",
   				url:"${path}/mall/mallList.do",
   				data:{cno:cno,searchType:searchType,searchData:searchData,lowValue:lowValue,highValue:highValue},
 				datatype:"json",
   				success:function(data){
   					var view="";
   					if(data!=null){
   						for(var i=0;i<data.length;i++){
   							view+="<div class='col-sm-6 col-md-4 col-lg-3 p-b-50'>";
   							view+="<div class='block2'>";
   							view+="<div class='block2-img wrap-pic-w of-hidden pos-relative hov4'>";
	                        view+="<a id='detail' href='${path }/mall/detail.do?no="+data[i].pno+"' draggable='false'>";
	                        view+="<img src='${path}/resources/upload/productImg/"+data[i].reImg+"' alt='IMG-PRODUCT' class='shopimg' draggable='false'>";
	                        view+="</a>";
	                        view+="<div class='block2-txt p-t-20'>";
	                        view+="<a id='detail' href='${path }/mall/detail.do?no="+data[i].pno+"' class='block2-name dis-block s-text3 p-b-5 shoptext' draggable='false'>"+data[i].pName+"</a>";
	                        view+="</div>";
	                        view+="</div>";
	                        view+="<span class='block2-price dis-block m-text6 p-r-5 shoptext'>\\"+data[i].price+"</span>";
	                        view+="</div>";
	                        view+="</div>";
   						}
   						if(cno==0) $('#p0').html(view);
   						else if(cno==1) $('#p1').html(view);
   						else if(cno==2) $('#p2').html(view);
   						else if(cno==3) $('#p3').html(view);
   					}
   					$('#searchData').val('');
   				},
   				error:function(jxhr,textStatus,error){
   					console.log("ajax 실패 : "+jxhr+" "+textStatus+" "+error);
   				}
   			});
	   	}
	    function search_ck(){
	   		var cno = $('input[name="tabs"]:checked').val();
	    }
    </script>
    
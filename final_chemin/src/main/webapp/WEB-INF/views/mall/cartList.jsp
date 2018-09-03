<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- Title Page -->
    <section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(${path}/resources/mall/img/food.jpg);">
        <h2 class="l-text2 t-center">
            Cart List
        </h2>
    </section>

    <!-- 구매할 상품 리스트 (수량은 1~20개 : mall.js에서 변경) -->
    <!-- Cart -->
	<section class="cart bgwhite p-t-70 p-b-100">
        <div class="container">
            <!-- Cart item -->
            <div class="container-table-cart pos-relative">
                <div class="wrap-table-shopping-cart bgwhite">
                    <table class="table-shopping-cart">
                        <tr class="table-head">
                            <th class="column-1"></th>
                            <th class="column-2">Product</th>
                            <th class="column-3">Price</th>
                            <th class="column-4">Quantity</th>
                            <th class="column-5"></th>
                            <th class="cloumn-6">Total</th>
                            <th class="column-7"></th>
                        </tr>

                        <tr class="table-row">
                            <td class="column-1">
                                <div class="cart-img-product b-rad-4 o-f-hidden">
                                    <img src="${path}/resources/mall/img/vase.jpg" alt="IMG-PRODUCT" draggable="false">
                                </div>
                            </td>
                            <td class="column-2">Men Tshirt</td>
                            <td class="column-3">$36.00</td>
                            <td class="column-4">
                                <div class="flex-w bo5 of-hidden w-size17">
                                    <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                        <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                    </button>

                                    <input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="1">

                                    <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                        <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </td>
                            <td class="column-5">
                                <a href="#" class="color1 flex-2">변경</a>
                            </td>
                            <td class="column-6">$36.00</td>
                            <td class="column-7">
								<a href="#" class="color1 flex-2" draggable="false"><i class="fa fa-times"></i></a>
							</td>
                        </tr>

                    </table>
                </div>
            </div>

            <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
                <div class="flex-w flex-m w-full-sm">
                    
                </div>

                <div class="size10 trans-0-4 m-t-10 m-b-10">
                    <!-- Button -->
                    <a class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" style="color:white" href="${path }/mall/mainMall.do">
                      	 쇼핑 계속하기
                    </a>
                </div>
            </div>

            <!-- Total -->
            <div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
                <h4 class="m-text26 p-b-30 p-t-15">
                   	결제 예정 금액
                </h4>

                <!--  -->
                <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                       	총 상품금액 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm">
                        $39.00
                    </span>
                </div>

                <!--  -->
                <div class="flex-w flex-sb p-t-15 p-b-20">
                    <span class="s-text18 w-size19 w-full-sm">
                       	 배송비 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm">
                        $39.00
                    </span>
                </div>

                <!--  -->
                <div class="flex-w flex-sb-m p-t-26 p-b-30 bo10">
                    <span class="m-text22 w-size19 w-full-sm">
                       	총 금액 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm">
                        $39.00
                    </span>
                </div>

                <div class="size15 trans-0-4 m-t-20">
                    <!-- Button -->
                    <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="location='orderForm.do'">
                       	전체상품주문
                    </button>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



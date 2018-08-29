<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<style>
div.main-menu{background-color:skyblue;width:100%;height:50px;}
div.sidebar{background-color:white;display: block;width: 200px;height: auto;text-align:center;margin-left:5%;float:left;}
div.com{height:1300px;width:100%;position:relative;margin-top:2%;}
table tr td a#hashTag{background-color:#F6F6F6;width:auto;overflow:auto;color:black;}
table.post{width:100%;height:40%; cellpadding:0; cellspacing:0; font-family: 'M PLUS Rounded 1c',sans-serif; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
table tr td img.post-img{height:50px;width:50px;float:left;}

</style>
<script type="text/javascript">
	$(function(){
		$(function(){
	         $(".more-list").slice(0, 2).show(); // 최초 10개 선택
	         $("#more-btn").click(function(e){ // Load More를 위한 클릭 이벤트e
	         e.preventDefault();
	         $(".more-list:hidden").slice(0, 14).show(); // 숨김 설정된 다음 10개를 선택하여 표시
	         
	          if($(".more-list:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
	        	  //alert();
	         } 
	         
	         });
	      });
	});
</script>
<div class="main-menu"></div>
<section>
	<div class="com"> <!-- class를 container로 바꾸면 반응형될수있음 -->
		<div class="community_list" style="position:relative; height: 1300px; visibility: visible;width:59%;margin-left:20%;">
			<div>
				 <ul class="nav">
				    <li class="nav-item">
				      <a class="nav-link" href="#top">전체보기</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="inter" href="#">인테리어</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="repair" href="#">집수리</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="security" href="#">보안</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="cook" href="#">1인레시피</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="cleaning" href="#">청소</a>
				    </li>
				    <button class="btn btn-outline-success" type="button" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
				 </ul>
				 
			</div>	
			<c:forEach items="${list}" var="c"> 
			<table class="post" border="1" bordercolor="#BDBDBD">
				<tr>
					<td rowspan="5" width="50%">사진</td>
					<td height="12%">
						<img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;"/>
						<p>${c.WRITER }<br>
						${c.COMMUNITYDATE}</p>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<h3>${c.TITLE }</h3><br>
					<span>${c.CONTENT }</span>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td height="12%">
					<c:forTokens items="${c.HASHTAG }" delims="," var="ht">
						&nbsp<a id="hashTag" href="#hashTag">${ht }</a>&nbsp
					</c:forTokens>
					</td>
				</tr>
				<tr>
					<td height="15%">
						<img class="post-img" src="${path }/resources/community/image/comment_icon.JPG"/>
						<img class="post-img" src="${path }/resources/community/image/good_icon.JPG"/>
						<p class="post-thenumber" style="font-size:12px;padding-left:86%;">좋아요 몇개</p><br>
					</td>
				</tr>
			</table><br><br>
		</c:forEach> 
		<div class="row" style="text-align:center;">
			<button id="more-btn" class="btn btn-primary btn-lg">더보기</button>
		</div> 
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
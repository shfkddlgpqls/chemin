<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,com.kh.chemin.community.model.vo.Attachment'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>  
<style>
table tr td img#list_icon{top:1.6%;left:2.4%;height:30px;width:30px;}
table.post div#comList > div#inComment {width:100%;height:100px;}
</style>

<script type="text/javascript">
/* 	 $(function(){
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
	});  */
/* 이미지 클릭하면 모달창 안에 이미지 뜨기 */
$(function(){
	var modal = document.getElementById('myModal');
	var img = document.getElementById('list_pic');
	var modalImg = document.getElementById("modalImg");
	var captionText = document.getElementById("caption");
	$('#list_pic').click(function(){
	    modal.style.display = "block";
	    modalImg.src = this.src;
	    captionText.innerHTML = this.alt;
	});
	$("#close").click(function(){
		 modal.style.display = "none";
	});
});

/* 좋아요 작동안됨 */
$(function(){
	$("#heart").click(function(){
		$(this).attr("src","https://icongr.am/jam/heart-f.svg?size=30&color=red");

	});
});

/* 이미지 누르면 댓글창 뜨게 안됨 */
/* function showComment() {
	$('#viewhidden').click(function(){
		if($('#comment').is(":visible")) {
			$('#comment').slideUp();
		}
		else {
			$("#comment").slideDown();
		}
	});
} */

/* ajax 댓글 등록하기 */
 
/* function fn_comment(code) {
	$.ajax({
		type:'POST',
		url : "${path}/community/addComment.do",
		data : $("#comFrm").serialize(),
		success : function(data) {
			if(data=="success")
			{
				getCommentList(); //아래 함수임
				$("#comWrite").val("");
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
} */

/* ajax 댓글 조회하기 */

var i;
function showComment(obj) {
	var communityno=$(obj).data("no");
	$.ajax({
		type : 'GET',
		url : "${path}/community/commentList.do?community_no="+communityno,
		dataType : "json",
		success : function(data) {
			if(data.commentList.length > 0) {
				 for(var i=0;i<data.commentList.length;i++){
					$('#comList').append("<div id='inComment'><p style='margin-left:1%;'><br>"+data.commentList[i].WRITER+" "+data.commentList[i].COMMUNITYDATE+"</p><p style='background-color:#E7E7E7;border:2px solid #E7E7E7;padding:10px;border-radius:30px;margin-left:1%;'>"+data.commentList[i].CONTENT+"</p></div></div><br>");
				};   
			}
		
			else {
				alert("등록된 댓글이 없습니다.");
			}
		}
	});  
}

function moreList() {
	$.ajax({
		url : "${path}/community/communityList.do",
		type : "POST",
		dataType : "json",
		
	});
}


</script>
<div class="main-menu"></div>
<section>
		<div class="community_list" style="position:relative; height:100%; visibility: visible;width:59%;margin-left:20%;">
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
                 <input id="search" class="form-control" style="width:20%;">
                 <button class="btn"><i class="fa fa-search"></i></button>
                <button class="btn btn-outline-success" type="button" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
             </ul>
			</div>	
			<div class="container">
				<c:forEach items="${list}" var="c"> 
				<input type="hidden" id="community_no" name="community_no" value="${c.COMMUNITYNO }">
				<table class="post" border="1" bordercolor="black">
					<tr>
						<td rowspan="5" width="50%">
							<c:forEach items="${attList }" var="a">
								<c:if test="${c.COMMUNITYNO eq a.COMMUNITYNO}"> 
								   <c:forEach items="${fileCount }" var="fc">  
								   		<c:if test="${fc.COMMUNITYNO eq a.COMMUNITYNO}">
											<c:if test="${fc.COUNT > 1}">  
									  			<img src="https://icongr.am/jam/pictures.svg?size=30&color=black">
											</c:if>  
										</c:if>
									</c:forEach> 
									<c:forTokens items="${a.RENAMEDFILENAME }" delims="." var="v" varStatus="status">
										<c:if test="${status.last }">
                                              <c:choose>
                                                  <c:when test="${v eq 'mp4'}">
                                                  <video controls="controls" width="560px" height="auto">
                                                      <source class="list_pic" style="position:relative;float:left;top:0.1%;" alt="${c.TITLE }" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"/>
                                                  </video>
                                                  </c:when>
                                                  <c:when test="${v eq 'jpg'}">
                                                      <img class="list_pic" style="position:relative;float:left;top:0.1%;" alt="${c.TITLE }" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"> 					
                                                  </c:when>
                                              </c:choose>
										</c:if>
									</c:forTokens>
								</c:if> 
                            </c:forEach>
						</td>
						<td height="12%">
							<img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;"/>
							<p>${c.WRITER }<br>
							<fmt:formatDate value="${c.COMMUNITYDATE}" pattern="yyyy년  MM월  dd일"/></p>
						</td>
					</tr>
					<tr>
						<td rowspan="2">
							<h3>${c.TITLE }</h3><br>
						<span style="font-size:20px;color:#8C8C8C;">${c.CONTENT }</span>
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
						<td height="13%">
							<button type="button" id="showComment" class="btn btn-outline-light" data-no="${c.COMMUNITYNO }" onclick="showComment(this)">
								<img class="post-img button" src="https://icongr.am/jam/message.svg" style="height:50px;width:50px;float:left;"/>
							</button>
							<button type="button" id="like" class="btn btn-outline-light" onclick="like()">
								<img class="post-img" id="like_check" style="height:50px;width:50px;" src="https://icongr.am/jam/heart.svg?size=30">
							</buttons>
							<p class="post-thenumber" style="font-size:15px;float:right;">좋아요 ${c.LIKECOUNT}개</p><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" >
							<div id="comment" style="height:90px;width:auto;">
								<input type="text" class="form-control" id="comWrite" name="comWrite" placeholder="댓글을 입력하세요" style="width:85%;margin-top:3%;margin-left:5%;float:left;">
								<a class="btn btn-primary" onclick="writeComment()" style="float:right;margin-top:3%;margin-right:2%;">등록</a>
							</div>
							<div id="comList" style="width:90%;height:auto;margin-left:5%;margin-right:2%;margin-bottom:2%;">
							</div>
						</td>
					</tr>
				</table><br><br>	
				</c:forEach>
		
		
		<!-- plus botton -->
		<!-- <div class="row" style="text-align:center;">
			<button id="more-btn" class="btn btn-primary btn-lg" onclick="moreList()">더보기</button>
		</div>  -->
		</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
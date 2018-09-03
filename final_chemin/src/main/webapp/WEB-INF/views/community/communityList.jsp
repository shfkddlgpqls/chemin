<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<style>
body {font-family: Arial, Helvetica, sans-serif;}
div.main-menu{background-color:skyblue;width:100%;height:50px;}
div.sidebar{background-color:white;display: block;width: 200px;height: auto;text-align:center;margin-left:5%;float:left;}
div.com{height:1300px;width:100%;position:relative;margin-top:2%;}
table tr td a#hashTag{background-color:#F6F6F6;width:auto;overflow:auto;color:black;}
table.post{width:100%;height:40%; cellpadding:0; cellspacing:0; font-family: 'M PLUS Rounded 1c',sans-serif; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
table tr td img.post-img{height:50px;width:50px;float:left;}
table tr td img#myImg{position:relative;}
table tr td img#list_icon{position:absolute;top:0.4%;left:2.4%;height:30px;width:30px;}
#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}
</style>




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
                <button class="btn btn-outline-success" type="button" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
             </ul>
             
         </div>   
         <div class="container">
            <c:forEach items="${list}" var="c"> 
            <table class="post" border="1" bordercolor="white">
               <tr>
                  <td rowspan="5" width="50%">
                    
                           <img id="myImg" alt="show" src="${path }/resources/upload/productImg/20180829_101.jpg">  
                   <%--   <c:forEach items="${attList }" var="a">
                        <c:if test="${c.COMMUNITYNO eq a.COMMUNITYNO }">
                          <img id="list_icon" src="${path }/resources/upload/productImg/20180829_101.jpg">
                        </c:if>
                     </c:forEach> --%>
                  </td>
                  <td height="12%">
                     <img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;"/>
                     <p>${c.WRITER }<br>
                     ${c.COMMUNITYDATE}</p>
                  </td>
               </tr>
               <tr>
                  <td rowspan="2">
                     <h3>${c.TITLE }</h3><br>
                  <span style="font-size:20px;">${c.CONTENT }</span>
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
         
      </div>
       <div id="myModal" class="modal">
              <span class="close">&times;</span> 
              <img class="modal-content" id="img01">
              <div id="caption"></div>
         </div>
      <div class="row" style="text-align:center;">
         <button id="more-btn" class="btn btn-primary btn-lg">더보기</button>
      </div> 
      </div>
</section>

<!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>


</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	div.background{background-color:white;height:1100px;width:100%;}
	section.com{height:100%;width:70%;margin-left:15%;position:relative;}
	form#insertFrm{height:5%;width:80%;margin-left:13%;}

</style>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<!-- 스마트 에디터 -->
<script type="text/javascript" src="${path}/resources/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
function fn_tag() {
		var tag=$('#tag').val().trim();
		var arr = str.split(",");
		if(arr.length()>6)
		{
			alert("태그는 5개까지 입력 가능합니다!");
			/* swal("태그는 5개까지 입력 가능합니다!"); */
			$('#tag').focus();
			return false;
		}
		
	return arr;
}
</script>
<div class="background">
	<section class="com">
		<h1 style="font-family:'Do Hyeon', sans-serif;margin-left:10%;">꿀팁 커뮤니티</h1><br><br>
			<form action="${path} /community/communityWriteEnd.do" name="insertFrm" id="insertFrm" onsubmit="return fn_tag();" method="post">
				<div class="row">
				<select class="col-md-2" name="category"> 
						<option value="inter">인테리어</option>
						<option value="repair">집수리 </option>
						<option value="security">보안 </option>
						<option value="cook">1인 레시피 </option>
						<option value="cleaning">청소 </option>
					</select>
					<input class="col-md-9" type="text" class="form-control" name="ir1_title" id="ir1_title" required>
					<textarea class="col-md-9" name="ir1" id="ir1" rows="3" cols="100" style="width:1000px;" required>@@</textarea>
				</div><br>
				<div class="row">
				<label class="col-md-2" for="text">태그달기</label>
  				<input class="col-md-9" type="text" placeholder="태그와 태그 사이에 쉼표(,)로 구분하여 최대 5까지 입력할수있습니다." name="tag" id="tag">
  				</div><br>
				<button type="submit" class="btn btn-success" id="insertBtn" name="insertBtn">저장</button>
				<button type="button" class="btn btn-basic" id="cancel">취소</button><br><br>
			</form>

	</div>
</div>

<script type="text/javascript">
var editor_oject = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: editor_oject,
          elPlaceHolder: "ir1", 
          sSkinURI: "${path}/resources/naver_editor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부
              bUseToolbar : true,            
              // 입력창 크기 조절바 사용 여부
              bUseVerticalResizer : false,    
              // 모드 탭(Editor | HTML | TEXT) 사용 여부
              bUseModeChanger : true,
          }
      }); 
          $("#insertBtn").click(function(){
             
             editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
             $("#insertFrm").submit();
         });    
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
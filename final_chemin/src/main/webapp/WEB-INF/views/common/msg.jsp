<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<<<<<<< HEAD
<c:set var="path" value="<%=request.getContextPath()%>"/>
=======
<c:set value="${pageContext.request.contextPath }" var="path"/>
>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/chemin.git
<script>
	alert("${msg}");
	location.href="${path}${loc}";
</script>
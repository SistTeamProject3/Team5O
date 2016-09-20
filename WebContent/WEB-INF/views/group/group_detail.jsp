<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
$(document).ready(function(){
	 $("#writer").hide();
  
    $("#content").click(function(){
        $("#writer").show();
    });
});
</script>
</head>
<body>
<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<div style="width: 70%;">
	<jsp:include page="/WEB-INF/views/group/group_newsfeed_write.jsp"/>
  <%-- <jsp:include page="/WEB-INF/views/newsfeed/newsfeed_write.jsp"/>  --%>
</div>
<!-- 뉴스피드 들어감 -->
</div>
</body>
</html>
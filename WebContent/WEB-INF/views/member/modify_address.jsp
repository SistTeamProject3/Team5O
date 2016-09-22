<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>


</head>
<body>
	<input type="button" onclick="test()">
	
	<c:if test="${login.m_address eq null}">
		<h1>ㅎㅇㅎㅇ</h1>
	</c:if>
	<c:if test="${login.m_address ne null}">
		<h1>${login.m_address}</h1>
	
	</c:if>
	
	
	
	
	
	

</body>
</html>
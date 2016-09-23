<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

ul {
	list-style: none;
	margin: 0px; 
	padding: 0px;
}

#myModal {
	margin-top: 100px;
}

</style> 

<ul>
	<li><a href="event_calendar.do">달력</a></li>
	<li><a href="#" id="event_write_form" data-toggle="modal" data-target="#myModal" onclick="return false">만들기</a></li>
</ul>

<jsp:include page="../event/form_event_write.jsp" />

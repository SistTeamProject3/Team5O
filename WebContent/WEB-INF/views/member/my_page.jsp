<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>


<div class="modal fade yss">
  <div class="modal-dialog">
    <div class="modal-content">
       <jsp:include page="/WEB-INF/views/member/file_up.jsp"/>
    </div>
  </div> 
</div> 

<div style="height: 110px; border: 1px solid black ;">
	<div style="float: left;" >
		<img alt="사진없음" src="upload/${login.m_profile}"class="img-thumbnail" height="150px" width="150px" data-toggle="modal" data-target=".yss" >
	</div>
	<div style="float: left;">
		${login.m_nickname }
	</div>
	
</div>
	<table>
		<tr><td><a href="time_line.do">타임라인&nbsp;&nbsp;&nbsp;</a></td><td><a href="my_page.do">정보&nbsp;&nbsp;&nbsp;</a></td><td><a href="">친구&nbsp;&nbsp;&nbsp;</a></td></tr>
		
	</table>
<br>
</body>
</html>
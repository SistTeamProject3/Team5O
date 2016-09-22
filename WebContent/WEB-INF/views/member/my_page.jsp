<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<body>

<div style="height: 100px; border: 1px solid black ;">
	<div style="border: 1px; background-color: blue; width: 100px; height: 100px; float: left;" >
		사진영역
	</div>
	<div style="border:1px; background-color:red; float: left;">
		이름
	</div>
</div>
	<table border="1">
		<tr><td>타임라인</td><td>정보</td><td>친구</td><td>사진</td></tr>
		
	</table>
	<br>
<div style="background-color: yellow;">
	<h2>정보</h2>
</div>
<div>
	<div style="float: left; width: 30%;">
		<table>
			<tr><td>개요</td></tr>
			<tr><td><input type="button" id="academic2" value="경력 및 학력"> </td></tr>
			<tr><td><input type="button" id="address2" value="거주했던장소"></td></tr>
			<tr><td><input type="button" id="information2" value="연락처 및 기본 정보"> </td></tr>
			<tr><td><input type="button" id="marriage2" value="가족 및 결혼/연애 상태"> </td></tr>
			<tr><td><input type="button" id="content2" value="자세한 내 소개"> </td></tr>
		</table>
	</div>
	<div style="float: left; width: 70%;">
		
		<div id="_address2"><jsp:include page='modify_address.jsp' flush='false' /></div>
		<div id="_academic2"><jsp:include page='modify_academic.jsp' flush='false' /></div>
		<div id="_content2"><jsp:include page='modify_content.jsp' flush='false' /></div>
		<div id="_information2"><jsp:include page='modify_information.jsp' flush='false' /></div>
		<div id="_marriage2"><jsp:include page='modify_marriage.jsp' flush='false' /></div>
	</div>

</div>



<script type="text/javascript">
/* $('#_address').hide(); */
$('#_academic2').hide();
$('#_content2').hide();
$('#_information2').hide();
$('#_marriage2').hide();


$('#address2').click(function() {
	$('#_address2').show();
	$('#_academic2').hide();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').hide();
});
$('#academic2').click(function() {
	$('#_address2').hide();
	$('#_academic2').show();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').hide();
});
$('#information2').click(function() {
	$('#_address').hide();
	$('#_academic').hide();
	$('#_content').hide();
	$('#_information').show();
	$('#_marriage').hide();
});
$('#marriage2').click(function() {

	$('#_address2').hide();
	$('#_academic2').hide();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').show();
});
$('#content2').click(function() {
	$('#_address2').hide();
	$('#_academic2').hide();
	$('#_content2').show();
	$('#_information2').hide();
	$('#_marriage2').hide();
});

</script>


</body>
</html>
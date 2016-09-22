<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Faceboot - A Facebook style template for Bootstrap</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/jquery-ui.css"/>
		
		<link href="css/styles.css" rel="stylesheet">
		
<title>Insert title here</title>
</head>
<body>

 	

 	<form id="_frmForm">
	<div>
	<i class="fa fa-envira" aria-hidden="true"></i>
	
	<table>
	<tr>
		<td>이메일 또는 휴대폰</td>
		<td>비밀번호</td>
		
	</tr>
	<tr>
		<td><input class="form-control" type="text" name="m_id" id="_id" size="20"></td>
		<td><input class="form-control" type="password" name="m_password" id="_pwd"size="20"></td>
		<td><a href="#none" id="_login" class="btn btn-default" title="로그인">로그인</a>	</td>
		<td><a href="#none" id="_regi" class="btn btn-default" title="회원가입">회원가입</a></td>
	</tr>
	
	</table>
	</div>
		
	</form> 
	
<script type="text/javascript">
$("#_login").click(function(){
	if($("#_id").val() == ""){
		alert("아이디를 입력해 주십시오.");
		$("#_id").focus();
	}else if($("#_pwd").val()==""){
		alert("패스워드를 입력해 주십시오.");
		$("#_pwd").focus();
	}else{
		$("#_frmForm").attr({"target":"_self", "action":"NewsFeedList.do"}).submit();
	}
});

$("#_regi").click(function(){
	$("#_frmForm").attr({"target":"_self", "action":"regi.do"}).submit();
});
</script>
</body>




</html>
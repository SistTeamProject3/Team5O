<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>    
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


<div id="_nickname">

${login.m_nickname}
<button onclick="modify_nickname1()">수정</button>
</div>
<div id="_m_nickname">
<input type="text" id="m_nickname" maxlength="4">
<button onclick="modify_nickname()">확인</button>
<button onclick="nick_cancel()">취소</button>
</div>

<hr>

<div id="_phone">
${login.m_phone} 
<button onclick="modify_phone1()">수정</button>
</div>

<div id="_m_phone">

<select id="_m_phone1" name="m_phone1">
<option>010</option>
	<option>011</option>
	<option>016</option>
	<option>018</option>
</select>
-
<input id="_m_phone2" type="text" size="10" style="ime-mode:disabled;" onkeydown="return phoneCode(event)" maxlength="4"> 
-
<input id="_m_phone3" type="text" size="10" style="ime-mode:disabled;" onkeydown="return phoneCode(event)" maxlength="4"> 

<button id="_check_phone1" onclick="check_phone()">휴대전화 중복확인</button>
<button id="_check_phone2" onclick="modify_phone()">확인</button>
<button onclick="phone_cancel()">취소</button>
</div>

<hr>

<div id="_gender">
<c:if test="${login.m_gender eq 0}" >
	남자
</c:if>
<c:if test="${login.m_gender eq 1}">
	여자
</c:if>
<button onclick="modify_gender1()">수정</button>
</div>

<div id="_m_gender">
<input type="radio" id="m_gender1" name="m_gender_" value="0" checked="checked">남자
<input type="radio" id="m_gender2" name="m_gender_" value="1">여자
<button onclick="modify_gender()">확인</button>
<button onclick="gender_cancel()">취소</button>
</div>
<hr>



<script type="text/javascript">
$("#_m_phone").hide();
$("#_m_nickname").hide();
$("#_m_gender").hide();
$("#_file").hide();
$("#_check_phone2").hide();

var id = $("#_id").val();


function modify_phone1(){
	$("#_m_phone1 option").not(":selected").attr("disabled", "");

	$("#_m_phone2").attr("readonly", false);
	$("#_m_phone3").attr("readonly", false);
	$("#_phone").hide();
	$("#_m_phone").show();
}
function modify_nickname1(){
	$("#_nickname").hide();
	$("#_m_nickname").show();
}
function modify_gender1(){
	$("#_gender").hide();
	$("#_m_gender").show();
}

function phone_cancel() {
	$("#_m_phone").hide();
	$("#_phone").show();
	
}
function nick_cancel() {
	$("#_m_nickname").hide();
	$("#_nickname").show();
}
function gender_cancel() {
	$("#_m_gender").hide();
	$("#_gender").show();
}

function modify_nickname(){
	var nick = $("#m_nickname").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_nickname.do",
	data:{"m_id":id,"m_nickname":nick},
	success:function(msg){
		$("#_nickname").html(msg.m_nickname + '<button onclick="modify_nickname1()">수정</button>');
		$("#_nickname").show();
		$("#_m_nickname").hide();
	},
	error:function(request,error){
		alert("닉 변경 실패.");
	}
})
}

function check_phone(){
	
	var phone = $("#_m_phone1").val()+$("#_m_phone2").val()+$("#_m_phone3").val();

	$.ajax({
	type:"POST",
	url:"./m_phoneAf.do",
	data:"m_phone="+phone,
	
	success:function(msg){
		alert("성공??");
		output(msg);
	},
	error:function(request,error){
		alert("폰번호 체크 실패.");
	}
})
}
function output(msg) {
	
	if(msg.message=='Sucs'){
		alert("사용할 수 없는 핸드폰 번호 입니다.");
	}else{
		alert("사용할 수 있는 핸드폰 번호 입니다.");
		$("#_m_phone1 option").not(":selected").attr("disabled", "disabled");
		$("#_m_phone2").attr("readonly", true);
		$("#_m_phone3").attr("readonly", true);
		$("#_check_phone1").hide();
		$("#_check_phone2").show();
	}
}
function modify_phone(){
	
	var phone = $("#_m_phone1").val()+$("#_m_phone2").val()+$("#_m_phone3").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_phone.do",
	data:{"m_id":id,"m_phone":phone},
	
	success:function(msg){
		$("#_phone").html(msg.m_phone + '<button onclick="modify_phone1()">수정</button>');
		$("#_phone").show();
		$("#_m_phone").hide();
		$("#_check_phone1").show();
		$("#_check_phone2").hide();
		alert("폰번호 변경 성공!.");	
	},
	error:function(request,error){
		alert("폰번호 변경 실패!.");
	}
})
}

function modify_gender(){
	var gender = $(":input:radio[name='m_gender_']:checked").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_gender.do",
	data:{"m_id":id,"m_gender":gender},
	success:function(msg){
		var ged = "";
		switch (msg.m_gender) {
	      case 0    : ged = "남자";
	                   break;
	      case 1   : ged = "여자"
	                   break;
	    }
		
		$("#_gender").html(ged + '<button onclick="modify_gender1()">수정</button>');
		$("#_gender").show();
		$("#_m_gender").hide();
		
	},
	error:function(request,error){
		alert("성별 변경 실패.");
	}
})
}

function modify_marriage2(){
	var id = $("#_id").val();
	var marriage = $(":input:radio[name='m_marriage']:checked").val();
	 $.ajax({
	type:"POST",
	url:"./change_m_marriage.do",
	data:{"m_id":id,"m_marriage":marriage},
	success:function(msg){
		var mar = "";
		switch (msg.m_marriage) {
	      case 0    : mar = "싱글";
	                   break;
	      case 1   : mar = "연애중"
	                   break;
	      case 2  : mar = "결혼"
	                   break;
	    }
		$("#_basics_marriage").html(mar);
		$("#_radio").hide();
		$("#_add_marriage").show();
	},
	error:function(request,error){
		alert("message.:"+request.responseText);
	}

}) 
}

</script>


</body>
</html>
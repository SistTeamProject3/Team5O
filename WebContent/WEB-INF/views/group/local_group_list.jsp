<%-- <%@page import="org.omg.CORBA.OBJ_ADAPTER"%> --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<script type="text/javascript">
var s_num1 =1;
var l_num1 =10;
var id = $("#m_id").attr("value");

	$(document).ready(function() {
		//리스트 출력 막으려고
		var i = 0;
	
		$("#top").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=top&s_num=1&l_num=10"}).submit();
		});
		$("#friends").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
		$("#local").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=local"}).submit();
		});
		$("#membership").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
	
		$("#search_local").click(function() {
				var items=[];
				$('input[name="inlineCheckbox1"]:checkbox:checked').each(function(){items.push($(this).val());});
				var tmp = items.join(',');
				 $.ajax({
					 type:"POST",
						url: "group_local_find.do?tmp="+tmp+"&l_num="+l_num1+"&s_num="+s_num1,
					 success: function(result){
						alert(result);
				    }, error: function(){
				    	alert(result);
				    }
				});
		});
	});
</script>
<div style="width: 100%;">
	<table style="width: 100%;" class="table table-striped">
		<tr>
			<td>
				<a href="#none" id="top">추천 그룹</a>
				<a href="#none" id="friends">친구의 그룹</a>
				<b><a href="#none" id="local">지역그룹</a></b>
				<a href="#none" id="membership">회원님의 그룹</a>
			</td>
			<td>
				<a href="#none" data-toggle="modal" data-target="#myModal"><img alt="그룹 생성" src="image/making_group.jpg"></a>
			</td>
		</tr>
	</table>
</div>

<table class="table table-striped" >
<tr>
<td align="center" style="width: 80px;">지역 : </td>
<td align="left" style="width: 500px;">
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local" name="inlineCheckbox1" value="1"> 서울
</label>
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local"name="inlineCheckbox1" value="2"> 경기도
</label>
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local"name="inlineCheckbox1" value="3"> 강원도
</label>
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local"name="inlineCheckbox1" value="4"> 충청도
</label>
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local" name="inlineCheckbox1" value="5"> 전라도
</label>
<label class="checkbox-inline">
  <input type="checkbox" class="chk_local" name="inlineCheckbox1" value="6"> 경상도
</label>
</td>
<td align="left">
<button class="btn btn-danger" id="search_local">검색</button>
</td>
</tr>
</table>

<form action="group_list.do" id="groupForm" method="post">
	<input type="hidden" value="1" name="s_num">
	<input type="hidden" value="10" name="l_num"> 
	<input type="hidden" value="${login.m_id }" id="m_id" name="m_id">
</from> 
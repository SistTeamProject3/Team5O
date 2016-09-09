<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<script type="text/javascript">
$(document).ready(function() {
	$("#top").click(function() {
		$("#groupForm").attr({"target":"_self","action":"group_list.do?category=top"}).submit();
	});
	$("#friends").click(function() {
		$("#groupForm").attr({"target":"_self","action":"group_list.do?category=membership"}).submit();
	});
	$("#local").click(function() {
		$("#groupForm").attr({"target":"_self","action":"group_list.do?category=membership"}).submit();
	});
	$("#membership").click(function() {
		$("#groupForm").attr({"target":"_self","action":"group_list.do?category=membership"}).submit();
	});
});
</script>

<div style="width: 100%;">
	<table style="width: 100%;">
		<tr>
			<td>
				<form action="" id="groupForm" method="post">
				<input type="hidden" value="AA" id="m_id" name="m_id">
				<b><a href="#none" id="top">추천 그룹</a></b> <a href="#none" id="friends">친구의 그룹</a> <a href="#none" id="local">지역그룹</a>
				<a href="#none" id="membership">회원님의 그룹</a></td>
				</from>
			<td>
				<button>그룹 만들기</button>
			</td>
		</tr>
	</table>
</div>

	<br>



<%@page import="org.omg.CORBA.OBJ_ADAPTER"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<%
Object snum = request.getAttribute("s_num");
int s_num = (int)snum;

Object lnum = request.getAttribute("l_num");
int l_num = (int)lnum;

System.out.println("받은 값 S"+s_num+"L"+l_num);

%>
<script type="text/javascript">
var s_num1 =1;
var l_num1 =10;
 
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
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
		$("#membership").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
	 	$(window).scroll(function() {
			var posScroll = $(window).scrollTop() + $(window).height();
			var maxHeight = $(document).height();

			if (($(window).scrollTop() == $(document).height() - $(window).height())) {
				s_num1 = s_num1+10;
				l_num1 = l_num1+10;
				
				$.ajax({
					type: 'POST',
					url: 'list.do?category=top&m_id='+'FA'+'&s_num='+s_num1+'&l_num='+l_num1,
					async: false,
					cache: false,
					timeout: 10000,
					success: function(data) {
					  	$('#bdiv').append(data); 
					},
					error: function(data) {
						alert("실패...");
					}
				}); 
			}
			
		});
 

	});
</script>
<div style="width: 100%;">
	<table style="width: 100%;">
		<tr>
			<td>
				<form action="" id="groupForm" method="post">
			 <input type="hidden" value="1" name="s_num">
				<input type="hidden" value="10" name="l_num"> 
					<input type="hidden" value="FA" id="m_id" name="m_id"> 
					<b><a href="#none" id="top">추천 그룹</a></b> 
					<a href="#none" id="friends">친구의 그룹</a>
					<a href="#none" id="local">지역그룹</a>
					<a href="#none" id="membership">회원님의 그룹</a>
			</td>
			</from>
			<td>
				<button>그룹 만들기</button>
			</td>
		</tr>
	</table>
</div>
<div>
<jsp:include page="list_table.jsp"/>
	<c:if test="${re_list.size() == 0 }">
		<table>
			<tr>
				<td><h4>추천 그룹이 없습니다.</h4></td>
			</tr>
		</table>
	</c:if>
</div>


<div id="bdiv">

</div>



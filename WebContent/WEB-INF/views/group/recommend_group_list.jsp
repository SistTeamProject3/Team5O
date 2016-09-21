<%@page import="org.omg.CORBA.OBJ_ADAPTER"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	$(document).ready(function() {
		var s_num ="";
		var l_num ="";
		
		//리스트 출력 막으려고
		var i = 0;
		$("#top").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=top"}).submit();
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
		
	
			if ( posScroll > (maxHeight - 100) ) {
				s_num = <%=s_num%>;
				l_num = <%=l_num%>;
				
				$.ajax({
					type: 'POST',
					url: 'group_list.do?category=top&m_id='+'FA'+'&s_num='+s_num+'&l_num='+l_num,
					success: function(data) {
						var str = "<tr>";
						str += "<c:forEach items='${re_list }' var='list' varStatus='i'>";
						str += "<td style='width: 50%; height: 250px;'>";
						str += "<div style='width: 100%; height: 100%;'><table style='width: 100%; height: 100%;'>";	
						str += "<tr>";
						str += "<c:if test='${!empty list.g_photo }'><td style='height:80%; width: 100%;' colspan='2'><img style='width: 99%; max-height: 200px; margin: 2px;' alt='그룹 이미지' src='upload/${list.g_photo }'></td></c:if>";
						str += "<c:if test='${empty list.g_photo}'></c:if>";
						str += "</tr><td style='height:80%; width: 100%;' colspan='2'><img style='width: 99%; max-height: 200px; margin: 2px;' alt='그룹 이미지' src='image/g_img_basic.jpg'></td><tr>";
						str += "<td style='width: 80%; height: 20%;'><a href='group_detail.do?g_seq=${list.g_seq}'>${ list.g_name}</a></td>";
						str += "<td style='width: 20%; height: 20%;'><button onclick=''>가입</button></td>";
						str += "</tr></table></div></td>";
						str += "<c:if test='${i.count%2 eq 0 }'>";
						str += "</tr><tr></c:if></c:forEach></tr>";
						$('#list_table').append(str);
					},
					error: function(data) {
						alert("실패...");
					}
				}); 
			}
			
			/* if ($(window).scrollTop() >= $(document).height()-$(window).height()-100) {
				alert("스크롤");
			} */
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
<div style="margin-left: 15%; margin-right: 15%; margin-top: 5%; margin-bottom: 5%; ">
	<c:if test="${re_list.size()>0 }">
		<table style="width: 100%;" border="1" id="list_table">
			<tr>
				<c:forEach items="${re_list }" var="list" varStatus="i">
					<td style="width: 50%; height: 250px;">
						<div style="width: 100%; height: 100%;">
							<table style="width: 100%; height: 100%;">
								<tr>
									<c:if test="${empty list.g_photo}">
									<td style="height:80%; width: 100%;" colspan="2"><img style="width: 99%; max-height: 200px; margin: 2px;" alt="그룹 이미지" src="image/g_img_basic.jpg"></td>
									</c:if>
									<c:if test="${!empty list.g_photo }">
									<td style="height:80%; width: 100%;" colspan="2"><img style="width: 99%; max-height: 200px; margin: 2px;" alt="그룹 이미지" src="upload/${list.g_photo }"></td>
									</c:if>
									
								</tr>
								<tr>
									<td style="width: 80%; height: 20%;"><a href="group_detail.do?g_seq=${list.g_seq}">${ list.g_name}</a></td>
									<td style="width: 20%; height: 20%;"><button>가입</button></td>
								</tr>
							</table>
						</div>
					</td>
				<c:if test="${i.count%2 eq 0 }">
			</tr>
			<tr>
				</c:if>

				</c:forEach>
			</tr>
		</table>
	</c:if>
	<c:if test="${re_list.size() == 0 }">
		<table>
			<tr>
				<td><h4>추천 그룹이 없습니다.</h4></td>
			</tr>
		</table>
	</c:if>
</div>


<br>



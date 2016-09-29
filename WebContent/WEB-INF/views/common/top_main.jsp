<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
<html>
<head>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">




<style>
#header_wrap div{
	 background-color: #fadfbc;
}

</style>

</head>
<body>
<div style="padding-left: 10%; padding-top: 8px; padding-bottom: 8px;">
<table style="text-align: center;">
<col width="150px;">
<col width="auto;">
<col width="auto;">
<col width="40px;">
<col width="auto;">


<tr>
	<td>
	<i class="fa fa-home fa-2x" aria-hidden="true"></i>
	</td>
<td>
	<input type="text" class="form-control" placeholder="사람 이름 또는 장소" >
</td>
<td>	
	<i class="fa fa-search fa-2x"" aria-hidden="true"></i>
</td>
<td>
	<div style="border: 2px solid;">
	<img alt="사진없음" src="upload/${login.m_profile}"class="img-thumbnail" height="50px" width="50px">
	</div>

</td>
<td>
	<c:if test="${login.m_id ne ''}">
	<a class="btn btn-default" href="my_page.do">
      	${login.m_nickname}
    </a>
	</c:if>
</td>
<td>
	<a class="btn btn-default" href="NewsFeedList2.do">홈</a>
</td>
<td>
	<a class="btn btn-default" href="#">친구찾기</a>
</td>

<td>
	
</td>
<td>
	<div class="btn-group">
	  <a class="btn btn-default dropdown-toggle"  aria-expanded="false" href="#" data-toggle="dropdown"><span class="caret"></span></a>
	  <ul class="dropdown-menu">
	    <li><a href="#">페이지 만들기</a></li>
	    <li class="divider"></li>
	    <li><a href="#">그룹 만들기</a></li>
	    <li><a href="#">새 그룹</a></li>
	    <li class="divider"></li>
	    <li><a href="#">광고 만들기</a></li>
	    <li><a href="#">ㅇㅇ에서 광고하기</a></li>
	    <li class="divider"></li>
	    <li><a href="#">활동 로그</a></li>
	    <li><a href="#">뉴스피드 기본 설정</a></li>
	    <li><a href="#">설정</a></li>
	    <li><a href="login.do">로그아웃</a></li>
	    <li class="divider"></li>
	    <li><a href="#">고객센터</a></li>
	    <li><a href="#">지원 관련 메시지함</a></li>
	    <li><a href="#">문제 신고</a></li>
	    <li class="divider"></li>
	  </ul>
	</div>
</td>
</tr>
</table>
</div>


<!-- <script type="text/javascript">
function logout() {
	alert("로그아웃");
	location.href="login.do";
}

</script> -->


</body>
</html>



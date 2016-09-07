<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	 $("#writer").hide();
  
    $("#content").click(function(){
        $("#writer").show();
    });
});
</script>
</head>
<body>
<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>

<div style="border: 1px solid black; width: 60%;">
	<!-- 글 쓰기 시작-->
	<table>
	<tr>
	<td><button>게시물 작성</button></td>
	<td><button>사진/동영상 추가</button></td>
	<td><button>설문 만들기</button></td>
	<td><button>더보기</button></td>
	</tr>
	<tr>
	<td>
		<img src="사진" alt="사진">
	</td>
		<td colspan="3">
		<textarea cols="30" rows="2" placeholder="글 쓰기..."id="content"></textarea>
		</td>
	</tr>
	<tr id="writer">
	<td colspan="3">
	<div>
		<button>사진</button>
		<button>태그</button>
		<button>기분</button>
		<button>장소</button>
	</div>
	</td>
	<td>
	<div>
		그룹명 
		<button>올리기</button>
	</div>
	</td>
	</tr>
	</table>
	<!-- 글 쓰기 종료 -->
</div>
</div>
</body>
</html>
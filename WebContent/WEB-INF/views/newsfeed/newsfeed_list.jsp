<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
</head>
<body> 

<c:if test="${news.n_seq ne NULL }">

${news.n_seq }
<div class="table" data-seq="${news.n_seq }">
<table class="newsfeed_list_table${news.n_seq }" style="width: 80%"   border="1px solid black">

<tr>
		<td width=80px; rowspan="2">프사사진</td>
		<td align=left>작성자 : ${news.m_id}</td>
		<td>
			<div class="dropdown">
		   		 <button type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu">
					    <li value="1">삭제</li>
					    <li value="2">수정</li>
					  </ul>
		 </div>
		</td>
</tr>
<tr>
		<td align=left>작성시간 : ${news.n_wdate}</td>
		<td>

		<div class="dropdown">
			
		   		 <button type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu">
					  	<c:choose>
							<c:when test="${news.n_show eq 1}"> 
								<li value="1">V 전체</li>
							    <li value="2">친구만</li>
							    <li value="3">나만보기</li>
						     </c:when>
							<c:when test="${news.n_show eq 2}">
								<li value="1">전체</li>
							    <li value="2">V 친구만</li>
							    <li value="3">나만보기</li>
						     </c:when>
							<c:when test="${news.n_show eq 3}">
								<li value="1">전체</li>
							    <li value="2">친구만</li>
							    <li value="3">V 나만보기</li>
						     </c:when>
						</c:choose>

					  </ul>
		 </div>
		</td>
</tr>

<tr>
	<td colspan="3"  align=left>
		<pre>${news.n_content}</pre>
					<c:if test="${news.n_tag_where ne NULL}">
				<strong>${news.n_tag_where}</strong>&nbsp;에서
			</c:if>
			
			<c:if test="${news.n_tag_friend ne NULL}">
				&nbsp;&nbsp;&nbsp;<strong>${news.n_tag_friend}</strong>&nbsp;님과 함께
			</c:if>
			
			<c:if test="${news.n_tag_feel ne NULL}">
				&nbsp;&nbsp;&nbsp;나는 지금
				<c:choose>
					<c:when test="${news.n_tag_feel eq 1}"><strong>기뻐요</strong><img src="image/happy.jpg" width="5px" height="5px"></c:when>
					<c:when test="${news.n_tag_feel eq 2}"><strong>슬퍼요</strong><img src="image/sad.jpg"></c:when>
					<c:otherwise><strong>피곤해요</strong><img src="image/tired.jpg"></c:otherwise>
				</c:choose>
			</c:if>	
		
	</td>
</tr>

<c:if test="${news.n_form_num eq 1}" >
		<tr>
			<td colspan="3"  align=left>${news.n_form_num }</td>
		</tr>
</c:if>

<tr>
	
	<td colspan="3"  align=left>
	<i class="fa fa-thumbs-o-up" id="like_btn${news.n_seq }"  aria-hidden="true" onclick="test(${news.n_seq })"  style="color: black"></i> 
	<a  id="like_btn_second${news.n_seq }"  onclick="test(${news.n_seq })" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<i class="fa fa-comment-o" aria-hidden="true" onclick="showComment(${news.n_seq })"></i> 
	<a onclick="showComment(${news.n_seq })" style="color: black">댓글달기</a>
	</td>
</tr>


<tr id="show_like_member${news.n_seq }" style="display: none">
	<td colspan="3"  align=left>
	<div id="like_member">
		좋아요 멤버 출력
	</div>
	</td>
</tr>

<tr id ="show_comment${news.n_seq }" style="display: none;">
	<td>프사사진</td>
	<td colspan="2">
	<input type="text"  style="width:100%;"/>
	</td>
</tr>


</table>
</div>
</c:if>
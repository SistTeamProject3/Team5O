<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/st.js"></script>


<h1>in_friend_search</h1>


<form name="originflist" action="">	<!-- 검색 버튼을 누르면, 기존의 table은 사라지고 검색 table 보여줌 -->
<table id="_originflist" style="width: 100%; visibility: visible;">
	<%-- <colgroup>
		<col width="25%"><col width="25%"><col width="25%"><col width="25%">
	</colgroup> --%>
	<tr>
		<td style="background: red">1</td>
		<td >2</td>
		<td >3</td>
		<td >4</td>
	</tr>
	<tr>
	<c:forEach items="${finformlist}" var="finform" varStatus="vsinform"> <!-- (수정할점0908) 이름으로 order by 해야함-->
		<c:set var="pathone" value="${imgpath }\\${finform.value.m_profile }"/>
		<%-- <c:if test="${vsinform.count%5 eq 0}"> --%>
		<c:if test="${vsinform.index%4 eq 0}">
			</tr><tr>	
		</c:if> <!-- (0906수정할거) 친구목록이 없으면 "친구가 없습니다"문구 띄우기 -->
		<td>
			<div class="row text-center">
	            <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                  <!-- (수정할거:0905)사진 크기에 따라 변하면 안됌.  -->
	                    <img src="${pathone }" alt="이미지없음" width="300px"> 
	                    <div class="caption">
	                       <h3>${finform.key }</h3>	<!-- (수정할점0908)id로 출력됨 => 이름(nickname)으로 출력해야함 -->
	                       <p>${finform.value.m_content}</p>
	                       <p>
	                       <c:forEach items="${flist}" var="f" varStatus="vs">
	                       	<c:if test="${f.f_id eq finform.value.m_id }"> 
		                       	<c:if test="${f.f_accept eq 1}">
		                       		<a href="#" class="btn btn-primary">친구 끊기</a>
		                       		<a href="#" class="btn btn-default">차단 하기</a>
		                       	</c:if> 
		                       	<c:if test="${f.f_accept eq 2}">
		                       		<a href="#" class="btn btn-primary">팔로우 끊기</a>
		                       	</c:if> 
	                       	</c:if>
	                       </p>
	                       </c:forEach>
	                    </div>
	                </div>
	            </div>
			 </div>
		 </td> 
	</c:forEach>
	</tr>
</table>
</form>

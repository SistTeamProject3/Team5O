<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- <link rel="stylesheet" href="css/ay.css"> -->	<!-- tiles를 사용하면, layouts-tiles.jsp기준으로 경로 설정하면 됌 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
function stranger(param, inpid){
	
	if($("#"+param).val()=="친구 끊기"){
		
		$.ajax({
			type:"POST",
			url:"stranger.do",
			data:{"m_id":'${login_id}', "f_id":inpid},
			success: function(response){
				$("#"+param).attr({"value":"차단 하기", "class":"btn btn-default"});		
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}else if($("#"+param).val()=="차단 하기"){
		
		$.ajax({
			type:"POST",
			url:"block.do",
			data:{"m_id":'${login_id}', "f_id":inpid},
			success: function(response){
				$("#"+param).attr({"value":"차단 완료" , "disabled":true});		
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}
	
}
</script>

<!-- 프로필사진 경로 : C:\springstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SpringSample\upload -->

<h1>know_group</h1>

<form>
<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">아는 친구 <font color="gray">( ${fn:length(knowlistinform) } 명 )</font></td>
	</tr>
	<c:if test="${fn:length(knowlistinform) eq 0}">
		<tr><td colspan="3" style="text-align: center;">아는 친구 그룹 내 인원이 없습니다</td></tr>	
	</c:if> 
	<c:forEach items="${knowlistinform }" var="knowf" varStatus="knowfS">
		<c:if test="${knowfS.count%2 eq 0}">
			<tr class="info">
		</c:if>
		<c:if test="${knowfS.count%2 eq 1}">
			<tr>
		</c:if>
		<c:set var="pathone" value="${imgpath }\\${knowf.m_profile }"/>
		<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
		<td style="text-align: left; vertical-align: middle;">
			<p>${knowf.m_nickname }</p>
			<c:forEach items="${fstotalnum }" var="fstn" varStatus="fstnS">	
				<c:if test="${fstn.key eq knowf.m_id }">
					<p><font color="gray" size="1px">친구 ${fstn.value } 명</font></p>
				</c:if>
			</c:forEach>
		</td> 
		<td style="text-align: center; vertical-align: middle;">
		<c:forEach items="${knowlist }" var="knowl" varStatus="knowlS">
			<c:if test="${knowf.m_id eq knowl.f_id }">
				<c:if test="${knowl.f_accept eq 1}">	<!-- 서로친구 -->
					<p><input type="button" id="${f.f_id }" class="btn btn-primary" value="친구 끊기" onclick="stranger(id, '${knowl.f_id}')"></p>
				</c:if>
				<c:if test="${knowl.f_accept eq 2}">	<!-- follow친구 -->	
					<a href="#" class="btn btn-primary">팔로우 끊기</a>
				</c:if>
			</c:if>
		</c:forEach>
		</td>
		</tr>
	</c:forEach>
	
</table>
</form>
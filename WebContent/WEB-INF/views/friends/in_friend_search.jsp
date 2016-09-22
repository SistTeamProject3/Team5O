<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- 넘겨받은 리스트 길이구하는데 사용 -->
<fmt:requestEncoding value="utf-8"/>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/st.js"></script>

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

<h1>in_friend_search</h1>


<form name="originflist" action="">	<!-- 검색 버튼을 누르면, 기존의 table은 사라지고 검색 table 보여줌 -->
<!-- <table id="_originflist" style="width: 100%; visibility: visible;"> -->
<div class="row text-center" style="margin: 10px;">
	<c:if test="${fn:length(finformlist) eq 0}">
		<p>친구가 없습니다</p>
	</c:if>
	<c:if test="${fn:length(finformlist) ne 0}">	
		<c:forEach items="${finformlist}" var="finform" varStatus="vsinform"> <!-- (수정할점0908) 이름으로 order by 해야함-->
			<c:set var="pathone" value="${imgpath }\\${finform.value.m_profile }"/>
			<c:if test="${vsinform.index%4 eq 0}">
				<br>
			</c:if> 
	        <div class="col-sm-6 hero-feature"> <!-- 크기관련 문제부분 : 한 열에 2개 출력(col-sm-6).  한 열에 2개 출력(col-md-3).-->
	            <div class="thumbnail">
	              <!-- (수정할거:0905)사진 크기에 따라 변하면 안됌.  -->
			<img src="${pathone }" alt="이미지없음" width="200px"> 
			<div class="caption">
				<h3>${finform.value.m_name }</h3>	<!-- 해당 회원의 실제 친구리스트에선 'nickname'이아닌 'name'출력 -->	
				<p>${finform.value.m_content}</p>
				<p>
				<c:forEach items="${flist}" var="f" varStatus="vs">
				<c:if test="${f.f_id eq finform.value.m_id }"> 
					<%-- <c:if test="${f.f_accept eq 1}"> --%>
						<p><input type="button" id="${f.f_id }" class="btn btn-primary" value="친구 끊기" onclick="stranger(id, '${f.f_id}')"></p>
						<%-- <p><input type="button" id="bl_${f.f_id }" class="btn btn-default" value="차단 하기" onclick="block('${f.f_id}')" style="visibility: hidden;"></p> --%>
						<!-- 0922수정할거 : 친구끊기 버튼 사라지면서 나타남  -->
					<%-- </c:if> --%> 
					<%-- <c:if test="${f.f_accept eq 2}">
						<p><input type="button" id="${f.f_id }" class="btn btn-primary" value="팔로우 끊기" onclick="stranger(id, '${f.f_id}')"></p>
						<!-- <a href="#" class="btn btn-primary">팔로우 끊기</a> -->
					</c:if>  --%>
				</c:if>
				</p>
				</c:forEach>
				</div>
	            </div>
	         </div>
		</c:forEach>
	</c:if>
</div>
<!-- </table> -->
</form>

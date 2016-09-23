<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<br><br><br>
<div style="width: 100%; border: 1px solid black;">
		<table style="width: 100%;" border="1">
			<c:if test="${empty requset_list}">
			<tr><td colspan="2"><h4>가입 신청이 없습니다.</h4></td></tr>
			</c:if>
			<c:if test="${!empty requset_list}">
			<tr>
				<td>
				<div style="width: 100%;">
				<table>
				<tr>
				<td style="width: 20%;"><img alt="프로필" src=""></td>
				<td style="width: 80%;">
			<%-- 	<h5><a href="#">${requset_list.m_id}</a></h5> --%>
				<%-- 	<c:if test="${requset_list.m_university ne null}">
						<h6>${requset_list.m_university}</h6>		
					</c:if>
					<c:if test="${requset_list.m_university eq null}">
						<h6>${requset_list.m_highschool}</h6>		
					</c:if>
					<c:if test="${requset_list.m_address ne null}">
						<h6>${requset_list.m_address}</h6>		
					</c:if>
					<c:if test="${requset_list.m_address eq null}">
						<h6>${requset_list.m_office}</h6>		
					</c:if> --%>
				</td>
				<td>
				<img alt="승인" src="image/yes.jpg" class="g_join_yes">
				</td>
				<td>
				<img alt="거절" src="image/no.jpg" class="g_join_no">
				</td>
				</tr>
				</table>
				</div>
				</td>
			</tr>
			</c:if>
		</table>
	</div> 
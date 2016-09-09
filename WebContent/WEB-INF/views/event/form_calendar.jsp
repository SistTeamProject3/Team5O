<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<style type="text/css">

.dayOfWeek {
	text-align: center;
}

.day {
	width: 100px; 
	padding-top: 5px;
	padding-left: 10px;
	text-align: left;
	vertical-align: top;
	border-top: 1px solid #303030;
}
</style>

<%

Calendar cal = Calendar.getInstance();

int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));

cal.set(year, month, 1);

int startDay = cal.get(Calendar.DAY_OF_WEEK);
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

pageContext.setAttribute("year", year);
pageContext.setAttribute("month", month);
pageContext.setAttribute("day", day);

pageContext.setAttribute("startDay", startDay);
pageContext.setAttribute("lastDay", lastDay);

%>
<!-- 확인용 테스트 -->
year: ${ year } &nbsp;
month: ${ month } &nbsp;
day: ${ day } &nbsp;
startDay: ${ startDay } &nbsp;
lastDay: ${ lastDay }
<!-- // 확인용 테스트 -->

<div class="event_calendar">
	<table style="width: 100%; border-collapse: separate; border-spacing: 10px; border-radius: 5px; background-color: #181818;">
		<tr>
			<td colspan="7" align="left" style="padding: 10px 0px;">
				<span><img id="_prev_month" class="prev_month" src="image/left.png" alt="이전 달"/></span>
				<span><img id="_next_month" class="next_month" src="image/right.png" alt="다음 달"/></span>
				<span>${ year }년 ${ month + 1 }월</span>
			</td>
		</tr>
		
		<tr class="active">
			<td class="dayOfWeek">월</td>
			<td class="dayOfWeek">화</td>
			<td class="dayOfWeek">수</td>
			<td class="dayOfWeek">목</td>
			<td class="dayOfWeek">금</td>
			<td class="dayOfWeek">토</td>
			<td class="dayOfWeek">일</td>
		</tr>
		
		<tr class="active" style="height: 130px;">
		
		<!-- 시작 날 이전 표시: 달력이 '월요일'부터 시작하며, 시작 요일을 제외하기 위해 '-2' 처리 -->
		<c:choose>
			<c:when test="${ startDay > 1 }">
				<c:forEach begin="1" end="${ startDay - 2 }">
					<td class="day">공백 - 이전</td>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<c:forEach begin="1" end="6">
					<td class="day">공백 - 이전</td>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<!-- // 시작 날 이전 표시 -->
		
		<!-- 시작 날 ~ 종료 날 표시 -->
		<c:forEach begin="1" end="${ lastDay }" varStatus="i">
			
			<td class="day">${ i.count }</td>
		
			<!-- 달의 마지막 날이 일요일이면 행 추가를 막기 위해 'i.count != lastDay' 조건 추가 -->
			<c:if test="${ ((i.count + startDay - 2) % 7 == 0) && i.count != lastDay }">
				</tr><tr class="active" style="height: 130px;">
			</c:if>
			
		</c:forEach>
		<!-- // 시작 날 ~ 종료 날 표시 -->
		
		<!-- 종료 날 이후 표시 -->
		<c:forEach begin="1" end="${ (7 - (startDay + lastDay - 2) % 7) % 7 }">
			<td class="day">공백 - 이후</td>
		</c:forEach>
		</tr>
		<!-- // 종료 날 이후 표시 -->
	
	</table>
	<br/><br/>
</div>
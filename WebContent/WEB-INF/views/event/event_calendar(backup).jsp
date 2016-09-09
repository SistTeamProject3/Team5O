<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!DOCTYPE>
<html>
<head>
</head>
<body>

<%

Calendar cal = Calendar.getInstance();

/* int tempYear = (Integer) request.getAttribute("year");
int tempMonth = (Integer) request.getAttribute("month");
int tempDay = (Integer) request.getAttribute("day"); */

Object tempYear = request.getAttribute("year");
Object tempMonth = request.getAttribute("month");
Object tempDay = request.getAttribute("day");

if ( tempYear != null && tempMonth != null && tempDay != null ) {
	System.out.println("tempYear: " + tempYear);
}

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int day = cal.get(Calendar.DAY_OF_MONTH);

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
	<table style="width: 100%;">
		<tr>
			<td colspan="7">
				<span><a href="#"><img src="" alt="이전 달"/></a></span>
				<span><a href="#"><img src="" alt="다음 달"/></a></span>
				<span>${ year }년 ${ month + 1 }월</span>
			</td>
		</tr>
		
		<tr>
			<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
		</tr>
		
		<tr style="height: 130px;">
		<!-- 시작 날 이전 표시: 달력이 '월요일'부터 시작하며, 시작 요일을 제외하기 위해 '-2' 처리 -->
		<c:forEach begin="1" end="${ startDay - 2 }">
			<td style="width: 100px; border: 1px solid black;">공백 - 이전</td>
		</c:forEach>
		<!-- // 시작 날 이전 표시 -->
		
		<!-- 시작 날 ~ 종료 날 표시 -->
		<c:forEach begin="1" end="${ lastDay }" varStatus="i">
			
			<td style="width: 100px; border: 1px solid black;">${ i.count }</td>
		
			<c:if test="${ (i.count + startDay - 2) % 7 == 0 }">
				</tr><tr style="height: 130px;">
			</c:if>
			
		</c:forEach>
		<!-- // 시작 날 ~ 종료 날 표시 -->
		
		<!-- 종료 날 이후 표시 -->
		<c:forEach begin="1" end="${ (7 - (startDay + lastDay - 2) % 7) % 7 }">
			<td style="width: 100px; border: 1px solid black;">공백 - 이후</td>
		</c:forEach>
		</tr>
		<!-- // 종료 날 이후 표시 -->
	
	</table>
	
	<input type="button" id="_btn_next_month" value="다음달 출력"/>
	
</div>

<div id="_event_calendar_next_month" class="event_calendar_next_month"></div>



<!-- Script -->
<script type="text/javascript">

$('#_btn_next_month').click( function() {
	
	var year = ${ year };
	var month = ${ month };
	var day = ${ day };
	alert("year: " + year + "\n" + "month: " + month + "\n" + "day: " + day);
	
	$.ajax({
		type: 'GET',
		url: 'calendar_form.do?year=' + year + '&month=' + month + "&day=" + day,
		success: function(data) {
			alert(data);
			$('#_event_calendar_next_month').append(data);
		},
		error: function(data) {
			alert("실패...");
			alert(data);
		}
	});
});

</script>

</body>
</html>
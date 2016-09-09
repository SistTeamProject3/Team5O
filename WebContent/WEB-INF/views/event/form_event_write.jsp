<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<%

Calendar cal = Calendar.getInstance();

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int day = cal.get(Calendar.DAY_OF_MONTH);

cal.set(year, month, 1);

pageContext.setAttribute("year", year);
pageContext.setAttribute("month", month);
pageContext.setAttribute("day", day);

%>

<style type="text/css">
table th {
	text-align: right;
	padding-right: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
}

td {
	text-align: left;
}

</style>

<form id="_frm_event_write" method="POST">
	<table style="width: 100%;">
	<col style="width: 20%;"/><col style="width: 80%;" />
	<tr>
		<th>이벤트 사진</th>
		<td style="border: 1px solid #505050; border-radius: 2px;">
			<span><a href="#" class="btn btn-default" style="width: 50%; float: left; border-radius: 0px;">주제 선택</a></span>
			<span><a href="#" class="btn btn-default" style="width: 50%; border-radius: 0px;">사진 업로드</a></span>
			<br/>
			<div style="margin: 10px auto; color: #909090;">추천 주제</div>
			<div id="myCarousel" class="carousel slide">
				<!-- 회전광고판 항목 -->
				<div class="carousel-inner">
					<jsp:include page="event_title_image_list.jsp"/>
				</div>
				<!-- 회전광고판 탐색 -->
				<a class="carousel-control left" href="#myCarousel" data-slide="prev" style="padding-top: 70px; font-size: 30pt;">&lsaquo;</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next" style="padding-top: 70px; font-size: 30pt;"">&rsaquo;</a>
			</div>
		</td>
	</tr>
	
	<tr>
		<th>이벤트 이름</th>
		<td>
			<input type="text" class="form-control frm_event_write" placeholder="간결하고 명확한 이름을 추가하세요" />
		</td>
	</tr>
	
	<tr>
		<th>장소</th>
		<td>
			<input type="text" class="form-control frm_event_write" placeholder="장소 또는 주소를 포함하세요" />
		</td>
	</tr>
	
	<tr>
		<th id="_event_time">날짜/시간</th>
		<td>
			<input type="text" class="form-control" style="width: 100px; margin-right: 5px; display: inline-block;" />
			<input type="text" class="form-control" style="width: 100px; display: inline-block;" />
			<div style="display: inline-block; margin-top: 6px; float: right;">
				<a href="#" id="_end_date" onclick="return false;">+ 종료 시간</a>
			</div>
		</td>
	</tr>
	
	<!-- 기본 상태: 숨김 -->
	<tr id="_date_end">
		<th>종료</th>
		<td>
			<input type="text" class="form-control" style="width: 100px; margin-right: 5px; display: inline-block;" />
			<input type="text" class="form-control" style="width: 100px; display: inline-block;" />
			<div style="display: inline-block; margin-top: 6px; float: right;">
				<a href="#" id="_end_time_delete" onclick="return false;">삭제</a>
			</div>
		</td>
	</tr>
	
	<tr>
		<th>설명</th>
		<td>
			<textarea rows="3" class="form-control" placeholder="이벤트에 대해 자세히 알려주세요"></textarea>
		</td>
	</tr>
	</table>
</form>

<!-- script -->
<script type="text/javascript">

$(document).ready(function () {
	$('#_date_end').hide();
	$('.carousel').carousel({
		interval: false
	});
});

$('#_end_date').click(function () {
	$('#_event_time').text("시작");
	$('#_end_date').hide();
	$('#_date_end').show();
});

$('#_end_time_delete').click(function () {
	$('#_event_time').text("날짜/시간");
	$('#_date_end').hide();
	$('#_end_date').show();
});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!-- 날짜/시간 달력 Plugin -->
<link rel="stylesheet" href="./css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="./js/material.min.js"></script>
<script type="text/javascript" src="./js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="./js/bootstrap-material-datetimepicker.js"></script>
<!-- // 날짜/시간 달력 Plugin -->

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

<!-- 	Modal	 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">이벤트 만들기</h4>
</div>
<div class="modal-body">
	<form id="frm_event_write" action="event_write.do" method="POST" enctype="multipart/form-data">
		<table style="width: 100%;">
		<col style="width: 20%;" /><col style="width: 80%;" />
		<tr>
			<th>이벤트 사진</th>
			<td style="border: 1px solid #505050; border-radius: 2px; height: 200px;">
				<div id="image_wrap_before">
					<span><a href="#" id="title_image_choice" class="btn btn-default" 
					style="width: 50%; float: left; border-radius: 0px;">주제 선택</a></span>
					
					<span>
						<a href="#" id="image_upload" class="btn btn-default" 
						style="width: 50%; border-radius: 0px;">사진 업로드</a>
						<!-- 파일 업로드 버튼 '찾아보기' 숨김 -->
						<input type="file" id="btn_image_upload" name="image_name" accept="image/*" />
					</span>
					<br/>
					<div id="img_slide">
						<div style="margin: 10px auto; color: #909090;">추천 주제</div>
						
						<!-- 주제 이미지 슬라이드 -->
						<div id="myCarousel" class="carousel slide">
							<!-- 이미지 리스트 -->
							<div class="carousel-inner">
								<jsp:include page="event_title_image_list.jsp" />
							</div>
							<!-- 이미지 전환(좌/우) -->
							<a class="carousel-control left" href="#myCarousel" data-slide="prev" 
							style="padding-top: 70px; font-size: 30pt;">&lsaquo;</a>
							<a class="carousel-control right" href="#myCarousel" data-slide="next" 
							style="padding-top: 70px; font-size: 30pt;">&rsaquo;</a>
						</div>
						<!-- // 주제 이미지 슬라이드 -->
					</div>
				</div>
				<div id="image_wrap_after">
					<img id="user_image" style="width: 100%; height: 200px;"/>
				</div>
			</td>
		</tr>
		
		<tr>
			<th>이벤트 이름</th>
			<td>
				<input type="text" id="event_name" name="e_title" class="form-control frm_event_write" 
				maxlength="100" placeholder="간결하고 명확한 이름을 추가하세요" />
			</td>
		</tr>
		
		<tr>
			<th>장소</th>
			<td>
				<input type="text" name="e_location" class="form-control frm_event_write" 
				maxlength="100" placeholder="장소 또는 주소를 포함하세요" />
			</td>
		</tr>
		
		<tr>
			<th id="event_date_time">날짜/시간</th>
			<td>
				<input type="text" id="start_date" class="form-control" maxlength="8" 
				placeholder="시작 날짜" style="width: 100px; margin-right: 5px; display: inline-block;" />
				
				<input type="text" id="start_time" class="form-control" maxlength="4" 
				placeholder="시작 시간" style="width: 100px; display: inline-block;" />
				
				<div style="display: inline-block; margin-top: 6px; float: right;">
					<a href="#" id="end_date_add" onclick="return false;">+ 종료 시간</a>
				</div>
			</td>
		</tr>
		
		<!-- 기본 상태: 숨김 -->
		<tr id="date_end">
			<th>종료</th>
			<td>
				<input type="text" id="end_date" class="form-control" 
				placeholder="종료 날짜" style="width: 100px; margin-right: 5px; display: inline-block;" />
				
				<input type="text" id="end_time" class="form-control" 
				placeholder="종료 시간" style="width: 100px; display: inline-block;" />
				
				<div style="display: inline-block; margin-top: 6px; float: right;">
					<a href="#" id="end_time_delete" onclick="return false;">삭제</a>
				</div>
			</td>
		</tr>
		
		<tr>
			<th>설명</th>
			<td>
				<textarea rows="3" id="e_content" name="e_content" class="form-control" 
				placeholder="이벤트에 대해 자세히 알려주세요" style="resize: none;"></textarea>
			</td>
		</tr>
		</table>
		
		<%-- <input type="hidden" name="m_name" value="${ login.m_name }" /> --%>
		<input type="hidden" name="m_name" value="login_id" />
		<input type="hidden" id="e_start_date" name="e_start_date" value="" />
		<input type="hidden" id="e_end_date" name="e_end_date" value="" />
		
	</form>
</div>
<div class="modal-footer">
	<button type="button" id="event_close" class="btn btn-default" data-dismiss="modal">닫기</button>
	<button type="button" id="event_write" class="btn btn-primary" data-dismiss="modal">이벤트 만들기</button>
</div>
</div>
</div>
</div>
<!--  // Modal	 -->

<!--		script			-->
<!--		▼ ▼ ▼ ▼			-->
<script type="text/javascript">

$(document).ready(function () {
	// 이벤트 만들기 팝업 초기 설정
	$('#event_write_form').click(function() {
		// 이벤트 제목 커서 이동
		setTimeout( function() { $('#event_name').focus(); }, 500);
		
		// 모든 입력 값 초기화
		$('#frm_event_write file').val('');
		$('#frm_event_write input').val('');
		$('#frm_event_write textarea').val('');
	});
	
	/*		기본 환경설정		*/
	$('#date_end').hide();
	$('.carousel').carousel({ interval: false });
	$('#btn_image_upload').hide();
	$('#image_wrap_after').hide();
	/* 	 // 기본 환경설정 		*/
	
	// 사진 업로드 버튼 클릭
	$('#image_upload').click(function() {
		$('#btn_image_upload').click();
	});

	// 업로드 파일 확장자 검사
	$('#btn_image_upload').change(function() {
		
		var fileName = $(this).val();
		var lastIdx = fileName.lastIndexOf('.');
		var extentionName = fileName.substring(lastIdx + 1, fileName.length);
		extentionName = extentionName.toLowerCase();
		
		if ( 
				extentionName != "jpg"
			&& 	extentionName != "jpeg"
			&& 	extentionName != "bmp"
			&& 	extentionName != "gif"
			&& 	extentionName != "png"
			) {
			
			alert("지원하지 않는 확장자 입니다." + "\n" + "※ 지원가능한 확장자(jpg, jpeg, bmp, gif, png)");
			$('#btn_image_upload').val('');
			
		} else {
			$('#img_slide').hide();
			$('#image_wrap_before').hide();
			
			// 선택한 파일의 '가상의 웹 경로' 생성
			var file = $('#btn_image_upload').prop("files")[0];
	        var fileURL = window.URL.createObjectURL(file);
			
			$('#user_image').attr('src', fileURL);
			$('#image_wrap_after').show();
		}
	});
	
	/*		날짜/시간		  */
	// 시작 날짜 클릭
	$('#start_date').bootstrapMaterialDatePicker( {
		weekStart: 0, format: 'YYYY-MM-DD', time: false
	});
	
	// 시작 시간 클릭
	$('#start_time').click(function() {
		var sDate = $('#start_date').val();
		
		if ( sDate == '' ) {
			alert("시작 날짜부터 설정해주세요.");
			$('#start_date').focus();
			
		} else {
			// 종료 시간은 시작 날짜보다 이전 날짜의 시간은 선택 불가
			$(this).bootstrapMaterialDatePicker({
				weekStart: 0, format: 'HH:mm', date: false
			}).on('change', function(e, date)	{
				$('#end_time').bootstrapMaterialDatePicker('setMinDate', date);
			});
		}
	});
	
	// 종료 날짜 클릭
	$('#end_date').click(function() {
		var sDate = $('#start_date').val();
		
		if ( sDate == '' ) {
			alert("시작 날짜부터 설정해주세요.");
			$('#start_date').focus();
			
		} else {
			// 종료 날짜는 시작 날짜보다 이전 날짜는 선택 불가
			$(this).bootstrapMaterialDatePicker({
				weekStart: 0, format: 'YYYY-MM-DD', time: false
			}).on('change', function(e, date)	{
				$('#end_date').bootstrapMaterialDatePicker('setMinDate', date);
			});
		}
	});
	
	// 종료 시간 클릭
	$('#end_time').click(function() {
		var sDate = $('#start_date').val();
		var eDate = $('#end_date').val();
		
		if ( sDate == '' || eDate == '' ) {
			alert("시작 날짜와 종료 날짜부터 설정해주세요.");
			$('#start_date').focus();
			
		} else {
			// 종료 날짜는 시작 날짜보다 이전 날짜는 선택 불가
			$(this).bootstrapMaterialDatePicker({
				weekStart: 0, format: 'YYYY-MM-DD', time: false
			}).on('change', function(e, date)	{
				$('#end_date').bootstrapMaterialDatePicker('setMinDate', date);
			});
		}
	});
/* 	
	// 종료 날짜 클릭
	$('#end_date').bootstrapMaterialDatePicker( {
		weekStart: 0, format: 'YYYY-MM-DD', time: false
	});
 */	
	// 종료 시간 클릭
	$('#end_time').bootstrapMaterialDatePicker( {
		weekStart: 0, format: 'HH:mm', date: false
	});
/* 	
	// 종료 날짜는 시작 날짜보다 이전 날짜는 선택 불가
	$('#start_date').bootstrapMaterialDatePicker().on('change', function(e, date)	{
		$('#end_date').bootstrapMaterialDatePicker('setMinDate', date);
	});
 */
/* 
	// 종료 시간은 시작 날짜보다 이전 날짜의 시간은 선택 불가
	$('#start_time').bootstrapMaterialDatePicker({
		weekStart: 0, format: 'HH:mm', date: false
	}).on('change', function(e, date)	{
		$('#end_time').bootstrapMaterialDatePicker('setMinDate', date);
	});
*/
	// 종료 시간 추가 클릭
	$('#end_date_add').click(function () {
		$('#event_date_time').text("시작");
		$('#end_date_add').hide();
		$('#date_end').show();
	});

	// 종료 시간 삭제 클릭
	$('#end_time_delete').click(function () {
		$('#event_date_time').text("날짜/시간");
		$('#date_end').hide();
		$('#end_date_add').show();
	});
	/*		// 날짜/시간 		  */

	$('#event_write').click(function() {
		
		$('#frm_event_write').submit();
		
		/* Ajax 처리 시도 */
		/* 
		var frm = document.getElementById('frm_event_write');
		var fileData = new FormData(frm);
		 
		$.ajax({
			url: 'event_upload.do',
			enctype: 'multipart/form-data', 
			type: 'POST',
			data: fileData,
			async: false,
			cache: false,
			contentType: false,
			processData: false,
			success: function() {
				alert("파일 업로드 완료");
			}
		});
		*/
		/* 
		var params = $("#frm_event_write").serialize();
		
		$.ajax({
			type: 'POST',
			url: 'event_write.do',
			data: params,
			async: false,
			success: function(data) {
				alert("작성 완료");
			},
			error: function(data) {
				alert("실패...");
				alert(data);
			}
		});
		*/
	});
	
	/* 테스트용 */
	$('#e_content').click(function() {
		changeDate();
	});
});

/*			function		*/
/*			▼ ▼ ▼ ▼			*/

function changeDate() {
	var sDate = $('#start_date').val();
	var sTime = $('#start_time').val();
	var eDate = $('#end_date').val();
	var eTime = $('#end_time').val();
	
	// 시작 날짜 설정
	if ( sTime != '' ) {
		
		var sTimeTemp = sTime.split(':');
		sDate = sDate + "-" + sTimeTemp[0] + "-" + sTimeTemp[1];
		
	} else {
		sDate = sDate + "-00-00";
	}
	$('#e_start_date').val(sDate);
	
	// 종료 날짜 설정
	if ( eTime != '' ) {
		
		var eTimeTemp = eTime.split(':');
		eDate = eDate + "-" + eTimeTemp[0] + "-" + eTimeTemp[1];
		
	} else {
		eDate = eDate + "-00-00";
	}
	$('#e_end_date').val(eDate);
}

</script>

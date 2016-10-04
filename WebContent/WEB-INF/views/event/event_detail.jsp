<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/>

<jsp:useBean id="calUtil" class="sist.co.util.CalendarUtil" />

<style type="text/css">

.title_image_wrap {
	position: relative;
	width: 100%;
}

.title_image {
	width: 100%;
	max-height: 300px;
}

.event_date_title {
	position: absolute;
	top: 230px;
	left: 20px;
}

.event_date {
	display: inline-block;
	width: 50px;
	height: 50px;
	border: 2px solid #FFFFFF;
	border-radius: 5px;
	
	color: #000000;
	
	background-color: #FFFFFF;
}

.event_title {
	display: table;
	float: right;
	width: 800px;
	max-height: 50px;
	padding-left: 10px;
	text-align: left;
	
	color: #FFFFFF;
	font-size: 28px;
	font-weight: bold;
	text-shadow: 0 1px 3px rgba(0, 0, 0, .5);
}

.event_menu_wrap, 
.event_main_summary, 
.event_main_wrap_right {
	border: 1px solid #DDDDDD;
	border-bottom: 1px solid #CCCCCC;
	border-radius: 2px;
}

.event_menu_wrap {
	width: 100%;
	height: 50px;
	display: table;
}

.event_writer {
	display: table-cell;
	vertical-align: middle;
	padding-left: 10px;
	
	text-align: left;
}

.event_modify {
	width: 200px;
	height: 100%;
	display: table-cell;
	vertical-align: middle;
	padding-right: 20px;
}

.event_main_wrap {
	width: 100%;
}

.event_main_wrap_left {
	width: 63%;
	float: left;
}

.event_main_wrap_right {
	width: 35%;
	float: right;
}

.summary_type {
	text-align: center;
}

.tbl_summary {
	width: 100%;
}

.tbl_summary td {
	padding: 15px 0px;
}

.td_bottom {
	border-bottom: 1px solid #DEDEDE;
}

.summary_location {
	border: none;
}

pre {
	text-align: left;
	background-color: #FFFFFF;
}

/* 참석유무 */
.event_main_join_list {
	padding: 10px;
}

.tbl_join_list {
	width: 100%;
}

.join_list_num {
	font-size: 16pt;
	font-weight: bold;
}

.join_list_text {
	color: #AAAAAA;
}


/* 임시 */
.newsfeed_event_title {
	width: 200px; 
	display: inline-block;
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis; 
	vertical-align: middle;
}

</style>

<div id="title_image" class="title_image_wrap">
	<!-- 타이틀 이미지 -->
	<c:choose>
	<c:when test="${ empty event.e_image }">
		<script type="text/javascript">
			$('#title_image').css('height', '300px').css('background-color', '#808080');
		</script>
	</c:when>
	
	<c:when test="${ fn:substring(event.e_image, 0, 12) == 'image/event/' }">
		<img src="${ event.e_image }" class="title_image" />
	</c:when>
	
	<c:otherwise>
		<img src="upload/${ event.e_image }" class="title_image" />
	</c:otherwise>
	</c:choose>
	
	<!-- 날짜 & 이벤트 이름 -->
	<div class="event_date_title">
		<span class="event_date">
			<span style="font-size: 9pt;">
				${ calUtil.toOne(fn:substring(event.e_start_date, 5, 7)) }월
			</span>
			<br/>
			<span style="font-size: 14pt; font-weight: 800;">
				${ calUtil.toOne(fn:substring(event.e_start_date, 8, 10)) }일
			</span>
		</span>
		<span class="event_title">
			${ event.e_title }
		</span>
	</div>
</div>

<!-- 이벤트 주최자 & 초대/수정 -->
<div class="event_menu_wrap">
	<div class="event_writer">
		<span style="color: #808080;">
			<i class="fa fa-male" aria-hidden="true"></i>&nbsp;주최자: 
		</span>
		<span>
			<a href="#" style="text-decoration: none;">${ event.m_name }</a>
		</span>
	</div>
	
	<!-- 주최자와 로그인 사용자와 동일하면 초대/수정 보임 -->
	<c:if test="${ login.m_id == event.m_id }">
		<div class="event_modify btn-group btn-group-justified">
			<a href="#" class="btn btn-default" data-toggle="modal" 
				data-target="#modal_invite" onclick="return false">
				<i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;초대</a>
			<a href="#" class="btn btn-default"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;수정</a>
		</div>
	</c:if>
</div>

<div id="modal_invite_wrap">
<jsp:include page="form_event_invite.jsp" />
</div>

<br/>

<div class="event_main_wrap">
	<div class="event_main_wrap_left">
		<div class="event_main_summary">
			<table class="tbl_summary">
				<col style="width: 10%;"/><col style="width: 90%;"/>
				<tr>
					<td class="summary_type td_bottom"><i class="fa fa-clock-o" aria-hidden="true"></i></td>
					
					<c:set var="sDateArr" value="${ fn:split(event.e_start_date, '-') }" />
					<td class="td_bottom" style="text-align: left;">
						<!-- 시작 날짜 -->
						${ sDateArr[0] }년&nbsp;
						${ calUtil.toOne(sDateArr[1]) }월&nbsp;
						${ calUtil.toOne(sDateArr[2]) }일&nbsp;
						<c:if test="${ calUtil.toOne(sDateArr[3]) <= 12 }">
							오전 ${ calUtil.toOne(sDateArr[3]) }시&nbsp;
						</c:if>
						<c:if test="${ calUtil.toOne(sDateArr[3]) > 12 }">
							오후 ${ calUtil.toOne(sDateArr[3]) - 12 }시&nbsp;
						</c:if>
						${ calUtil.toOne(sDateArr[4]) }분
						
						<!-- 종료 날짜 -->
						<c:if test="${ !empty event.e_end_date }">
							<c:set var="eDateArr" value="${ fn:split(event.e_end_date, '-') }" />
							~&nbsp;
							${ sDateArr[0] }년&nbsp;
							${ calUtil.toOne(sDateArr[1]) }월&nbsp;
							${ calUtil.toOne(sDateArr[2]) }일&nbsp;
							<c:if test="${ calUtil.toOne(sDateArr[3]) <= 12 }">
								오전 ${ calUtil.toOne(sDateArr[3]) }시&nbsp;
							</c:if>
							<c:if test="${ calUtil.toOne(sDateArr[3]) > 12 }">
								오후 ${ calUtil.toOne(sDateArr[3]) - 12 }시&nbsp;
							</c:if>
							${ calUtil.toOne(sDateArr[4]) }분
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="summary_type"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
					<td style="text-align: left;">
						${ event.e_location }
					</td>
				</tr>
			</table>
		</div>
		
		<br/>
		
		<div class="event_main_content">
			<pre>${ event.e_content }</pre>
		</div>
		
		<br/>
		
		<div class="event_main_newsfeed">
			<jsp:include page="/WEB-INF/views/newsfeed/newsfeed_write.jsp" >
				<jsp:param name="viewPage" value="event" />
				<jsp:param name="eventSeq" value="${ event.e_seq }" />
			</jsp:include>
			<%-- <jsp:include page="/WEB-INF/views/group/group_newsfeed_write.jsp" /> --%>
		</div>
		
		<!-- 임시용: 이벤트 뉴스피드 -->
		<br/>
		<div>
			<table border="1" style="width: 100%; height:100%;">
				<col style="width: 10%;" /><col style="width: 60%;" /><col style="width: 20%;" />
				<tr>
					<td>
						<span class="event_date">
							<span style="font-size: 9pt;">
								${ calUtil.toOne(fn:substring(event.e_start_date, 5, 7)) }월
							</span>
							<br/>
							<span style="font-size: 14pt; font-weight: 800;">
								${ calUtil.toOne(fn:substring(event.e_start_date, 8, 10)) }일
							</span>
						</span>
					</td>
					<td style="text-align: left;">
						<div class="newsfeed_event_title">${ event.e_title }</div>
						<br/>
						<c:if test="${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) <= 12 }">
							오전 ${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) }시&nbsp;
						</c:if>
						
						<c:if test="${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) > 12 }">
							오후 ${ calUtil.toOne(sDateArr[3]) - 12 }시&nbsp;
						</c:if>
						${ calUtil.toOne(fn:substring(event.e_start_date, 14, 16)) }분
					</td>
					<td>
						<div class="btn-group">
							<a href="#" id="event_join_decision" class="btn btn-default dropdown-toggle" 
								data-toggle="dropdown" aria-expanded="false">
								<span class="event_join_type_img"></span>
								<font id="event_join_decision_text">결정</font>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#" class="event_join_type" chk="0" 
										onclick="return false"><span class="event_join_type_img"></span>
										&nbsp;참석</a>
								</li>
								<li>
									<a href="#" class="event_join_type" chk="0" 
										onclick="return false"><span class="event_join_type_img"></span>
										&nbsp;불참</a>
								</li>
								<li>
									<a href="#" class="event_join_type" chk="0" 
										onclick="return false"><span class="event_join_type_img"></span>
										&nbsp;모르겠음</a>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<!--		뉴스피드 리스트			-->
		<div>
			
			<jsp:include page="/WEB-INF/views/newsfeed/newsfeed_list.jsp" >
				<jsp:param name="viewPage" value="event" />
				<jsp:param name="eventSeq" value="${ event.e_seq }" />
			</jsp:include>
			
		</div>
		<!--	 // 뉴스피드 리스트			-->
		
	</div>
	<div class="event_main_wrap_right">
		<div class="event_main_join_list">
			<table class="tbl_join_list">
				<col style="width: 33%;" /><col style="width: 33%;" /><col style="width: 33%;" />
				<tr>
					<td class="join_list_num">0</td>
					<td class="join_list_num">1</td>
					<td class="join_list_num">2</td>
				</tr>
				
				<tr>
					<td class="join_list_text">참석</td>
					<td class="join_list_text">불참</td>
					<td class="join_list_text">초대됨</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	// 이벤트 이름이 두 줄 이상이 되면 타이틀 위치를 위로 이동
	var titleHeight = $('.event_date_title').css('height');
	titleHeight = titleHeight.replace('px', '');
	
	if ( titleHeight > 50 ) {
		$('.event_date_title').css('top', '220px');
	}
	
	// 이벤트 참석 여부 결정
	$('.event_join_type').click(function() {
		var targetChk = $(this).attr('chk');
		var choiceText = $(this).text();
		var imgTag = "<i id='join_check_img' class='fa fa-check' aria-hidden='true'></i>";
		
		if ( targetChk == 0 ) {
			$(this).attr('chk', '1').find('.event_join_type_img').html(imgTag);
			$('.event_join_type').not(this).attr('chk', '0').find('i').remove();
			
		} else {
			$(this).not(this).attr('chk', '0').find('.event_join_type_img').find('i').remove();
		}
		
		$('#event_join_decision').find('#event_join_decision_text').text(choiceText);
		$('#event_join_decision').find('.event_join_type_img').html(imgTag);
	});
});

</script>

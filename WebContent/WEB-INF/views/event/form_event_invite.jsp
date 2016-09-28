<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css"/>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

<style type="text/css">

/*		공용		*/
.invite_form_border {
	border: 1px solid #EEEEEE;
}
/*	 // 공용		*/

.invite_content {
	width: 100%;
	height: 500px;
}

.invite_content_left {
	width: 75%;
	height: 100%;
	float: left;
	/* background-color: red; */
}

.invite_content_head {
	height: 10%;
	padding: 5px;
}

.invite_content_friend_group_wrap {
	width: 30%;
	height: 90%;
	float: left;

	/* background-color: green; */
}

.invite_content_friend_group_type {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.invite_content_right {
	width: 25%;
	height: 100%;
	padding: 10px;
	float: right;
	/* background-color: blue; */
}

.choice_friend_info {
	width: 145px; 
	display: inline-block;
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis; 
	vertical-align: middle;
}

/*		검색된 친구 리스트		*/

.invite_content_search_list_wrap {
	width: 70%;
	height: 90%;
	padding: 15px;
	float: right;
	
	overflow-x: hidden;
	overflow-y: auto;
	/* background-color: skyblue; */
}

.tbl_search_friend_mouseover {
	border: 1px solid #CCCCCC;
	background-color: aqua;
	cursor: pointer;
}

/*	 // 검색된 친구 리스트		*/

/*		선택한 친구 리스트		*/

.add_choice_friend_info {
	height: 25px;
	text-align: left;
	margin: 5px auto;
}

.choice_friend_profile_image {
	width: 25px;
	height: 25px;
	margin-right: 5px; 
	float: left;
}

/*	 // 선택한 친구 리스트		*/

/*		Modal		*/
.modal-dialog-invite {
	width: 800px;
	margin: 100px auto;
}

.modal-content-invite {
	/* background-color: #808080; */
}

.modal-body-invite {
	height: 100%;
	padding: 0;
	/* background-color: aqua; */
}

.modal-footer-invite {
	height: 100%;
	/* background-color: lime; */
}
/*	 // Modal		*/

</style>

<!-- 	Modal	 -->
<div id="modal_invite_refresh">
<div class="modal fade" id="modal_invite" tabindex="-1" role="dialog" 
	aria-labelledby="myModalLabel" data-backdrop="static">
<div class="modal-dialog modal-dialog-invite" role="document">
<div class="modal-content modal-content-invite">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">친구 초대</h4>
</div>
<div class="modal-body modal-body-invite">
	<form id="frm_event_invite" action="event_invite.do" method="POST">
		<div class="invite_content">
			<div class="invite_content_left">
				
				<!--		친구할 초대 검색		-->
				<div class="invite_content_head">
					<input type="text" class="form-control" placeholder="닉네임을 검색해주세요."
						style="width: 100%; height:100%; padding: 5px;" />
				</div>
				<!--	 // 친구할 초대 검색		-->
				
				<!--		초대 그룹		-->
				<div class="invite_content_friend_group_wrap invite_form_border mCustomScrollbar">
					<div>
						<ul class="invite_content_friend_group_type">
							<li>모든 친구</li>
							<li>친한 친구</li>
						</ul>
					</div>
				</div>
				<!--	 // 초대 그룹		-->
				
				<!--		초대할 친구 리스트		-->
				<div class="invite_content_search_list_wrap invite_form_border mCustomScrollbar" 
					data-mcs-theme="minimal-dark">
					<table style="width: 100%;">
						<col style="width: 50%;" /><col style="width: 50%;" />
						<tr>
							<td style="text-align: left;">친구(${ finformlist.size() })</td>
							<td style="text-align: right;">모두 선택</td>
						</tr>
					</table>
					
					<br/>
					
					<c:forEach var="friend" items="${ finformlist }">
						<div class="search_friend_info" style="height: 55px;">
							<table class="tbl_search_friend" m_name="${ friend.value.m_name }">
								<col width="70px" /><col width="300px" /><col width="70px" />
								<tr>
									<td>
										<img alt="프로필 사진" src="image/event/profile_base.jpg" 
											width="50px" height="50px" />
									</td>
									<td style="text-align: left;">
										${ friend.value.m_name }
										<br/>
										<!-- 추가 정보 출력 우선순위(직장 > 대학교 > 고등학교 > 거주지) -->
										<!-- 아무것도 없으면 공백 -->
										<font style="color: #AAA;">
										<c:choose>
										<c:when test="${ !empty friend.value.m_office }">
											${ friend.value.m_office }
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${ !empty friend.value.m_university }">
													${ friend.value.m_university }
												</c:when>
												
												<c:when test="${ !empty friend.value.m_highschool }">
													${ friend.value.m_highschool }
												</c:when>
												
												<c:when test="${ !empty friend.value.m_address }">
													${ friend.value.m_address }
												</c:when>
												
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
										</c:choose>
										</font>
									</td>
									<td style="text-align: center;">
										<img id="chk_image" class="chk_image" alt="체크 이미지" 
											src="image/event/invite_check_off.png" check="0" />
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
				<!--	 // 초대할 친구 리스트		-->
			</div>
			
			<div class="invite_content_right invite_form_border mCustomScrollbar">
				<div class="invite_content_choice_list">
					<div style="text-align: left;">선택됨(<span id="choice_count">0</span>)</div>
					<br/>
					<div id="add_choice_friend"></div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer modal-footer-invite">
	<!-- <button type="button" id="event_test" class="btn btn-default">테스트</button> -->
	<button type="button" id="btn_event_close" class="btn btn-default" data-dismiss="modal">취소</button>
	<button type="button" id="btn_event_invite" class="btn btn-primary">초대 보내기</button>
</div>
</div>
</div>
</div>
</div>	<!-- #modal_invite_refresh -->
<!--  // Modal	 -->

<!--		script			-->
<!--		▼ ▼ ▼ ▼			-->
<script type="text/javascript">
// 테스트용
/* 
$('#event_test').click(function() {
});
*/

$(document).ready(function () {
	// 이벤트 만들기 팝업 초기 설정
	$('#event_write_form').click(function() {
		
		// 모든 입력 값 초기화
		$('#frm_event_write file').val('');
		$('#frm_event_write input').val('');
		$('#frm_event_write textarea').val('');
	});
	
	/*		기본 환경설정		*/
	
	/* 	 // 기본 환경설정 		*/
	
	/*		검색된 친구 리스트 시각효과		*/
	var inviteMemberList = "";	// 선택한 친구를 초대 리스트에 저장
	var choiceCnt = 0;			// 선택한 친구 개수 저장
	
	$('.tbl_search_friend').on('click', function() {
		var target = $(this).find('.chk_image');
		var chkVal = $(target).attr('check');
		
		var m_name = $(this).attr('m_name');
		var choiceFriendTag = "<div id = choice-" + m_name + ">"
							+ "<div class='add_choice_friend_info'>"
							+ "<img alt='프로필 사진' src='image/event/profile_base.jpg'" 
							+ "class='choice_friend_profile_image' />"
							+ "<div class='choice_friend_info'>"
							+ m_name
							+ "</div></div></div>";
		
		// 체크되지 않은 상태면
		if ( chkVal == 0 ) {
			$(target).attr('src', 'image/event/invite_check_on.png');
			$(target).attr('check', 1);
			
			// 선택한 친구는 선택 리스트에 추가
			$('#add_choice_friend').prepend(choiceFriendTag);
			
			// 초대 리스트에 추가
			inviteMemberList = inviteMemberList + m_name + "-";
			
			// 선택 개수 증가
			choiceCnt++;
			$('#choice_count').text(choiceCnt);
			
		// 체크된 상태면	
		} else {
			$(target).attr('src', 'image/event/invite_check_off.png');
			$(target).attr('check', 0);
			
			// 선택한 친구를 선택 리스트에서 제거
			$('#choice-' + m_name).remove();
			
			// 초대 리스트에서 제거
			inviteMemberList = inviteMemberList.replace(m_name + "-", "");
			
			// 선택 개수 감소
			choiceCnt--;
			$('#choice_count').text(choiceCnt);
		}
	});
	
	// 마우스 올려놓기
	$('.tbl_search_friend').on('mouseover', function() {
		var target = $(this).find('.chk_image');
		var chkVal = $(target).attr('check');
		
		if ( chkVal == 0 ) $(target).attr('src', 'image/event/invite_check_over.png');
		
		$(this).addClass('tbl_search_friend_mouseover');
	});
	
	// 마우스 벗어나기
	$('.tbl_search_friend').on('mouseout', function() {
		var target = $(this).find('.chk_image');
		var chkVal = $(target).attr('value');
		
		if ( chkVal == 0 ) $(target).attr('src', 'image/event/invite_check_off.png');
		
		$(this).removeClass('tbl_search_friend_mouseover');
	});
	/*	 // 검색된 친구 리스트 시각효과		*/
	
	/*		선택한 친구에게 초대 발송		*/
	$('#btn_event_invite').click(function() {
		$.ajax({
			url: 'event_invite.do',
			type: 'POST',
			data: { 'seq' : ${ event.e_seq }, 'inviteMemberList' : inviteMemberList },
			async: false,
			cache: false,
			success: function(data) {
				alert("초대 완료");
				$('#btn_event_close').click();
			},
			error: function(data) {
				alert("실패...");
				alert(data);
			}
		});
	});
	/*	 // 선택한 친구에게 초대 발송		*/
	
	// 모달 초기화를 위해 html 저장
	var modalTag = $('#modal_invite_wrap').html();
	
	$('#modal_invite').on('hidden.bs.modal', function(){
	//	$(this).find('form')[0].reset();	form에 있는 모든 input 값 초기화
		initModal();
	});
	
	// 모달 초기화
	function initModal() {
		$('#modal_invite').remove();
		$('#modal_invite_wrap').html(modalTag);
	}
});

/*		기타 function		*/
/*		▼ ▼ ▼ ▼ ▼ ▼		*/

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!-- 	Modal	 -->
<div class="modal fade" id="modal_invite" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">친구 초대</h4>
</div>
<div class="modal-body">
	<form id="frm_event_invite" action="event_invite.do" method="GET">
		
	</form>
</div>
<div class="modal-footer">
	<!-- <button type="button" id="event_test" class="btn btn-default">테스트</button> -->
	<button type="button" id="btn_event_close" class="btn btn-default" data-dismiss="modal">취소</button>
	<button type="button" id="btn_event_invite" class="btn btn-primary">초대 보내기</button>
</div>
</div>
</div>
</div>
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
	
});

/*			function		*/
/*			▼ ▼ ▼ ▼			*/

</script>

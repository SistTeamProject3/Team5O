<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

ul {
	list-style: none;
	margin: 0px; 
	padding: 0px;
}

#myModal {
	margin-top: 100px;
}

</style> 

<ul>
	<li><a href="event_calendar.do">달력</a></li>
	<li><a href="#" id="_event_write" data-toggle="modal" data-target="#myModal" onclick="return false">만들기</a></li>
</ul>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">이벤트 만들기</h4>
			</div>
			<div class="modal-body">
				<jsp:include page="../event/form_event_write.jsp"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">이벤트 만들기</button>
			</div>
		</div>
	</div>
</div>
<!-- // Modal -->

<script type="text/javascript">

// 만들기 팝업이 등장할 때마다 팝업 내부에 있는 모든 input 값 초기화
$('#_event_write').click(function() {
	$('.frm_event_write').val('');
});

</script>

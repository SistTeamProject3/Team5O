<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var s_num1 = 1;
var l_num1 = 10;

$(document).ready(function(){
	var gseq = $("#g_seq").attr("value");
	
	$("#writer").hide();
    $("#content").click(function(){
        $("#writer").show();
    });
	$(window).scroll(function() {
		var posScroll = $(window).scrollTop() + $(window).height();
		var maxHeight = $(document).height();

		if (($(window).scrollTop() == $(document).height() - $(window).height())) {
			s_num1 = s_num1+10;
			alert(gseq);
			l_num1 = l_num1+10;
			$.ajax({
				type: 'POST',
				url: 'group_newsfeed_list.do?g_seq='+gseq+'&s_num='+s_num1+'&l_num='+l_num1,
				async: false,
				cache: false,
				timeout: 10000,
				success: function(data) {
					$('#add_g_list').append(data); 
				},
				error: function(data) {
					alert("실패...");
				}
			}); 
		}
		
	});
	
});


</script>
</head>
<body>
<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<c:if test="${g_key eq true || g_make.g_type eq 1 }">
<div style="width: 70%;">
	<jsp:include page="/WEB-INF/views/group/group_newsfeed_write.jsp"/>
	<%-- <jsp:include page="/WEB-INF/views/group/test.jsp"/>  --%>
</div>
</c:if>
<br/>
<c:if test="${g_key eq true || g_make.g_type eq 1 }">
<div style="width: 70%;">
<jsp:include page="/WEB-INF/views/group/group_newsfeed_list.jsp"/>
</div>
<div id="add_g_list" style="width: 70%;">

</div>
</c:if>
</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<table border="1" style="width: 100%;">
	<c:forEach items="${g_n_list }" var="g_nlist" varStatus="i">
			<tr>
				<td>프로필 사진</td><td>${g_nlist.m_id}</td>
			</tr>
		<c:if test="${g_nlist.n_form_num eq 1 }">
			<script type="text/javascript">
			$(document).ready(function() {
				var a = ${g_nlist.n_seq};
				$.ajax({
					type: 'POST',
					url: 'group_newsfeed_p_form.do?n_seq='+a,
					async: false,
					cache: false,
					timeout: 10000,
					success: function(data) {
						$('#photodiv'+a).append(data); 
					},
					error: function(data) {
						alert("실패...");
					}
				});
			});
			</script>
			<tr>
				<td colspan="2">
					<div id="photodiv${g_nlist.n_seq}">
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${g_nlist.n_form_num eq 2 }">
			<script type="text/javascript">
			$(document).ready(function() {
				var a =${g_nlist.n_seq};
				$.ajax({
					type: 'POST',
					url: 'group_newsfeed_v_form.do?n_seq='+a,
					async: false,
					cache: false,
					timeout: 10000,
					success: function(data) {
						$('#videodiv'+a).append(data); 
					},
					error: function(data) {
						alert("실패...");
					}
				});
			});
			</script>
			<tr>
				<td colspan="2">
					<div id="videodiv${g_nlist.n_seq}">
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${g_nlist.n_form_num eq 4 }">
			<script type="text/javascript">
			$(document).ready(function() {
				var a =${g_nlist.n_seq};
				var b =${g_nlist.n_vote_seq};
				$.ajax({
					type: 'POST',
					url: 'group_newsfeed_b_form.do?n_vote_seq='+b,
					async: false,
					cache: false,
					timeout: 10000,
					success: function(data) {
						$('#vote'+a).append(data); 
					},
					error: function(data) {
						alert("실패...");
					}
				});
			});
			</script>
			<tr>
				<td colspan="2">
					<div id="vote${g_nlist.n_seq}">
					</div>
				</td>
			</tr>
		</c:if>
	</c:forEach>
</table>

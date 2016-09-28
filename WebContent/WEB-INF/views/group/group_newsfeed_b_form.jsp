<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>

<script type="text/javascript">
$(document).ready(function() {
	$(".chk_vote").click(function() {
		alert($(this).attr("value"));
		$(".chk_vote").not(this).prop("checked",false);
		
	});
	
});

</script>



<table style="width: 100%; height: auto;" border="1">
<tr>
<td>
<div>
<c:if test="${!empty vodto.vote1 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote1 }">${vodto.vote1 }<br>
</c:if>
<c:if test="${!empty vodto.vote2 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote2 }">${vodto.vote2 }<br>
</c:if>
<c:if test="${!empty vodto.vote3 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote3 }">${vodto.vote3 }<br>
</c:if>
<c:if test="${!empty vodto.vote4 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote4 }">${vodto.vote4 }<br>
</c:if>
<c:if test="${!empty vodto.vote5 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote5 }">${vodto.vote5 }<br>
</c:if>
<c:if test="${!empty vodto.vote6 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote6 }">${vodto.vote6 }<br>
</c:if>
<c:if test="${!empty vodto.vote7 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote7 }">${vodto.vote7 }<br>
</c:if>
<c:if test="${!empty vodto.vote8 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote8 }">${vodto.vote8 }<br>
</c:if>
<c:if test="${!empty vodto.vote9 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote9 }">${vodto.vote9 }<br>
</c:if>
<c:if test="${!empty vodto.vote10 }">
<input class="chk_vote" type="checkbox" value="${vodto.vote10 }">${vodto.vote10 }<br>
</c:if>
</div>
</td>
</tr>
</table>
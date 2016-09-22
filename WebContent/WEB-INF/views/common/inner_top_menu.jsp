<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>



<div id="top_menu_wrap">
	<div id="_top_menu">
		<!-- 검색 --> <!-- (0908) 실시간 검색을 만들경우, 이 부분이 나중에 header로 올라감. 그리고 ~.do를 실행시켜서 content에 결과 출력하는 방식으로 만들거임 -->
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<!-- <input class="form-control" type="text" placeholder="이름" id="searchtext" name="insearchname" onkeypress="if(event.keyCode==13) {Searchingin(); return false;}"> --> <!-- 0922. 하다말았음ㅋㅋㅋ -->
				<input class="form-control" type="text" placeholder="이름" id="searchtext" name="insearchname" onkeypress="">
			</div>
			<button class="btn btn-default" type="button" onclick="">검색</button>	<!-- submit으로 하면 안됌. 다른페이지로 넘기는 형태이므로.새로고침하는셈 -->
		</form>
	</div>
</div>

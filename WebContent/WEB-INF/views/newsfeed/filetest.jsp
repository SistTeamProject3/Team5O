<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frmForm" id="_frmForm" action="writeNewsFeed.do" method="post" enctype="multipart/form-data">

	<input type=file  name="fileload2" > 

				<img alt="게시하기"  id ="finish" src="image/temp.jpg">
</form>


<script type="text/javascript">
$("#finish").click(function() {
	alert("피니쉬!!!!");
	$("#_frmForm").attr({"target":"_self", "action":"writeNewsFeed.do"}).submit();
});

</script>

</body>
</html>
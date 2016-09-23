<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<style>
.div_header {
	position: relative;
}

.bottomright {
	position: absolute;
	bottom: 8px;
	right: 16px;
	font-size: 18px;
}

.bottomleft {
	position: absolute;
	bottom: 0px;
	left: 16px;
}

.center {
	position: absolute;
	left: 0;
	top: 50%;
	width: 100%;
	text-align: center;
	font-size: 12pt;
	
}
.topright {
    position: absolute;
    top: 8px;
    right: 16px;
    font-size: 18px;
}
</style>
<form action="" id="fileForm" method="post" enctype="multipart/form-data">
<input type="file" id="fileupload" name="fileload">
<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
</form>

<div style="width: 100%; border: 1px solid black;">
	<div class="div_header" style="width: 100%; height: 250px; border: 1px solid black;">
		<!-- 1.그룹 가입여부에따른 다른 창 보여줄예정(조건문 걸기) -->
		<div class="center" >
		<c:if test="${g_make.g_photo eq null ||g_make.g_photo eq ''}">
		<div>
			<div style="border: 1px solid red; " align="center" >
				<h6>그룹의 개성을 가장 잘 나타내는 사진을 한 장 고르세요.</h6>
				<img id="filesearch" alt="사진" src="image/news_file.jpg">
			</div>
		</div>	
		</c:if>
		</div>
		<c:if test="${!empty g_make.g_photo}">
			<div id="group_heder">
 			<img alt="배경" src="upload/${g_make.g_photo}" style="width: 100%; height: 250px;" >
			<div class="topright"><button id="changeImage">사진 변경</button></div>
			</div>
		</c:if>
		<!-- 1.여기까지 -->
		<div class="bottomleft">
			<h4>
				<a href="group_detail.do?g_seq=${g_make.g_seq }">${g_make.g_name}</a>
			</h4>
			<c:if test="${g_make.g_type eq 1}">
				<h5>
					<a href="#none">공개 그룹</a>
				</h5>
			</c:if>
			<c:if test="${g_make.g_type eq 2}">
				<h5>
					<a href="#none">비공개 그룹</a>
				</h5>
			</c:if>
			<c:if test="${g_make.g_type eq 3}">
				<h5>
					<a href="#none">비밀 그룹</a>
				</h5>
			</c:if>
		</div>
		<div class="bottomright">
			<button>가입함</button>
		</div>
	</div>
	<div>
		
		<div style="width: 60%; float: left; border: 1px solid black;">
		<form action="" method="post" id="_frmForm">
		<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
			<button id="debate">토론</button>
			<button id="member">멤버</button>
			<button id="event">이벤트</button>
			<button id="photo">사진</button>
			<button id="file">파일</button>
			<c:if test="${g_make.g_manager eq login.m_id}"><button id="request">가입요청</button></c:if> 
		</form>
		</div>
		
		<div style="width: 40%; float: left; border: 1px solid black;">
			<input type="text" placeholder="이 그룹 검색" value="">
			<button>검색</button>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#debate").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail.do"}).submit();
	});
	$("#member").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_member.do?type=1&keyword="}).submit();
	});	
	$("#event").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_event.do"}).submit();
	});	
	$("#photo").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_photo.do"}).submit();
	});	
	$("#file").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_flie.do"}).submit();
	});	
	$("#request").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_request.do"}).submit();
	});	
	
	$("#fileupload").hide();
	
	$("#filesearch").click(function() {
		$("#fileupload").trigger("click");	
	});
	$("#changeImage").click(function() {
		$("#fileupload").trigger("click");	
	});
	$("#fileupload").change(function() {
		/* $.ajax({url: "group_main_image.do", success: function(result){ */
			
			var file = $("#fileupload").val();
				
			var pos = file.lastIndexOf( "." );
			var fileExt = file.substring( pos + 1 );
			/* fileExt.toLowerCase(); */
			fileExt = fileExt.toLowerCase();
		
			if (fileExt == "jpg" ||fileExt == "gif" || fileExt == "jpeg" || fileExt == "png" || fileExt == "bmp"  ) {
				$("#fileForm").attr({"target":"_self","action":"group_main_image.do"}).submit(); 
			}else{
				alert("제대로된 파일좀 올려줘");
			}
		      
	});
	$("#changeImage").hide();	
		
	$("#group_heder").mouseover( function() {
		$("#changeImage").show();
	});
	
	$("#group_heder").mouseout(function() {
		$("#changeImage").hide();
	});
	  
	
	
});
</script>




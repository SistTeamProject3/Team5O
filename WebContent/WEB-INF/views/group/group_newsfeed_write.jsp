<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>

 #image_preview {
    display:none;
}
 #image_preview2 {
    display:none;
}
</style>
</head>
<body>
<form name="frmForm" id="group_frmForm" action="writeNewsFeed.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="AA">
<c:if test="${g_make.g_type eq 1 }">
<input type="hidden" name="n_show" value="4">
</c:if>
<c:if test="${g_make.g_type eq 2 ||g_make.g_type eq 3 }">
<input type="hidden" name="n_show" value="5">
</c:if>
<input type="hidden" name="g_seq" value="${g_make.g_seq }">
<input type="hidden" name="n_show" value="4">
		<table style="width: 100%" border="1">
			<col width="100"><col width="150"><col width="150"><col width="150">
			<tr>
				<td>
					<h6>
						<a href="#none" id="news_write">게시물 작성</a>
					</h6>
				</td>
				<td>
					<h6>
						<a href="#none">사진/동영상 추가</a>
					</h6>
				</td>
				<td>
					<h6>
						<a href="#none" id="make_vote">설문 만들기</a>
					</h6>
				</td>
				<td>
					<h6>
						<a href="#none">더보기</a>
					</h6>
				</td>
			</tr>
			<tr class="news_write">
				<td rowspan="2">프사사진</td>
				<td colspan="3"><textarea id="n_content" name="n_content"
						style="overflow: hidden; width: 100%;" placeholder="글쓰기.."></textarea>
					<div id="room_type">
						<div id="image_preview2">
							<label for="image"> <input type=file name="fileload2"
								id="image2" style='display: none;'> <img
								src='image/news_addfile.jpg' name="_file3" id="_file3"
								border='0' onclick='hideAll();'>
							</label>
						</div>
						<div class="form-group">
							<div id="image_preview">
								<img src="#" width="150px" height="100px" /> <a
									class='fa fa-times' onclick="remove_div(this)"></a>
							</div>
						</div>
					</div>
					<div id="field"></div></td>
			</tr>
			<tr>
				<td colspan="4">
					<div id="nowFriend" style='display: none;'>
						<h6>님과 함께&nbsp;&nbsp;</h6>
						<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowFriend')"></i>
					</div>
					<div id="nowWhere" style='display: none;'></div>
					<div id="nowFeel" style='display: none;'></div>
				</td>
			</tr>
			<tr id=friend style="display: none;">
				<td><h6>함께한 친구</h6></td>
				<td colspan="2"><input type="text" id="n_tag_friend"
					name="n_tag_friend" onKeyDown="onKeyDown();"
					onclick="this.value=''"></td>
			</tr>
			<tr id=feel style="display: none;">
				<td id="printFeel"><h6>나는지금</h6></td>
				<td colspan="3">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li onclick="getState('기뻐요'); setState('1')" value="1"><img
								src="image/happy.jpg">기뻐요</a></li>
							<li onclick="getState('슬퍼요'); setState('2')" value="2"><img
								src="image/sad.jpg">슬퍼요</a></li>
							<li onclick="getState('피곤해요'); setState('3')" value="3"><img
								src="image/tired.jpg">피곤해요</a></li>
						</ul>
					</div>
				</td>
			</tr>

			<tr id=where style="display: none;">
				<td><h6>장소</h6></td>
				<td colspan="3"><input type="text" id="n_tag_where"
					name="n_tag_where" onKeyDown="onKeyDown2();"
					onclick="this.value=''"></td>
			</tr>
			<tr class="news_write">
				<td colspan="4"><input type=file name="fileload" id="image"
					style='display: none;'> <img src='image/photo.jpg'
					name="_file2" id="_file2" border='0' onclick='hideAll();'>

					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#none"> <img
						src="image/tag.jpg" id="viewFriend" onclick="return false;">
				</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#none"> <img
						src="image/face.jpg" id="viewFeel" onclick="return false;">
				</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#none"> <img
						src="image/place.jpg" id="viewWhere" onclick="return false;">
				</a> <span style="float: right;"> <img alt="게시하기" id="finish"
						src="image/temp.jpg">
				</span></td>
			</tr>
			<!-- 여기는 설문  -->
			<tr class="make_vote">
			<td colspan="4"><textarea id="q_content" name="q_content" style="overflow: hidden; width: 100%;" placeholder="질문을 올려보세요.."></textarea></td>
			</tr>
			<tr class="make_vote">
			<td colspan="4" id="votelist">
			<span><input type="text" name="vote1" value=""><img src="" alt="추가" class="addvote"></span><br/>
			<span><input type="text" name="vote2" value=""><img src="" alt="추가" class="addvote"></span><br/>
			</td>
			</tr>
			<tr class="make_vote">
			<td colspan="4"><img alt="게시하기" id="vote_submit" src="image/temp.jpg"></td>
			</tr>
		</table>
	</form>
 <script type="text/javascript">
 var a ="";
 var countDiv=1;
 
 // 설문과 게시글 변경 스크립트
var num=3; 
 
 $(".make_vote").hide();

 $("#news_write").click(function () {
	 $(".news_write").show();
	 $(".make_vote").hide();
	});
 
 $("#make_vote").click(function () {
	 $(".news_write").hide();
	 $(".make_vote").show();

	});
 $(document).on("click",".addvote",function() {
	if(num < 11){	 
 		$("#votelist").append("<span><input type='text' name='vote"+num+"'><img src='' alt='추가' class='addvote'></span><br/>");
 		num++
	}
 });
 $("#vote_submit").click(function() {
		alert("전달");
		$("#group_frmForm").attr({"target":"_self", "action":"make_vote.do"}).submit();
	});
 // 여기서 끝
 $("#viewFriend").click(function() {
	  status = $("#friend").css("display");
	  if (status == "none") {
	    $("#friend").css("display","");
	    $("#feel").css("display","none");
	    $("#where").css("display","none");
	  }
	  else {
	    $("#friend").css("display","none");
	  }
	});
 
 $("#viewFeel").click(function() {
	  status = $("#feel").css("display");
	  if (status == "none") {
		  $("#friend").css("display","none");
		  $("#feel").css("display","");
		  $("#where").css("display","none");
	  }
	  else {
	    $("#feel").css("display","none");
	  }
	});
 
 $("#viewWhere").click(function() {
	  status = $("#where").css("display");
	  if (status == "none") {
		  $("#friend").css("display","none");
		  $("#feel").css("display","none");
		  $("#where").css("display","");
	  }
	  else {
	    $("#where").css("display","none");
	  }
	});
function hideAll(){
	 $("#friend").css("display","none");
	  $("#feel").css("display","none");
	  $("#where").css("display","none");
}
function getState(val) {
	$("#printFeel").text("");
	$("#printFeel").append("나는지금  "+val);
	
	$("#nowFeel").css("display","");
	$("#nowFeel").text("");
	$("#nowFeel").text("나는지금  "+val);
	$("#nowFeel").append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowFeel')\"></i>"); 
}

function setState(val){
	
	$("#nowFeel").append("<input type='hidden' name='n_tag_feel' value="+val+">");
}

function onKeyDown()
{
     if(event.keyCode == 13)
     {
    	$("#nowFriend").css("display","");
     	$("#nowFriend").prepend($("#n_tag_friend").val()+",");
     }
}

function onKeyDown2()
{
     if(event.keyCode == 13)
     {
	    $("#nowWhere").css("display","");
		$("#nowWhere").text("");
	    $("#nowWhere").text($("#n_tag_where").val()+"에서");
		$("#nowWhere").append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowWhere')\"></i>"); 
		$("#n_tag_where").text("");
     }
}

function deleteArea(val){
	$("#"+val).css("display","none");
}

$(function() {
	  $("#n_content").keyup(function () {
	    $(this).css("height","5px").css("height",(20+$(this).prop("scrollHeight"))+"px");
	  });
	});

 $('#image').on('change', function() {
	   
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
    } else { 
    	$("#image_preview2").css("display","");
        file = $('#image').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        
       	a = a+file.name +",";	//업로드파일이름
        
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        $('#image_preview2').slideDown(); 
        $(this).slideUp(); //파일 양식 감춤
      
        
   } 
});
 $('#image2').on('change', function() {
	   
	    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	    
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
	        resetFormElement($(this)); //폼 초기화
	        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
	    } else { 
	    	add_div();
	    	$("#image_preview2").css("display","");
	        file = $('#image2').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        
	       	a = a+file.name +",";	//업로드파일이름
	        
	        $('#image_preview img').attr('src', blobURL);
	        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
	        $('#image_preview2').slideDown(); 
	        $(this).slideUp(); //파일 양식 감춤
	   } 
	});

 $('#image_preview a').bind('click', function() {
    resetFormElement($('#image')); //전달한 양식 초기화
    $(this).parent().slideUp(); //미리 보기 영역 감춤
    $('#image_preview2').slideUp(); 
    return false; //기본 이벤트 막음
});
function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap(); //감싼 <form> 태그를 제거
}

function add_div(){
 	 	var div = document.createElement('div');
    	div.innerHTML = document.getElementById('image_preview').innerHTML;
    	document.getElementById('field').appendChild(div); 
}

function remove_div(obj){
	document.getElementById('field').removeChild(obj.parentNode);
}

function test(){
	alert("test");
}

$(function(){ 
   $("#_file2").click(function(){                    
        $("#image").click(); 
   }); 
}); 

$(function(){ 
	   $("#_file3").click(function(){                    
	        $("#image2").click(); 
	 	   
	       });
	}); 
$("#finish").click(function() {
	alert("피니쉬!!!!");
	$("#group_frmForm").attr({"target":"_self", "action":"writeNewsFeed.do"}).submit();
});




</script>



</body>
</html>


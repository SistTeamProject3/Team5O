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
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
textarea
{
  width:100%; 
}

th{
width:20%; 
}

 #image_preview {
    display:none;
}

 #image_preview2 {
    display:none;
}
</style>
  
  
</head>
<body>


<form name="frmForm" id="_frmForm" action="writeNewsFeed2.do" method="post" enctype="multipart/form-data">

WRITEeeeee

<input type="hidden" name="id" value="영선" >

<table class="ys_write_table" style="width: 80%" border="1px solid black">
	<tr>
		<td colspan="4">상태</td>
	</tr>
	
	<tr>
		<th width=300px; rowspan="2">프사사진</th>
		<td>

		<textarea id="ta" name="content" style="overflow: hidden"></textarea>
		
		<div id="room_type">
				<div id="image_preview2" >
		    	  	  	
		    	  	  	<label for="image">
							 <input type=file  name="fileload2" id="image2" style='display: none;'> 
							<img src='image/news_addfile.jpg' name="_file3" id="_file3" border='0' onclick='hideAll();'> 
						</label>
			    			
			
				</div> 
				<div class="form-group">
				
					<div id="image_preview">
					 	<img src="#" width="150px" height="100px"/>
					 	<a class='fa fa-times' onclick="remove_div(this)"></a> 
    				</div>			
				</div>
		</div>
		
		<div id="field" ></div>

		</td>
	</tr>

	<tr>
		<td colspan="4">
			<div id="nowFriend" style='display: none;'>님과 함께&nbsp;&nbsp;<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowFriend')"></i> </div>
			<div id="nowWhere" style='display: none;'></div>
			<div id="nowFeel"  style='display: none;'></div>
		</td>
	</tr>
	
	
	
	<tr id=friend style="display:none;">
		<th>함께한 친구</th>
		<td colspan="2"><input type ="text" id="_friend" name="tag_friend"  onKeyDown="onKeyDown();"  onclick="this.value=''"></td>
	</tr>

	
	<tr id=feel style="display:none;">	
	
		<th id="printFeel">나는지금</th>
		<td colspan="3">
			 <div class="dropdown">
		   		 <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu">
					    <li onclick="getState('기뻐요'); setState('1')" value="1"><img src="image/happy.jpg">기뻐요</a></li>
					    <li onclick="getState('슬퍼요'); setState('2')" value="2"><img src="image/sad.jpg">슬퍼요</a></li>
					    <li onclick="getState('피곤해요'); setState('3')" value="3"><img src="image/tired.jpg">피곤해요</a></li>
					  </ul>
		 	 </div>
		 <!-- 	 <input type="hidden" name="tag_feel" value="1"/> -->
		</td>
	</tr>
	
	<tr id=where style="display:none;">
				<th>장소</th>
					<td colspan="3"><input type ="text" id="_where" name="tag_where" onKeyDown="onKeyDown2();" onclick="this.value=''"></td>
	</tr>

	<tr> 
	<td colspan="4">
	
	<!-- 	
 			<br/> 
		  	<input type=file  name="image" id="image" style='display: none;'> 
			<img src='image/news_file.jpg' border='0' onclick='hideAll();'>
				
  		 -->
 	
  		 <!--  <label for="image"> -->
  		 	<input type=file  name="fileload" id="image" style='display: none;'> 
			<img src='image/news_file.jpg' name="_file2" id="_file2" border='0' onclick='hideAll();'>
		<!-- 	</label> -->
	
		<!-- <span class="fa fa-camera-retro fa-2x"></span> -->
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span  style="color:blue" class="fa fa-users fa-2x" id="viewFriend"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-smile-o fa-2x" id="viewFeel"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-map-marker fa-2x"  id="viewWhere"  onclick="return false;"></span>

		<span style="float:right;"> 
			<select name="show" >
				<option value="1">전체공개</option>
				<option value="2">친구만</option>
				<option value="3">나만보기</option>
			</select>
				
			<img alt="게시하기"  id ="finish" src="image/temp.jpg">
			</span>
	</td>

	</tr>
</table>



</form>
 <script type="text/javascript">
 var a ="";
 var countDiv=1;
 
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
	
/* 	$("#tag_feel").attr("value",val); */
	$("#nowFeel").append("<input type='hidden' name='tag_feel' value="+val+">");
}

function onKeyDown()
{
     if(event.keyCode == 13)
     {
    	$("#nowFriend").css("display","");
     	$("#nowFriend").prepend($("#_friend").val()+",");
     }
}

function onKeyDown2()
{
     if(event.keyCode == 13)
     {
	    $("#nowWhere").css("display","");
		$("#nowWhere").text("");
	    $("#nowWhere").text($("#_where").val()+"에서");
		$("#nowWhere").append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowWhere')\"></i>"); 
		$("#_where").text("");
     }
}

function deleteArea(val){
	$("#"+val).css("display","none");
}

$(function() {
	  $("#ta").keyup(function () {
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
     //   alert("blobURL=="+file.name);
        
       	a = a+file.name +",";	//업로드파일이름
     //   alert("a="+a);
        
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
	    //    alert("blobURL=="+file.name);
	        
	       	a = a+file.name +",";	//업로드파일이름
	    //    alert("a="+a);
	        
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
	$("#_frmForm").attr({"target":"_self", "action":"writeNewsFeed2.do"}).submit();
});




</script>



</body>
</html>


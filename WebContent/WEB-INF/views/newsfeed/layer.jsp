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

<!-- header -->
<div class="modal-header">
 수정하자아아아아아~~
  <button type="button" class="close"  data-dismiss="modal">×</button>
</div>

<!-- body -->
<div class="modal-body">
  
<form name="frmForm2" id="_frmForm2" action="writeNewsFeed.do" method="post" enctype="multipart/form-data">



<input type="hidden" name="m_id" value="영선" >

<table class="ys_update_table" style="width: 100%" border="1px solid black">
	<tr>
		<td colspan="4">상태</td>
	</tr>
	
	<tr>
		<th width=300px; rowspan="2">프사사진</th>
		<td>

		<textarea id="ta2" name="n_content" style="overflow: hidden"></textarea>
		
		<div id="room_type">
				<div id="image_preview2_2" >
		    	  	  	
		    	  	  	<label for="image">
							 <input type=file  name="fileload2" id="image2_2" style='display: none;'> 
							<img src='image/news_addfile.jpg' name="_file3" id="_file3_2" border='0' onclick='hideAll2();'> 
						</label>
			    			
			
				</div> 
				<div class="form-group">
				
					<div id="image_preview_2">
					 	<img src="#" width="150px" height="100px"/>
					 	<a class='fa fa-times' onclick="remove_div2(this)"></a> 
    				</div>			
				</div>
		</div>
		
		<div id="field_2" ></div>

		</td>
	</tr>

	<tr>
		<td colspan="4">
			<div id="nowFriend_2" style='display: none;'>님과 함께&nbsp;&nbsp;<i class="fa fa-times" aria-hidden="true" onclick="deleteArea2('nowFriend')"></i> </div>
			<div id="nowWhere_2" style='display: none;'></div>
			<div id="nowFeel_2"  style='display: none;'></div>
		</td>
	</tr>
	
	
	
	<tr id="friend_2" style="display:none;">
		<th>함께한 친구</th>
		<td colspan="2"><input type ="text" id="_friend_2" name="n_tag_friend"  onKeyDown="onKeyDown3();"  onclick="this.value=''"></td>
	</tr>

	
	<tr id="feel_2" style="display:none;">	
	
		<th id="printFeel_2">나는지금</th>
		<td colspan="3">
			 <div class="dropdown">
		   		 <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu">
					    <li onclick="getState2('기뻐요'); setState2('1')" value="1"><img src="image/happy.jpg">기뻐요</a></li>
					    <li onclick="getState2('슬퍼요'); setState2('2')" value="2"><img src="image/sad.jpg">슬퍼요</a></li>
					    <li onclick="getState2('피곤해요'); setState2('3')" value="3"><img src="image/tired.jpg">피곤해요</a></li>
					  </ul>
		 	 </div>
		<!--   <input type="hidden" name="tag_feel" value="0"/>  -->
		</td>
	</tr>
	
	<tr id="where_2" style="display:none;">
				<th>장소</th>
					<td colspan="3"><input type ="text" id="_where_2" name="n_tag_where" onKeyDown="onKeyDown4();" onclick="this.value=''"></td>
	</tr>

	<tr> 
	<td colspan="4">
	
	<!-- 	
 			<br/> 
		  	<input type=file  name="image" id="image_2" style='display: none;'> 
			<img src='image/news_file.jpg' border='0' onclick='hideAll2();'>
				
  		 -->
 	
  		 <!--  <label for="image"> -->
  		 	<input type=file  name="fileload" id="image_2" style='display: none;'> 
			<img src='image/news_file.jpg' name="_file2" id="_file2_2" border='0' onclick='hideAll2();'>
		<!-- 	</label> -->
	
		<!-- <span class="fa fa-camera-retro fa-2x"></span> -->
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span  style="color:blue" class="fa fa-users fa-2x" id="viewFriend_2"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-smile-o fa-2x" id="viewFeel_2"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-map-marker fa-2x"  id="viewWhere_2"  onclick="return false;"></span>

		<span style="float:right;"> 
			<select name="n_show" >
				<option value="1">전체공개</option>
				<option value="2">친구만</option>
				<option value="3">나만보기</option>
			</select>
			
			</span>
	</td>

	</tr>
</table>



</form>
</div>
<!-- Footer -->
<div class="modal-footer">
  <button type="button" class="btn btn-default"  id="update_2" data-dismiss="modal" >수정완료</button>
</div>

<script type="text/javascript">
 var a ="";
 var countDiv=1;
 
 $("#viewFriend_2").click(function() {
	  status = $("#friend_2").css("display");
	  if (status == "none") {
	    $("#friend_2").css("display","");
	    $("#feel_2").css("display","none");
	    $("#where_2").css("display","none");
	  }
	  else {
	    $("#friend_2").css("display","none");
	  }
	});
 
 $("#viewFeel_2").click(function() {
	  status = $("#feel_2").css("display");
	  if (status == "none") {
		  $("#friend_2").css("display","none");
		  $("#feel_2").css("display","");
		  $("#where_2").css("display","none");
	  }
	  else {
	    $("#feel_2").css("display","none");
	  }
	});
 
 $("#viewWhere_2").click(function() {
	  status = $("#where_2").css("display");
	  if (status == "none") {
		  $("#friend_2").css("display","none");
		  $("#feel_2").css("display","none");
		  $("#where_2").css("display","");
	  }
	  else {
	    $("#where_2").css("display","none");
	  }
	});
 
function hideAll2(){
	 $("#friend_2").css("display","none");
	  $("#feel_2").css("display","none");
	  $("#where_2").css("display","none");
}


function getState2(val) {

	$("#printFeel_2").text("");
	$("#printFeel_2").append("나는지금  "+val);
	
	$("#nowFeel_2").css("display","");
	$("#nowFeel_2").text("");
	$("#nowFeel_2").text("나는지금  "+val);
	$("#nowFeel_2").append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea2('nowFeel')\"></i>"); 


	
}

function setState2(val){
	
/* 	$("#tag_feel").attr("value",val); */
	$("#nowFeel_2").append("<input type='hidden' name='tag_feel' value="+val+">");
}

function onKeyDown3()
{
     if(event.keyCode == 13)
     {
    	$("#nowFriend_2").css("display","");
     	$("#nowFriend_2").prepend($("#_friend_2").val()+",");
     }
}

function onKeyDown4()
{
     if(event.keyCode == 13)
     {
	    $("#nowWhere_2").css("display","");
		$("#nowWhere_2").text("");
	    $("#nowWhere_2").text($("#_where_2").val()+"에서");
		$("#nowWhere_2").append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea2('nowWhere')\"></i>"); 
		$("#_where_2").text("");
     }
}

function deleteArea2(val){
	$("#"+val+"_2").css("display","none");
}

$(function() {
	  $("#ta2").keyup(function () {
	    $(this).css("height","5px").css("height",(20+$(this).prop("scrollHeight"))+"px");
	  });
	});

 $('#image_2').on('change', function() {
	   
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
    } else { 
    	$("#image_preview2_2").css("display","");
        file = $('#image_2').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
     //   alert("blobURL=="+file.name);
        
       	a = a+file.name +",";	//업로드파일이름
     //   alert("a="+a);
        
        $('#image_preview_2 img').attr('src', blobURL);
        $('#image_preview_2').slideDown(); //업로드한 이미지 미리보기 
        $('#image_preview2_2').slideDown(); 
        $(this).slideUp(); //파일 양식 감춤
      
        
   } 
});
 $('#image2_2').on('change', function() {
	   
	    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	    
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
	        resetFormElement($(this)); //폼 초기화
	        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
	    } else { 
	    	add_div2();
	    	$("#image_preview2_2").css("display","");
	        file = $('#image2_2').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	    //    alert("blobURL=="+file.name);
	        
	       	a = a+file.name +",";	//업로드파일이름
	    //    alert("a="+a);
	        
	        $('#image_preview_2 img').attr('src', blobURL);
	        $('#image_preview_2').slideDown(); //업로드한 이미지 미리보기 
	        $('#image_preview2_2').slideDown(); 
	        $(this).slideUp(); //파일 양식 감춤
	   } 
	});

 

 $('#image_preview_2 a_2').bind('click', function() {
    resetFormElement($('#image_2')); //전달한 양식 초기화
    $(this).parent().slideUp(); //미리 보기 영역 감춤
    $('#image_preview2_2').slideUp(); 
    return false; //기본 이벤트 막음
});
    

function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap(); //감싼 <form> 태그를 제거
}

function add_div2(){
 	 	var div = document.createElement('div');
    	div.innerHTML = document.getElementById('image_preview_2').innerHTML;
    	document.getElementById('field_2').appendChild(div); 
}

function remove_div2(obj){
	document.getElementById('field_2').removeChild(obj.parentNode);
}

function test(){
	alert("test");
}

$(function(){ 
   $("#_file2_2").click(function(){                    
        $("#image_2").click(); 
   }); 
}); 

$(function(){ 
	   $("#_file3_2").click(function(){                    
	        $("#image2_2").click(); 
	 	   
	       });
	}); 

$("#update_2").click(function(){
		alert("update");
});





</script>

</body>
</html>
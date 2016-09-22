<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>

 <style>
.ys_write_table textarea
{
  width:100%; 
}

.ys_write_table th{
width:20%; 
}

.ys_write_table #image_preview {
    display:none;
}

.ys_write_table #image_preview2 {
    display:none;
}
</style>

</head>
<script type="text/javascript">
 $(window).bind('scroll', function(){
	   if ($(window).scrollTop() == $(document).height() - $(window).height()){
	     	add3();
	   }   
});

function add3(){
	 $(window).unbind('scroll');

     var lastseq = $(".table:last").attr("data-seq");
 	
 	  $.ajax({
 	        type: 'POST',
 	        url: 'test2.do',
 	        data: {'lastseq' : lastseq},
 	        async:true,
 	        success: function(data) {
 	        	  $('#scrolling').append(data); 
 	        	 $(window).bind('scroll', function(){
 	        		   if ($(window).scrollTop() == $(document).height() - $(window).height()){
 	        			   add3();
 	        		   }   
 	        	 }); 
 	        },
 	        error: function(data) {
 	      		alert("error");
 	        }
 	     }); 
}

$(function() {
	  $("#ta").keyup(function () {
	    $(this).css("height","5px").css("height",(20+$(this).prop("scrollHeight"))+"px");
	  });
});

</script>
<body>
<%--  <button class="btn btn-default" id="popbutton2">수정모달</button><br/> --%>
<!-- write -->
<%-- <jsp:include page="newsfeed_write.jsp"/> --%>




<%--  <a data-toggle="modal" href="layer.jsp" data-target=".yss">Click me</a> 

  <div class="modal fade yss">
  <div class="modal-dialog">
    <div class="modal-content">
       <jsp:include page="/WEB-INF/views/newsfeed/layer.jsp"/>
    </div>
  </div>
</div>   --%>

<form name="frmForm" id="_frmForm" action="writeNewsFeed.do" method="post" enctype="multipart/form-data">

<input type="hidden" name="m_id" value="영선" >

<table class="ys_write_table" style="width: 80%" border="1px solid black">
	<tr>
		<td colspan="4">상태</td>
	</tr>
	
	<tr>
		<th width=300px; rowspan="2">프사사진</th>
		<td>

		<textarea id="ta" name="n_content" style="overflow: hidden"></textarea>
		
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
		<td colspan="2"><input type ="text" id="_friend" name="n_tag_friend"  onKeyDown="onKeyDown();"  onclick="this.value=''"></td>
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
		<!--   <input type="hidden" name="tag_feel" value="0"/>  -->
		</td>
	</tr>
	
	<tr id=where style="display:none;">
				<th>장소</th>
					<td colspan="3"><input type ="text" id="_where" name="n_tag_where" onKeyDown="onKeyDown2();" onclick="this.value=''"></td>
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
			<select name="n_show" >
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


<c:forEach var="news" items="${NewsFeedList }" varStatus="i"> 


<c:if test="${news.n_del ne 1 }">
<br><br>

${news.n_seq }
<div class="table" data-seq="${news.n_seq }">
<table class="newsfeed_list_table${news.n_seq }" style="width: 80%"  border="1px solid black">

<tr>
		<td width=80px; rowspan="2">프사사진</td>
		<td align=left>작성자 : ${news.m_id}</td>
		<td>
			<div class="dropdown">
		   		 <button type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu">
					    <li value="1" onclick="removeNews('${news.n_seq}')">삭제</li>
					    <li value="2"  data-toggle="modal" href="layer.jsp" data-target=".ys">수정</li>
					  </ul>
		 </div>
		</td>
</tr>
<tr>
		<td align=left>작성시간 : ${news.n_wdate}</td>
		<td>
	
		<div class="dropdown">
			
		   		 <button type="button" data-toggle="dropdown">
				 <span class="caret"></span></button>
					  <ul class="dropdown-menu" id="total">
					  	<c:choose>
							<c:when test="${news.n_show eq 1}"> 
								<li id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)"  style="color: red">전체</li>
							    <li id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" >친구만</li>
							    <li id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" >나만보기</li>
						     </c:when>
							<c:when test="${news.n_show eq 2}">
								<li id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</li>
							    <li id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" style="color: red">친구만</li>
							    <li id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)">나만보기</li>
						     </c:when>
							<c:when test="${news.n_show eq 3}">
								<li id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</li>
							    <li id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)">친구만</li>
							    <li id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" style="color: red">나만보기</li>
						     </c:when>
						</c:choose>

					  </ul>
		 </div>
		</td>
</tr>

<tr>
	<td colspan="3"  align=left>
		<pre width="50px">${news.n_content}</pre>
		
			<c:if test="${news.n_tag_where ne NULL}">
				<strong>${news.n_tag_where}</strong>&nbsp;에서
			</c:if>
			
			<c:if test="${news.n_tag_friend ne NULL}">
				&nbsp;&nbsp;&nbsp;<strong>${news.n_tag_friend}</strong>&nbsp;님과 함께
			</c:if>
			
			<c:if test="${news.n_tag_feel ne NULL}">
				&nbsp;&nbsp;&nbsp;나는 지금
				<c:choose>
					<c:when test="${news.n_tag_feel eq 1}"><strong>기뻐요</strong><img src="image/happy.jpg" width="5px" height="5px"></c:when>
					<c:when test="${news.n_tag_feel eq 2}"><strong>슬퍼요</strong><img src="image/sad.jpg"></c:when>
					<c:otherwise><strong>피곤해요</strong><img src="image/tired.jpg"></c:otherwise>
				</c:choose>
			</c:if>	
	</td>
</tr>

<c:if test="${news.n_form_num eq 1}" >
		<tr>
			<td colspan="3"  align=left>${news.n_form_num }</td>
		</tr>
</c:if>

<tr>
	
	<td colspan="3"  align=left>
	<i class="fa fa-thumbs-o-up" id="like_btn${news.n_seq }"  aria-hidden="true" onclick="test(${news.n_seq })"  style="color: black"></i> 
	<a  id="like_btn_second${news.n_seq }"  onclick="test(${news.n_seq })" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<i class="fa fa-comment-o" aria-hidden="true" onclick="showComment(${news.n_seq })"></i> 
	<a onclick="showComment(${news.n_seq })" style="color: black">댓글달기</a>
	</td>
</tr>


<tr id="show_like_member${news.n_seq }" style="display: none">
	<td colspan="3"  align=left>
	<div id="like_member">
		좋아요 멤버 출력
	</div>
	</td>
</tr>

<tr id ="show_comment${news.n_seq }" style="display: none;">
	<td>프사사진</td>
	<td colspan="2">
	<input type="text"  style="width:100%;"/>
	</td>
</tr>


</table>
</div>

</c:if>

 </c:forEach> 
 
 <div id="scrolling">
</div>



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
	$("#nowFeel").append("<input type='hidden' name='n_tag_feel' value="+val+">");
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
	$("#_frmForm").attr({"target":"_self", "action":"writeNewsFeed.do"}).submit();
});





function test(val){

	status = $("#like_btn"+val).css("color");
	if(status=="rgb(255, 0, 0)"){
		$(" #like_btn"+val).css("color","black");
		$(" #like_btn_second"+val).css("color","black");
		$("#show_like_member"+val).css("display","none");
		
	}else{
		$(" #like_btn"+val).css("color","red");
		$(" #like_btn_second"+val).css("color","red");
		$("#show_like_member"+val).css("display","");
	}
}

function showComment(val){
	
	 status = $("#show_comment"+val).css("display");
	 if(status=="none"){
		$("#show_comment"+val).css("display","");
	 }else{
		 $("#show_comment"+val).css("display","none");
	 }
}

function updateShow(val){
	 $.ajax({
		type: 'GET',
		url:'updateShow.do',
		data:{'val':val},
	 })
	
}

function changeShow(val,val2){
/* 	$("#total").css("color","yellow"); */
	if(val2=="1"){
		$("#dropdown-menu-"+1+"-"+val).css("color","red");
		$("#dropdown-menu-"+2+"-"+val).css("color","black");
		$("#dropdown-menu-"+3+"-"+val).css("color","black");
	}else if(val2=="2"){
		$("#dropdown-menu-"+1+"-"+val).css("color","black");
		$("#dropdown-menu-"+2+"-"+val).css("color","red");
		$("#dropdown-menu-"+3+"-"+val).css("color","black");
	}else if(val2=="3"){
		$("#dropdown-menu-"+1+"-"+val).css("color","black");
		$("#dropdown-menu-"+2+"-"+val).css("color","black");
		$("#dropdown-menu-"+3+"-"+val).css("color","red");
	}
}

function removeNews(val){
	 $.ajax({
			type: 'GET',
			url:'deleteNews.do',
			data:{'val':val},
		    success: function(data) {
		    	$(".newsfeed_list_table"+val).css("display","none");
		    },
            error: function(data) {
               alert("removeNews error");
            }
		 });
}



</script>

 


</body>
</html>
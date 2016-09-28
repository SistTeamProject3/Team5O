<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
 			async: false ,
 			cache: false,
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

</script>


<c:if test="${fn:length(NewsFeedList) eq 0}">
리스트 DB값 없음
</c:if>


<c:if test="${fn:length(NewsFeedList) ne 0}">
<input type="hidden" name="m_id" value="${login.m_id }" >

<c:forEach var="news" items="${NewsFeedList }" varStatus="i"> 

<c:if test="${news.n_del ne 1 }">
<c:if test="${news.n_step eq 0}">

<br><br>

<div class="table" data-seq="${news.n_seq }" id="newsfeedlist_top${news.n_seq }">
${news.n_seq }
<table class="newsfeed_list_table${news.n_seq }" style="width: 80%"  border="1px solid black">

<tr>
		<td width=80px; rowspan="2">프사사진</td>
		<td align=left>작성자 : ${news.m_id}</td>
		<td>
		 
		 <select name="update_select">
		 	<option value=""><삭제/수정></option>
		 	<option  value="삭제" onclick="removeNews('${news.n_seq}')" >삭제</option>
		 	<option value="수정" data-toggle="modal" data-target=".yss">수정</option>
		 </select>

		</td>
</tr>
<tr>
		<td align=left>작성시간 : ${news.n_wdate}</td>
		<td>
			
		  <select class="dropdown-menu4" id="total">
			<c:choose>
							<c:when test="${news.n_show eq 1}"> 
								<option value=""><공개 대상></option>
								<option id="dropdown-menu-1-${news.n_seq }"   style="color: red" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)" >전체</option>
							    <option id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" >친구만</option>
							    <option id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" >나만보기</option>
						     </c:when>
							<c:when test="${news.n_show eq 2}">
								<option value=""><공개 대상></option>
								<option id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</option>
							    <option id="dropdown-menu-2-${news.n_seq }" style="color: red" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" >친구만</option>
							    <option id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)">나만보기</option>
						     </c:when>
							<c:when test="${news.n_show eq 3}">
								<option value=""><공개 대상></option>
								<option id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</option>
							    <option id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)">친구만</option>
							    <option id="dropdown-menu-3-${news.n_seq }" style="color: red"  value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" >나만보기</option>
						     </c:when>
						</c:choose>
		</select>
			 
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
			<td colspan="3"  align=left>
			<img alt="이미지없음" src="upload/${news.filename }" width="200px" height="200px"><br>
			</td>
		</tr>
</c:if>

<tr>
	<td colspan="3"  align=left>
		<i class="fa fa-thumbs-o-up" id="like_btn${news.n_seq }"  aria-hidden="true" onclick="like_btn_second(${news.n_seq })"  style="color: black"></i> 
		<a id="like_btn_second${news.n_seq }"  onclick="like(${news.n_seq },'${news.m_id }')" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	<input type="text"  style="width:100%;" id="n_content${news.n_seq }" name="n_content" onkeydown="onKeyDown_comment('${news.n_seq }')">
	</td>
	
</tr>

<%-- <tr id="nowComment${news.n_seq }" >
</tr>

<tr id="nowComment2${news.n_seq }">
</tr> --%>
</table>
</div>


<div id="newsfeedlist_bottom${news.n_seq }">
<table class="newsfeed_list_table2${news.n_seq }"  >
<c:forEach var="news2" items="${NewsFeedList }" varStatus="j"> 
	<c:if test="${news.n_seq eq news2.n_parent}">	
		<tr class="comment2${news.n_seq }" style="display: none;">
			<td rowspan="2">프사</td>
			<td colspan="2" align="left">&nbsp;<Strong>${news2.m_id }</Strong> &nbsp;&nbsp;${news2.n_content }</td>
		</tr>
		<tr class="comment3${news.n_seq }" style="display: none;" align="left">
			<td colspan="2">&nbsp;<a>좋아요</a>&nbsp;·&nbsp;<a>답글달기</a>&nbsp;·&nbsp;${news2.n_wdate }</td>
		</tr>
	</c:if>
</c:forEach>
</table>
</div>


</c:if>
</c:if>
</c:forEach> 

</c:if>

<div id="scrolling">
</div>




<script type="text/javascript">

function like(val, val2){
		$.ajax({
		type: 'GET',
		url:'Like.do',
		data:{'seq':val , 'm_id':val2},
		async: false ,
		cache: false,
		success: function(data) {
			alert(data[0]);
	    },
	    error: function(data) {
			alert("like error");
	    } 
	}); 

	status = $("#like_btn"+val).css("color");
	if(status=="rgb(255, 0, 0)"){
		$(" #like_btn"+val).css("color","black");
		$(" #like_btn_second"+val).css("color","black");
		$("#show_like_member"+val).css("display","none");
		
	}else{
		$(" #like_btn"+val).css("color","red");
		$(" #like_btn_second"+val).css("color","red");
		$("#show_like_member"+val).show();
	};
}

function showComment(val){
	 status = $("#show_comment"+val).css("display");
	 if(status=="none"){
		$(".comment2"+val).show();
		$(".comment3"+val).show();
		$("#show_comment"+val).show();
	 }else{
		 $(".comment2"+val).hide();
		 $(".comment3"+val).hide();
		 $("#show_comment"+val).hide();
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
		    	$(".newsfeed_list_table"+val).hide();
		    	$(".newsfeed_list_table2"+val).hide();
		    },
            error: function(data) {
               alert("removeNews error");
            }
		 });
}

function onKeyDown_comment(val)
{
    if(event.keyCode == 13)
    {

 	var s = "<tr><td rowspan='2'>프사</td><td colspan='2' align='left'>&nbsp;<Strong>${login.m_id }</Strong> &nbsp;&nbsp;"+
 	$("#n_content"+val).val()+"</td></tr><tr><td colspan='2' align='left'>&nbsp;<a>좋아요</a>&nbsp;·&nbsp;<a>답글달기</a>&nbsp;·&nbsp;방금전</td></tr>";
	
 	$("#newsfeedlist_bottom"+val).prepend(s); 
	
	var content = $("#n_content"+val).val();
   	 $.ajax({
			type: 'GET',
			data:{'n_seq':val, 'n_content':content, 'm_id':'${login.m_id }'},
			url:'writeComment.do',
   	 });
   	
   	 $("#n_content"+val).val("");
   }
}

</script>
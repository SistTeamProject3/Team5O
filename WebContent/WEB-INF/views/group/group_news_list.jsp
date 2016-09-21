<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<script type="text/javascript">
/*  $(window).bind('scroll', function(){
      if ($(window).scrollTop() == $(document).height() - $(window).height()){
           add3();
      }   
});
 */
/* function add3(){
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
                alert("1error");
            }
         }); 
} */
$(function() {
     $("#ta").keyup(function () {
       $(this).css("height","5px").css("height",(20+$(this).prop("scrollHeight"))+"px");
     });
});
</script>

<table class="newsfeed_list_table${news.n_seq }" style="width: 100%"  border="1px solid black">

<tr>
      <td width=80px; rowspan="2">프사사진</td>
      <td align=left>작성자 : ${news.m_id}</td>
      <td>
         <div class="dropdown">
                <button type="button" data-toggle="dropdown">
             <span class="caret"></span></button>
                 <ul class="dropdown-menu">
                   <li value="1">삭제</li>
                   <li value="2">수정</li>
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
<!--    <div id="like_btn"> -->
   <i class="fa fa-thumbs-o-up" id="like_btn${news.n_seq }"  aria-hidden="true" onclick="test(${news.n_seq })"  style="color: black"></i> <a  id="like_btn_second${news.n_seq }"  onclick="test(${i.count})" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment-o" aria-hidden="true" onclick="showComment(${news.n_seq })"></i> <a onclick="showComment(${news.n_seq })" style="color: black">댓글달기</a>
   <!-- </div> -->
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

<script type="text/javascript">

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
   alert("val="+val);
    $.ajax({
      type: 'GET',
      url:'updateShow.do',
      data:{'val':val},
      success:function(){
         alert("success");
      },
      error:function(){
         alert("2error");
      }
    })
   
}

function changeShow(val,val2){
   alert("val="+val);
   alert("val2="+val2);
   $("#total").css("color","red");
   status = $("#dropdown-menu-"+val2+"-"+val1).css("color");
   $("#dropdown-menu-"+val2+"-"+val1).css("color","red");

}

</script>
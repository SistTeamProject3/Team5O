<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />

<style>

.menu_table 
li.menu_item
a:hover{
	background-image:url("<%=request.getContextPath()%>/image/arrow.gif");
	background-repeat:no-repeat;
	background-position:5px 7px;
	background-color:#000000;
}
</style> 


	left_bbslist

	
<div class="menu_table">
	<ul style="width:100%;">
		<li class="menu_item">
			<a href="#none" onclick="location.href='group_list.do'" title="그룹">그룹</a>
		</li>
		<li class="menu_item">
		 		<a data-toggle="modal" data-target="#myModal">그룹 만들기</a>
		</li>
	</ul>
</div>
<!-- 여기부터 모달 입니다. -->

<div class="container">
 
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <jsp:include page="/WEB-INF/views/group/group_make.jsp"></jsp:include>
        </div>
        <div class="modal-body">
        	
        </div>
     
      </div>
      
    </div>
  </div>
  
</div>

<!-- 여기까지 모달 입니다. -->

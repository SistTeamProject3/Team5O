<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>


 <style>
textarea
{
  width:98%;
}
  </style>
  
  
</head>
<body>
WRITE
<table class="ys_write_table" style="width: 100%" border="1px solid black">
	<tr>
		<td colspan="3">상태</td>
	</tr>
	
	<tr>
		<td>프사</td>
		<td colspan="2"><textArea style="overflow: hidden"></textArea></td>
	</tr>
	
	<tr>
		<td>함께한 친구</td>
		<td colspan="2"><textArea style="overflow: hidden"></textArea></td>
	</tr>
	
	<tr>
		<td>나는지금</td>
		
		<td colspan="2">
			<div id="page">
				<form method="post" action="">
			
					<select name="fancySelect" class="makeMeFancy">
				        <option value="0" selected="selected" data-skip="1">나는지금</option>
			        	<option value="1" data-icon="image/happy.jpg" data-html-text="기쁨">나는 지금 기뻐요</option>
			        	<option value="2" data-icon="image/sad.jpg" data-html-text="슬픔">나는 지금 슬퍼요</option>
			        	<option value="3" data-icon="image/tired.jpg" data-html-text="피곤">나는 지금 피곤해요</option>
			        </select>
   				</form>

			</div>
		</td>
	</tr>
	


	<tr>
		<td>장소</td>
			<td colspan="2"><textArea style="overflow: hidden"></textArea></td>
	</tr>
	
	
	<tr>
	<td colspan="2">
		<span class="fa fa-camera-retro fa-2x"></span>
		<span class="fa fa-users fa-2x"></span>
		<span class="fa fa-smile-o fa-2x"></span>
		<span class="fa fa-map-marker fa-2x"></span>
	</td>
	

	
	<td>
		<select name="show">
			<option value="친구만">친구만</option>
			<option value="전체공개">전체공개</option>
			<option value="나만보기">나만보기</option>
		</select>
			
		<img alt="게시하기" src="image/temp.jpg">
	</td>
	</tr>
	
	
	
</table>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	// The select element to be replaced:
	var select = $('select.makeMeFancy');

	var selectBoxContainer = $('<div>',{
		width		: select.outerWidth(),
		className	: 'tzSelect',
		html		: '<div class="selectBox"></div>'
	});

	var dropDown = $('<ul>',{className:'dropDown'});
	var selectBox = selectBoxContainer.find('.selectBox');

	// Looping though the options of the original select element

	select.find('option').each(function(i){
		var option = $(this);

		if(i==select.attr('selectedIndex')){
			selectBox.html(option.text());
		}

		// As of jQuery 1.4.3 we can access HTML5
		// data attributes with the data() method.

		if(option.data('skip')){
			return true;
		}

		// Creating a dropdown item according to the
		// data-icon and data-html-text HTML5 attributes:

		var li = $('<li>',{
			html:	'<img src="'+option.data('icon')+'" /><span>'+
					option.data('html-text')+'</span>'
		});

		li.click(function(){

			selectBox.html(option.text());
			dropDown.trigger('hide');

			// When a click occurs, we are also reflecting
			// the change on the original select element:
			select.val(option.val());

			return false;
		});

		dropDown.append(li);
	});

	selectBoxContainer.append(dropDown.hide());
	select.hide().after(selectBoxContainer);

	// Binding custom show and hide events on the dropDown:

	dropDown.bind('show',function(){

		if(dropDown.is(':animated')){
			return false;
		}

		selectBox.addClass('expanded');
		dropDown.slideDown();

	}).bind('hide',function(){

		if(dropDown.is(':animated')){
			return false;
		}

		selectBox.removeClass('expanded');
		dropDown.slideUp();

	}).bind('toggle',function(){
		if(selectBox.hasClass('expanded')){
			dropDown.trigger('hide');
		}
		else dropDown.trigger('show');
	});

	selectBox.click(function(){
		dropDown.trigger('toggle');
		return false;
	});

	// If we click anywhere on the page, while the
	// dropdown is shown, it is going to be hidden:

	$(document).click(function(){
		dropDown.trigger('hide');
	});
});


</script>
</body>
</html>
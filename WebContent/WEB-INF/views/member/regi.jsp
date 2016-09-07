<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form class="form-horizontal">
  <fieldset>
    <legend>Legend</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="inputEmail">아이디</label>
      <div class="col-lg-10">
        <!-- <input class="form-control" id="inputEmail" type="text" placeholder="Email" size="20;"> -->
      	<input class="form-control" id="_id" type="text" name="m_id" size="20">
      	<select>
      		<option>@hanmail.net</option>
      		<option>@naver.com</option>
      		<option>@hanmail.net</option>
      	</select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="_pwd">비밀번호</label>
      <div class="col-lg-10">
        <input class="form-control" id="_pwd" type="password" placeholder="Password">
        <div class="checkbox">
          <!-- <label> -->
            <input type="checkbox"> Checkbox
          <!-- </label> -->
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="textArea">Textarea</label>
      <div class="col-lg-10">
        <textarea class="form-control" id="textArea" rows="3"></textarea>
        <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label">Radios</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input name="optionsRadios" id="optionsRadios1" type="radio" checked="" value="option1">
            Option one is this
          </label>
        </div>
        <div class="radio">
          <label>
            <input name="optionsRadios" id="optionsRadios2" type="radio" value="option2">
            Option two can be something else
          </label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="select">Selects</label>
      <div class="col-lg-10">
        <select class="form-control" id="select">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
        </select>
        <br>
        <select class="form-control" multiple="">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button class="btn btn-default" type="reset">Cancel</button>
        <button class="btn btn-primary" type="submit">Submit</button>
      </div>
    </div>
  </fieldset>
</form>


</body>
</html>
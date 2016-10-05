<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>

<table style="width: 100%; height: auto;" border="1">
<tr>
<td>
<%-- <video src="upload/${vdto.nf_video }" style="width: 100%; height: auto;"></video> --%>
<video controls="controls" class="videoclass" data-set="upload/${vlist.nf_video }" style="width: 95%; height: auto;">
    <source src="upload/${vdto.nf_video }" type="video/mp4" />
</video>
</td>
</tr>
</table>
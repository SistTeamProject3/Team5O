<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>


<table style="width: 100%; height: auto;" class="table table-bordered">
<tr>
<td>
<%-- <video src="upload/${vdto.nf_video }" style="width: 100%; height: auto;"></video> --%>
<video controls="controls" class="videoclass" id="video${vdto.n_seq }" data-set="upload/${vdto.nf_video }" style="width: 95%; height: auto;" >
    <source src="upload/${vdto.nf_video }" type="video/mp4" />
</video>
</td>
</tr>
</table>
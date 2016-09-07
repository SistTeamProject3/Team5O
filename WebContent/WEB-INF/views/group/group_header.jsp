<%@ page contentType="text/html; charset=UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<style>
.div_header {
	position: relative;
}

.bottomright {
	position: absolute;
	bottom: 8px;
	right: 16px;
	font-size: 18px;
}

.bottomleft {
	position: absolute;
	bottom: 0px;
	left: 16px;
}

.center {
	position: absolute;
	left: 0;
	top: 50%;
	width: 100%;
	text-align: center;
	font-size: 12pt;
}
</style>
<div style="width: 100%; border: 1px solid black;">
	<div class="div_header"
		style="width: 100%; height: 250px; border: 1px solid black;">

		<!-- 1.그룹 가입여부에따른 다른 창 보여줄예정(조건문 걸기) -->
		<div class="center">
			<div style="border: 1px solid red;" align="center">
				<h6>그룹의 개성을 가장 잘 나타내는 사진을 한 장 고르세요.</h6>
		
			</div>
		</div>

		<!-- 1.여기까지 -->
		<div class="bottomleft">
			<h4>
				<a href="">${Mdto.g_name}</a>
			</h4>
			<c:if test="${Mdto.g_type eq 1}">
				<h5>
					<a href="">공개 그룹</a>
				</h5>
			</c:if>
			<c:if test="${Mdto.g_type eq 2}">
				<h5>
					<a href="">비공개 그룹</a>
				</h5>
			</c:if>
			<c:if test="${Mdto.g_type eq 3}">
				<h5>
					<a href="">비밀 그룹</a>
				</h5>
			</c:if>
		</div>
		<div class="bottomright">
			<button>가입함</button>
		</div>
	</div>
	<div>
		<div style="width: 60%; float: left; border: 1px solid black;">
			<button>토론</button>
			<button>멤버</button>
			<button>이벤트</button>
			<button>사진</button>
			<button>파일</button>
		</div>
		<div style="width: 40%; float: left; border: 1px solid black;">
			<input type="text" placeholder="이 그룹 검색" value="">
			<button>검색</button>
		</div>
	</div>
</div>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.div_join2 {
		margin-top:30px;
	}
	.div_title {
		margin-bottom: 65px;
	}
	.div_admin_menu {
		width:1400px;
		text-align:center;
		margin-top:50px;
	}
	.page_title {
		font-size:16px;
		font-weight:bold;
		letter-spacing:3px;
		color:#000000;
	}
	.div_btn {
		display:inline-block;
		width:900px;
		margin-top:30px;
		margin-bottom:30px;
		text-align:right;
	}
	.input_del {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	.div_category {
		margin-top:30px;
		font-size:14px;
	}
	.div_tb_product table {
		font-size:12px;
	}
	.tb_product {
		align:center;
		border:1px solid #d9d9d9;
		border-collapse:collapse;
		width:900px;
		font-size:14px;
	}
	.tb_product td {
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
	.div_img {
		float:left;
		vertical-align:middle;
	}
	.div_product_name {
		float:left;
		margin-top:35px;
		margin-bottom:30px;
		margin-left:10px;
	}
	.frm_btn {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	.div_pageNum {
		margin-top:30px;
		margin-bottom:30px;
	}
	.input_search {
		border:1px solid #d9d9d9;
		width:300px;
		height:25px;
	}
</style>

<section class="container2">
<%@ include file ="/include/connection.jsp" %>
<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

<script>
function levelSet(userid) {
	alert(userid+"의 레벨변경");
}
</script>


<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > <a href="/admin/index">ADMINPAGE</a> > 회원관리
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">ADMINPAGE<span>
	</div>
	<div style="margin-bottom:50px;">
	총 ${count}명의 회원이 있습니다.
	</div>
	<div class="div_tb_product">
		<table border=1 class="tb_product" align=center>
			<tr style="height:30px">
				<td align=center width=150px>아이디</td>
				<td align=center width=150px>이름</td>
				<td align=center width=300px>이메일</td>
				<td align=center width=100px>이메일 수신여부</td>
				<td align=center width=80px>레벨</td>
			</tr>
		<c:forEach var="list" items="${list}">
			<tr class="row_checkbox">
				<td align=center>${list.userid}</td>
				<td align=center>${list.name}</td>
				<td align=center>${list.email}</td>
				<td align=center>${list.email_re}</td>
				<td align=center>${list.level}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div class="div_pageNum">
		<c:if test="${count>0 }">
			<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
			<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
			<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
			<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->		
			<!-- 2개의 변수 초기화 -->
			<c:set var="startPage" value="${1 }" />
			<c:set var="pageBlock" value="${3 }" />	
			<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
			<c:if test="${pageNum > pageBlock }">
				<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
				<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
				<c:set var="startPage" value="${result * pageBlock + 1 }" />
			</c:if>	
			<!-- endPage 값 설정 부분 -->
			<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
			<c:if test="${endPage > pageCount }">
				<c:set var="endPage" value="${pageCount }" />
			</c:if>		
			<!-- 이전 링크 -->
			<c:if test="${startPage > pageBlock }">
				<a href="${category}?pageNum=${startPage - pageBlock }&field=${field}&search=${search}">[이전] </a>
			</c:if>		
			<!-- 페이징 링크 -->
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a href="${category}?pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;"><font color=black><b>[${i }]</b></font></span></a>
					</c:when>
					<c:otherwise>
						<a href="${category}?pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
			<!-- 다음 링크 -->
			<c:if test="${endPage < pageCount }">
				<a href="${category}?pageNum=${startPage + pageBlock }&field=${field}&search=${search}">[다음] </a>
			</c:if>
		</c:if>
	</div>
	<div>
		<form method="get">
		<table align=center>
			<tr>
				<td>
					<select name="field" style="width:90px;height:25px">
						<option value='userid' <c:if test="${field == 'userid'}">selected</c:if>>아이디</option>
						<option value='name' <c:if test="${field == 'name'}">selected</c:if>>이름</option>
						<option value='email' <c:if test="${field == 'email'}">selected</c:if>>이메일</option>
					</select>
				</td>
				<td>
					<input class="input_search" name="search" value="${search}">
				</td>
				<td>
					<button class="frm_btn" style="width:50px;height:25px">검색</button>
				</td>
			</tr>
		</table>
		</form>
	</div>

</div>

</main>

<%@ include file = "/include/footer.jsp" %>



</section>

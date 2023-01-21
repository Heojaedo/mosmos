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
function itemDel() {
	if(confirm("삭제하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}

$(document).ready(function () {
	Allcheck();
});

function Allcheck() {
	$("#allcheckbox").click(function() {
		if($("#allcheckbox").is(":checked")) {
			$("input[name=itemCheck]").prop("checked", true);
		} else {
			$("input[name=itemCheck]").prop("checked", false);
		}
	});
}

function checkedItemDel() {
	var checkItem = new Array();
	
	if($("input[name=itemCheck]:checked").length == 0) {
		alert("상품을 선택해주세요.");
		return;
	}
	
	for(var i=0;i<$("input[name=itemCheck]:checked").length;i++) {
		checkItem[i] = $("input[name=itemCheck]:checked").eq(i).val();
	}
	
	location.href="/admin/CheckedItemDelete?no="+checkItem;
}
</script>

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > <a href="/admin/index">ADMINPAGE</a> > 상품관리
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">ADMINPAGE<span>
	</div>

	<div class="div_category">
		<a href="/admin/itemList">전체 &nbsp;&nbsp;&nbsp;</a>
		<a href="/admin/itemList?category=giftset">선물세트 &nbsp;&nbsp;&nbsp;</a>
		<a href="/admin/itemList?category=beans">원두 &nbsp;&nbsp;&nbsp;</a>
		<a href="/admin/itemList?category=dripbag">드립백 &nbsp;&nbsp;&nbsp;</a>
		<a href="/admin/itemList?category=coldbrew">콜드브루 RTD &nbsp;&nbsp;&nbsp;</a> 
		<a href="/admin/itemList?category=capsule">캡슐 </a>
	</div>
	
	<div class="div_btn">
		<input class="input_del" type="button" value="상품 등록하기" onclick="location.href='/admin/regist'">
		<input class="input_del" type="button" value="선택 상품 삭제" onclick="return checkedItemDel()">
	</div>
	
	<div class="div_tb_product">
		<table border=1 class="tb_product" align=center>
			<tr style="height:30px">
				<td align=center><input type="checkbox" id="allcheckbox"></td>
				<td align=center width="50px">NO</td>
				<td align=center width="500px">상품명</td>
				<td align=center width="125px">가격</td>
				<td align=center width="125px">배송료</td>
				<td align=center width="100px"></td>
			</tr>
		<c:set var="i" value="${number}"/>
		<c:forEach var="list" items="${list}">
			<tr class="row_checkbox">
				<td align=center><input type="checkbox" name="itemCheck" value="${list.uid}"></td>
				<td align=center>${i}</td>
				<td>
					<div class="div_img">
						<a href="/product/${list.category1}?no=${list.uid}">
							<c:choose>
								<c:when test="${list.file1_s != ''}">
									<img class="product_img" src="/upload/${list.file1_s}">
								</c:when>
								<c:otherwise>
									<img src="/image/NoImage.jpg" style="width:100px;height:100px;object-fit:cover;">
								</c:otherwise>
							</c:choose>
						</a>
					</div>
					<div class="div_product_name"><a href="/product/${list.category1}?no=${list.uid}">${list.name}</a><br>${list.subname}</td></div>
				<td align=center><fmt:formatNumber value="${list.price}"/>원</td>
				<td align=center><fmt:formatNumber value="${list.delivery}"/>원</td>
				<td align=center>
					<form action="/admin/itemModify" method="post">
					<input type="hidden" name="item_uid" value="${list.uid}">
					<button class="frm_btn">수정</button>
					</form>
					<form action="/admin/itemDelete" method="post" onsubmit="return itemDel()">
					<input type="hidden" name="item_uid" value="${list.uid}">
					<button class="frm_btn">삭제</button>
					</form>
				</td>
			</tr>
		<c:set var="i" value="${i-1}"/>
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
				<a href="${category}?pageNum=${startPage - pageBlock }">[이전] </a>
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
				<a href="${category}?pageNum=${startPage + pageBlock }">[다음] </a>
			</c:if>
		</c:if>
	</div>
	<div>
		<form method="get">
		<input type="hidden" name="category" value="${category}">
		<table align=center>
			<tr>
				<td>
					<select name="field" style="width:90px;height:25px">
						<option value='name' <c:if test="${field == 'name'}">selected</c:if>>상품명</option>
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

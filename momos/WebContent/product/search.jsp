<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.div_join2 {
		margin-top:30px;
	}
	.div_title {
		margin-bottom: 65px;
	}
	.page_title {
		font-size:16px;
		font-weight:bold;
		letter-spacing:3px;
		color:#000000;
	}
	.div_admin_menu {
		width:1400px;
		margin-top:50px;
		text-align:center;
	}
	.table_border {
		font-size:12px;
		border:1px solid #d9d9d9;
		border-collapse:collapse;
		width:1400px;
		height:250px;
	}
	.table_search {
		border:0px;
		font-size:12px;
		width:500px;
	}
	.search_text {
		margin-top:50px;
		width:1400px;
		text-align:center;
		color: red;
	}
	.div_search_result {
		display: inline-flex;
		justify-content:flex-start;
		align-items:center;
		flex-wrap:wrap;
		position: relative;
		top: 10px;
		right: 25px;
	}
	
	#search_btn{
		background-color: #343434;
		color: #FFFFFF;
		border: solid 1px #343434;
		cursor: pointer;
		width:80px;
	}
	#search_btn2{
		background-color: #FFFFFF;
		color: #343434;
		border: solid 1px #343434;
		cursor: pointer;
		width:80px;
	}
</style>

<%@ include file="/include/connection.jsp" %>
<section class="container2">
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/aside.jsp" %>
<main class="main1">

<script>

</script>

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > SEARCH
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">SEARCH<span>
	</div>
	<div class="div_table">
		<form action="/product/search_result" method="get">
			<table class="table_border">
				<tr>
					<td align=center>
						<table class="table_search">
							<tr>
								<td>상품분류</td>
								<td>
									<select name="category">
										<option selected disabled>상품분류선택</option>
										<option value="giftset">선물세트</option>
										<option value="beans">원두</option>
										<option value="dripbag">드립백</option>
										<option value="coldbrew">콜드브루 RTD</option>
										<option value="capsule">캡슐</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>검색조건</td>
								<td>
									<select name="field">
										<option value="name" <c:if test="${field == 'name'}">selected</c:if>>상품명</option>
										<option value="subname" <c:if test="${field == 'subname'}">selected</c:if>>키워드</option>
									</select>
									<input name="search" value="${search}">
								</td>
							</tr>
							<tr>
								<td>판매가격대</td>
								<td>
								<input name="minprice" value="${minprice}">~
								<input name="maxprice" value="${maxprice}">
								</td>
							</tr>
							<tr>
								<td>검색정렬기준</td>
								<td>
									<select name="sort">
										<option value="sort_method4">신상품순</option>
										<option value="sort_method1">상품명순</option>
										<option value="sort_method2">낮은가격순</option>
										<option value="sort_method3">높은가격순</option>
									</select>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input id="search_btn" type="submit" value="SEARCH">
									<input id="search_btn2" type="button" value="RESET" onclick="location.href='/product/search'">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>


</div>
	<div class="page2">
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
				<a href="search_result?pageNum=${startPage - pageBlock }&category=${category}&field=${field}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&sort=${sort}"><img src ="/image/btn_page_prev.gif"></a>
			</c:if>		
			<!-- 페이징 링크 -->
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a href="search_result?pageNum=${i }&category=${category}&field=${field}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&sort=${sort}"><span style="padding:0px 4px;"><font color=black><b>[${i }]</b></font></span></a>
					</c:when>
					<c:otherwise>
						<a href="search_result?pageNum=${i }&category=${category}&field=${field}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&sort=${sort}"><span style="padding:0px 4px;">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
			<!-- 다음 링크 -->
			<c:if test="${endPage < pageCount }">
				<a href="search_result?pageNum=${startPage + pageBlock }&category=${category}&field=${field}&search=${search}&minprice=${minprice}&maxprice=${maxprice}&sort=${sort}"><img src ="/image/btn_page_next.gif"></a>
			</c:if>
		</c:if>
	</div>
<div class="search_text">
	<c:if test="${count != null}">총 ${count}개의 상품이 검색되었습니다.</c:if>
</div>
<div class="div_search_result">
	<c:forEach var="list" items="${list}">
		<div id="div_item" class="div_item">
			<ul>
				<li class="file1_size">
				<a href="/product/${list.category1}?no=${list.uid}">
				<c:choose>
					<c:when test="${list.file1 != ''}">
					<img src="/upload/${list.file1 }">
					</c:when>
					<c:otherwise>
					<img src="/image/NoImage.jpg">
					</c:otherwise>
				</c:choose>
				</a>
				</li>
				<li class="list_line"><a href="/product/${list.category1}?no=${list.uid}">${list.name}</a></li>
				<li class="list_line2">${list.subname}</li>
				<li><fmt:formatNumber value="${list.price}"/>원</li>
			</ul>
		</div>
	</c:forEach>



</main>
<%@ include file="/include/footer.jsp" %>
</section>
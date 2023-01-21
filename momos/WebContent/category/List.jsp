<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="/include/connection.jsp" %>

<section class="container2">

<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span>
		<c:choose>
			<c:when test="${category eq 'giftset'}">
				<a href="/category/giftset">> 선물세트</a>
			</c:when>
			<c:when test="${category eq 'beans'||category eq 'blend'||category eq 'estate'||category eq 'easytomake'}">
				<a href="/category/beans">> 원두</a>
			</c:when>
			<c:when test="${category eq 'dripbag'}">
				<a href="/category/dripbag">> 드립백</a>
			</c:when>
			<c:when test="${category eq 'coldbrew'}">
				<a href="/category/coldbrew">> 콜드브루 RTD</a>
			</c:when>
			<c:when test="${category eq 'capsule'}">
				<a href="/category/capsule">> 캡슐</a>
			</c:when>
		</c:choose>
 
</div>

<div id="div_list">
	<div id="div_title">
		<c:choose>
			<c:when test="${category eq 'giftset'}">
				<h3 class="join_title_main"><a href="/category/category">선물세트</a></h3><br>
			</c:when>
			<c:when test="${category eq 'beans'||category eq 'blend'||category eq 'estate'||category eq 'easytomake'}">
				<h3 class="join_title_main"><a href="/category/beans">원두</a></h3><br>
			</c:when>
			<c:when test="${category eq 'dripbag'}">
				<h3 class="join_title_main"><a href="/category/dripbag">드립백</a></h3><br>
			</c:when>
			<c:when test="${category eq 'coldbrew'}">
				<h3 class="join_title_main"><a href="/category/coldbrew">콜드브루 RTD</a></h3><br>
			</c:when>
			<c:when test="${category eq 'capsule'}">
				<h3 class="join_title_main"><a href="/category/capsule">캡슐</a></h3><br>
			</c:when>
		</c:choose>
	</div>
	<div id="div_beansCategory" class="beans_category">
		<c:if test="${category eq 'beans'||category eq 'blend'||category eq 'estate'||category eq 'easytomake'}">
			<a href="/category/blend">시그니처 블렌드</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/category/estate">싱글 에스테이트</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/category/easytomake">EASY TO MAKE</a>
		</c:if>
	</div>
	<div id="div_count" class="soon2">${count} items in this category.</div>
	<div id="div_sort" class="soon">
		<a href="/category/${category}">신상품순</a>｜ 
		<a href="/category/${category}?sort_method=1">이름순</a>｜ 
		<a href="/category/${category}?sort_method=2">낮은 가격순</a>｜
		<a href="/category/${category}?sort_method=3">높은 가격순</a>
	</div>
	<div class="div_parents">
	<c:forEach var="list" items="${list}">
		<div id="div_item" class="div_item">
			<ul>
				<c:choose>
					<c:when test="${list.file1 != ''}">
						<li class="file1_size"><a href="/product/${list.category1}?no=${list.uid}"><img src="/upload/${list.file1 }"></a></li>
					</c:when>
					<c:otherwise>
						<li class="file1_size"><a href="/product/${list.category1}?no=${list.uid}"><img src="/image/NoImage.jpg"></a></li>
					</c:otherwise>
				</c:choose>
				<li class="list_line"><a href="/product/${list.category1}?no=${list.uid}">${list.name}</a></li>
				<li class="list_line2">${list.subname}</li>
				<li><fmt:formatNumber value="${list.price}"/>원</li>
			</ul>
		</div>
	</c:forEach>
	</div>
	<div id="page4">
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
				<a href="${category}?pageNum=${startPage - pageBlock }"><img src ="/image/btn_page_prev.gif"></a>
			</c:if>		
			<!-- 페이징 링크 -->
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a href="${category}?pageNum=${i }"><span style="padding:0px 4px;"><font color=black><b>[${i }]</b></font></span></a>
					</c:when>
					<c:otherwise>
						<a href="${category}?pageNum=${i }"><span style="padding:0px 4px;">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
			<!-- 다음 링크 -->
			<c:if test="${endPage < pageCount }">
				<a href="${category}?pageNum=${startPage + pageBlock }"><img src ="/image/btn_page_next.gif"></a>
			</c:if>
		</c:if>
	</div>
</div>

</main>

<%@ include file = "/include/footer.jsp" %>



</section>
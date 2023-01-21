<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/include/connection.jsp" %>

<section class="container2">

<%@ include file="/include/header.jsp" %>

<%@ include file="/include/aside.jsp" %>

<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main"><a href="/board/qna">Q&A</a></h3><br>

<style>
	.qna_table {
		font-size: 12px;
	}
</style>

<div>
	<div></div>
	<div>
		<table style="margin-left: 30px;" class="qna_table">
			<hr class="community_hr">
			<tr class="community_title2">
				<td>NO</td>
				<td>PRODUCT</td>
				<td id="sub">SUBJECT</td>
				<td>NAME</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>
			<hr class="community_hr" style="position: relative; top: 20px;">
			<c:set var="i" value="${number}"/>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>
						<div style="height:10px;"></div>
					</td>
				</tr>
				<tr>
					<td align=center>${i}</td>
					<td align=center>
						<c:if test="${list.item_uid != 0}"><a href="/product/${list.item_category}?no=${list.item_uid}">${list.item_name}</a></c:if>
					</td>
					<td style="text-indent:20px;">
						<c:choose>
							<c:when test="${list.secret == 'on'}">
								<a href="/board/secret?url=/article/qna?no=${list.uid}">${list.subject}</a>
							</c:when>
							<c:otherwise>
								<c:if test="${list.thread != 'A'}">&nbsp;&nbsp;&nbsp;<img src="/image/ico_re.gif"></c:if>
								<a href="/article/qna?no=${list.uid}">${list.subject}</a>
							</c:otherwise>
						</c:choose>
						<c:if test="${list.secret == 'on'}"><img src="/image/ico_lock.gif"></c:if>
					</td>
					<td align=center>${list.name}</td>
					<td align=center>${fn:substring(list.signdate,0,10)}</td>
					<td align=center>${list.ref}</td>
				</tr>
				<tr>
					<td>
						<div style="height:10px;"></div>
					</td>
				</tr>
			<c:set var="i" value="${i-1}"/>
			</c:forEach>
		</table>
		<hr class="community_hr">
	</div>
	<div>
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
			<div class="page">
			<!-- 이전 링크 -->
			<c:if test="${startPage > pageBlock }">
				<a href="${category}?pageNum=${startPage - pageBlock }&field=${field}&search=${search}"><img src ="/image/btn_page_prev.gif"></a>
			</c:if>		
			<!-- 페이징 링크 -->
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a style="position: relative; top: -12px; display: inline;" href="${category}?pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;"><font color=black><b>[${i }]</b></font></span></a>
					</c:when>
					<c:otherwise>
						<a style="position: relative; top: -12px; display: inline;" href="${category}?pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				
			<!-- 다음 링크 -->
			<c:if test="${endPage < pageCount }">
				<a href="${category}?pageNum=${startPage + pageBlock }&field=${field}&search=${search}"><img src ="/image/btn_page_next.gif"></a>
			</c:if>
			</div>	
		</c:if>
	</div>
	<div> 
		<form method="get">
			<div class="community_search">
			<select name="field">
				<option value='subject' <c:if test="${field == 'subject'}">selected</c:if>>제목</option>
				<option value='contents' <c:if test="${field == 'contents'}">selected</c:if>>내용</option>
				<option value='name' <c:if test="${field == 'name'}">selected</c:if>>글쓴이</option>
				<option value='item_name' <c:if test="${field == 'item_name'}">selected</c:if>>상품명</option>
			</select>
			<input name="search" value="${search}">
			<button>검색</button>
			</div>
		</form>
		<form action="/board/qnawrite" method="post">
				<input type="hidden" name="session_id" value="${sessionScope.userid}">
				<input type="hidden" name="session_name" value="${sessionScope.name}">
				<input type="hidden" name="session_level" value="${sessionScope.level}">
				<button id="qna_btn">글쓰기</button>
		</form>
		
	</div>
</div>

</main>

<%@ include file="/include/footer.jsp" %>

</section>
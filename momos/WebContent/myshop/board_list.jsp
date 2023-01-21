<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function board_list(str){
	location.href="/myshop/board_list?code="+str;
}
</script>


<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>

<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > BOARD
</div>
<h3 class="join_title_main">BOARD</h3><br>


<c:choose>
<c:when test="${count == 0 }">
<span class="no_wish">작성한 게시물이 없습니다.</span>
</c:when>

<c:otherwise>
<div style="position: relative; left: 30px;">
<table style="font-size: 12px;">
	<tr>
		<td>
			분류선택: <select id="code" name="code" onchange="board_list(this.value)">
				<option value="">선택</option>
				<option value="N" <c:if test="${code == 'N' }">selected</c:if>>REVIEW</option>
				<option value="Y" <c:if test="${code == 'Y' }">selected</c:if>>Q&A</option>
			</select>
		</td>
	</tr>
</table>
<hr class="community_hr" style="position: relative; left: -110px;">

<table class="orderform2" style="font-size: 12px;">
	<tr style="position: relative; top: -8px; font-weight: bold;">
		<td>번호</td>
		<td>분류</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회</td>
	</tr>
	<hr class="community_hr" style="position: relative; left: -110px; top: 25px;">
	<c:forEach var="board" items="${list }">
	<tr id="board_line">	
		<td>${board.uid }</td>
		<td>
			<c:choose>
				<c:when test="${board.review == 'Y'}">
					<a href="/board/review">REVIEW</a>
				</c:when>
				<c:otherwise>
					<a href="/board/qna">Q&A</a>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${board.review == 'Y'}">
				<a href="/article/review?no=${board.uid }">${board.subject }</a>
				</c:when>
				<c:otherwise>
				<a href="/article/qna?no=${board.uid }">${board.subject }</a>	
				</c:otherwise>
			</c:choose>
		</td>
		<td>${board.name }</td>
		<td>${fn:substring(board.signdate,0,10)}</td>
		<td>${board.ref }</td>
	</tr>
	</c:forEach>
</table>
<hr class="community_hr" style="position: relative; left: -110px;">
<!-- 페이징 처리 -->
<table class="orderform2" style="font-size: 12px;">
	<tr>
		<td align=center>
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
					<a href="board_list?&pageNum=${startPage - pageBlock }">[이전] </a>
				</c:if>
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="board_list?code=${code}&pageNum=${i }"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="board_list?code=${code}&pageNum=${i }"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="board_list?code=${code }&pageNum=${startPage + pageBlock }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
<!-- 페이징 처리 끝  -->

<!-- 검색 -->
<form method="get">
<table class="orderform2" style="font-size: 12px;">
	<tr>
		<td align=center>
			<select name="field">
				<option value="subject" <c:if test="${field == 'subject'}">selected</c:if>>제목</option>
				<option value="contents" <c:if test="${field == 'contents'}">selected</c:if>>내용</option>
			</select>
			<input name="search" value="${search }">
			<button>검색</button>
		</td>
	</tr>
</table>
</form>
<!-- 검색 끝  -->
</div>
</c:otherwise>
</c:choose>
</script>
</main>

<%@ include file = "/include/footer.jsp" %>

</section>
</body>
</html>
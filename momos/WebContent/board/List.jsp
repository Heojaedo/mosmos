<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="/include/connection.jsp" %>
<section class="container2">
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/aside.jsp" %>
<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > ${category_title}
</div>
<h3 class="join_title_main"><a href="/board/${category}">${category_title}</a></h3><br>

<style>
	.qna_table {
		width: 1350px;
		font-size: 12px;
	}
	.qna_table2 {
		width: 1350px;
		font-size: 12px;
	}
	.tr_title {
		font-size: 12px;
		text-align: center;
		font-weight: bold;
	}
	.qna_hr {
		background-color: #D7D5D5;
		border: 0px;
		height: 1px;
	}
</style>

<div>
	<div></div>
	<div>
		<table class="qna_table" style="margin-left:25px;">
			<tr>
				<td colspan=5><hr class="qna_hr"></td>
			</tr>
			<tr class="tr_title">
				<td width=100px>NO</td>
				<td width=800px>SUBJECT</td>
				<td width=150px>NAME</td>
				<td width=150px>DATE</td>
				<td width=150px>HIT</td>
			</tr>
			<tr>
				<td colspan=5><hr class="qna_hr"></td>
			</tr>
			<c:forEach var="notice" items="${notice}">
				<tr>
					<td>
						<div style="height:10px;"></div>
					</td>
				</tr>
				<tr>
					<td align=center style="font-weight: bold; color: blue;">공지</td>
					<td style="text-indent:50px;"><a href="/article/${category}?no=${notice.uid}">${notice.subject}</a></td>
					<td align=center>${notice.name}</td>
					<td align=center>${fn:substring(notice.signdate,0,10)}</td>
					<td align=center>${notice.ref}</td>
				</tr>
				<tr>
					<td>
						<div style="height:10px;"></div>
					</td>
				</tr>
				<tr>
				<td colspan=5><hr class="qna_hr"></td>
				</tr>
			</c:forEach>
			<c:set var="i" value="${number}"/>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>
						<div style="height:10px;"></div>
					</td>
				</tr>
				<tr>
					<td align=center>${i}</td>
					<td style="text-indent:50px;"><a href="/article/${category}?no=${list.uid}">${list.subject}</a></td>
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
			<tr>
				<td colspan=5><hr class="qna_hr"></td>
			</tr>
			</c:forEach>
		</table>
		<table class="qna_table2" style="margin-left:25px;">
			<tr>
				<td width=425px align=left>
					<div class="community_search">
					<form method="get">
						<input type="hidden" name="category" value="${category}">
						<input type="hidden" name="session_id" value="${sessionScope.userid}">
						<input type="hidden" name="session_name" value="${sessionScope.name}">
						<input type="hidden" name="session_level" value="${sessionScope.level}">
						<input type="hidden" name="category" value="${category}">
						<input type="hidden" name="category_title" value="${category_title}">
						
						<select name="field">
							<option value='subject' <c:if test="${field == 'subject'}">selected</c:if>>제목</option>
							<option value='contents' <c:if test="${field == 'contents'}">selected</c:if>>내용</option>
							<option value='name' <c:if test="${field == 'name'}">selected</c:if>>글쓴이</option>
						</select>
						<input name="search" value="${search}">
						<button>검색</button>
					</form>
					</div>
				</td>
				<td width=500px align=center>
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
							<a href="${category}?pageNum=${startPage - pageBlock }&field=${field}&search=${search}"><img src ="/image/btn_page_prev.gif" style="vertical-align:middle"></a>
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
							<a href="${category}?pageNum=${startPage + pageBlock }&field=${field}&search=${search}"><img src ="/image/btn_page_next.gif" style="vertical-align:middle"></a>
						</c:if>
					</c:if>
				</td>
				<td width=425px>
				<div class="div_com_btn">
					<form action="/board/write" method="post">
						<input type="hidden" name="category" value="${category}">
						<input type="hidden" name="session_id" value="${sessionScope.userid}">
						<input type="hidden" name="session_level" value="${sessionScope.level}">
						<c:if test="${sessionScope.level == '10' }">
								<button id="comm_btn">작성</button>
						</c:if>
					</form>
				</div>
				</td>
			</tr>
		
		</table>
	</div>

</div>

<style>
	.div_com_btn {
		position:relative;
		right:-350px;
	}
</style>

</main>

<%@ include file="/include/footer.jsp" %>

</section>


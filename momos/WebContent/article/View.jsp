<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="container2">
<%@ include file ="/include/connection.jsp" %>
<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

<style>
	.div_admin_menu {
		width:1300px;
		margin-top:50px;
		margin-left:50px;
	}
	.tb_iteminfo {
		border:1px solid #d9d9d9;
	}
	.div_itemImg {
		float:left;
		margin-right:30px;
	}
	.div_iteminfo {
		margin-top:10px;
		margin-botton:10px;
		margin-left:30px;
	}
	.div_clear {
		clear:both;
		margin-top:50px;
	}
	.div_admin_menu table {
		font-size:12px;
	}
	.div_post table {
		font-size:12px;
	}
	.frm_btn {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	.div_contents {
		padding:30px;
	}
	.div_btn_table {
		margin-top:30px;
	}
	.div_post_table {
		margin-top:30px;
	}
	.post_table {
		width:1280px;
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
	.post_table td {
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
</style>

<script>
	function board_delete() {
		if(confirm('삭제하시겠습니까?')) {
			return true;
		} else {
			return false;
		}
	}
</script>

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > ${category_title}
</div>
<h3 class="join_title_main"><a href="/board/notice">${category_title}</a></h3><br>

<div class="div_admin_menu">
	<div><hr></div>
	<div>
		<table>
				<tr>
					<td width=100px>제목</td>
					<td>${subject}</td>
				</tr>
		</table>
	</div>
	<div><hr></div>
	<div> 
		<table>
				<tr>
					<td width=100px>작성자</td>
					<td>${name}</td>
				</tr>
		</table>
	</div>
	<div><hr></div>
	<div>
		<table>
			<tr>
				<td width=300px>작성일&nbsp;&nbsp;&nbsp;${signdate}</td>
				<td>조회수&nbsp;&nbsp;&nbsp;${ref}</td>
			</tr>
		</table>
	</div>
	<div><hr></div>
	<div class="div_contents">${contents}</div>
	<div><hr></div>
	<div class="div_btn_table">
		<table width=1300px>
			<tr>
				<td align=left>
					<button class="frm_btn" type="button" onclick="location.href='/board/${category}'">목록</button>
				</td>
				<form action="/board/modify" method="post">
				<td width=45px align=center>
					<c:if test="${sessionScope.level == '10'}">
						
						<input type="hidden" name="post_uid" value="${uid}">
						<input type="hidden" name="category" value="${category}">
						<input type="hidden" name="category_title" value="${category_title}">
						<button class="frm_btn">수정</button>
						
					</c:if>
				</td>
				</form>
				<form action="/board/delete" method="post" onsubmit="return board_delete()">
				<td width=45px align=center>
					<c:if test="${sessionScope.level == '10'}">
						
						<input type="hidden" name="post_uid" value="${uid}">
						<input type="hidden" name="category" value="${category}">
						<input type="hidden" name="category_title" value="${category_title}">
						<button class="frm_btn">삭제</button>
						
					</c:if>
				</td>
				</form>
				
			</tr>
		</table>
	</div>
	<div class="div_post_table">
		<table class="post_table" border=1 width=1280px align=center>
			<tr>
				<td width=100px height=35px align=center>다음글</td>
				<td>
					<c:choose>
						<c:when test="${notice == 'on'}">
							<c:if test="${nextnoticesubject == null}">다음글이 없습니다.</c:if>
							<c:if test="${nextnoticesubject != null}"><a href="/article/${category}?no=${nextnoticeuid}">${nextnoticesubject}</a></c:if></div>
						</c:when>
						<c:otherwise>
							<c:if test="${nextsubject == null}">다음글이 없습니다.</c:if>
							<c:if test="${nextsubject != null}"><a href="/article/${category}?no=${nextuid}">${nextsubject}</a></c:if></div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td width=100px height=35px align=center>이전글</td>
				<td>
					<c:choose>
						<c:when test="${notice == 'on'}">
							<c:if test="${prenoticesubject == null}">이전글이 없습니다.</c:if>
							<c:if test="${prenoticesubject != null}"><a href="/article/${category}?no=${prenoticeuid}">${prenoticesubject}</a></c:if></div>
						</c:when>
						<c:otherwise>
							<c:if test="${presubject == null}">이전글이 없습니다.</c:if>
							<c:if test="${presubject != null}"><a href="/article/${category}?no=${preuid}">${presubject}</a></c:if></div>
						</c:otherwise>	
					</c:choose>
				</td>
			</tr>
		</table> 
	</div>

</div>

</main>

<%@ include file = "/include/footer.jsp" %>



</section>










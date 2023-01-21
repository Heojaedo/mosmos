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
		margin-top:10px;
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
</style>

<%@ include file="/include/connection.jsp" %>
<section class="container2">
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/aside.jsp" %>
<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main"><a href="/board/notice">Q&A</a></h3><br>
<div class="div_admin_menu">
	<div class="div_table">
			<table class="table_border">
				<tr>
					<td align=center>
						<form action="/board/secretCheck" method=post>
						<input type="hidden" name="qna_id" value="${qna_id}">
						<input type="hidden" name="fid_id" value="${firstfid_id}">
						<input type="hidden" name="session_level" value="${sessionScope.level}">
						<input type="hidden" name="preurl" value="${preurl}">
						<table class="table_search">
							<tr>
								<td align=center>이글은 비밀글입니다. 비밀번호를 입력하여주세요.</td>
							</tr>
							<tr>
								<td align=center>관리자는 확인버튼만 누르시면 됩니다.</td>
							</tr>
							<tr>
								<td align=center>> 비밀번호 <input name="pass" value=""></td>
							</tr>
							<tr>
								<td align=center>
									<input type="button" onclick="location.href='/board/qna'" value="목록">
									<input type="submit" value="확인">
								</td>
							</tr>
						</table>
						</form>
					</td>
				</tr>
			</table>
	</div>
</div>



</main>
<%@ include file="/include/footer.jsp" %>
</section>
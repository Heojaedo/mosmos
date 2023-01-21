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
	.div_table {
		display:inline-block;
	}
	.table_admin_menu {
		border:1px solid #d9d9d9;
		border-collapse:collapse;
		width:1350px;
		font-size:12px;
	}
	.table_admin_menu td {
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
</style>

<section class="container2">
<%@ include file ="/include/connection.jsp" %>
<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > MYPAGE
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">MYPAGE<span>
	</div>
	<div class="div_table">
		<table class="table_admin_menu">
			<tr>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/myshop/order/list">ORDER LIST</a></p>
					<p><a href="/myshop/order/list">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.<br/>비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</a></p>
				</td>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/member/modify">PROFILE</a></p>
					<p><a href="/member/modify">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br/>개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</a></p>
				</td>
			</tr>
			<tr>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/myshop/wish_list">WISH LIST</a></p>
					<p><a href="/myshop/wish_list">관심상품으로 등록하신 상품의 목록을 보여드립니다.</a></p>
				</td>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/myshop/board_list">BOARD</a></p>
					<p><a href="/myshop/board_list">고객님께서 작성하신 게시물을 관리하는 공간입니다.<br/>고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</a></p>
				</td>
			</tr>
		</table>
	</div>
</div>


</main>
<%@ include file = "/include/footer.jsp" %>
</section>





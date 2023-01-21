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
<span class="home"><a href="/">HOME</a></span> > ADMINPAGE
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">ADMINPAGE<span>
	</div>
	<div class="div_table">
		<table class="table_admin_menu">
			<tr>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/admin/itemList">ITEM LIST</a></p>
					<p><a href="/admin/itemList">상품 관리 페이지입니다.<br/>상품을 등록,수정,삭제하실 수 있습니다.</a></p>
				</td>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/admin/memberList">MEMBER LIST</a></p>
					<p><a href="/admin/memberList">회원 리스트를 볼 수 있습니다.</a></p>
				</td>
			</tr>
			<tr>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="/admin/orderList">ORDER LIST</a></p>
					<p><a href="/admin/orderList">주문 관리 페이지입니다.<br/>회원들의 주문 리스트를 볼 수 있습니다.</a></p>
				</td>
				<td style="width:725px;height:190px;" align="center">
					<p><a href="">메뉴 준비중</a></p>
					<p><a href="">메뉴 준비중</a></p>
				</td>
			</tr>
		</table>
	</div>
</div>

</main>

<%@ include file = "/include/footer.jsp" %>



</section>




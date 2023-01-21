<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

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
	.input_regist {
		border:1px solid #d9d9d9;
		width:250px;
		height:25px;
	}
	.frm_btn {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	.div_admin_menu table {
		font-size:12px;
	}
</style>
<script>
	function cate1(cate) {
		$.ajax({
			url: "regist_category1", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "category1="+cate, //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				$("#category2").html(text);
			}
		});
	}
	function productRegist() {
		$.ajax({
			url: "regist_productnameBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productName="+$("#productName").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productName_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productName_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productsubnameBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productSubname="+$("#productSubname").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productSubname_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productSubname_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productpriceBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productPrice="+$("#productPrice").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productPrice_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productPrice_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productdeliveryBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productDelivery="+$("#productDelivery").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productDelivery_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productDelivery_text").html("");
				}				
			}
		});
		if(productName.value == "") {
			return false;
		}
		if(productSubname.value == "") {
			return false;
		}
		if(productPrice.value == "") {
			return false;
		}
		if(productDelivery.value == "") {
			return false;
		}
	}
</script>

<section class="container2">
<%@ include file ="/include/connection.jsp" %>
<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > <a href="/admin/index">ADMINPAGE</a> > 상품관리
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">ADMINPAGE<span>
	</div>
	
	<div>
	<form action="/admin/regist_insert" method="post" enctype="multipart/form-data" onsubmit="return productRegist()">
		<table class="table_regist" align=center style="width:620px">
			<tr>
				<td width=310px align=center>
					<select name="productCate1" onchange="cate1(this.value)" style="height:25px">
						<option selected disabled>- [필수] 카테고리를 선택해주세요 -</option>
						<option disabled>---------------</option>
						<option value="beans">원두</option>
						<option value="dripbag">드립백</option>
						<option value="coldbrew">콜드브루 RTD</option>
						<option value="capsule">캡슐</option>
					</select>
				</td>
				<td width=310px align=center>
					<span id="category2">
					</span>
				</td>
			</tr>
		</table>
		<table align=center style="margin-top:10px;width:480px">
			<tr>
				<td>
					<input type="checkbox" name="productGiftset" id="gift"> 
					<label for="gift">선물세트</label>
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productName">상품명 </label>
				</td>
				<td>
					<input class="input_regist" id="productName" name="productName" value="">
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="productName_text"></span></td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productSubname">상품 설명 </label>
				</td>
				<td>
					<input class="input_regist" id="productSubname" name="productSubname" value="">
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="productSubname_text"></span></td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productPrice">가격 </label>
				</td>
				<td>
					<input class="input_regist" id="productPrice" name="productPrice" value="" pattern="\d*" title="숫자만 입력하세요.">원
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="productPrice_text"></span></td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productDelivery">배송료 </label>
				</td>
				<td>
					<input class="input_regist" id="productDelivery" name="productDelivery" value="2500" readonly>원
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="productDelivery_text"></span></td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<input type="file" name="productImg" style="border:0px;">
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<button class="frm_btn">상품등록</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
</main>

<%@ include file = "/include/footer.jsp" %>



</section>
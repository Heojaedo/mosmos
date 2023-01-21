<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
		width:320px;
		height:25px;
	}
	.input_imgModi {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	.frm_btn {
		border:1px solid #d9d9d9;
		cursor:pointer;
	}
	#img_regist {
		display:none;
	}
</style>


<section class="container2">
<%@ include file ="/include/connection.jsp" %>
<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">

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

		function img_modify() {
			$("#img_regist").show();
		}

</script>

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > <a href="/admin/index">ADMINPAGE</a> > 상품관리
</div>
<div class="div_admin_menu">
	<div class="div_title">
		<span class="page_title">ADMINPAGE<span>
	</div>
	
	<div>
	<form action="/admin/itemModify_insert" method="post" enctype="multipart/form-data" onsubmit="return productRegist()">
	<input type="hidden" name="item_uid" value="${item_uid}">
		<table align=center style="width:620px">
			<tr>
				<td width=310px align=center>
					<select name="productCate1" onchange="cate1(this.value)">
						<option selected disabled>- [필수] 카테고리를 선택해주세요 -</option>
						<option disabled>---------------</option>
						<option value="beans" <c:if test="${item_cate1 == 'beans'}">selected</c:if>>원두</option>
						<option value="dripbag" <c:if test="${item_cate1 == 'dripbag'}">selected</c:if>>드립백</option>
						<option value="coldbrew" <c:if test="${item_cate1 == 'coldbrew'}">selected</c:if>>콜드브루 RTD</option>
						<option value="capsule" <c:if test="${item_cate1 == 'capsule'}">selected</c:if>>캡슐</option>
					</select>
				</td>
				<td width=310px align=center>
					<span id="category2">
						<c:if test="${item_cate2 != ''}">
							<select name="productCate3" style="height:25px"> 
								<option selected disabled>- [필수] 상세 카테고리를 선택해 주세요 -</option> 
								<option disabled>---------------</option>
								<option value="blend" <c:if test="${item_cate2 == 'blend'}">selected</c:if>>시그니처 블렌드</option>
								<option value="estate" <c:if test="${item_cate2 == 'estate'}">selected</c:if>>싱글 에스테이트</option>
								<option value="easytomake" <c:if test="${item_cate2 == 'easytomake'}">selected</c:if>>EASY TO MAKE</option>
							</select>
						</c:if>
					</span>
				</td>
			</tr>
		</table>
		<table align=center style="margin-top:30px;width:480px">
			<tr>
				<td>
					<input type="checkbox" name="productGiftset" id="gift" <c:if test="${item_gift == 'on'}">checked</c:if>> 
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
					<input class="input_regist" id="productName" name="productName" value="${item_name}"><span id="productName_text"></span>
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productSubname">상품 설명 </label>
				</td>
				<td>
					<input class="input_regist" id="productSubname" name="productSubname" value="${item_subname}"><span id="productSubname_text"></span>
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productPrice">가격 </label>
				</td>
				<td>
					<input class="input_regist" id="productPrice" name="productPrice" value="${item_price}">원<span id="productPrice_text"></span>
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<label for="productDelivery">배송료 </label>
				</td>
				<td>
					<input class="input_regist" id="productDelivery" name="productDelivery" value="${item_delivery}">원<span id="productDelivery_text"></span>
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td>
					<input class="input_imgModi" type="button" value="이미지 변경하기" onclick="img_modify()">
				</td>
			</tr>
			<tr id="img_regist">
				<td colspan=2>
					<input type="file" name="productImg" value="상품 이미지 등록">
				</td>
			</tr>
			<tr>
				<td height=10px></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<button class="frm_btn">상품수정</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

</main>

<%@ include file = "/include/footer.jsp" %>



</section>
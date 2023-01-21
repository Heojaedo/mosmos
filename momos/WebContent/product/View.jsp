<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/include/connection.jsp" %>


<section class="container2">

<%@ include file="/include/header.jsp" %>
<%@ include file="/include/aside.jsp" %>



<script>
var item_op = new Array();
var totalprice = 0;
var totalcount = 0;

$(document).ready(function () {
	if(${category != 'beans'}) {
		opSelect();
	} else {
		beansSelect();
	}
});

function opSelect() {
	var op = "";
	$("#itemOption").change(function () {
		if($("#itemOption").val() == 'op1' && $("input[name=selectOp1]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op2' && $("input[name=selectOp2]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op1') {
			op = "기본발송";
			$("input[name=selectOp1]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus1()'><input id='item_count1' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus1()'></td>"+
					"<td rowspan='2'><input id='item_price1' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		} else {
			op = "선물포장";
			$("#selectOp2").attr('value','Y');
			$("input[name=selectOp2]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus2()'><input id='item_count2' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus2()'></td>"+
					"<td rowspan='2'><input id='item_price2' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		}
	})
}


function addcart() {
	if($("input[name=selectOp1]").val() == '' && $("input[name=selectOp2]").val() == '' && $("input[name=selectOp3]").val() == '' && $("input[name=selectOp4]").val() == '') {
		alert("상품을 선택해주세요.");
		return false;
	}
}

//beans
function beansSelect() {
	var op = "";
	
	$("#itemOption").change(function () {
		if($("#itemOption").val() == 'op1' && $("input[name=selectOp1]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op2' && $("input[name=selectOp2]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op3' && $("input[name=selectOp3]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op4' && $("input[name=selectOp4]").val() == 'Y') {
			alert("이미 선택된 옵션입니다.");
			return false;
		}
		if($("#itemOption").val() == 'op1') {
			op = "분쇄안함";
			$("input[name=selectOp1]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus1()'><input id='item_count1' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus1()'></td>"+
					"<td rowspan='2'><input id='item_price1' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		} else if($("#itemOption").val() == 'op2') {
			op = "핸드드랍";
			$("#selectOp2").attr('value','Y');
			$("input[name=selectOp2]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus2()'><input id='item_count2' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus2()'></td>"+
					"<td rowspan='2'><input id='item_price2' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		} else if($("#itemOption").val() == 'op3') {
			op = "커피메이커";
			$("#selectOp3").attr('value','Y');
			$("input[name=selectOp3]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus3()'><input id='item_count3' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus3()'></td>"+
					"<td rowspan='2'><input id='item_price3' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		} else if($("#itemOption").val() == 'op4') {
			op = "가정용더치";
			$("#selectOp4").attr('value','Y');
			$("input[name=selectOp4]").attr('value','Y');
			$("#div_itemOptionSelect").append("<div>"+
					"<table><tr>"+
					"<td>${itemName}</td>"+
					"<td rowspan='2'><input type='button' value='-' onclick='minus4()'><input id='item_count4' name='item_count' value='1' readonly><input type='button' value='+' onclick='plus4()'></td>"+
					"<td rowspan='2'><input id='item_price4' name='item_price' value='<fmt:formatNumber value='${itemPrice}'/>원' readonly style='width:120px'></td>"+
					"</tr><tr>"+
					"<td><input name='item_option' value='"+op+"'></td>"+
					"</tr></table></div>");
			totalprice += ${itemPrice};
			totalcount += 1;
			$("#div_allPrice").empty();
			$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
		}
	})
}

var total_price = 0;
var option_price = 0;

function minus1() {
	if($("input[id=item_count1]").val() == '1') {
		alert("최소수량은 1개입니다.");
		return false;
	}
	$("input[id=item_count1]").attr('value',$("input[id=item_count1]").val()-1);
	$("input[id=item_price1]").attr('value',$.number($("input[id=item_count1]").val() * ${itemPrice})+"원");
	totalprice -= ${itemPrice};
	totalcount -= 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function plus1() {
	$("input[id=item_count1]").attr('value',parseInt($("input[id=item_count1]").val())+1);
	$("input[id=item_price1]").attr('value',$.number($("input[id=item_count1]").val() * ${itemPrice})+"원");
	totalprice += ${itemPrice};
	totalcount += 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function minus2() {
	if($("input[id=item_count2]").val() == '1') {
		alert("최소수량은 1개입니다.");
		return false;
	}
	$("input[id=item_count2]").attr('value',$("input[id=item_count2]").val()-1);
	$("input[id=item_price2]").attr('value',$.number($("input[id=item_count2]").val() * ${itemPrice})+"원");
	totalprice -= ${itemPrice};
	totalcount -= 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function plus2() {
	$("input[id=item_count2]").attr('value',parseInt($("input[id=item_count2]").val())+1);
	$("input[id=item_price2]").attr('value',$.number($("input[id=item_count2]").val() * ${itemPrice})+"원");
	totalprice += ${itemPrice};
	totalcount += 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function minus3() {
	if($("input[id=item_count3]").val() == '1') {
		alert("최소수량은 1개입니다.");
		return false;
	}
	$("input[id=item_count3]").attr('value',$("input[id=item_count3]").val()-1);
	$("input[id=item_price3]").attr('value',$.number($("input[id=item_count3]").val() * ${itemPrice})+"원");
	totalprice -= ${itemPrice};
	totalcount -= 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function plus3() {
	$("input[id=item_count3]").attr('value',parseInt($("input[id=item_count3]").val())+1);
	$("input[id=item_price3]").attr('value',$.number($("input[id=item_count3]").val() * ${itemPrice})+"원");
	totalprice += ${itemPrice};
	totalcount += 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function minus4() {
	if($("input[id=item_count4]").val() == '1') {
		alert("최소수량은 1개입니다.");
		return false;
	}
	$("input[id=item_count4]").attr('value',$("input[id=item_count4]").val()-1);
	$("input[id=item_price4]").attr('value',$.number($("input[id=item_count4]").val() * ${itemPrice})+"원");
	totalprice -= ${itemPrice};
	totalcount -= 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
function plus4() {
	$("input[id=item_count4]").attr('value',parseInt($("input[id=item_count4]").val())+1);
	$("input[id=item_price4]").attr('value',$.number($("input[id=item_count4]").val() * ${itemPrice})+"원");
	totalprice += ${itemPrice};
	totalcount += 1;
	$("#div_allPrice").empty();
	$("#div_allPrice").append("총 상품금액(수량): "+$.number(totalprice)+"원("+totalcount+"개)");
}
</script>

<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span>
<c:if test="${category == 'beans'}"> > <a href="/category/beans">원두</a></c:if>
<c:if test="${category == 'dripbag'}"> > <a href="/category/dripbag">드립백</a></c:if>
<c:if test="${category == 'coldbrew'}"> > <a href="/categorycoldbrew">콜드브루 RTD</a></c:if>
<c:if test="${category == 'capsule'}"> > <a href="/category/capsule">캡슐</a></c:if>

</div>

<div id="div_item">
	<div id="div_itemImg" class="view_image">
		<c:choose>
			<c:when test="${itemImg != ''}">
				<img src="/upload/${itemImg}" style="object-fit:cover;">
			</c:when>
			<c:otherwise>
				<img src="/image/NoImage.jpg" style="object-fit:cover;">
			</c:otherwise>
		</c:choose>
	</div>
		<div id="div_itemContents">
		<div id="div_itemName">${itemName}</div>
		<div id="div_itemPrice">판매가 <fmt:formatNumber value="${itemPrice}"/>원</div>
		<div id="div_itemDelivery">배송비 <fmt:formatNumber value="${itemDelivery}"/>원</div>
		<div><hr class="view_hr"></div>
			<c:choose>
			<c:when test="${category == 'beans'}">
				<div id="div_option"><span class="package_select">분쇄상태</span>
					<select id="itemOption" name="itemOption" class="itemOption">
						<option selected disabled>- [필수] 옵션을 선택해주세요 -</option>
						<option disabled>---------------</option>
						<option value="op1">분쇄안함</option>
						<option value="op2">핸드드랍</option>
						<option value="op3">커피메이커</option>
						<option value="op4">가정용더치</option>
					</select>
				</div>
			</c:when>
			<c:otherwise>
				<div id="div_option"><span class="package_select" class="itemOption2">선물포장선택</span>
              		<select id="itemOption" name="itemOption" class="itemOption">
						<option selected disabled>- [필수] 옵션을 선택해주세요 -</option>
						<option disabled>---------------</option>
						<option value="op1">기본발송</option>
						<option value="op2">선물포장</option>
               		</select>
            	</div>
			</c:otherwise>
		</c:choose>
		<div class="div_ordercountText">(최소주문수량 1개 이상)</div>
		<input type="hidden" name="selectOp1" value="">
		<input type="hidden" name="selectOp2" value="">
		<input type="hidden" name="selectOp3" value="">
		<input type="hidden" name="selectOp4" value="">
		
		<form method="post" onsubmit="return addcart()">
		<input type="hidden" name="item_uid" value="${itemUid}">
		<input type="hidden" name="itemName" value="${itemName}">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="session_id" value="${sessionScope.userid}">
		<input type="hidden" name="cart_session" value="${sessionScope.cart}">
		<input type="hidden" name="item_delivery" value="${itemDelivery}">
		<input type="hidden" name="item_price2" value="${itemPrice}">
		
		<div class="option_select" id="div_itemOptionSelect"><hr class="view_hr2"></div>
		<div class="div_allprice" id="div_allPrice"></div>
		<br>
		<div id="div_buy"><input type="submit" class="view_btn1" value="바로 구매하기" onclick="javascript: form.action='/product/order';"/></div>
		<div id="div_cartbox"></div>
		<div id="div_addCart"><input type="submit" class="view_btn2" value="ADD TO CART" onclick="javascript: form.action='/product/addcart';"/></div>
		</form>
		<form action="/product/wishlist" method="post">
		<input type="hidden" name="item_uid" value="${itemUid}">
		<input type="hidden" name="item_user" value="${sessionScope.userid}">
		<input type="hidden" name="item_name" value="${itemName}">
		<input type="hidden" name="item_price" value="${itemPrice}">
		<input type="hidden" name="item_delivery" value="${itemDelivery}">
		<div id="div_wishList"><button class="view_btn3">WISH LIST</button></div>
		</form>
	</div>
</div>
		
	
<div id="viewQnaList">
<%@ include file="/board/viewQnaList.jsp" %>
</div>

<div id="ReviewList" style="margin-top:30px;">
<%@ include file="/board/viewReviewList.jsp" %>
</div>

<script>
function page_link(pageNo) {
		$.ajax({
			url: "/board/viewQnaPaging", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				$("#viewQnaList").empty();
				$("#viewQnaList").append(text);
			}
		});	
}
function qnaNextPage(pageNo) {
	$.ajax({
		url: "/board/viewQnaPaging", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#viewQnaList").empty();
			$("#viewQnaList").append(text);
		}
	});	
}
function qnaPrePage(pageNo) {
	$.ajax({
		url: "/board/viewQnaPaging", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#viewQnaList").empty();
			$("#viewQnaList").append(text);
		}
	});	
}
function page_link_re(pageNo) {
	$.ajax({
		url: "/board/viewReviewPaging", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#ReviewList").empty();
			$("#ReviewList").append(text);
		}
	});	
}
function qnaNextPage_re(pageNo) {
$.ajax({
	url: "/board/viewReviewPaging", //전송받을 페이지 경로
	type: "post", //데이터 읽어오는 방식
	dataType: "text", //데이터 방식
	data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
	error:function(){ //실패일 경우
		alert("실패");
	},
	success:function(text){ //성공일 경우
		$("#ReviewList").empty();
		$("#ReviewList").append(text);
	}
});	
}
function qnaPrePage_re(pageNo) {
$.ajax({
	url: "/board/viewReviewPaging", //전송받을 페이지 경로
	type: "post", //데이터 읽어오는 방식
	dataType: "text", //데이터 방식
	data: "item_uid=${itemUid}&item_name=${itemName}&category=${category}&pageNo="+pageNo, //데이터 전달
	error:function(){ //실패일 경우
		alert("실패");
	},
	success:function(text){ //성공일 경우
		$("#ReviewList").empty();
		$("#ReviewList").append(text);
	}
});	
}
</script>




</main>
<%@ include file="/include/footer.jsp" %>
</section>






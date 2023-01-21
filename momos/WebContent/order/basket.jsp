<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function checkall() {//체크박스 전체 선택 , 해제
	if(Form1.all.checked) {
		for(i=1; i < (document.Form1.length); i++){
			document.Form1.elements[i].checked = true;
		}
	}else{
		for(i=1; i < (document.Form1.length); i++){
			document.Form1.elements[i].checked = false;
		}
	}
}

//삭제... 
function check_select(){//체크박스 부분 선택
	myForm = document.getElementsByName("ap_check");
	myFormLen = myForm.length; //체크박스 전체수

	if(myFormLen==1){
		document.Form1.ap_check.checked = true;
		check_hide = document.Form1.ap_check.value;
		location.href="/order/basket_delete?str="+check_hide;
	} 

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	if(confirm('선택한 항목을 확인하시겠습니까?')){
		check_select2();
	} 
}


function check_select2(){//2개 이상의 리스트에서 체크된 값들
	var check_hide = new Array();

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		if(document.Form1.ap_check[i].checked == true) {
			check_hide[i] = document.Form1.ap_check[i].value;
		}
	}
	
	//alert(check_hide);//체크된 값들 확인
	location.href="/order/basket_delete?str="+check_hide;
}

function check_select_submit(num){//모두 체크된 값들
	myForm = document.getElementsByName("ap_check");
	myFormLen = myForm.length; //체크박스 전체수

	var check_hide = new Array();
	
	if(myFormLen==1){
		
		document.Form1.ap_check.checked = true;
		check_hide = document.Form1.ap_check.value;
		location.href="/order/order_insert?str="+check_hide;
		
	}else{
		
		for(var i = 0;  i < document.Form1.ap_check.length; i++) {
			if(document.Form1.ap_check[i].checked == true) {
				check_hide[i] = document.Form1.ap_check[i].value;
			}
		}
		
		//alert(check_hide);//체크된 값들 확인
		location.href="/order/order_insert?str="+check_hide;
	}
}
</script>

</head>
<body>
<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>


<main class="main1" >
<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > CART
</div>
<h3 class="join_title_main">CART</h3><br>


<%-- session_id : ${sessionScope.userid }
session_cart : ${sessionScope.cart } --%>

<form name="Form1" id="Form1">
<c:choose>
<c:when test="${count == 0}">
<span class="no_wish">장바구니 내역이 없습니다.</span>
</c:when>

<c:otherwise>
<input type="hidden" id="ap_check_hide" name="ap_check_hide">
<hr class="community_hr">
<table class="cart_table">
	<tr>
		<th><input type="checkbox" name="all" value="checkbox" onClick="checkall()"></th>
		<th>이미지</th>
		<th>상품정보</th>
		<th>판매가</th>
		<th>수량</th>
		<th>배송비</th>
		<th>합계</th>		
	</tr>
	<hr class="community_hr2">
	<c:set var="sum" value="${0 }"/>
	<c:forEach var="basket" items="${list}">
	<tr>
		<td><input type='checkbox' name='ap_check' value='${basket.cart_uid}'></td>
		<td>
			<c:choose>
				<c:when test="${basket.file1_s != ''}">
					<img src="/upload/${basket.file1_s }">
				</c:when>
				<c:otherwise>
					<img src="/image/NoImage.jpg" style="width:100px;height:100px;object-fit:cover;">
				</c:otherwise>
			</c:choose>
		</td>
		<td><a href="">${basket.item_name }</a><br>${basket.item_option }</td>
		<td><fmt:formatNumber value='${basket.price }'/>원</td>
		<td>${basket.item_num }</td>
		<td><fmt:formatNumber value='${basket.delivery }'/>원</td>
		<td>
		<fmt:formatNumber value='${basket.total}'/>원
		</td>		
	</tr>
	<c:set var="sum" value="${sum = sum + basket.total }"/>
	</c:forEach>
	<%-- <tr>
		<td colspan=7>합계:${sum }</td>
	</tr> --%>
</table>


<table class="cart_table2">
	<tr>
		<td>
			<input type="button" onClick="check_select();return false;" value="선택 상품 삭제">
		</td>
		<td>
			<input type="button" onclick="location.href='/order/basket_deleteall'" value="장바구니 비우기">
		</td>
	</tr>
</table>

<table class="cart_table3">
	<tr>
		<td>총 상품금액</td>
		<td>총 배송비</td>
		<td>결제예정금액</td>
		<td colspan=7><b>합계</b></td>
	</tr>
	<tr>
		<td><fmt:formatNumber value='${sum }'/>원</td>
		<td>
			<c:choose>
				<c:when test="${sum <= 30000 }">
					<c:set var="delivery" value="${2500 }"/>
					<fmt:formatNumber value="${delivery }"/>원
				</c:when>
				<c:otherwise>
					<c:set var="delivery" value="${0 }"/>
					<fmt:formatNumber value="${delivery }"/>원
				</c:otherwise>
			</c:choose>
		</td>
		<td><fmt:formatNumber value='${sum + delivery}'/>원</td>
		<td><b><fmt:formatNumber value='${sum + delivery}'/>원</b></td>
	</tr>
</table>
<hr class="community_hr" style="position: relative; top: -40px;">
<table class="cart_table4">
	<tr>
		<td><input style="cursor: pointer;" type="button" onclick="location.href='/order/order_insert'" value="전체상품주문"></td>
		<td><input style="cursor: pointer;" type="button" onclick="check_select_submit(1)" value="선택상품주문"></td>
	</tr>	
</table>
</c:otherwise>
</c:choose>
</form>

</main>

<%@ include file = "/include/footer.jsp" %>

</section>
</body>
</html>


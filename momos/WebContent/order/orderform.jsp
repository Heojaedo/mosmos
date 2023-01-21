<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/connection.jsp" %>

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
		location.href="/order/basket_back?str="+check_hide;
	} 

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 상품이 없습니다.");         
		return;
	}
	if(confirm('선택한 상품을 삭제하시겠습니까?')){
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
	location.href="/order/basket_back?str="+check_hide;
}


function order_insert(){
	if(name2.value == ""){
		alert("주문자 성함을 입력해주세요.");
		name2.focus();
		return false;
	}
	if(zipcode.value == ""){
		alert("주문자 주소를 입력해주세요.");
		zipcode.focus();
		return false;
	}
	if(address.value == ""){
		alert("주문자 주소를 입력해주세요.");
		address.focus();
		return false;
	}
	if(detailaddress.value == ""){
		alert("주문자 주소를 입력해주세요.");
		detailaddress.focus();
		return false;
	}
	if(phone2.value == ""){
		alert("주문자 전화번호를 입력해주세요.");
		phone2.focus();
		return false;
	}
	if(phone3.value == ""){
		alert("주문자 전화번호를 입력해주세요.");
		phone3.focus();
		return false;
	}
	if(email.value == ""){
		alert("주문자 이메일을 입력해주세요.");
		email.focus();
		return false;
	}
	if(name3.value == ""){
		alert("받으시는분 성함을 입력해주세요.");
		name3.focus();
		return false;
	}
	if(zipcode2.value == ""){
		alert("받으시는 분 주소를 입력해주세요.");
		zipcode2.focus();
		return false;
	}
	if(address2.value == ""){
		alert("받으시는 분 주소를 입력해주세요.");
		address2.focus();
		return false;
	}
	if(detailaddress3.value == ""){
		alert("받으시는 분 주소를 입력해주세요.");
		detailaddress3.focus();
		return false;
	}
	if(phone5.value == ""){
		alert("받으시는 분 전화번호를 입력해주세요.");
		phone5.focus();
		return false;
	}
	if(phone6.value == ""){
		alert("받으시는 분 전화번호를 입력해주세요.");
		phone6.focus();
		return false;
	}
	if(pay_name.value == ""){
		alert("입금자명을 입력해주세요.");
		pay_name.focus();
		return false;
	}
	if(pay_bank.value == ""){
		alert("입금은행을 선택해주세요.");
		pay_bank.focus();
		return false;
	}
	if(!purchase_agreement.checked){
		alert("이용약관에 동의해주세요.");
		purchase_agreement.focus();
		return false;
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
<span class="home"><a href="/">HOME</a></span> > ORDER
</div>
<h3 class="join_title_main">ORDER</h3><br>
<hr class="community_hr">
<hr class="community_hr" style="position: relative; top: 30px;">

<div id="all_orderform">
<form name="Form1" id="Form1">

<table class="orderform1">
	<tr class="th_font_m">
		<th><input type="checkbox" name="all" value="checkbox" onClick="checkall()"></th>
		<th>이미지</th>
		<th>상품정보</th>
		<th>판매가</th>
		<th>수량</th>
		<th>배송비</th>
		<th>합계</th>		
	</tr>

	<c:set var="sum" value="${0 }"/>
	<c:forEach var="basket" items="${list}">
	<tr class="tr_font_m">
		<td><input type='checkbox' name='ap_check' value='${basket.cart_uid }'><%-- ${basket.cart_uid } --%></td>
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
		<td>${basket.item_name }<br>[옵션 : ${basket.item_option }]</td>
		<td><fmt:formatNumber value="${basket.price }"/>원</td>
		<td>${basket.item_num }</td>
		<td><fmt:formatNumber value="${basket.delivery }"/>원</td>
		<td><fmt:formatNumber value="${basket.total }"/>원</td>		
	</tr>
	<c:set var="sum" value="${sum = sum + basket.total }"/>
	</c:forEach>
	<tr class="buy">
		<td colspan=7>
		상품구매금액: <fmt:formatNumber value="${sum }"/>원 + 배송비:
		<c:choose>
		<c:when test="${sum >= 30000 }">
		 0원 = 합계 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="bold_sum"><fmt:formatNumber value="${sum + 0}"/></span> 원
		</c:when>
		<c:otherwise>
		2,500원 = 합계 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="bold_sum"><fmt:formatNumber value="${sum + 2500}"/></span> 원
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>


<hr class="community_hr" style="position: relative; left: -105px; top: 10px;">

<table>
	<tr>
		<td>
			<input class="delete_btn" type="button" onClick="check_select();return false;" value="선택 상품 삭제">
		</td>
	</tr>
</table>

</form>

<form id="order" name="order" method="post" onsubmit="return order_insert()">
<div style="position: relative; left: 30px;">
<table id="t_font" style="font-size: 12px;">
	<tr>
		<td colspan=2><span>주문 정보</span><span style="position: relative; left: 1150px;"><img src="/image/ico_required.gif">필수입력사항</span></td>		
	</tr>
	<tr>
		<td>주문하시는 분<img src="/image/ico_required.gif"></td>
		<td><input id="name2" name="name2" value="${user.name }"></td>
	</tr>
	<tr>
		<td>주소<img src="/image/ico_required.gif"></td>
		<td>
			<input id="zipcode" name="zipcode" placeholder="우편번호" value="${user.zipcode}">
			<img src="/image/btn_zipcode.gif" onclick="sample6_execDaumPostcode()" style="margin-bottom: -9px; cursor: pointer;">
			<input id="address" name="address" placeholder="주소" value="${user.address }" style="display: block; margin-bottom: 5px; ">
			<input id="detailaddress" name="detailaddress" value="${user.detailaddress }" placeholder="상세주소" style="display: block; margin-bottom: 5px;">
			<input id="detailaddress2" name="detailaddress2" placeholder="참고항목" style="display: block;">
		</td>
	</tr>
	<tr>
		<td>휴대전화<img src="/image/ico_required.gif"></td>
		<td>
			<select id="phone1" name="phone1">
	            <option value="010">010</option>
	            <option value="011">011</option>
	            <option value="016">016</option>
	            <option value="017">017</option>
	            <option value="018">018</option>
	            <option value="019">019</option>
         	</select>
			-
			<input id="phone2" name="phone2" value="${user.phone2 }" size=4 >
			-
			<input id="phone3" name="phone3" value="${user.phone3 }" size=4 >
			
		</td>
	</tr>
	<tr>
		<td>이메일<img src="/image/ico_required.gif"></td>
		<td><input id="email" name="email" value="${user.email }"></td>
	</tr>
</table>
<hr class="community_hr" style="position: relative; left: -130px;">
<table id="t_font" style="font-size: 12px;">
	<tr>
		<td colspan=2><span>배송 정보</span><span style="position: relative; left: 1150px;"><img src="/image/ico_required.gif">필수입력사항</span></td>		
	</tr>
	<tr>
		<td>받으시는 분<img src="/image/ico_required.gif"></td>
		<td><input id="name3" name="name3"></td>
	</tr>
	<tr>
		<td>주소<img src="/image/ico_required.gif"></td>
		<td>
			<input id="zipcode2" name="zipcode2" placeholder="우편번호" >
			<img src="/image/btn_zipcode.gif" onclick="sample7_execDaumPostcode()" style="margin-bottom: -9px; cursor: pointer;">
			<input id="address2" name="address2" placeholder="주소" style="display: block; margin-bottom: 5px; ">
			<input id="detailaddress3" name="detailaddress3" placeholder="상세주소" style="display: block; margin-bottom: 5px;">
			<input id="detailaddress4" name="detailaddress4" placeholder="참고항목" style="display: block;">
		</td>
	</tr>
	<tr>
		<td>휴대전화<img src="/image/ico_required.gif"></td>
		<td>
			<select id="phone4" name="phone4">
	            <option value="010">010</option>
	            <option value="011">011</option>
	            <option value="016">016</option>
	            <option value="017">017</option>
	            <option value="018">018</option>
	            <option value="019">019</option>
         	</select>
			-
			<input id="phone5" name="phone5" size=4 value="">
			-
			<input id="phone6" name="phone6" size=4 value="">
			
		</td>
	</tr>
	<tr>
		<td>배송메세지<img src="/image/ico_required.gif"></td>
		<td><input type="text" maxlength="30" id="shippingmsg" name="shippingmsg"></td>
	</tr>
</table>
<hr class="community_hr" style="position: relative; left: -130px;">

<table id="t_font" style="font-size: 12px;">
	<tr>
		<td colspan=2><span>결제 예정 금액</span></td>		
	</tr>
	<tr id="td_margin">
		<td>총 주문금액</td>
		<td>총 배송비</td>
		<td>결제예정금액</td>
	</tr>
	<tr id="td_margin">
		<td>&nbsp;<span class="total_one"><fmt:formatNumber value="${sum }"/></span>원</td>
		<td>
			<c:choose>
			<c:when test="${sum >= 30000 }">
			&nbsp;<span class="total_one">0</span>원
			</c:when>
			<c:otherwise>
			&nbsp;<span class="total_one">2,500</span>원
			</c:otherwise>
			</c:choose>
		</td>
		<td>
		<c:choose>
		<c:when test="${sum >= 30000 }">
		&nbsp;= <span class="total_one"><fmt:formatNumber value="${sum + 0 }"/></span>원
		</c:when>
		<c:otherwise>
		&nbsp;= <span class="total_one"><fmt:formatNumber value="${sum + 2500 }"/></span>원
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
<hr class="community_hr" style="position: relative; left: -130px;">
<table id="t_font" style="font-size: 12px;">
	<tr>
		<td colspan=2><span>결제수단</span></td>		
	</tr>
	<tr>
		<td><input type="radio" checked id="pay_method" name="pay_method" value="bankTransfer">무통장입금 </td>
	</tr>
</table>

<table id="t_font" style="font-size: 12px;">
	<tr>
		<td>입금자명</td>
		<td><input id="pay_name" name="pay_name"></td>
	</tr>
	<tr>
		<td>입금은행</td>
		<td>
			<select id="pay_bank" name="pay_bank">
				<option value="">:::선택해 주세요.:::</option>
				<option value="하나은행:123-1234567-123456 모스모스커피(주)">하나은행:123-1234567-123456 모스모스커피(주)</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>현금영수증 신청</td>
		<td>
			<input type="radio" id="cash_receipt_Y" name="cash_receipt" value="Y">현금영수증 신청
			<input type="radio" checked id="cash_receipt_N" name="cash_receipt" value="N">신청안함
		</td>
	</tr>
	<tr>
		<td>세금계산서 신청</td>
		<td>
			<input type="radio" id="tax_request_Y" name="tax_request" value="Y">세금계산서 신청
			<input type="radio" checked id="tax_request_N" name="tax_request" value="N">신청안함
		</td>
	</tr>
</table>


<table id="t_font" style="font-size: 12px;">
	<tr>
		<td>최종결제 금액</td>
	</tr>
	<tr>
		<td>
			<c:choose>
				<c:when test="${sum > 30000 }">
					<fmt:formatNumber value="${sum + 0 }"/>원
					<c:set var="payprice" value="${sum + 0 }"/>
				</c:when>
				<c:otherwise>
					<fmt:formatNumber value="${sum + 2500 }"/>원
					<c:set var="payprice" value="${sum + 2500 }"/>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td><input type="checkbox" id="purchase_agreement" name="purchase_agreement" value="Y">결제정보를 확인하였으며, 구매진행에 동의합니다.</td>
	</tr>
	<tr>
		<td><button class="delete_btn">결제하기</button></td>
	</tr>

</table>
<input type="hidden" name="payprice" value="${payprice }">
</form>
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("detailaddress2").value = extraAddr;
                
                } else {
                    document.getElementById("detailaddress2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample7_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("detailaddress4").value = extraAddr;
                
                } else {
                    document.getElementById("detailaddress4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode2').value = data.zonecode;
                document.getElementById("address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress3").focus();
            }
        }).open();
    }
</script>
	
</main>

<%@ include file = "/include/footer.jsp" %>

</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>


<main class="main1" >
<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > <a href="/admin/index">ADMINPAGE</a> > 주문관리
</div>
<h3 class="join_title_main">ORDER&nbsp;VIEW</h3><br>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<form action="orderModifyInsert" method="post">
<table>
	<tr>
		<td colspan=2><strong>주문정보</strong></td>
	</tr>
	<tr>
		<td>주문번호</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${o.or_cart_session }</td>
	</tr>
	<tr>
		<td>주문일자</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${o.date }</td>
	</tr>
	<tr>
		<td>주문자</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${o.or_name }</td>
	</tr>
	<tr>
		<td>주문처리상태</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>
			<select name="order_status">
				<option value="입금전" <c:if test="${o.order_status == '입금전'}">selected</c:if>>입금전</option>
				<option value="입금" <c:if test="${o.order_status == '입금'}">selected</c:if>>입금</option>
				<option value="준비" <c:if test="${o.order_status == '준비'}">selected</c:if>>준비</option>
				<option value="배송" <c:if test="${o.order_status == '배송'}">selected</c:if>>배송</option>
				<option value="완료" <c:if test="${o.order_status == '완료'}">selected</c:if>>완료</option>
				<option value="취소" <c:if test="${o.order_status == '취소'}">selected</c:if>>취소</option>
				<option value="반품" <c:if test="${o.order_status == '반품'}">selected</c:if>>반품</option>
			</select>
		</td>
	</tr>
</table>
</div>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table >
	<tr>
		<td colspan=2><strong>배송지정보</strong></td>
	</tr>
	<tr>
		<td>받으시는 분</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td><input name="re_name" value="${o.re_name}"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>
			<input id="zipcode2" name="zipcode2" placeholder="우편번호" value="${o.re_zipcode}">
			<img src="/image/btn_zipcode.gif" onclick="sample7_execDaumPostcode()" style="margin-bottom: -9px; cursor: pointer;">
			<input id="address2" name="address2" placeholder="주소" style="display: block; margin-bottom: 5px; " value="${o.re_address }">
			<input id="detailaddress3" name="detailaddress3" placeholder="상세주소" style="display: block; margin-bottom: 5px;" value="${o.re_detailaddr }">
			<input id="detailaddress4" name="detailaddress4" placeholder="참고항목" style="display: block;">
		</td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td><input name="re_phone1" value="${o.re_phone1}">-<input name="re_phone2" value="${o.re_phone2}">-<input name="re_phone3" value="${o.re_phone3}"></td>
	</tr>
	<tr>
		<td>배송메세지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td><input name="shippingmsg" value="${o.shippingmsg}"></td>
	</tr>
</table>
</div>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table width=800px;>
	<tr>
		<td colspan=6><strong>주문 상품 정보</strong></td>
	</tr>
	<tr>
		<td style="text-align: left;">이미지</td>
		<td style="text-align: left; width: 300px;">상품정보</td>
		<td style="text-align: center;">수량</td>
		<td style="text-align: center;">판매가</td>
		<td style="text-align: center;">합계</td>
		<td style="text-align: center;">주문처리상태</td>
	</tr>
	<c:set var="sum" value="${0 }"/>
	<c:forEach var="or_item" items="${list }">
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: left;"><img src="/upload/${or_item.file1_s }"></td>
		<td style="text-align: left; width: 300px;">${or_item.item_name }<br>[옵션 : ${or_item.item_option }]</td>
		<td style="text-align: center;"><fmt:formatNumber value="${or_item.item_num }" pattern="###,###,###"/></td>
		<td style="text-align: center;"><fmt:formatNumber value="${or_item.price }" pattern="###,###,###"/>원</td>
		<td style="text-align: center;"><fmt:formatNumber value="${or_item.total }" pattern="###,###,###"/>원</td>
		<td style="text-align: center;">${or_item.order_status }</td>
	</tr>
	<c:set var="sum" value="${sum = sum + or_item.total }"/>
	</c:forEach>
	<%-- <tr>
		<td>합계:${sum }</td>
	</tr> --%>
	
</table>
</div>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table>
	<tr>
		<td colspan=2><strong>결제정보</strong></td>
	</tr>
	<tr>
		<td>총 주문금액</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td><fmt:formatNumber value="${sum }" pattern="###,###,###"/>원</td>
	</tr>
	<tr>
		<td>총 결제금액&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>
			<c:choose>
				<c:when test="${sum <= 30000}">
					<fmt:formatNumber value="${sum + 2500}" pattern="###,###,###"/>원 (배송료 2,500원)
				</c:when>
				<c:otherwise>
					<fmt:formatNumber value="${sum }" pattern="###,###,###"/>원
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>결제 수단</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>
		<c:if test="${o.pay_method == 'bankTransfer'}">
			무통장입금
			<br>입금자: [ ${o.or_name } ]
			<br>계좌번호: [ ${o.pay_bank} ] 
		</c:if>
		</td>
	</tr>
</table>
</div>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table style="padding-bottom: 50px;">
	<tr>
		
		
		<input type="hidden" name="cart_session" value="${o.or_cart_session }">
		<td>
		<button class="or_btn">주문처리변경</button>
		</td>
		
		<td><input class="or_btn" type="button" onclick="history.back()" value="취소"></td>
	</tr>
</table>
</form>
</div>

<style>
	.or_btn {
		cursor:pointer;
		width:110px;
		height:22px;
		border:1px solid #d7d5d5;
	}
</style>
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
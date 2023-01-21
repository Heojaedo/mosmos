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
<span class="home"><a href="/">HOME</a></span> > ORDER
</div>
<h3 class="join_title_main">ORDER&nbsp;VIEW</h3><br>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table>
	<tr>
		<td colspan=2><strong>주문정보</strong></td>
	</tr>
	<tr>
		<td>주문번호</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<c:set var="date" value="${order.date}"/>
		<c:set var="oruid" value="${fn:substring(date,0,10)}"/>
		<td>${order.or_cart_session }</td>
	</tr>
	<tr>
		<td>주문일자</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.date }</td>
	</tr>
	<tr>
		<td>주문자</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.or_name }</td>
	</tr>
	<tr>
		<td>주문처리상태</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${status.order_status}</td>
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
		<td>${order.re_name}</td>
	</tr>
	
	<tr>
		<td>우편번호</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.re_zipcode}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.re_address} ${order.re_detailaddr}</td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.re_phone1}-${order.re_phone2}-${order.re_phone3}</td>
	</tr>
	<tr>
		<td>배송메세지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><img src="/image/btn_page_next.gif" class="f_id_img2"></td>
		<td>${order.shippingmsg}</td>
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
				<c:when test="${sum < 30000}">
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
		<c:if test="${order.pay_method == 'bankTransfer'}">
			무통장입금
			<br>입금자: [ ${order.or_name } ]
			<br>계좌번호: [ ${order.pay_bank} ] 
		</c:if>
		</td>
	</tr>
</table>
</div>
<hr class="community_hr">
<div style="position: relative; left: 30px;">
<table style="padding-bottom: 50px;">
	<a style="background-color: #343434; color: #FFFFFF; border: solid 1px #343434; font-size: 13px; position: relative; top: -6px;" href="/myshop/order/list">주문목록</a>
</table>
</div>

</main>

<%@ include file = "/include/footer.jsp" %>

</section>
</body>
</html>
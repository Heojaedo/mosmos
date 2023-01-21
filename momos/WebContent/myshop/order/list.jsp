<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/connection.jsp" %>

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
<span class="home"><a href="/">HOME</a></span> > ORDERLIST
</div>
<h3 class="join_title_main">ORDERLIST</h3><br>

<c:choose>
<c:when test="${count == 0}">
<span class="no_wish">주문하신 내역이 없습니다.</span>
</c:when>

<c:otherwise>
<div style="position: relative; left: 30px;">
<hr class="community_hr">
<hr class="community_hr" style="position: relative; top: 45px;">
<table class="orderpage">
	<tr>
		<td>&nbsp;&nbsp;주문일자<br>&nbsp;[주문번호]</td>
		<td>이미지</td>
		<td width=700px;>상품정보</td>
		<td>수량</td>
		<td>상품구매금액</td>
		<td>주문처리상태</td>
	</tr>
	<c:forEach var="order" items="${list}">
	<c:set var="date" value="${order.date}"/>
	<c:set var="oruid" value="${fn:substring(date,0,10)}"/>
	<tr>
		<td>
		${fn:substring(date,0,10)}<br>
		<a href="detail?or_uid=${order.or_uid}&cart_uid=${order.cart_uid}">[${order.or_cart_session }]</a><br>
		<c:choose>
		<c:when test="${order.order_status == '취소'}">
		<!--비어있음...  -->
		</c:when>
		<c:otherwise>
		<a href="cancel?or_uid=${order.or_uid}"><img src="/image/btn_order_cancel.gif" style="width: 50%"></a>
		</c:otherwise>
		</c:choose>
		</td>
		<td><a href="/product/${order.category1}?no=${order.item_uid}">
         <c:choose>
            <c:when test="${order.file1_s != ''}">
               <img src="/upload/${order.file1_s}">
            </c:when>
            <c:otherwise>
               <img src="/image/NoImage.jpg" style="width:100px;height:100px;object-fit:cover;">
            </c:otherwise>
         </c:choose>
      	</a></td>
		<td id="order_op"><a href="/product/${order.category1}?no=${order.item_uid}">${order.item_name}<br>[옵션 : ${order.item_option}]</a></td>
		<td><fmt:formatNumber value="${order.item_num}" pattern="###,###,###"/></td>
      	<td><fmt:formatNumber value="${order.total}" pattern="###,###,###"/>원</td>   	
		<td>${order.order_status}</td>		
	</tr>
	</c:forEach>
</table>


<!-- 페이징 처리 -->
<table class="order_page">
	<tr>
		<td align=center>
			<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${3 }" />			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
				<c:if test="${pageNum > pageBlock }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock + 1 }" />
				</c:if>	
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
				<!-- 이전 링크 -->
				<c:if test="${startPage > pageBlock }">
					<a href="list?pageNum=${startPage - pageBlock }">[이전] </a>
				</c:if>
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="list?pageNum=${i }"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="list?pageNum=${i }"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="list?pageNum=${startPage + pageBlock }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
</div>
<!-- 페이징 처리 끝  -->

</c:otherwise>
</c:choose>

</main>

<%@ include file = "/include/footer.jsp" %>

</section>

</body>
</html>
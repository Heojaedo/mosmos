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
		location.href="/myshop/wish_list_delete?str="+check_hide;
	} 

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 상품이 없습니다.");         
		return;
	}
	if(confirm('선택한 상품을 삭제 하시겠습니까?')){
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
	location.href="/myshop/wish_list_delete?str="+check_hide;
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
<span class="home"><a href="/">HOME</a></span> > WISHLIST
</div>
<h3 class="join_title_main">WISHLIST</h3><br>


<%-- session_id : ${sessionScope.userid } --%>

<form name="Form1" id="Form1">
<c:choose>
<c:when test="${count == 0}">
<span class="no_wish">관심상품 내역이 없습니다.</span>
</c:when>

<c:otherwise>
<hr class="community_hr">
<table class="cart_table">
	<tr>
		<th><input type="checkbox" name="all" value="checkbox" onClick="checkall()"></th>
		<th>이미지</th>
		<th>상품정보</th>
		<th>판매가</th>
		<th>배송비</th>
	</tr>
	<hr class="community_hr2">
	<c:forEach var="item" items="${list}">
	<tr>
		<td><input type='checkbox' name='ap_check' value='${item.wi_uid}'><%-- ${item.wi_uid } --%></td>
		<td>
		<a href="/product/${item.category1 }?no=${item.uid}">
			<c:choose>
				<c:when test="${item.file1_s != ''}">
					<img src="/upload/${item.file1_s}">
				</c:when>
				<c:otherwise>
					<img src="/image/NoImage.jpg" style="width:100px;height:100px;object-fit:cover;">
				</c:otherwise>
			</c:choose>
		</a>
		</td>
		<td><a href="/product/${item.category1 }?no=${item.uid}">${item.name }</a></td>
		<td><fmt:formatNumber value="${item.price }"/>원</td>
		<td><fmt:formatNumber value="${item.delivery }"/>원</td>	
	</tr>
	</c:forEach>
</table>
<hr class="community_hr" style="position:relative; top:2px;">
<table>
	<tr>
		<td>
			<button class="wish_delete" onClick="check_select();return false;">삭제하기</button>
<!-- 			<button onclick="check_select3();return false;" style="cursor:pointer;">장바구니 담기</button> -->
		</td>
<!-- 		<td><button onclick="check_select5();return false;" style="cursor:pointer;">전체상품 주문</button></td> -->
	</tr>
</table>
</form>

<%-- pageSize:${pageSize }
pageNum:${pageNum }
count:${count }
number:${number } --%>

<!-- 페이징 처리 -->
<table class="wish_list_table">
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
					<a href="wish_list?pageNum=${startPage - pageBlock }">[이전] </a>
				</c:if>
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="wish_list?pageNum=${i }"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="wish_list?pageNum=${i }"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="wish_list?pageNum=${startPage + pageBlock }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
<!-- 페이징 처리 끝  -->
</c:otherwise>
</c:choose>
</main>

<%@ include file = "/include/footer.jsp" %>

</section>
</body>
</html>
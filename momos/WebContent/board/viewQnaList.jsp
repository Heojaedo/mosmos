<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/include/connection.jsp" %>



<div class="viewqnalist" >
	<div>
	<div class="">
		<div>
			<div></div>
			<div>
			<table id="table_qna" class="table_qna">
				
				<tr>
					<td style="font-size: 11px;" colspan=4><hr></td>
				</tr>
				<tr>
					<td>Q&A</td>
				</tr>
				<tr>
					<td style="width: 100px;" align=center>NO</td>
					<td style="width: 700px;" align=center>SUBJECT</td>
					<td style="width: 150px;" align=center>NAME</td>
					<td style="width: 150px;" align=center>DATE</td>
				</tr>
			
				<script>
					$(document).ready(function () {
						$("#table_qna span").each(function (index,item) {
							$(item).addClass('span_qnasubject'+index);
							//console.log(item);
							//console.log($(this).attr("class"));
						});
						$(".tr_qnacontents td").each(function (index,item) {
							$(item).addClass('td_qnacontents'+index);
							//console.log(item);
							//console.log($(this).attr("class"));
						});
						$(".span_qnasubject0").click(function () {
							$(".td_qnacontents0").show();
						});
						$(".span_qnasubject1").click(function () {
							$(".td_qnacontents1").show();
						});
						$(".span_qnasubject2").click(function () {
							$(".td_qnacontents2").show();
						});
						$(".span_qnasubject3").click(function () {
							$(".td_qnacontents3").show();
						});
						$(".span_qnasubject4").click(function () {
							$(".td_qnacontents4").show();
						});
						$(".span_qnasubject5").click(function () {
							$(".td_qnacontents5").show();
						});
						$(".span_qnasubject6").click(function () {
							$(".td_qnacontents6").show();
						});
						$(".span_qnasubject7").click(function () {
							$(".td_qnacontents7").show();
						});
						$(".span_qnasubject8").click(function () {
							$(".td_qnacontents8").show();
						});
						$(".span_qnasubject9").click(function () {
							$(".td_qnacontents9").show();
						});
					});
				</script>
				<c:set var="i" value="${number}"/>
				<c:set var="no" value="1"/>
				<c:forEach var="list" items="${list}">
				<c:set var="d" value="${list.signdate}"/>
				<c:set var="date" value="${fn:substring(d,0,10)}"></c:set>
				<tr class="tr_title">
					<td align=center>${i}</td>
					<td>
						<c:choose>
							<c:when test="${list.secret == 'on'}">
								<c:if test="${sessionScope.userid != null && (list.userid == sessionScope.userid || sessionScope.level == '10')}">
								<span>${list.subject}</span>
								</c:if>
								<c:if test="${sessionScope.userid == null || (list.userid != sessionScope.userid && sessionScope.level != '10')}">
								<span>비밀글입니다.</span>
								</c:if>
							</c:when>
							<c:otherwise>
								<span>${list.subject}</span>
							</c:otherwise>
						</c:choose>
						<c:if test="${list.secret == 'on'}"><img src="/image/ico_lock.gif"></c:if>
					</td>
					<td align=center>${list.name}</td>
					<td align=center>${date}</td>
				</tr>
				<tr class="tr_qnacontents">
					<td colspan=4>
						<c:choose>
							<c:when test="${list.secret == 'on'}">
									<c:if test="${sessionScope.userid != null && (list.userid == sessionScope.userid || sessionScope.level == '10')}">
										${list.contents}
									</c:if>
									<c:if test="${sessionScope.userid == null || (list.userid != sessionScope.userid && sessionScope.level != '10')}">
										비밀글입니다.
									</c:if>
							</c:when>
							<c:otherwise>
								${list.contents}
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<c:set var="i" value="${i-1}"/>
				<c:set var="no" value="${no+1}"/>
				</c:forEach>
				<tr><td><div style="height:20px"></div></td></tr>
				<tr id ="listnwrite">
					<td></td>
					<td></td>
					<td align=right>
					<div>
						<form action="/board/qnaviewwrite" method="post">
							<input type="hidden" name="item_uid" value="${itemUid}">
							<input type="hidden" name="itemName" value="${itemName}">
							<input type="hidden" name="category" value="${category}">
							<input type="hidden" name="session_id" value="${sessionScope.userid}">
							<input type="hidden" name="session_name" value="${sessionScope.name}">
							<input type="hidden" name="session_level" value="${sessionScope.level}">
						<div class="v_write">
							<button class="viewqna_write">WRITE</button>
						</div>
						</form>
					</div>
					</td>
					<td align=left>
					<form action="/board/qnaviewwrite" method="post">
					<div class="v_write">
						<input class="viewqna_write" type="button" onclick="location.href='/board/qna'" value="LIST">
					</div>
					</form>
					</td>
				</tr>
				<tr>
					<td align=center colspan=4>
						<div>
							<c:if test="${count>0 }">
								<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
								<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
								<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
								<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->		
								<!-- 2개의 변수 초기화 -->
								<c:set var="startPage" value="${1 }" />
								<c:set var="pageBlock" value="${5 }" />	
								<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
								<c:if test="${pageNum_1 > pageBlock }">
									<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
									<fmt:parseNumber var="result" value="${pageNum_1 / pageBlock - (pageNum_1 % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
									<c:set var="startPage" value="${result * pageBlock + 1 }" />
								</c:if>	
								<!-- endPage 값 설정 부분 -->
								<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
								<c:if test="${endPage > pageCount }">
									<c:set var="endPage" value="${pageCount }" />
								</c:if>		
								<!-- 이전 링크 -->
								<c:if test="${startPage > pageBlock }">
									<span style="cursor:pointer;" onclick="qnaPrePage(${startPage - 1 })">[이전]</span>
								</c:if>		
								<!-- 페이징 링크 -->
								<span id="pagearray">
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
										<span style="padding:0px 4px;cursor:pointer;<c:if test="${pageNum_1 == i }">color:red;</c:if>" onclick="page_link(${i})" >[${i }]</span>
										
								</c:forEach>
								</span>		
								<!-- 다음 링크 -->
								<c:if test="${endPage < pageCount }">
									<span style="cursor:pointer;" onclick="qnaNextPage(${startPage + pageBlock })">[다음]</span>
								</c:if>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
			</div>
		</div>
 	</div>
		
	</div>
</div>
<script>
$(document).ready(function() {
	$("#pagearray span").each(function (index,item) {
		//$(item).addClass('pageid'+index);
		console.log(item);
		//console.log($(this).attr("class"));
	});
})
</script>
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".tr_title").click(function(){
            var submenu = $(this).next(".tr_qnacontents");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    
    /* 외부영역 클릭시 팝업 닫기 */
    $(document).mouseup(function (e){
    	if($(".tr_qnacontents").has(e.target).length === 0){
    		$(".tr_qnacontents").hide();
    	}
    });
   
 
</script>



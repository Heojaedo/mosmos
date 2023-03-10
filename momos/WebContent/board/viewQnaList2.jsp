<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/include/connection.jsp" %>



<div class="viewqnalist" >
	<div>
	<div class="">
		<div>
			<div></div>
			<div>
			<table id="table_qna" class="table_qna" >
				
				<tr>
					<td style="font-size: 11px;">total post: ${count}</td>
				</tr>
				<tr>
					<td>Q&A</td>
				</tr>
				<tr>
					<td style="width: 100px;">NO</td>
					<td style="width: 850px;">SUBJECT</td>
					<td>NAME</td>
					<td>DATE</td>
				</tr>
			
				<script>
					$(document).ready(function () {
						$("#table_qna span").each(function (index,item) {
							$(item).addClass('span_qnasubject'+index);
							console.log(item);
							console.log($(this).attr("class"));
						});
						$(".tr_qnacontents td").each(function (index,item) {
							$(item).addClass('td_qnacontents'+index);
							console.log(item);
							console.log($(this).attr("class"));
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
					<td>${i}</td>
					<td>
						<c:choose>
							<c:when test="${list.secret == 'on'}">
								<c:if test="${list.userid == sessionScope.userid || sessionScope.level == '10'}">
								<span>${list.subject}</span>
								</c:if>
								<c:if test="${list.userid != sessionScope.userid || sessionScope.level != '10'}">
								<span>??????????????????.</span>
								</c:if>
							</c:when>
							<c:otherwise>
								<span>${list.subject}</span>
							</c:otherwise>
						</c:choose>
						<c:if test="${list.secret == 'on'}"><img src="/image/ico_lock.gif"></c:if>
					</td>
					<td>${list.name}</td>
					<td>${date}</td>
				</tr>
				<tr class="tr_qnacontents">
					<td colspan=4>
						<c:choose>
							<c:when test="${list.secret == 'on'}">
								<c:if test="${list.userid == sessionScope.userid || sessionScope.level == '10'}">
								${list.contents}
								</c:if>
								<c:if test="${list.userid != sessionScope.userid || sessionScope.level != '10'}">
								??????????????????.
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
					<tr id ="listnwrite">
					<td>
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
					<td>
					<form action="/board/qnaviewwrite" method="post">
					<div class="v_write">
						<input class="viewqna_write" type="button" onclick="location.href='/board/qna'" value="LIST">
					</div>
					</form>
					</td>
				</tr>
			</table>
			</div>
		</div>
		
 	</div>
		<div>
			<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
				<!-- fmt:parseNumber : ???????????? ????????? ????????? ?????? ????????? ???????????? ?????? -->
				<!-- integerOnly : true , false ????????? ????????? ???????????? ?????? ?????? -->		
				<!-- 2?????? ?????? ????????? -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${3 }" />	
				<!-- ?????? ????????? ????????? ?????? ??? ?????? startPage ??? ?????? ??????-->
				<c:if test="${pageNum > pageBlock }">
					<!-- ????????? ??????????????? ?????? ????????? ?????? ????????? fmt -->
					<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock + 1 }" />
				</c:if>	
				<!-- endPage ??? ?????? ?????? -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>		
				<!-- ?????? ?????? -->
				<c:if test="${startPage > pageBlock }">
					<a href="${category}?pageNum=${startPage - pageBlock }">[??????] </a>
				</c:if>		
				<!-- ????????? ?????? -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="${category}?no=${itemUid}&pageNum_1=${i }#qna" onclick="page_link(${i})"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="${category}?no=${itemUid}&pageNum_1=${i }#qna" onclick="page_link(${i})"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>		
				<!-- ?????? ?????? -->
				<c:if test="${endPage < pageCount }">
					<a href="${category}?pageNum=${startPage + pageBlock }">[??????] </a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>

<script>
    // html dom ??? ??? ????????? ??? ????????????.
    $(document).ready(function(){
        // menu ????????? ?????? ????????? ?????? a ????????? ???????????????
        $(".tr_title").click(function(){
            var submenu = $(this).next(".tr_qnacontents");
 
            // submenu ??? ???????????? ???????????? ?????? ???????????? ?????? ????????? ????????? ???????????? ?????????
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    
    /* ???????????? ????????? ?????? ?????? */
    $(document).mouseup(function (e){
    	if($(".tr_qnacontents").has(e.target).length === 0){
    		$(".tr_qnacontents").hide();
    	}
    });
   
 
</script>



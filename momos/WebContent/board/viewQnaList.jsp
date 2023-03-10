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
								<span>??????????????????.</span>
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
								<!-- fmt:parseNumber : ???????????? ????????? ????????? ?????? ????????? ???????????? ?????? -->
								<!-- integerOnly : true , false ????????? ????????? ???????????? ?????? ?????? -->		
								<!-- 2?????? ?????? ????????? -->
								<c:set var="startPage" value="${1 }" />
								<c:set var="pageBlock" value="${5 }" />	
								<!-- ?????? ????????? ????????? ?????? ??? ?????? startPage ??? ?????? ??????-->
								<c:if test="${pageNum_1 > pageBlock }">
									<!-- ????????? ??????????????? ?????? ????????? ?????? ????????? fmt -->
									<fmt:parseNumber var="result" value="${pageNum_1 / pageBlock - (pageNum_1 % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
									<c:set var="startPage" value="${result * pageBlock + 1 }" />
								</c:if>	
								<!-- endPage ??? ?????? ?????? -->
								<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
								<c:if test="${endPage > pageCount }">
									<c:set var="endPage" value="${pageCount }" />
								</c:if>		
								<!-- ?????? ?????? -->
								<c:if test="${startPage > pageBlock }">
									<span style="cursor:pointer;" onclick="qnaPrePage(${startPage - 1 })">[??????]</span>
								</c:if>		
								<!-- ????????? ?????? -->
								<span id="pagearray">
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
										<span style="padding:0px 4px;cursor:pointer;<c:if test="${pageNum_1 == i }">color:red;</c:if>" onclick="page_link(${i})" >[${i }]</span>
										
								</c:forEach>
								</span>		
								<!-- ?????? ?????? -->
								<c:if test="${endPage < pageCount }">
									<span style="cursor:pointer;" onclick="qnaNextPage(${startPage + pageBlock })">[??????]</span>
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



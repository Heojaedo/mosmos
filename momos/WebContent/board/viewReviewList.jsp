<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	  
<%@ include file="/include/connection.jsp" %>	  

	  
<div class="viewqnalist" >
	<div>
	<div class="">
		<div>
			<div></div>
			<div>
			<table id="table_qna" class="table_qna" >
				
				<tr>
					<td style="font-size: 11px;" colspan=4><hr></td>
				</tr>
				<tr>
					<td>REVIEW</td>
				</tr>
				<tr>
					<td style="width: 100px;" align=center>NO</td>
					<td style="width: 700px;" align=center>SUBJECT</td>
					<td style="width: 150px;" align=center>NAME</td>
					<td style="width: 150px;" align=center>DATE</td>
				</tr>
			
				<script>

				</script>
				<c:set var="i_re" value="${number_re}"/>
				<c:set var="no_re" value="1"/>
				<c:forEach var="list_re" items="${list_re}">
				<c:set var="d_re" value="${list_re.signdate}"/>
				<c:set var="date_re" value="${fn:substring(d_re,0,10)}"></c:set>
				<tr class="tr_title">
					<td align=center>${i_re}</td>
					<td>
						<span>${list_re.subject}</span>
					</td>
					<td align=center>${list_re.name}</td>
					<td align=center>${date_re}</td>
				</tr>
				<tr class="tr_reviewcontents">
					<td colspan=4>
								${list_re.contents}

					</td>
				</tr>
				<c:set var="i_re" value="${i_re-1}"/>
				<c:set var="no_re" value="${no_re+1}"/>
				</c:forEach>
				<tr><td><div style="height:20px"></div></td></tr>
					<tr id ="listnwrite">
					<td></td>
					<td></td>
					<td align=right>
					<div>
						<form action="/board/reviewwrite" method="post">
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
					<form action="/board/reviewwrite" method="post">
					<div class="v_write">
						<input class="viewqna_write" type="button" onclick="location.href='/board/review'" value="LIST">
					</div>
					</form>
					</td>
				</tr>
				<tr>
				<td align=center colspan=4>
					<div>
						<c:if test="${count_re>0 }">
							<c:set var="pageCount_re" value="${count_re / pageSize + (count_re % pageSize == 0 ? 0 : 1) }" />
							<fmt:parseNumber var="pageCount_re" value="${pageCount_re }" integerOnly="true" />
							<!-- fmt:parseNumber : ???????????? ????????? ????????? ?????? ????????? ???????????? ?????? -->
							<!-- integerOnly : true , false ????????? ????????? ???????????? ?????? ?????? -->		
							<!-- 2?????? ?????? ????????? -->
							<c:set var="startPage_re" value="${1 }" />
							<c:set var="pageBlock_re" value="${5 }" />	
							<!-- ?????? ????????? ????????? ?????? ??? ?????? startPage ??? ?????? ??????-->
							<c:if test="${pageNum_2 > pageBlock_re }">
								<!-- ????????? ??????????????? ?????? ????????? ?????? ????????? fmt -->
								<fmt:parseNumber var="result_re" value="${pageNum_2 / pageBlock_re - (pageNum_2 % pageBlock_re == 0 ? 1:0) }" integerOnly="true"/>
								<c:set var="startPage_re" value="${result_re * pageBlock_re + 1 }" />
							</c:if>	
							<!-- endPage ??? ?????? ?????? -->
							<c:set var="endPage_re" value="${startPage_re + pageBlock_re - 1 }" />
							<c:if test="${endPage_re > pageCount_re }">
								<c:set var="endPage_re" value="${pageCount_re }" />
							</c:if>		
							<!-- ?????? ?????? -->
							<c:if test="${startPage_re > pageBlock_re }">
								<span style="cursor:pointer;" onclick="qnaPrePage_re(${startPage_re - 1 })">[??????]</span>
							</c:if>		
							<!-- ????????? ?????? -->
							<span id="pagearray_re">
							<c:forEach var="i_re" begin="${startPage_re }" end="${endPage_re }">
									<span style="padding:0px 4px;cursor:pointer;<c:if test="${pageNum_2 == i_re }">color:red;</c:if>" onclick="page_link_re(${i_re})" >[${i_re }]</span>
									
							</c:forEach>
							</span>		
							<!-- ?????? ?????? -->
							<c:if test="${endPage_re < pageCount_re }">
								<span style="cursor:pointer;" onclick="qnaNextPage_re(${startPage_re + pageBlock_re })">[??????]</span>
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

</script>
<script>
    // html dom ??? ??? ????????? ??? ????????????.
    $(document).ready(function(){
        // menu ????????? ?????? ????????? ?????? a ????????? ???????????????
        $(".tr_title").click(function(){
            var submenu = $(this).next(".tr_reviewcontents");
 
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
    	if($(".tr_reviewcontents").has(e.target).length === 0){
    		$(".tr_reviewcontents").hide();
    	}
    });
   
 
</script>
      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="/include/connection.jsp" %>

<section class="container">

<style>
	.tb_iteminfo {
		border:1px solid #d9d9d9;
		align:center;
	}
</style>

<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	//전역변수
	var obj = [];
	
	$(document).ready(function() {
		
		//스마트에디터 프레임 생성
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "contents",
	        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
	        fCreator: "createSEditor2",
	        htParams: { 
				//툴바 사용 여부(true:사용)
				bUseToolbar: true,
				//입력창 크기 조절바 사용 여부(true:사용)
				bUseVerticalResizer: true,
				//모드 탭(Editor | HTML | TEXT) 사용 여부(true:사용)
				bUseModeChanger: true,
	        }
		});
		
		$("#qna_insert").click(function(){
			if(subject.value == "") {
				alert("제목을 입력하세요.");
				return;
			}
		    obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		    if($("#contents").val() == "" || $("#contents").val() == "<p>&nbsp;</p>") {
		    	alert("내용을 입력하세요.");
		    	return;
		    }
		    $("#frm").submit();
		});    
	});
</script>

<main class="main1" >

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main">Q&A</h3><br>
<hr class="community_hr">
<div>
	<div>
		<c:if test="${itemUid != '0'}">
		<table class="tb_iteminfo" width=1000px align=center>
				<tr>
					<td rowspan=4><img src="/upload/${itemFile_s}"></td>
					<td rowspan=4 width=50px></td>
					<td width=1150px>${item_name}</td>
				</tr>
				<tr>
					<td>${itemPrice}원</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td><input type="button" onclick="location.href='/product/${category}?no=${itemUid}'" value="상품 상세보기 >" style="cursor:pointer;"></td>
				</tr>
		</table>
		</c:if>
	</div>
	<form action="/board/qnamodify_insert" method="post" id="frm">
	<input type="hidden" name="uid" value="${uid}">
	<div>
		
	</div><c:if test="${secret == 'on'}">checked</c:if>
	<div class="qna_w_title">
		제목
		<input id="subject" name="subject" value="${subject}">
		<input type="checkbox" name="secretCheck" <c:if test="${secret == 'on'}">checked</c:if>>비밀글
	</div>
	<div>
		<textarea class="qna_textarea" id="contents" name="contents">${contents}</textarea>
	</div>
	<div class="div_btn">
		<input class="btn1" type="button" value="수정" id="qna_insert">
		<input class="btn2" type="button" value="취소" onclick="location.href='/board/qna'">
	</div>
	</form>
</div>

</main>
<style>
	.div_btn {
		margin-top: 10px;
		margin-left: 1300px;
	}
	.btn1 {
		background-color: #343434;
		color: #FFFFFF;
		border: solid 1px #343434;
		cursor: pointer;
		padding: 5px 10px 5px 10px;
	}
	.btn2 {
		background-color: #FFFFFF;
		color: #343434;
		border: solid 1px #343434;
		cursor: pointer;
		padding: 5px 10px 5px 10px;
	}
</style>

<%@ include file = "/include/footer.jsp" %>

</section>
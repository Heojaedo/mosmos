<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
	.tb_iteminfo {
		border:1px solid #D7D5D5;
		align:left;
		position: relative;
		left: -250px;
		font-size: 14px;
	}
	
	.detail_btn {
		cursor:pointer;
		border: none;
		background-color: rgb(58,64,80);
		color: white;
	}
</style>

<main class="main1" >

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main">Q&A</h3><br>
<hr class="community_hr">
<div>
	<form action="/board/qnaviewwrite_insert" method="post" id="frm">
	<input type="hidden" name="item_uid" value="${item_uid}">
	<input type="hidden" name="item_name" value="${item_name}">
	<input type="hidden" name="category" value="${category}">
	<input type="hidden" name="session_id" value="${id}">
	<input type="hidden" name="session_name" value="${name}">
	<div>
	<div>
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
					<td><hr class="thumb_hr"></td>
				</tr>
				<tr>
					<td><input class="detail_btn" type="button" onclick="location.href='/product/${category}?no=${item_uid}'" value="상품 상세보기 >" ></td>
				</tr>
					
				
		</table>
	</div>
	</div>
	<div class="qna_w_title">
		제목
		<input id="subject" name="subject" value="">
		<input type="checkbox" name="secretCheck">비밀글
	</div>
	<div>
		<textarea class="qna_textarea" id="contents" name="contents"></textarea>
	</div>
	<div class="div_btn">
		<input class="btn1" type="button" value="등록" id="qna_insert">
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



<!-- Smart Editor -->
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 
 
<!-- Smart Editor -->
<script type="text/javascript">
 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "contents",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams: { fOnBeforeUnload : function(){}}
});
 

 
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="/upload/'+filepath+'">';
    oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

$(document).ready(function () {
	$("#qna_insert").click(function(){
		if(subject.value == "") {
			alert("제목을 입력하세요.");
			return;
		}
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	    if($("#contents").val() == "" || $("#contents").val() == "<br>") {
	    	alert("내용을 입력하세요.");
	    	return;
	    }
	    $("#frm").submit();
	});    
});
 
</script>

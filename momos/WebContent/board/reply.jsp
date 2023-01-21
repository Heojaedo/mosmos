<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<main class="main1" >

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main">Q&A</h3><br>
<hr class="community_hr">
<div>
	<form action="/board/qnareply_insert" method="post" id="frm">
	<input type="hidden" name="uid" value="${uid}">
	<input type="hidden" name="item_uid" value="${item_uid}">
	<input type="hidden" name="item_name" value="${item_name}">
	<input type="hidden" name="reply_id" value="${reply_id}">
	<input type="hidden" name="reply_name" value="${reply_name}">
	<input type="hidden" name="fid" value="${fid}">
	<input type="hidden" name="thread" value="${thread}">
	<div>
		
	</div>
	<div class="qna_w_title">
		제목
		<input id="subject" name="subject" value="re:${subject}">
		<input type="checkbox" name="secretCheck" <c:if test="${serect == 'on'}">checked</c:if>>비밀글
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

<script>
    let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "contents",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2",
        htParams: { fOnBeforeUnload : function(){}}
      });
    }
    

    $(document).ready(function() {
      smartEditor()
      
      $("#qna_insert").click(function(){
          oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });
    })
</script>
<script>

submitPost = function() {
	  oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", [])
	  let content = document.getElementById("contents").value

	  if(content == '') {
	    alert("내용을 입력해주세요.")
	    oEditors.getById["contents"].exec("FOCUS")
	    return
	  } else {
	    console.log(content)
	  }
	}
</script>
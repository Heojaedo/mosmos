<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function pass_search() {
		if(userid.value == ""){
			alert("아이디를 입력하세요");
			userid.focus();
			return false;
		}
		if(name2.value == ""){
			alert("이름을 입력하세요.")
			name2.focus();
			return false;
		}
		if(email.value == ""){
			alert("이메일을 입력하세요.")
			email.focus();
			return false;
		}
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
<span class="home"><a href="/">HOME</a></span> > 비밀번호 찾기
</div>
<h3 class="join_title_main">비밀번호 찾기</h3><br>

<form method="post" onsubmit="return pass_search()">
<table class="find_pw_table" style="border: 1px solid #D7D5D5; width: 1390px; height: auto;">
	<tr>
		<th colspan=2>비밀번호 찾기</th>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">아이디</th>
		<td><input id="userid" name="userid" value=""></td>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">이름</th>
		<td><input id="name2" name="name2" value=""></td>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">이메일</th>
		<td><input id="email" name="email" value=""></td>
	</tr>
	<tr>
		<td colspan=2><button class="f_btn2"><img src="/image/btn_submit.gif"></button></td>
	</tr>
</table>
</form>

</main>

<%@ include file = "/include/footer.jsp" %>

</section>

</body>
</html>
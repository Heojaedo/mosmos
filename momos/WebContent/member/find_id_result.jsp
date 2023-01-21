<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<span class="home"><a href="/">HOME</a></span> > 아이디 찾기
</div>
<h3 class="join_title_main">아이디 찾기</h3><br>


<table class="find_id_table" style="border: 1px solid #D7D5D5; width: 1390px; height: auto;">
	<tr>
		<th colspan=2>아이디 찾기<br><br><span class="find_id_ok">고객님의 아이디 찾기가 완료 되었습니다.</span></th>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">이름</th>
		<td class="id_result">:&nbsp;${name }</td>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">이메일</th>
		<td class="id_result">:&nbsp;${email }</td>
	</tr>
	<tr>
		<th style="text-align: left;"><img src="/image/btn_page_next.gif" class="f_id_img">아이디</th>
		<td class="id_result">:&nbsp;${id }</td><br>
	</tr>
	<tr>
		<td colspan="2" class="id_result2"><a href="/member/login"><img src="/image/btn_find_login.gif"></a>&nbsp;<a href="/member/find_passwd"><img src="/image/btn_find_pw.gif"></a></td>
	</tr>
</table>


</main>

<%@ include file = "/include/footer.jsp" %>

</section>

</body>
</html>
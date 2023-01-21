<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모모스커피-Specialty for all</title>	
<meta name = "google-signin-client-id" content="3929581950-s7nalaib25kg6qhv9j3eiv4ifga0ru1s.apps.googleusercontent.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
</head>
<body>

<style>
   #loginbtn {
   border:none;
   background-color:rgba(0,0,0,0);
   cursor: pointer;
   
   }
</style>

<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>



<main class="main1" style="border: 1px solid #D7D5D5; width: 1390px; height: auto;">

<h1 style="font-size: 20px; font-family: sans-serif; text-align: center;">회원로그인</h1>
<center>
<form method="post" onsubmit="return frm_check();">
<table>
	<tr>
		<td>
			<label for="userid"><input class="login_input" type="text" id="userid" name="userid" placeholder="아이디"></label>
		</td>
		<td rowspan="2"><button id="loginbtn" tabindex="3"><img src="/image/btn_login.gif"></button></td>
	</tr>
	<tr>
		<td>
			<label for="password"><input class="login_input" type="password" id="password" name="password" placeholder="비밀번호"></label>
		</td>	
	</tr>
	<tr>
		<td class="login_img1"><input type="checkbox" name="checkId" id="saveId"> 
		<label for="saveId"> &nbsp;아이디저장</label>
		</td>
	</tr>
	<tr>
		<td class="login_img2">
			<a href="/member/find_id"><img src="/image/btn_right.gif"> 아이디찾기</a> 
			<a href="/member/find_passwd"><img src="/image/btn_right.gif"> 비밀번호찾기</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" id="GgCustomLogin" style="padding-bottom: 18px; tabindex: -1;">
			<a href="javascript:void(0)"><img src="/image/btn_google_login.gif"></a>
			<img src="/image/btn_kakao_login.gif">
		</td>
	</tr>
</table>
	<hr class="login_hr">
<table>
	<tr>
		<td style="word-spacing: -1px; padding: 10px 90px 0px 0px; color: #5B5B5C; padding-top: 18px;">회원가입을 하시면 다양하고  특별한<br>혜택이 준비되어 있습니다.</td>
		<td><a href="/member/join"><img src="/image/btn_join.gif"></a></td>
	</tr>
</table>
</form>
</center>
</main>


<%@ include file = "/include/footer.jsp" %>

</section>

<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyDQM7aYdy9ksT7wuNzfN0KkbAOwro7RNfw', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script>
$(function() {
    
    fnInit();
  
});

function frm_check(){
  saveid();
}

function fnInit(){
 var cookieid = getCookie("saveid");
 console.log(cookieid);
 if(cookieid !=""){
     $("input:checkbox[id='saveId']").prop("checked", true);
     $('#userid').val(cookieid);
 }
 
}    

function setCookie(name, value, expiredays) {
 var todayDate = new Date();
 todayDate.setTime(todayDate.getTime() + 0);
 if(todayDate > expiredays){
     document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
 }else if(todayDate < expiredays){
     todayDate.setDate(todayDate.getDate() + expiredays);
     document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
 }
 
 
 console.log(document.cookie);
}

function getCookie(Name) {
 var search = Name + "=";
 console.log("search : " + search);
 
 if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
     offset = document.cookie.indexOf(search);
     console.log("offset : " + offset);
     if (offset != -1) { // 쿠키가 존재하면 
         offset += search.length;
         // set index of beginning of value
         end = document.cookie.indexOf(";", offset);
         console.log("end : " + end);
         // 쿠키 값의 마지막 위치 인덱스 번호 설정 
         if (end == -1)
             end = document.cookie.length;
         console.log("end위치  : " + end);
         
         return unescape(document.cookie.substring(offset, end));
     }
 }
 return "";
}

function saveid() {
 var expdate = new Date();
 if ($("#saveId").is(":checked")){
     expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
     setCookie("saveid", $("#userid").val(), expdate);
     }else{
    expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
     setCookie("saveid", $("#userid").val(), expdate);
      
 }
}



</script>


</body>
</html>


</body>
</html>


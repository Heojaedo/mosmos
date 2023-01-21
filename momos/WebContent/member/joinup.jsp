<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모모스커피-Specialty for all</title>	

</head>
<body>

<%@ include file ="/include/connection.jsp" %>

<script>

let reg = /^(?=.*?[a-z])(?=.*?[0-9]).{4,16}$/

let reg2 = /^(?=.*?[a-z])(?=.*?[0-9]).{4,16}$/

	function join_insert(){
	if(userid.value ==""){
		alert("아이디를 입력해주세요.");
		userid.focus();
		return false;
	}
	if(!reg2.test(userid.value)){
		alert("아이디를 소문자,숫자를 포함한 4~16자로 입력해주세요.");
		userid.focus();
		return false;
	}
	if(password.value ==""){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	if(!reg.test(password.value)){
		alert("비밀번호를 소문자,숫자를 포함한 4~16자로 입력해주세요.");
		password.focus();
		return false;
	}
	if(password.value.search(" ") != -1){
		alert("비밀번호는 공백을 포함 할 수 없습니다.");
		password.focus();
		return false;
	}
		
	if(password.value != password2.value){
		alert("비밀번호를 다시 확인해주세요.");
		password2.focus();
		return false;
	}
	if(name2.value ==""){
		alert("이름을 입력해주세요.");
		name2.focus();
		return false;
	}

	if(zipcode.value ==""){
		alert("주소를 확인해주세요.");
		zipcode.focus();
		return false;
	}
	if(address.value ==""){
		alert("주소를 확인해주세요.");
		address.focus();
		return false;
	}
	if(detailaddress.value ==""){
		alert("주소를 확인해주세요.");
		detailaddress.focus();
		return false;
	}
	if(phone2.value =="" || phone3.value==""){
		alert("연락처를 입력해주세요.");
		phone2.focus();
		return false;
	}
	if(email.value ==""){
		alert("이메일을 확인해주세요.");
		email.focus();
		return false;
	}

	document.submit();
	
}

</script>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>

<main class="main1">

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > MODIFY
</div>
<h3 class="join_title_main">회원 정보 수정</h3><br>

<div class="join_div">

<img src ="/image/img_member_default.gif">

<table class="header_table" style="margin-bottom: -60px;" >
	<tr>
		<td class="join_title" ><b>기본정보</b></td>
		<td align="right"><img src="/image/ico_required.gif">필수입력사항</td>
	</tr>
</table>
<hr class="join_hr" style="position: relative; bottom: -50px;">
<form name="join" method="post" onsubmit="return join_insert()">
<input type="hidden" id="a" name="a" value="">
<table>
	<tr>
		<td>아이디<img src="/image/ico_required.gif"></td>
		<td><input id="userid" name="userid" value="${member.userid }" class="join_input" readonly="readonly"> (영문 소문자/숫자, 4~16자)</td>
	</tr>
	<tr>
		<td>비밀번호<img src="/image/ico_required.gif"></td>
		<td><input type="password" id="password" name="password" value="" class="join_input"> (영문 소문자/숫자 4~16자)</td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -100px;">
	<tr>
		<td>비밀번호 확인<img src="/image/ico_required.gif"></td>
		<td><input type="password" id="password2" name="password2" value="" class="join_input"></td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -140px;">
	<tr>
		<td>이름<img src="/image/ico_required.gif"></td>
		<td><input  id="name2" name="name" value="${member.name }" class="join_input" readonly="readonly"></td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -175px;">
	<tr>
		<td>주소<img src="/image/ico_required.gif"></td>
		<td>
			<input class="join_input_add1" type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="${member.zipcode }">
			<img src="/image/btn_zipcode.gif"  onclick="sample6_execDaumPostcode()" style="margin-bottom: -9px; cursor: pointer;">
			<input class="join_input_add2" type="text" id="address" name="address" value="${member.address }" placeholder="주소" style="display: block; margin-bottom: 5px; ">
			<input class="join_input_add2" type="text" id="detailaddress" name="detailaddress" value="${member.detailaddress }"  placeholder="상세주소" style="display: block; margin-bottom: 5px;">
			<input class="join_input_add2" type="text" id="detailaddress2" name="detailaddress2" placeholder="참고항목" style="display: block;">
		</td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -210px;">
	<tr>
		<td class="td1">휴대전화<img src="/image/ico_required.gif"></td>
		<td>
			<select id="phone1" name="phone1" value="${member.phone1 }">
				<option value="010">010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			-
			<input class="join_input_phone" id="phone2" name="phone2" size=4 value="${member.phone2 }">
			-
			<input class="join_input_phone" id="phone3" name="phone3" size=4 value="${member.phone3 }">
			
		</td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -315px;">
	<tr>
		<td>SMS 수신여부<img src="/image/ico_required.gif"></td>
		<td>
			<input type="radio" id="sms_Y" name="sms" value="Y" checked>수신함
			<input type="radio" id="sms_N" name="sms" value="N">수신안함
			<span class="event_agree"><br></span>
			쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.
		</td>		
	</tr>
<hr class="join_hr" style="position: relative; bottom: -350px;">
	<tr>
		<td>이메일<img src="/image/ico_required.gif"></td>
		<td><input class="join_input" id="email" name="email" value="${member.email }"></td>
	</tr>
<hr class="join_hr" style="position: relative; bottom: -405px;">
	<tr>
		<td>이메일 수신여부<img src="/image/ico_required.gif"></td>
		<td>
			<input type="radio" id="email_re_Y" name="email_re" value="Y" checked>수신함
			<input type="radio" id="email_re_N" name="email_re" value="N">수신안함
			<span class="event_agree"><br></span>
			쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.
		</td>		
	</tr>
<hr class="join_hr" style="position: relative; bottom: -440px;">
</table>

</div>

<hr class="join_hr" style="margin-left: 22px;">
<div class="modify_btn">
	<input type="image" src="/image/btn_modify_member.gif">
	<a href="/"><img src="/image/btn_modify_cancel.gif" style="position: relative; top: -1px;"></a>
</div>

</form>
</main>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("detailaddress2").value = extraAddr;
                
                } else {
                    document.getElementById("detailaddress2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>


<%@ include file = "/include/footer.jsp" %>

</section>



</body>
</html>


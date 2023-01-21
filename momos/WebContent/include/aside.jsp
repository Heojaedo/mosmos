<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/connection.jsp" %>

<aside id="sticky_test2" class="aside1">
	<a href="/"><img class="img1" src="/image/logo.png" align="left"></a>
	<div class="all_aside">
		<table class="menu2">
			<tr class="aside_category"><td>ONLINESHOP</td></tr>
			<tr><td></td></tr>
			<tr><td><a href="/category/giftset">선물세트</a></td></tr>
			<tr><td><a href="/category/beans">원두</td></tr>
			<tr><td><a href="/category/dripbag">드립백</a></td></tr>
			<tr><td><a href="/category/coldbrew">콜드브루 RTD</a></td></tr>
			<tr><td><a href="/category/capsule">캡슐</a></td></tr>	
		</table>
		<table class="menu2">
			<tr class="aside_category"><td>ABOUT</td></tr>
			<tr><td></td></tr>
		
			<tr><td><a href="/momos">MOMOS</a></td></tr>
			
			<tr><td><a href="/people">RECRUIT</a></td></tr>
		</table>
		<table  class="menu2_under">
			<tr class="aside_category"><td>COMMUNITY</td></tr>
			<tr><td></td></tr>
			<tr><td><a href="/board/notice">NOTICE</a></td></tr>
			<tr><td><a href="/board/faq">FAQ</a></td></tr>
			<tr><td><a href="/board/qna">Q&A</a></td></tr>
			<tr><td><a href="/board/release">PRESS RELEASE</a></td></tr>	
		</table>
		<div class="aside_div" >
				<li class="menu3">
					<a><b>CALLCENTER</b></a>
					<ul class="hide" style="padding-left: 0px;">
						<li>051-123-4567</li>
						<li>AM 09:00-PM 06:00</li>
						<li>Sat,Sun,Holiday OFF</li>
					</ul>
				</li>
			
		</div>
		<div class="aside_div">
				<li class="menu3">
					<a><b>BANKACCOUNT</b></a>
					<ul class="hide" style="padding-left: 0px;">
						<li>051-123-4567</li>
						<li>AM 09:00-PM 06:00</li>
						<li>Sat,Sun,Holiday OFF</li>
					</ul>
				</li>
			
		</div>
	</div>	
</aside>

<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu3>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>


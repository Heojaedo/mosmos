<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<span id="span_200" style="color:blue;cursor:pointer">200g</span>
<span id="span_500" style="color:blue;cursor:pointer">500g</span>
<style>
	.input_itemCount {
		width:30px;
	}
</style>
<script>
	$(document).ready(function () {
		if(${option == "op1"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox1").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus1'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount1' name='itemCount1' value='1'>\r\n" + 
												"				<button id='btn_plus1'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice1'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-분쇄 안함 Whole Bean/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox1]").attr('value','분쇄 안함 Whole Bean/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox2").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus2'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount2' name='itemCount2' value='1'>\r\n" + 
												"				<button id='btn_plus2'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice2'>${price*2}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-분쇄 안함 Whole Bean/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox2]").attr('value','분쇄 안함 Whole Bean/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		} else if(${option == "op2"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox3").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus3'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount3' name='itemCount3' value='1'>\r\n" + 
												"				<button id='btn_plus3'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice3'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-핸드 드립 Hand Drip/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox3]").attr('value','핸드 드립 Hand Drip/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox4").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus4'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount4' name='itemCount4' value='1'>\r\n" + 
												"				<button id='btn_plus4'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice4'>${price*2}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-핸드 드립 Hand Drip/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox4]").attr('value','핸드 드립 Hand Drip/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		} else if(${option == "op3"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox5").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus5'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount5' name='itemCount5' value='1'>\r\n" + 
												"				<button id='btn_plus5'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice5'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-커피 메이커 Coffee Maker/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox5]").attr('value','커피 메이커 Coffee Maker/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox6").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus6'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount6' name='itemCount6' value='1'>\r\n" + 
												"				<button id='btn_plus6'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice6'>${price*2}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-커피 메이커 Coffee Maker/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox6]").attr('value','커피 메이커 Coffee Maker/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		} else if(${option == "op4"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox7").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus7'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount7' name='itemCount7' value='1'>\r\n" + 
												"				<button id='btn_plus7'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice7'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-가정용 더치 Dutch/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox7]").attr('value','가정용 더치 Dutch/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox8").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus8'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount8' name='itemCount8' value='1'>\r\n" + 
												"				<button id='btn_plus8'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice8'>${price*2}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-가정용 더치 Dutch/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox8]").attr('value','가정용 더치 Dutch/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		} else if(${option == "op5"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox9").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" +
												"				<button id='btn_minus9'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount9' name='itemCount9' value='1'>\r\n" + 
												"				<button id='btn_plus9'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice9'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-모카 포트 Moka Pot/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox9]").attr('value','모카 포트 Moka Pot/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox10").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus10'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount10' name='itemCount10' value='1'>\r\n" + 
												"				<button id='btn_plus10'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice10'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-모카 포트 Moka Pot/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox10]").attr('value','모카 포트 Moka Pot/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		} else if(${option == "op6"}) {
			$("#span_200").on("click",function () {
				if($("#checkbox11").val() == ""){
					$("#div_weightText").text("[필수] 200g");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus11'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount11' name='itemCount11' value='1'>\r\n" + 
												"				<button id='btn_plus11'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice11'>${price}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-가정용 에스프레소 ESP Machine/200g</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox11]").attr('value','가정용 에스프레소 ESP Machine/200g');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
			$("#span_500").on("click",function () {
				if($("#checkbox12").val() == ""){
					$("#div_weightText").text("[필수] 500g (+${price}원)");
					$("#div_itemSelect2").before("<div class='div_itemTable'>\r\n" + 
												"	<table border=1 style='width:450px;font-size:12px'>\r\n" + 
												"		<tr>\r\n" + 
												"			<td width=290px>${itemName}</td>\r\n" + 
												"			<td rowspan=2 width=90px align=center>\r\n" + 
												"				<button id='btn_minus12'>-</button>\r\n" + 
												"				<input class='input_itemCount' id='itemCount12' name='itemCount12' value='1'>\r\n" + 
												"				<button id='btn_plus12'>+</button>\r\n" + 
												"			</td>\r\n" + 
												"			<td rowspan=2 width=70px><span id='itemPrice12'>${price*2}원</span></td>\r\n" + 
												"		</tr>\r\n" + 
												"		<tr>\r\n" + 
												"			<td>-가정용 에스프레소 ESP Machine/500g (+${price}원)</td>\r\n" + 
												"		</tr>\r\n" + 
												"	</table>\r\n" + 
												"</div>");
					$("input[name=checkbox12]").attr('value','가정용 에스프레소 ESP Machine/500g (+${price}원)');
				} else {
					alert("아래 리스트에서 이미 선택된 옵션을 삭제 후 다시 선택해주세요.");
				}
			});
		}
		//분쇄안함 200g 마이너스
		$(document).off("click").on("click", "#btn_minus1", function() {
			var count = $("#itemCount1").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount1]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice1").text(allprice+"원");
		});
		//분쇄안함 200g 플러스
		$(document).on("click", "#btn_plus1", function() {
			var count = $("#itemCount1").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount1]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice1").text(allprice+"원");
		});
		$(document).on("click", "#btn_minus2", function() {
			var count = $("#itemCount2").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount2]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice2").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus2", function() {
			var count = $("#itemCount2").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount2]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice2").text(allprice+"원");
			$.ajax({
				url: "beans_weight_choose", //전송받을 페이지 경로
				type: "post", //데이터 읽어오는 방식
				dataType: "text", //데이터 방식
				data: "count1="+itemCount1.value+"&price1="+allprice+"&count2="+itemCount2.value+"&price2="+parseInt(itemCount2.value)*parseInt($(price*2)),
				//data: {"option":$("#beansOption").val(),"price":${price}},
				error:function(){ //실패일 경우
					alert("실패");
				},
				success:function(text){ //성공일 경우
					$("#label_price").html(text);
				}
			});
		});		
		$(document).on("click", "#btn_minus3", function() {
			var count = $("#itemCount3").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount3]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice3").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus3", function() {
			var count = $("#itemCount3").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount3]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice3").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus4", function() {
			var count = $("#itemCount4").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount4]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice4").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus4", function() {
			var count = $("#itemCount4").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount4]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice4").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus5", function() {
			var count = $("#itemCount5").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount5]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice5").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus5", function() {
			var count = $("#itemCount5").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount5]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice5").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus6", function() {
			var count = $("#itemCount6").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount6]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice6").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus6", function() {
			var count = $("#itemCount6").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount6]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice6").text(allprice+"원");
		});
		$(document).on("click", "#btn_minus7", function() {
			var count = $("#itemCount7").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount7]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice7").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus7", function() {
			var count = $("#itemCount7").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount7]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice7").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus8", function() {
			var count = $("#itemCount8").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount8]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice8").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus8", function() {
			var count = $("#itemCount8").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount8]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice8").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus9", function() {
			var count = $("#itemCount9").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount9]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice9").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus9", function() {
			var count = $("#itemCount9").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount9]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice9").text(allprice+"원");
		});	
		$(document).on("click", "#btn_minus10", function() {
			var count = $("#itemCount10").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount10]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice10").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus10", function() {
			var count = $("#itemCount10").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount10]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice10").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus11", function() {
			var count = $("#itemCount11").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount11]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice11").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus11", function() {
			var count = $("#itemCount11").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount11]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price});
			$("#itemPrice11").text(allprice+"원");
		});		
		$(document).on("click", "#btn_minus12", function() {
			var count = $("#itemCount12").val();
			count = parseInt(count);
			count -= 1;
			if(count <= 0) {
				alert("최소 수량은 1개입니다.");
				count = 1;
			}	
			$("input[name=itemCount12]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice12").text(allprice+"원");
		});
		$(document).on("click", "#btn_plus12", function() {
			var count = $("#itemCount12").val();
			count = parseInt(count);
			count += 1;
			$("input[name=itemCount12]").attr('value',count);
			var allprice = 0;
			allprice = count * parseInt(${price*2});
			$("#itemPrice12").text(allprice+"원");
		});
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>
	#div_item {
		display:inline-block;
		position:absolute;
	}
	#div_itemImg {
		display:inline-block;
		position:relative;
		margin-right:150px;
	}
	#div_itemContents {
		background-color:lightyellow;
		width:450px;
		display:inline-block;
		position:absolute;
	}
	#div_item img {
		margin-left:90px;
		width:705px;
		object-fit:cover;
	}
	#div_itemName {
		margin-bottom:30px;
	}
	#div_itemPrice {
		margin-bottom:20px;
	}
	#div_itemDelivery {
		margin-bottom:20px;
	}
	#div_beansOption {
		margin-top:10px;
		margin-bottom:10px;
	}
	#div_weightText {
		margin-bottom:10px;
	}
	#div_ordercountText {
		margin-top:10px;
		margin-bottom:20px;
	}
	#div_itemSelect {
		margin-top:20px;
	}
	#div_itemSelect2 {
		margin-bottom:30px;
	}
</style>
<script>
	function option() {
		$.ajax({
			url: "beans_option", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "option="+beansOption.value+"&price=${price}&name=${itemName}",
			//data: {"option":$("#beansOption").val(),"price":${price}},
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				$(".span_weight").html(text);
			}
		});
	}
</script>

<div id="div_item">
	<div id="div_itemImg"><img src="/upload/${filename}"></div>
	<div id="div_itemContents">
		<div id="div_itemName">${itemName}</div>
		<div id="div_itemPrice">판매가 ${price}원</div>
		<div id="div_itemDelivery">배송비 ${delivery}원 (30,000원 이상 구매 시 무료)</div>
		<div><hr></div>
		<div id="div_beansOption">분쇄상태
			<select id="beansOption" name="beansOption" onchange="option()">
				<option selected disabled>- [필수] 옵션을 선택해주세요 -</option>
				<option disabled>---------------</option>
				<option value="op1">분쇄 안함 Whole Bean</option>
				<option value="op2">핸드 드립 Hand Drip</option>
				<option value="op3">커피 메이커 Coffee Maker</option>
				<option value="op4">가정용 더치 Dutch</option>
				<option value="op5">모카 포트 Moka Pot</option>
				<option value="op6">가정용 에스프레소 ESP Machine</option>
			</select>
		</div>
		<div>중량 <span class="span_weight">200g 500g</span></div>
		<div id="div_weightText">[필수] 옵션을 선택해주세요</div>
		<div><hr></div>
		<div id="div_ordercountText">(최소주문수량 1개 이상)</div>
		<div><hr></div>
		<div>
		<input type="hidden" id="checkbox1" name="checkbox1" value="">
		<input type="hidden" id="checkbox2" name="checkbox2" value="">
		<input type="hidden" id="checkbox3" name="checkbox3" value="">
		<input type="hidden" id="checkbox4" name="checkbox4" value="">
		<input type="hidden" id="checkbox5" name="checkbox5" value="">
		<input type="hidden" id="checkbox6" name="checkbox6" value="">
		<input type="hidden" id="checkbox7" name="checkbox7" value="">
		<input type="hidden" id="checkbox8" name="checkbox8" value="">
		<input type="hidden" id="checkbox9" name="checkbox9" value="">
		<input type="hidden" id="checkbox10" name="checkbox10" value="">
		<input type="hidden" id="checkbox11" name="checkbox11" value="">
		<input type="hidden" id="checkbox12" name="checkbox12" value="">
		</div>
		<div id="div_itemSelect"></div>
		<div id="div_itemSelect2"></div>
		<div id="div_allPrice"><label id="label_price"></label></div>
	</div>
</div>

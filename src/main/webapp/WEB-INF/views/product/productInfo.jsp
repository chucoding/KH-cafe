<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//플래너 정보 입력
	$("#insertBtn").on('click', function() {
		var index = $("#order_detail").children().size()+1;
		console.log(index);
		for(var i = 1; i<$("#order_detail").children().size();i++){
			if($("#order_detail").children("div").eq(i).children("div").eq(0).text()=='${productInfo.productName}'){
				var cnt =$("#order_detail").children("div").eq(i).children("div").eq(2).children("input").eq(0).val()
				
				console.log(cnt+$("#insertcnt").val())
				
				var d = Number(cnt)+Number($("#insertcnt").val());
				console.log(d);
				$("#order_detail").children("div").eq(i).children("div").eq(2).children("input").val(d);
				return false;
			}
			console.log("확인 "+i+"열"+$("#order_detail").children("div").eq(i).children("div").eq(0).text());
		}
		var div =$("<div>").attr({name:"product", class:"order_idx"})
		div.html("<div>${productInfo.productName}</div><div>${productInfo.price}</div><div></div>")
		var btn =$("<input>").attr({type:'number', min:'0',id:'insertcnt',value:$("#insertcnt").val()})
		div.children("div").eq(2).append(btn)
		$("#order_detail").append(div);

	});
	$("#returnBtn").on('click',function(){
		$.ajax({
			type : "get",
			url : "/product/list",
			data : {
				"productNo" : 0
			},
			dataType : "html",
			success : function(data) {
				$(".product_list").html(data);
				$("#product_indx").children().children().on("click",function() {
					var productno = $(this).children().eq(1).children("input").eq(0).val();
//						console.log("placeno :"+placeno)
					$.ajax({
						type : "get",
						url : "/product/productInfo",
						data : {
							"productNo" : productno
						},
						dataType : "html",
						success : function(data) {
							$(".product_list").html(data);
						},
						error : function() {
							console.log("fail");
						}
					})
					
				});
			},
			error : function() {
				console.log("fail");
			}
		})
		
	})
	
	
})
		
</script>

<div class="text-center" style="width:300px;">
	<table border="1" id="product_view">
		<tr>
			<td>상품명</td>
			<td>${productInfo.productName }</td>
		</tr>
		<tr>
			<td>기본 카테고리</td>
			<td>비고</td>
		</tr>
		<tr>
			<td>상세 카테고리</td>
			<td>비고</td>
		</tr>
		<tr>
			<td>판매가</td>
			<td>${productInfo.price}</td>
		</tr>
		<tr>
			<td>판매상태</td>
			<td>${productInfo.selStatus }</td>
		</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" min="0" value="0" id="insertcnt"></td>
			</tr>
	</table>
		<button id="returnBtn">목록으로</button><button id="insertBtn">입력</button>	
</div>
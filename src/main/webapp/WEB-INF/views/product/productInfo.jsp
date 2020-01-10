<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//정보 입력
	$("#insertBtn").on('click', function() {
		var index = $("#order_detail").children().size()+1;
		console.log(index);
		for(var i = 1; i<$("#order_detail").children().size();i++){
			if($("#order_detail").children("div").eq(i).children("div").eq(0).text()=='${productInfo.productName}'  &&$("#order_detail").children("div").eq(i).children("div").eq(2).text()== $("#optionVal option:selected").text()){
				var cnt =$("#order_detail").children("div").eq(i).children("div").eq(3).children("input").eq(0).val()
				
				console.log(cnt+$("#proCnt").val())
				
				var d = Number(cnt)+Number($("#proCnt").val());
				console.log(d);
				$("#order_detail").children("div").eq(i).children("div").eq(3).children("input").val(d);
				return false;
			}
			console.log("확인 "+i+"열"+$("#order_detail").children("div").eq(i).children("div").eq(0).text());
		}
		var div =$("<div>").attr({name:"product",proNo:'${productInfo.productNo}'})
		div.addClass("order_idx");
		div.html("<div>${productInfo.productName}</div><div>${productInfo.price}</div><div></div><div></div>")
		var btn =$("<input>").attr({type:'number', min:'0',id:'insertcnt',value:$("#proCnt").val()})
		var opVal =$("<input>").attr({type:'hidden', id:'optionNo',value:$("#optionVal").val()})
		div.children("div").eq(2).text($("#optionVal option:selected").text())
		div.children("div").eq(2).append(opVal)
		div.children("div").eq(3).append(btn)
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
			<td>${productInfo.productName }<input type="hidden" value='${productInfo.productNo}'/></td>
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
	</table>
	<hr>
	<table>
		<tr>
			<th>옵션 이름</th>
			<th>수량</th>
		</tr>
			<tr>
				<td>
					<select id="optionVal">
		<c:forEach var="option" items="${option_list }">
						<option value="${option.optionNo }">${option.optionName }</option>
		</c:forEach>
					</select>
				</td>
				<td><input id="proCnt" type="number" min="0"></td>
			</tr>
	</table>
		<button id="returnBtn">목록으로</button><button id="insertBtn">입력</button>	
</div>
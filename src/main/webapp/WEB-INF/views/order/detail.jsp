<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#returnBtn").on('click',function(){
				$.ajax({
					type : "get",
					url : "/order/list",
					data : {
						"cusid" : '${cusid}'
					},
					dataType : "html",
					success : function(data) {
// 						$(".product_list").html(data);
						$(".info3").html(data);
					},
					error : function() {
						console.log("fail");
					}
				})
	})

	var proName = new Array();
	<c:forEach items="${productList}" var="product">
		var json  =new Object();
		json.productName="${product.productName}"
		proName.push(json);
	</c:forEach>
	
	for (var i=1 ; i<=proName.length;i++){
		$("#proTable").children("tbody").children("tr").eq(i).children("td").eq(0).text(proName[i-1].productName+"")
	}
	
});

</script>
<style type="text/css">
#order_detail_body > div >table > tbody > tr > td{
	width : 80px;
}	
</style>
<div id="order_detail_body" style="width: 23%;height: 100%">
	<div style="width: 100%;height: 15%; float: left;">
	<table border="1" style="margin: 0px; float: left;">
		<tr>
			<th>주문 번호</th>
			<td>${order.orderNo }</td>
		</tr>
		<tr>	
			<th>지점 번호</th>
			<td>${order.shopNo }</td>
		</tr>	
		<tr>
			<th>주문 날짜</th>
			<td>${order.orderDate }</td>
		</tr>	
		<tr>	
			<th>고객 요구사항</th>
			<td>${order.cusReq }</td>
		</tr>
	</table>
	</div>
	<br><br>
	
	<font>상품 정보</font>
	<div>
	<table id="proTable" border="1" style="margin: 0px; float: left;">
		<tr>
			<th>상품명</th>
			<th>수량</th>
		</tr>
		<c:forEach var="product" items="${orderProductList }">
			<tr>
				<td>${product.productNo }</td>			
				<td>${product.productcnt }</td>			
			</tr>
		</c:forEach>
	</table>
	</div>
	<br><br><br>
	<button id="returnBtn">목록으로</button>
<!-- 	<button id="buyBtn">결제</button> -->
</div>
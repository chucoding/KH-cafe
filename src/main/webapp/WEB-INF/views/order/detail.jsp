<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
//플래너 정보 입력
	$("#inputOrder").on('click', function() {
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
})
		
</script>

<div class="col-md-12" id="order_detail" style="height:700px;border: 3px solid #337ab7;float:left;">
	<div class="order_idx"><div>품목명</div><div>가격</div><div>수량</div></div>
</div>
<div style="float:left;padding: 30px 125px; border:3px solid #337ab7; "><button id="inputOrder">주문 신청</button></div>
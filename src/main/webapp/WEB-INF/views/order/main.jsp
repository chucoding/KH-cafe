<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
			* element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.index {
	border: 2px solid #337ab7;
}

.container {
	height: 800px;
	width: 100%;
}

div div>.selected {
	color: white;
	background: #337ab7;
}

.side_bar {
	height: 100%;
	width: 20%;
	border-right: 2px solid #337ab7;
	margin: 0;
	float: left;
}

.info_body {
	height: 100%;
	width: 35%;
	margin: 0;
	float: left;
}

.bar_con {
	height: 10%;
	float: left;
	width: 100%;
	height: 40px;
	padding: 9px;
	border-bottom: 2px solid #337ab7;
}

.info_body > div {
	height: 100%;
	width: 30%;
	z-index: 1;
	position: absolute;
	background: white;
}

.info_body > .selected_info {
	height: 100%;
	width: 30%;
	z-index: 10;
	position: absolute;
	background: white;
}

.index_ele {
	hieght: 50px;
	width: 80%;
	border-bottom: 1px solid #337ab7;
}

.selected_con {
	background: #337ab7;
	color: white;
}
#product_view > tbody > tr>td:nth-child(1){
	width:120px;
	height:30px;

}

#product_view > tbody > tr > td{
	width:90px;
	height:30px;
}

.order_idx > div{
	width: 100px;
	height:28px;
	float:left;
	border: 1px solid #337ab7;
}
#insertcnt{
	width: 40px;
}

</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#product_indx").children().children().on("click",function() {
							var productno = $(this).children().eq(1).children("input").eq(0).val();
// 							console.log("placeno :"+placeno)
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
				
				//인덱스 선택 버튼 동작
				$(".side_bar .bar_con").on('click',function(){
					console.log("시동");
					var index= $(this).index()+1;
					console.log(index);
					$(".info_body > .selected_info").removeClass("selected_info")
					$(".info_body > .info"+index).addClass("selected_info")
					$(".side_bar > .selected_con").removeClass("selected_con");
					$(".side_bar").children("div").eq(index-1).addClass("selected_con");

				})
			});
</script>
</head>

<body>
	<div class="container text-center">
		<div class="side_bar">
			<div class="bar_con product selected_con">상품 정보</div>
			<div class="bar_con order">주문 정보</div>
			<div class="bar_con order_list">주문 목록</div>
			<div class="bar_con payment">결제 정보</div>
			<div class="bar_con payment_list">결제 목록</div>
		</div>
		<div class="info_body">
			<div class="product_list info1 selected_info">
				<jsp:include page="../../views/product/list.jsp"></jsp:include>
			</div>
			<div class="info2">
				<jsp:include page="../../views/order/detail.jsp"></jsp:include>
			</div>
			<div class="info3">
				<jsp:include page="../../views/order/list.jsp"></jsp:include>
			</div>
			<div class="info4">
				<jsp:include page="../../views/payment/insert.jsp"></jsp:include>
			</div>
			<div class="info5">
				<jsp:include page="../../views/payment/list.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>
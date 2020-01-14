<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<title></title>

<!-- 헤더 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- select2 4.0.5 버전 -->
<link rel="stylesheet" href="/resources/vendor/select2/select2.min.css" />


<!-- 폰트 어썸 4.7 버전 -->
<link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

<!-- 폰트어썸 5.12 버전 -->
<script src="https://kit.fontawesome.com/a1cb5a2b66.js" crossorigin="anonymous"></script>

<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet">

<!-- 제이쿼리 3.2.1 버전 -->
<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript -->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- select2 JS -->
<script src="/resources/vendor/select2/select2.min.js"></script>

<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->


<!-- Page level plugin JavaScript -->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>


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
	width: 50%;
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

.info_body > div:nth-child(3) {
	height: 100%;
	width: 800px;
	z-index: 1;
	position: absolute;
	background: white;
	visibility: hidden;
}

.container > .info_body > .selected_info {
	height: 100%;
	z-index: 10;
	position: absolute;
	background: white;
	visibility: visible;
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
.order_idx{
	width: 405px;
	height:28px;
}



</style>

<script type="text/javascript">
	var table;
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
				
				table = $('#myTable').DataTable({
			    	"scrollY" : 200, //테이블 고정 크기 설정
			    	"columnDefs" : [
			    	      {width: '5%', targets : [0] },
			    	      {"render":function(data){
				    			data='<div onclick="detail('+data+')">'+data+'</div>'
				    					return data;
				    		} ,width: '7%', targets : [1] },
			    	      { width: '5%', targets : [2] },
			    	      { width: '5%', targets : [3] },
			    	      { width: '5%', targets : [4] },

			    	],
			    	"scrollCollapse" : true, //가변 크기 막기
			    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
			    	"language": {
			            "emptyTable": "데이터가 없어요.",
			            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
			            "info": "현재 _START_ - _END_ / _TOTAL_건",
			            "infoEmpty": "데이터 없음",
			            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			            "search": "빠른검색 : ",
			            "emptyTable": "발주 목록이 존재하지 않습니다.",
			            "zeroRecords": "일치하는 데이터가 없어요.",
			            "loadingRecords": "로딩중...",
			            "processing":     "잠시만 기다려 주세요...",
			            "paginate": {
			            	"first": "처음",
			                "last": "마지막",
			                "next": "다음",
			                "previous": "이전"
			            }
			        },
			    	"length" : 5, //한페이지에 보여줄 페이지 갯수
			    	"serverSide" : false, //클라이언트에서 처리
			    	"processing" : true, 
			    	ajax : {
						"type" : "GET",
						"url" : "/order/search",
						"dataType":"json",
						"data" : function(d) {
							d.cusid = "${userid}"
						},
						"dataSrc" : function(json){
							
							for(let i=0; i<json.data.length; i++){
								if(json.data[i][4] == "0"){
									json.data[i][4] = "장바구니"
								}
								if(json.data[i][4] == "1"){
									json.data[i][4] = "주문완료"
								}
								if(json.data[i][4] == "2"){
									json.data[i][4] = "결제완료"
								}
								
							}
							console.log(json.data);
							return json.data;
						}
					}
			    });
				//정보 입력
				$("#inputOrder").on('click', function() {
					var optionList = [];
					var productNo = []
					var productcnt = []
					var shopNo = $("#shopNo").val();
					console.log(shopNo);
					for(var i = 1; i<$("#order_detail").children().size();i++){
						var no = $("#order_detail").children("div").eq(i).attr("prono");
						console.log(no);
						productNo.push(no)
						optionList.push($("#order_detail").children("div").eq(i).children("div").eq(2).children("input").eq(0).val())
						productcnt.push($("#order_detail").children("div").eq(i).children("div").eq(3).children("input").eq(0).val())
							console.log("확인 "+i+"열"+$("#order_detail").children("div").eq(i).children("div").eq(0).text());
						}
					console.log(productNo)
					console.log(productcnt)
					$.ajax({
						type : "post",
						url : "/order/input",
						data : {
							"productNo" :productNo,
							"optionNo" :optionList,
							"shopNo" : shopNo,
							"productcnt":productcnt
						},
						dataType : "text",
						success : function(data) {
							console.log(data)
							console.log($("#order_detail").children().size())
							var cnt=$("#order_detail").children().size()
							for(var j = 1; j<cnt;j++){
								console.log(j)
								$("#order_detail").children("div").eq(1).remove();
							}
							reload()
						}	,
						error : function() {
							console.log("fail");
						}
					})
				});
				
			});
	function reload(){
		$('#myTable').DataTable().ajax.reload();
	}
	function detail(order_No){
		$.ajax({
			type : "post",
			url : "/order/detail",
			data : {
				"orderNo" :order_No
			},
			dataType : "html",
			success : function(data) {
				console.log("success")
			}	,
			error : function() {
				console.log("fail");
			}
		})
	}
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
				<jsp:include page="../../views/order/insert.jsp"></jsp:include>
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
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
</html>
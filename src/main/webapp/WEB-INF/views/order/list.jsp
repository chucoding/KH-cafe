<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet">

<script type="text/javascript">
var table;
$(document).ready(function() {
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
        "emptyTable": "주문 목록이 존재하지 않습니다.",
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
			console.log(data)
			$(".info3").html(data);
		}	,
		error : function() {
			console.log("fail");
		}
	})
}
</script>

<div class="col-md-12" id="order_list">

<table id="myTable" class="display table table-bordered" >
    <thead class="thead-dark">
        <tr>
            <th>no</th>
            <th>주문번호</th>
            <th>지점 번호</th>
            <th>주문 날짜</th>
            <th>진행 상태</th>
        </tr>
    </thead>
</table>



</div>
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
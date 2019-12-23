<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<div>
	<table border="1">
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
	</table>
</div>
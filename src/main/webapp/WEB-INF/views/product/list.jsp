<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table border="1" id="product_indx">
	<tr>
	<th>상품 번호</th>
	<th>상품명</th>
	<th>판매가</th>
	</tr>
		<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.productNo }</td>
				<td><input type="hidden" value="${list.productNo }">${list.productName }</td>
				<td>${list.price }</td>
			</tr>
		</c:forEach>
	</table>

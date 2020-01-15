<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
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

</head>
<body>
<div class="container text-center"> 
	<h1>메인 화면</h1>
	<c:choose>
		<c:when test="${logCk eq false or logCk eq null  }">
			<div>
				<a href="/login/login"><button>로그인</button></a>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<a href="/order/main"><button>주문 창</button></a>
				<a href="/login/logout"><button>로그아웃</button></a>
			</div>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>
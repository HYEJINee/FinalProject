<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">TAWAR</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li id="proposal"><a href="/proposal/list">안건 건의<span class="sr-only"></span></a></li>
					<li id="ongoing"><a href="/ongoing/list">토론중</a></li>
					<li id="finished"><a href="/finished/list">종료된 토론</a>
				</ul>
				<form class="navbar-form navbar-left" action="/search/search_result"  method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="검색어를 입력해주세요" name="search_word"  id="search_word">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty USER_KEY != true}">
						<li><a href="/member/mypage">마이페이지</a></li>
					</c:if>
					<c:if test="${empty USER_KEY != false}">
						<li class="dropdown"><a href="/member/member_login">로그인</a></li>
					</c:if>
					<c:if test="${empty USER_KEY != true}">
						<li class="dropdown"><a href="/member/member_logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<head>
	<title>Home</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="include/header.jsp" %>
	<!-- Content Title -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2>인권을<br>자유를<br/>논하다</h2>
			</div>
			<div class="col-md-offset-9">
				<label class="label label-primary">찬반</label>
				<span>의견논제1</span><br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제2</span><br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제3</span><br/><br/>
			</div>
		</div>
	</div>
	<hr/>
	<!-- Content List -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>토론중</h3>
				<hr/>
				<div class="col-md-4">
					<label class="label label-primary">찬반</label><br/><br/>
					<h3>자살은 개인의 선택이다</h3>
					<hr/>
					<p>자살은 '자신의 생명을 고의로 끊는 행위'를 이른다. 어떤 사람에게는 샬라샬라 쿠알라룸푸</p>
					<span class="glyphicon glyphicon-user"> 27</span>
					<span style="color:blue"> 찬 50%</span>
					<span style="color:red"> 반 30%</span>
					<span style="color:gray"> 중 20%</span>
				</div>
				<div class="col-md-4">
					<label class="label label-warning">의견</label><br/><br/>
					<h3>정치권 철새현상에 대한 의견</h3>
					<hr/>
					<p>자살은 '자신의 생명을 고의로 끊는 행위'를 이른다. 어떤 사람에게는 샬라샬라 쿠알라룸푸</p>
					<span class="glyphicon glyphicon-education"> 27</span>
				</div>
				<div class="col-md-4">
					<label class="label label-primary">찬반</label><br/><br/>
					<h3>노점상 단속에 대한 찬반</h3>
					<hr/>
					<p>자살은 '자신의 생명을 고의로 끊는 행위'를 이른다. 어떤 사람에게는 샬라샬라 쿠알라룸푸</p>
					<span class="glyphicon glyphicon-user"> 27</span>
					<span style="color:blue"> 찬 50%</span>
					<span style="color:red"> 반 30%</span>
					<span style="color:gray"> 중 20%</span>
				</div>
			</div>
		</div>
	</div>
	<hr/>
	<!-- Board -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<center><h3>안건 건의</h3></center>
				<label class="label label-primary">찬반</label>
				<span>의견논제1</span>
				<span>아이콘</span>
				<br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제2</span>
				<span>아이콘</span>
				<br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제3</span>
				<span>아이콘</span>
				<br/><br/>
			</div>
			<div class="col-md-6">
				<center><h3>종료된 토론</h3></center>
				<label class="label label-primary">찬반</label>
				<span> 의견논제1</span>
				<span>아이콘</span>
				<br/><br/>
				<label class="label label-primary">찬반</label>
				<span> 의견논제2</span>
				<span>아이콘</span>
				<br/><br/>
				<label class="label label-primary">찬반</label>
				<span> 의견논제3</span>
				<span>아이콘</span>
				<br/><br/>
			</div>
		</div>
	</div>
</body>
</html>

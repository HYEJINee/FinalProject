<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TAWAR</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/proposal/css/list.css" rel="stylesheet">
<style>
	.grid-item {
		width: 358px;
		height: 260px;
	}
	
	.grid-item {
		margin-bottom: 10px;
	}
	
	.grid-item--width2 { width: 600px; }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<div id="content" class="container">
	
	<h3 class="col-md-9">안건 건의</h3>
	<div class="btn-group" role="group">
		<button class="btn btn-link" data-filter="*">모든 토론</button>
		<button class="btn btn-link" data-filter=".topic_0">찬반 토론</button>
		<button class="btn btn-link" data-filter=".topic_1">자유 토론</button>
	</div>
	
		<c:if test="${empty USER_KEY != true}">
			<div id="divWrite">
				<p class="text-center">
					<button class="customBtn btn-write customBtn-lg">안건 건의 글 작성하기</button>
				</p>
				<p id="login_needed" class="text-center"></p>
			</div>
		</c:if>
		
			<div class="grid">
				<c:forEach items="${topicList}" var="topic">
					<div class="grid-item card topic_${topic.topic_type}" topic-no="${topic.topic_no}">
						<c:choose>
							<c:when test="${topic.img_file_name != '' && topic.img_file_name != null}">
								<div class="card-header">
									<c:choose>
										<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
										<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
									</c:choose><br>
									<h4>${topic.topic_title}</h4>
									<img src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}" style="position: absolute; left:0; top:-50%; width:100%; height:auto; opacity:0.5;z-index:-1;">
								</div>
							</c:when>
							<c:otherwise>
								<div class="card-header" style="background-color: rgba(230, 230, 230, 0.5);">
									<c:choose>
										<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
										<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
									</c:choose><br>
									<h4>${topic.topic_title}</h4>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="card-body">
							${topic.topic_short_cont}
						</div>
						<div class="card-footer">
							<p class="text-right">
								<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${topic.recommend}
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		
		<nav id="page_nav" style="display: none;">
			<p><a href="page-2.html"></a></p>
		</nav>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
	<script src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/proposal/js/jquery.infinitescroll.min.js"></script>
	
	<script>
		$(function() {
				
			var $grid = $('.grid').isotope({
				// set itemSelector so .grid-sizer is not used in layout
				itemSelector: '.grid-item',
				// use element for option
				columnWidth: 358,
				masonry: {
					gutter: 30
				}
			});
			
			$grid.infinitescroll({
				navSelector : '#page_nav',
				nextSelector : '#page_nav a',
				itemSelector : '.grid-item',
				loading: {
					finishedMsg: '더이상 불러올 안건이 존재하지 않습니다.',
					img: 'http://i.imgur.com/qkKy8.gif'
				}
			},
				function(newElements) {
					$grid.isotope('appended', $(newElements));
				}
			);

			$('.btn-group').on('click', 'button', function() {
				var filterValue = $(this).attr('data-filter');
				$grid.isotope({filter: filterValue});
			})
		});
		
	
		$('.btn-write').on('click', function() {
	    	location.href='/proposal/write.do';
    	});
    	
    	$(function () {
    		  $('[data-toggle="tooltip"]').tooltip()
    	});
    	
    	$('.card').on('click', function() {
    		var topic_no = $(this).attr("topic-no");
	   		location.href="read?topic_no=" + topic_no;
    	});
	</script>
</body>
</html>
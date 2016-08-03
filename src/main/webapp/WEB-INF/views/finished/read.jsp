<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Read Page</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/read/css/read.css" rel="stylesheet" />
</head>
<body>
	<!-- 종료된 토론 페이지 보는것만 가능, 투표,의견 작성, 삭제, 수정 불가능 -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container top">
		<form class="form-horizontal">
		<!-- 토론 주제에 따른 타이틀 변경 -->
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
					<h1>
						<span class="label label-primary">찬반</span>
					</h1>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${readlist.topic_type eq 1}">
					<h1>
						<span class="label label-info">자유</span>
					</h1>
				</c:when>
			</c:choose>
			<br />
			<!-- 토론 제목 및 종료 날짜 -->
			<div class="form-group">
				<div class="col-sm-5">
					<h2>${readlist.topic_title}</h2>
				</div>

				<div style="text-align: right; color: red">
					<h3>
						<em>토론 종료 날짜 : ${readlist.debate_endate}</em><br />
					</h3>
				</div>
			</div>
			<br />
			<!-- 토론의 소제목과 건의자 -->
			<div class="form-group">
				<h3>${readlist.topic_short_cont}</h3>
			</div>
			<div style="text-align: right">
				<h4>건의자 : ${readlist.user_nick}</h4>
				<hr />
			</div>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal">
		<!-- 찬반 토론일때만 투표가 나오도록 설정 -->
		<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
			<div class="form-group">
				<div class=" col-sm-offset-1 col-sm-2">
					<h2>
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)}
					</h2>
				</div>
				<div class="col-sm-2">
					<c:choose>
						<c:when
							test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
							<h4 style="color: blue">찬성 : 0.0%</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: blue">
								찬성 :
								<fmt:formatNumber
									value="${readlist.debate_tot_pro/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"
									pattern="#.#" />
								%
							</h4>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-sm-2">
					<c:choose>
						<c:when
							test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
							<h4 style="color: red">반대 : 0.0%</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: red">
								반대 :
								<fmt:formatNumber
									value="${readlist.debate_tot_con/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"
									pattern="#.#" />
								%
							</h4>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-sm-2">
					<c:choose>
						<c:when
							test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
							<h4 style="color: gray">중립 : 0.0%</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: gray">
								중립 :
								<fmt:formatNumber
									value="${readlist.debate_tot_neut/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"
									pattern="#.#" />
								%
							</h4>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			</c:when>
			</c:choose>
		</form>
		<form class="form-horizontal">
		<!-- 찬반 토론일때만 투표가 나오도록 설정 -->
		<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<div class="progress">
						<div class="progress-bar progress-bar-info progress-bar-striped"
							role="progressbar"
							style="width: ${readlist.debate_tot_pro/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}%"></div>
						<div class="progress-bar progress-bar-danger progress-bar-striped"
							role="progressbar"
							style="width: ${readlist.debate_tot_con/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}%"></div>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
		</form>
		<form class="form-horizontal" action="vote" method="post" id="voteform">
		<!-- 찬반 토론일때만 투표부분에 텍스트 출력 -->
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
			<div class="form-group">
				<div class="col-sm-offset-5">
							<h4>종료된 토론입니다.</h4>
				</div>
			</div>
			</c:when>
			</c:choose>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal">
		<!-- 본문 -->
			<div>
				<h2>본문</h2>
				<h4>${readlist.topic_long_cont}</h4>
				<br />
				<hr />
			</div>
			<div>
			<!-- 참고자료 링크를 넣어서 클릭시 다른 사이트가 새창으로 띄움 -->
				<h2>참고자료</h2>
				<c:forEach items="${readResource}" var="resource">
					<br />
					<h3>
						<a href=http://${resource.topic_resource_link} target="_blank">${resource.topic_resource_title}</a>
					</h3>
					<br />
				</c:forEach>
			</div>
			<hr />
			<!-- 찬반 주제일때만 찬성-반대 의견이 보임 -->
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
			<div class="row marketing">
				<div class="col-lg-6">
					<h2 style="text-align: center">찬성 의견</h2>
					<br />
					<h4>${readlist.topic_pro}</h4>
					<br />
				</div>
				<div class="col-lg-6">
					<h2 style="text-align: center">반대 의견</h2>
					<br />
					<h4>${readlist.topic_con}</h4>
					<br />

				</div>
			</div>
			</c:when>
			</c:choose>
		</form>
		<h2>의견</h2>
		<hr />
	</div>
	<div class="grid ScrollSpy col-sm-offset-2 col-sm-10">
		<!-- 의견들을 list로 담아와서 foreach로 뿌림 -->
		<c:forEach items="${readOpinion}" var="opinion" varStatus="status">
			<!-- 찬성 의견, grid-item은 무한 스크롤을 위해 선언 -->
			<c:choose>
				<c:when test="${opinion.vote_type eq 0}">
					<div class="container grid-item">
						<form class="form-horizontal" action="like" method="post" >
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-2">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 60px; width: 60px" />
										</c:when>
									</c:choose>
								</div>
								<!-- 닉네임과 찬성 텍스트 뿌림 -->
								<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #3333FF">
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-primary" style="margin-top: 20px">찬성</span>
										</h3>
									</div>
									<!-- 태그가 있을 경우 출력 -->
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="tagstart">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">#참조</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">#반박</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									</div>
									<!-- 의견 내용 -->
									<hr />
									${opinion.op_content} <br />
									<hr />
									<!-- 날짜, 좋아요, 싫어요, 답글 버튼 클릭 방지 -->
										<div>
											<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-5 col-sm-1 minibottom">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>
			<!-- 반대 의견 -->
			<c:choose>
				<c:when test="${opinion.vote_type eq 1}">
					<div class="container grid-item  col-sm-offset-1">
						<form class="form-horizontal" action="like" method="post">
							<div class="form-group">
								<div class="col-sm-9 " style="border-style: solid; border-width: 1px; border-color: #FF3232">
								<!-- 닉네임과 의견 출력 -->
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;
											<span class="label label-danger" style="margin-top: 20px">반대</span>
										</h3>
									</div>
									<!-- 태그가 있을 경우 출력 -->
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="tagstart">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">#참조</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">#반박</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									</div>
									<!-- 의견 내용 -->
									<hr />
									${opinion.op_content} <br />
									<hr />
									<div>
									<!-- 날짜, 좋아요, 싫어요, 답글 버튼 클릭 방지 -->
										<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-5 col-sm-1 minibottom">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
										</div>	
								</div>
								<div class="col-sm-2 col-sm-offset-1">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 60px; width: 60px" />
										</c:when>
									</c:choose>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>
			<!-- 중립 의견 -->
			<c:choose>
				<c:when test="${opinion.vote_type eq 2}">
					<div class="container grid-item" >
						<form class="form-horizontal" action="like" method="post" >
							<div class="form-group ">
								<div class="col-sm-offset-1 col-sm-2">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 60px; width: 60px" />
										</c:when>
									</c:choose>
								</div>
								<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #66FF00">
									<!-- 닉네임과 의견 출력 -->
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-success" style="margin-top: 20px">중립</span>
										</h3>
									</div>
									<!-- 태그가 있을 경우 출력 -->
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="tagstart">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">#참조</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">#반박</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									<!-- 의견 내용 -->
									</div>
									<hr />
									${opinion.op_content} <br />
									<hr />
									<div>
									<!-- 날짜, 좋아요, 싫어요, 답글 버튼 클릭 방지 -->
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-5 col-sm-1 minibottom">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
												
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>
			<!-- 자유 의견 -->
			<c:choose>
				<c:when test="${opinion.vote_type eq 3}">
					<div class="container grid-item" >
						<form class="form-horizontal" action="like" method="post" >
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-2">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 60px; width: 60px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 60px; width: 60px" />
										</c:when>
									</c:choose>
								</div>
								<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #46FFFF">
									<!-- 닉네임과 의견 출력 -->
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-info" style="margin-top: 20px">자유</span>
										</h3>
									</div>
									<!-- 태그가 있을 경우 출력 -->
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="tagstart">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">#의견</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">#의견</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									<!-- 의견 내용 -->
									</div>
									<hr />
									${opinion.op_content} <br />
									<hr />
									<div>
									<!-- 날짜, 좋아요, 싫어요, 답글 버튼 클릭 방지 -->
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-5 col-sm-1 minibottom">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
	<!-- 무한스크롤을 위한 선언 -->
	<div id="bottom"></div>
	<nav id="page_nav" style="display:none">
		<p><a href="/finished/read?topic_no=${readlist.topic_no}&pageNo=2"></a></p>
	</nav>
	<!-- 의견 작성 -->
	<div class="container">
		<form class="form-horizontal" action="option" method="post"
			id="optionform">
			<div class="form-group">
				<h2>의견 작성</h2>
				<hr />
				<div class="col-sm-1">
					<c:choose>
						<c:when test="${readuser.user_lv eq 0}">
							<img src="/resources/user_lv/common.png"
								style="height: 60px; width: 60px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 1}">
							<img src="/resources/user_lv/prestige.png"
								style="height: 60px; width: 60px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 2}">
							<img src="/resources/user_lv/royal.png"
								style="height: 60px; width: 60px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 3}">
							<img src="/resources/user_lv/vip.png"
								style="height: 60px; width: 60px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 4}">
							<img src="/resources/user_lv/vvip.png"
								style="height: 60px; width: 60px" />
						</c:when>
					</c:choose>
				</div>
				<!-- 닉네임 대신 출력 -->
				<div class="col-sm-3">
						<h4>종료된 토론입니다.</h4>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-9">
			<textarea id="context" cols="150" rows="10"
							style="border-color: #46FFFF" readonly="readonly"
							placeholder="종료된 토론으로 의견작성이 불가능합니다."></textarea> <br/><br/>
			</div>
			<br />
			<div class="col-sm-offset-10 col-sm-2" style="text-align: right">
			<input type="button" value="등록" class="btn btn-default btn-lg"
							disabled="disabled" /><br/><br/><br/><br/><br/><br/><br/><br/>
			</div>
		</form>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
<script src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/read/js/jquery.infinitescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/read/js/read.js"></script>
</body>
</html>
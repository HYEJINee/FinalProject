<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Read Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/read/css/read.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.js"></script>
<script src="/resources/bootstrap/js/menu.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/read/js/read.js"></script>
</head>
<body data-spy="scroll" data-target=".ScrollSpy" data-offset="50">
	<script type="text/javascript">
		var list = new Array();
		<c:forEach items="${readoplike}" var="item">
		list.push("${item.op_no}");
		</c:forEach>
	</script>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container top">
		<form class="form-horizontal">
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
					<h1>
						<span class="label label-primary">찬반 / ${list2.size()}</span>
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
		</form>
		<form class="form-horizontal">
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
		</form>
		<form class="form-horizontal" action="vote" method="post"
			id="voteform">
			<div class="form-group">
				<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
				<input type="hidden" name="vote_type" />
				<c:choose>
					<c:when test="${empty readuser.user_nick != false}">
						<div class="col-sm-offset-5">
							<h4>로그인 후 투표가 가능합니다.</h4>
						</div>
					</c:when>
					<c:when test="${empty readvote.user_no != true}">
						<div class="col-sm-offset-5">
							<h4>이미 투표하셨습니다.</h4>
						</div>
					</c:when>
					<c:when test="${empty readuser.user_nick != true}">

						<div class="col-sm-offset-4">
							<div class="col-sm-2">
								<input type="button" value="찬성" class="btn btn-info"
									name="votebtn" id="0" />
							</div>
							<div class="col-sm-2">
								<input type="button" value="반대" class="btn btn-danger"
									name="votebtn" id="1" />
							</div>
							<div class="col-sm-2">
								<input type="button" value="중립" class="btn btn-default"
									name="votebtn" id="2" />
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</form>
	</div>
	<div class="container" data-offset="150">
		<form class="form-horizontal">
			<div>
				<h2>본문</h2>
				<h4>${readlist.topic_long_cont}</h4>
				<br />
				<hr />
			</div>
			<div>
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
		</form>
		<h2>의견</h2>
		<hr />
	</div>${status.count}
	<div class="ScrollSpy">
		<c:forEach items="${readOpinion}" var="opinion" varStatus="status">
			<c:choose>
				<c:when test="${opinion.vote_type eq 0}">
					<div class="container" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group">
								<div class="col-sm-1">
									<input type="hidden" name="op_no" value="${opinion.op_no}" />
									<input type="hidden" name="topic_no"
										value="${readlist.topic_no}" /> <input type="hidden"
										name="op_like_type" />
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 50px; width: 50px" />
										</c:when>
									</c:choose>

								</div>
								<div class="col-sm-9"
									style="border-style: solid; border-width: 1px; border-color: #46FFFF">
									<div class="col-sm-3">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-info" style="margin-top: 20px">찬성</span>
										</h3>
									</div>
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="status">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">${tag.tagged_op_no}</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">${tag.tag_op_no}</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>

									<div style="text-align: right">
										<h3>
											<em>NO.${status.count}</em>
										</h3>
									</div>
									<hr />
									${opinion.op_content} <br />
									<hr />
									<div>
										<c:choose>
											<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" name="rebtn" disabled="disabled">답글</button>
												</div>
											</c:when>
											<c:when test="${readuser.user_nick != opinion.user_nick}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="Modal">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="del">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${opinion.vote_type eq 1}">
					<div class="container" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group">
								<input type="hidden" name="op_no" value="${opinion.op_no}" /> <input
									type="hidden" name="topic_no" value="${readlist.topic_no}" />
								<input type="hidden" name="op_like_type" />
								<div class="col-sm-offset-2 col-sm-9" id="blog_intro"
									style="border-style: solid; border-width: 1px; border-color: #FF3232">
									<div class="col-sm-3">
										<h3>${opinion.user_nick}&nbsp;
											<span class="label label-danger" style="margin-top: 20px">반대</span>
										</h3>
									</div>
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="status">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">${tag.tagged_op_no}</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">${tag.tag_op_no}</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									<div style="text-align: right">
										<h3>
											<em>NO.${status.count}</em>
										</h3>
									</div>
									<hr />
									${opinion.op_content} <br />
									<hr />
									<div>
										<c:choose>
											<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" name="rebtn" disabled="disabled">답글</button>
												</div>
											</c:when>
											<c:when test="${readuser.user_nick != opinion.user_nick}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="Modal">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="del">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="col-sm-1">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 50px; width: 50px" />
										</c:when>
									</c:choose>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>

			<c:choose>
				<c:when test="${opinion.vote_type eq 2}">
					<div class="container" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group ">
								<input type="hidden" name="op_no" value="${opinion.op_no}" /> <input
									type="hidden" name="topic_no" value="${readlist.topic_no}" />
								<input type="hidden" name="op_like_type" />
								<div class="col-sm-2">
									<c:choose>
										<c:when test="${opinion.user_lv eq 0}">
											<img src="/resources/user_lv/common.png"
												style="height: 100px; width: 100px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 1}">
											<img src="/resources/user_lv/prestige.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 2}">
											<img src="/resources/user_lv/royal.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 3}">
											<img src="/resources/user_lv/vip.png"
												style="height: 50px; width: 50px" />
										</c:when>
										<c:when test="${opinion.user_lv eq 4}">
											<img src="/resources/user_lv/vvip.png"
												style="height: 50px; width: 50px" />
										</c:when>
									</c:choose>
								</div>
								<div class="col-sm-9"
									style="border-style: solid; border-width: 1px; border-color: #66FF00">
									<div class="col-sm-3">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-success" style="margin-top: 20px">중립</span>
										</h3>
									</div>
									<div class="col-sm-5 minitop">
										<h4>
											<c:forEach items="${taglist}" var="tag" varStatus="status">
												<c:choose>
													<c:when test="${tag.tag_op_no == opinion.op_no}">
														<a href="#${tag.tagged_op_no}#">${tag.tagged_op_no}</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${tag.tagged_op_no == opinion.op_no}">
														<a href="#${tag.tag_op_no}#">${tag.tag_op_no}</a>
													</c:when>
												</c:choose>
											</c:forEach>
										</h4>
									</div>
									<div style="text-align: right">
										<h3>
											<em>NO.${status.count}</em>
										</h3>
									</div>
									<hr />
									${opinion.op_content} <br />
									<hr />
									
									<div>
										<c:choose>
											<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" name="rebtn" disabled="disabled">답글</button>
												</div>
											</c:when>
											<c:when test="${readuser.user_nick != opinion.user_nick}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="Modal">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" name="del">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<input type="button" value="답글" class="btn btn-default"
														id="btn${status.count}" name="rebtn" /> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:when>
			</c:choose>


		</c:forEach>
	</div>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<div class=" col-sm-offset-5">
					<input type="button" value="이전 답글" class="btn btn-default" /> <input
						type="button" value="다음 답글" class="btn btn-default" /><br /> <br />
				</div>
			</div>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal" action="option" method="post"
			id="optionform">
			<div class="form-group">
				<h2>의견 작성</h2>
				<hr />
				<div class="col-sm-1">
					<img src="" style="height: 30px; width: 30px" />
					<c:choose>
						<c:when test="${readuser.user_lv eq 0}">
							<img src="/resources/user_lv/common.png"
								style="height: 50px; width: 50px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 1}">
							<img src="/resources/user_lv/prestige.png"
								style="height: 50px; width: 50px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 2}">
							<img src="/resources/user_lv/royal.png"
								style="height: 50px; width: 50px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 3}">
							<img src="/resources/user_lv/vip.png"
								style="height: 50px; width: 50px" />
						</c:when>
						<c:when test="${readuser.user_lv eq 4}">
							<img src="/resources/user_lv/vvip.png"
								style="height: 50px; width: 50px" />
						</c:when>
					</c:choose>
				</div>
				<div class="col-sm-3">

					<c:choose>
						<c:when test="${empty readuser.user_nick != false}">
							<h4>로그인 후 의견을 작성해주세요.</h4>
						</c:when>
						<c:when test="${empty readuser.user_nick != true}">
							<h4>${readuser.user_nick}</h4>
						</c:when>
					</c:choose>

				</div>
				<div class="col-sm-5">
					<div id="debateType" class="btn-group">
						<button type="button" id="btnDebateType"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
							토론 형식 <span class="caret"></span>
						</button>
						<ul id="btn_topic_type" class="dropdown-menu" role="menu">
							<li><a>찬성 </a></li>
							<li><a>반대 </a></li>
							<li><a>중립 </a></li>
						</ul>
						<input type="hidden" id="hid_topic_type" name="optionchk" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-2">
					<h4>
						<input type="text" class="form-control" id="relid"
							readonly="readonly"> <input type="hidden" id="rel"
							name="rel" value="0">
					</h4>
				</div>
				<div class="col-sm-2">
					<h4>에 대한 답글</h4>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-9">

				<c:choose>
					<c:when test="${empty readuser.user_nick != false}">
						<textarea id="context" cols="150" rows="10"
							style="border-color: #46FFFF" readonly="readonly"
							placeholder="로그인 후 의견 작성이 가능합니다."></textarea>
						<br />
						<br />
					</c:when>

					<c:when test="${empty readuser.user_nick != true}">
						<textarea id="context" cols="150" rows="10"
							style="border-color: #46FFFF" name="context"></textarea>
						<br />
						<br />
						<input type="hidden" name="recontent">
					</c:when>
				</c:choose>
			</div>
			<br /> <input type="hidden" name="topic_no"
				value="${readlist.topic_no}" />
			<div class="col-sm-offset-10 col-sm-2" style="text-align: right">
				<c:choose>
					<c:when test="${empty readuser.user_nick != false}">
						<input type="button" value="등록" class="btn btn-default btn-lg"
							disabled="disabled" />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
					</c:when>
					<c:when test="${empty readuser.user_nick != true}">
						<input type="button" value="등록" class="btn btn-default btn-lg"
							id="optionbtn" />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
					</c:when>
				</c:choose>
			</div>
		</form>
		<form id="delform" action="delete" method="post">
			<input type="hidden" name="delopno" id="delopno"> <input
				type="hidden" name="deltopicno" id="deltopicno">
		</form>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">의견 수정하기</h4>
				</div>
				<div class="modal-body">
					<textarea id="upcontent" cols="80" rows="10"></textarea>
					<form id="optupform" action="reup" method="post">
						<input type="hidden" name="reupopno" id="reupopno"> <input
							type="hidden" name="reupcontent" id="reupcontent"> <input
							type="hidden" name="topic_no" value="${readlist.topic_no}" />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="optupbtn">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
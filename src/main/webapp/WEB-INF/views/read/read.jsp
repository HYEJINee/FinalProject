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
<!-- 현재 토론중인 페이지 -->
	<!-- 의견의 좋아요, 싫어요 중복 방지를 위해 db에서 뽑아와서 list에 담아둠-->
	<script type="text/javascript">
		var list = new Array();
		<c:forEach items="${readoplike}" var="item">
		list.push("${item.op_no}");
		</c:forEach>
	</script>
	
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<div class="container top">
		<form class="form-horizontal">
		<!-- 토론 주제에 따른 타이틀 변경 -->
		<c:choose>
		<c:when test='${readlist.img_file_name != "" && readlist.img_file_name != null}'>
			<div id="divCoverImg"  class="jumbotron">
				<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
					<h2>
						<span class="label label-primary">찬반</span>
					</h2>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${readlist.topic_type eq 1}">
					<h2>
						<span class="label label-info">자유</span>
					</h2>
				</c:when>
			</c:choose>
				
				<p class="text-center" style="font-size:16pt;">${readlist.topic_title}</p>
				<p id="short_cont">${readlist.topic_short_cont}<br></p>
				<p id="writer" class="text-right">건의자 : ${readlist.user_nick}</p>
				<img id="coverImg" alt="커버 이미지" src="/resources/proposal/img/${readlist.img_file_name}.${readlist.img_ext_name}">
			</div>
		</c:when>
		<c:otherwise>
			<div id="divCoverImg" class="jumbotron" style="background-color: rgba(230, 230, 230, 0.5);">
				<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
					<h2>
						<span class="label label-primary">찬반</span>
					</h2>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${readlist.topic_type eq 1}">
					<h2>
						<span class="label label-info">자유</span>
					</h2>
				</c:when>
			</c:choose>
			
				<p class="text-center" style="font-size:16pt;">${readlist.topic_title}</p>
				<p id="short_cont">${readlist.topic_short_cont}<br></p>
				<p id="writer" class="text-right">건의자 : ${readlist.user_nick}</p>
			</div>
		</c:otherwise>
		</c:choose>
		
				<div style="text-align: right; color: red">
					<h3>
						<em>토론 종료 날짜 : ${readlist.debate_endate}</em><br />
					</h3>
				</div>
			
			<br />
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
			<div class="form-group" id="divRecommend">
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
			</c:when>
			</c:choose>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal">
			
			<div id="divContent" class="col-md-12">
			<h4>본문</h4>
				<p>${readlist.topic_long_cont}</p>
			</div>
			<!-- 본문 내용 -->	

			<!-- 참고 자료 -->			
			<div id="divRef" class="col-md-12">
				<h4>참고 자료</h4><br/>
				<c:forEach items="${readResource}" var="resource">
					<a href=http://${resource.topic_resource_link} target="_blank">${resource.topic_resource_title}</a>
				</c:forEach>
			</div>
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
			<div id="divProCon" class="col-md-12">
				<div class="col-lg-6">
					<h4>찬성 의견</h4>
					<p>${readlist.topic_pro}</p>
				</div>
				<div class="col-lg-6">
					<h4>반대 의견</h4>
					<p>${readlist.topic_con}</p>
				</div>
			</div>
			</c:when>
			</c:choose>
		</form>
		<h2>의견</h2>
		<hr />
	</div>
	<div class="grid col-sm-offset-2 col-sm-10" id="op">
		<c:forEach items="${readOpinion}" var="opinion" varStatus="status">
			<c:choose>
				<c:when test="${opinion.vote_type eq 0}">
					<div class="container grid-item" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post" id="${opinion.op_no}">
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-2">
									<input type="hidden" name="op_no" value="${opinion.op_no}" />
									<input type="hidden" name="topic_no"
										value="${readlist.topic_no}" /> <input type="hidden" name="op_like_type" />
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
								<div class="col-sm-9"
									style="border-style: solid; border-width: 1px; border-color: #3333FF">
									<div class="row">
									<div class="col-sm-4 ">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-primary" style="margin-top: 20px">찬성</span>
										</h3>
									</div>
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
														id="btn${status.count}" onclick="Ref(this)" disabled="disabled">답글</button>
												</div>
											</c:when>
											<c:when test="${readuser.user_nick != opinion.user_nick}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align"  onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"  onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Modify(this)">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Optdel(this)">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align"  onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"  onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
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
					<div class="container grid-item  col-sm-offset-1" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group">
								<input type="hidden" name="op_no" value="${opinion.op_no}" /> <input
									type="hidden" name="topic_no" value="${readlist.topic_no}" />
								<input type="hidden" name="op_like_type" />
								<div class="col-sm-9 "
									style="border-style: solid; border-width: 1px; border-color: #FF3232">
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;
											<span class="label label-danger" style="margin-top: 20px">반대</span>
										</h3>
									</div>
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
														id="btn${status.count}" onclick="Ref(this)" disabled="disabled">답글</button>
												</div>
											</c:when>
											<c:when test="${readuser.user_nick != opinion.user_nick}">
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-offset-4 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align"  onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"  onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Modify(this)">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Optdel(this)">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:otherwise>
										</c:choose>
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

			<c:choose>
				<c:when test="${opinion.vote_type eq 2}">
					<div class="container grid-item" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group">
								<input type="hidden" name="op_no" value="${opinion.op_no}" /> <input
									type="hidden" name="topic_no" value="${readlist.topic_no}" />
								<input type="hidden" name="op_like_type" />
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
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-success" style="margin-top: 20px">중립</span>
										</h3>
									</div>
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
														aria-label="Left Align"  onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"  onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Modify(this)">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Optdel(this)">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
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
				<c:when test="${opinion.vote_type eq 3}">
					<div class="container grid-item" id="${opinion.op_no}#">
						<form class="form-horizontal" action="like" method="post"
							id="${opinion.op_no}">
							<div class="form-group">
								<input type="hidden" name="op_no" value="${opinion.op_no}" /> <input
									type="hidden" name="topic_no" value="${readlist.topic_no}" />
								<input type="hidden" name="op_like_type" />
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
								<div class="col-sm-9"
									style="border-style: solid; border-width: 1px; border-color: #46FFFF">
									<div class="row">
									<div class="col-sm-4">
										<h3>${opinion.user_nick}&nbsp;&nbsp;
											<span class="label label-info" style="margin-top: 20px">자유</span>
										</h3>
									</div>
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
														aria-label="Left Align"  onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align"  onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button><input
														type="hidden" value="${opinion.user_nick}"> <input
														type="hidden" value="${opinion.op_no}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-4">
													<em>작성 날짜 : ${opinion.op_regdate}</em><br />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Modify(this)">수정
													</button>
													<input type="hidden" value="${opinion.op_content}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn-default" onclick="Optdel(this)">삭제
													</button>
													<input type="hidden" value="${readlist.topic_no}" /> <input
														type="hidden" value="${opinion.op_no}">
												</div>
												<div class="col-sm-offset-2 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" onclick="Opvotebtn0(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" onclick="Opvotebtn1(this)"
														value="${opinion.op_no}">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>

												<div class="col-sm-offset-1 col-sm-1 minibottom">
													<button type="button" class="btn btn-default"
														id="btn${status.count}" onclick="Ref(this)">답글</button> <input
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
		<br /><br /><br /><br /><br />
	</div>
	<div id="bottom"></div>
	<nav id="page_nav" style="display:none">
		<p><a href="/read/read?topic_no=${readlist.topic_no}&pageNo=2"></a></p>
	</nav>
	
	<div class="container">
		<form class="form-horizontal" action="option" method="post" id="optionform">
			<c:choose>
				<c:when test="${readlist.topic_type eq 0}">
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
						<input type="button" value="등록" class="btn btn-default btn-lg" id="optionbtn" />
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
			</c:when>
			</c:choose>
			
			<c:choose>
				<c:when test="${readlist.topic_type eq 1}">
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
						<button type="button" id="btnDebateType"
							class="btn btn-info" disabled="disabled">
							자유
						</button>
						<input type="hidden" name="optionchk" value="3" />
						<input type="hidden" id="rel" name="rel" value="0">
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
							id="freebtn" />
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
			</c:when>
			</c:choose>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
<script src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/read/js/jquery.infinitescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/read/js/read.js"></script>
</body>
</html>
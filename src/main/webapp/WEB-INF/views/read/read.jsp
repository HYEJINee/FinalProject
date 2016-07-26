<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<title>read page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.js"></script>
<script src="/resources/bootstrap/js/menu.js"></script>
</head>
<style>
.top {
	margin-top: 50px;
}
</style>

<body>
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
			<div class="form-group">
				<div class="col-sm-5">
					<h2>${readlist.topic_title}</h2>
				</div>
				
				<div style="text-align: right; color: red">
					<h3>
						<em>토론 종료 날짜 : ${readlist.debate_endate}</em><br/>
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
					<c:when test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
						<h4 style="color: blue">찬성 : 0.0%</h4>
					</c:when>
					<c:otherwise>
						<h4 style="color: blue">찬성 : <fmt:formatNumber value="${readlist.debate_tot_pro/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#.#"/>%</h4>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="col-sm-2">
				<c:choose>
					<c:when test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
						<h4 style="color: red">반대 : 0.0%</h4>
					</c:when>
					<c:otherwise>
						<h4 style="color: red">반대 : <fmt:formatNumber value="${readlist.debate_tot_con/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#.#"/>%</h4>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="col-sm-2">
				<c:choose>
					<c:when test="${(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut) eq 0}">
						<h4 style="color: gray">중립 : 0.0%</h4>
					</c:when>
					<c:otherwise>
						<h4 style="color: gray">중립 : <fmt:formatNumber value="${readlist.debate_tot_neut/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#.#"/>%</h4>
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
							role="progressbar" style="width: ${readlist.debate_tot_pro/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}%"></div>
						<div class="progress-bar progress-bar-danger progress-bar-striped"
							role="progressbar" style="width: ${readlist.debate_tot_con/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}%"></div>
					</div>
				</div>
			</div>
			</form>
			<form class="form-horizontal" action="vote" method="post" id="voteform">
			<div class="form-group">
				<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
				<input type="hidden" name="vote_type"/>
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
						<input type="button" value="찬성" class="btn btn-info" name = "votebtn" id="0"/>
					</div>
					<div class="col-sm-2">
						<input type="button" value="반대" class="btn btn-danger" name = "votebtn" id="1"/>
					</div>
					<div class="col-sm-2">
						<input type="button" value="중립" class="btn btn-default" name = "votebtn" id="2"/>
					</div>
					</div>
					</c:when>
				</c:choose>
				
			</div>
			</form>
			</div>
			<div class="container">
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
			</div>
			
			
			<c:forEach items="${readOpinion}" var="opinion" varStatus="status">
			<c:choose>
			<c:when test="${opinion.vote_type eq 0}">
			<div class="container">
		<form class="form-horizontal" action="like" method="post" id="${opinion.op_no}">
			<div class="form-group">
				<div class="col-sm-1">
				<input type="hidden" name="op_no" value="${opinion.op_no}" />
				<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
				<input type="hidden" name="op_like_type"/>
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
				<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #46FFFF">
					<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-info" style="margin-top: 20px">찬성</span></h3>
					</div>
					<div style="text-align: right">
						<h3>
							<em>NO.${status.count}</em>
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<c:choose>
						<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-offset-5 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												</c:when>
												<c:otherwise>
												<div class="col-sm-offset-5 col-sm-1">
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
												</c:otherwise>
						</c:choose>
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default" id="btn${status.count}" name="rebtn"/>
							<input type="hidden" value="${opinion.user_nick}">
							<input type="hidden" value="${opinion.user_no}">
						</div>
					</div>
				</div>
			</div>
			</form>
			</div>
			</c:when>
			</c:choose>
			<c:choose>
			<c:when test="${opinion.vote_type eq 1}">
			<div class="container">
		<form class="form-horizontal" action="like" method="post" id="${opinion.op_no}">
			<div class="form-group ">
			<input type="hidden" name="op_no" value="${opinion.op_no}" />
			<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
				<input type="hidden" name="op_like_type"/>
				<div class="col-sm-offset-2 col-sm-9" style="border-style: solid; border-width: 1px; border-color: #FF3232">
				<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-danger" style="margin-top: 20px">반대</span></h3>
					</div>
					
					<div style="text-align: right">
						<h3>
							<em>NO.${status.count}</em>
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<c:choose>
						<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-offset-5 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												</c:when>
												<c:otherwise>
												<div class="col-sm-offset-5 col-sm-1">
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
												</c:otherwise>
						</c:choose>			
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default" id="btn${status.count}" name="rebtn"/>
							<input type="hidden" value="${opinion.user_nick}">
							<input type="hidden" value="${opinion.user_no}">
						</div>
						<br/>
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
			<div class="container">
		<form class="form-horizontal" action="like" method="post" id="${opinion.op_no}">
			<div class="form-group ">
			<input type="hidden" name="op_no" value="${opinion.op_no}" />
			<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
				<input type="hidden" name="op_like_type"/>
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
				<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #66FF00">
					<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-success" style="margin-top: 20px">중립</span></h3>
					</div>
					<div style="text-align: right">
						<h3>
							<em>NO.${status.count}</em>
							<input type="hidden" value="${opinion.op_no}" id="tq" name="tq">
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<c:choose>
						<c:when test="${empty readuser.user_nick != false}">
												<div class="col-sm-offset-5 col-sm-1">
													<button type="button" class="btn btn btn-info"
														aria-label="Left Align" name="opvotebtn0"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-top"
															aria-hidden="true"></span> ${opinion.op_like}
													</button>
													<input type="hidden" value="0" />
												</div>
												<div class="col-sm-1">
													<button type="button" class="btn btn btn-danger"
														aria-label="Left Align" name="opvotebtn1"
														value="${opinion.op_no}" disabled="disabled">
														<span class="glyphicon glyphicon-triangle-bottom"
															aria-hidden="true"></span> ${opinion.op_count - opinion.op_like}
													</button>
													<input type="hidden" value="1" />
												</div>
												</c:when>
												<c:otherwise>
												<div class="col-sm-offset-5 col-sm-1">
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
												</c:otherwise>
						</c:choose>
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default" id="btn${status.count}" name="rebtn"/>
							<input type="hidden" value="${opinion.user_nick}">
							<input type="hidden" value="${opinion.user_no}">
						</div>
					</div>
				</div>
			</div>
			</form>
			</div>
			</c:when>
			</c:choose>
			
			
			</c:forEach>
			<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<div class=" col-sm-offset-5">
					<input type="button" value="이전 답글" class="btn btn-default" /> <input
						type="button" value="다음 답글" class="btn btn-default"/><br /> <br />
				</div>
			</div>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal" action="option" method="post" >
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
					<h4 class="radio-inline">
						<label for="chkok"><input type="radio" name="chk" id="chkok" value="0">찬성</label>
						</h4>
					<h4 class="radio-inline">
						<label for="chkno"><input type="radio" name="chk" id="chkno" value="1">반대</label>
					</h4>
					<h4 class="radio-inline">
						<label for="chkneut"><input type="radio" name="chk" id="chkneut" value="2">중립</label>
					</h4>
					
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-2">
					<h4>
						<input type="text" class="form-control" id="relid" readonly="readonly">
						<input type="hidden" id="rel" name="rel" value="0">
						
					</h4>
				</div>
				<div class="col-sm-2">
					<h4>에 대한 답글</h4>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-9">
			
				<c:choose>
					<c:when test="${empty readuser.user_nick != false}">
						<textarea id="areaid" cols="150" rows="10"
					style="border-color: #46FFFF" id="replyarea" readonly="readonly" placeholder="로그인 후 의견 작성이 가능합니다."></textarea>
					</c:when>
				
					<c:when test="${empty readuser.user_nick != true}"> 
						<textarea id="areaid" cols="150" rows="10"
					style="border-color: #46FFFF" id="context" name="context"></textarea>
					</c:when>
				</c:choose>
			</div>
			<br />
			<input type="hidden" name="topic_no" value="${readlist.topic_no}" />
			<div class="col-sm-offset-10 col-sm-2" style="text-align: right">
			<c:choose>
					<c:when test="${empty readuser.user_nick != false}">
						<input type="submit" value="등록" class="btn btn-default btn-lg" disabled="disabled"/>
					</c:when>
					<c:when test="${empty readuser.user_nick != true}"> 
						<input type="submit" value="등록" class="btn btn-default btn-lg" />
					</c:when>
				</c:choose>
				
			</div>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		</form>
		
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name=rebtn]").click(function() { //id test1 이라는 a태그 클릭시 발생
				var id = $(this).attr('id');
				var nick = $(this).next().val();
				var userno = $(this).next().next().val();
				$("#relid").val(nick);
				$("#rel").val(userno);
				$("#context").focus();
			});
			$("input[name=chk]").click(function() { //id test1 이라는 a태그 클릭시 발생
				var chkval = $(this).val();
				if (chkval == "0") {
					$("#areaid").attr("style", "border-color: #46FFFF");
				} else if (chkval == "1") {
					$("#areaid").attr("style", "border-color: #FF3232");
				} else {
					$("#areaid").attr("style", "border-color: #66FF00");
				}
			});
			$("input[name=votebtn]").click(function() { //id test1 이라는 a태그 클릭시 발생
				var vote_type = $(this).attr('id'); //0 , 1, 2
				$("input[name=vote_type]").val(vote_type);
				$("#voteform").submit();
			});
			$("button[name=opvotebtn0]").click(function() { //id test1 이라는 a태그 클릭시 발생
				var op_like_type = $(this).next().val();
				var formid = $(this).val(); //0 , 1, 2
				if(list.length == 0){
					$("input[name=op_like_type]").val(op_like_type);
					$("#"+formid).submit();
				}else{
					if(list.indexOf(formid) == -1){
						$("input[name=op_like_type]").val(op_like_type);
						$("#"+formid).submit();
					} else if(list.indexOf(formid) != -1){
						alert("이미 투표에 참여하셨습니다.");
					}
					}
			});
			$("button[name=opvotebtn1]").click(function() { //id test1 이라는 a태그 클릭시 발생
				var op_like_type =$(this).next().val();
				var formid = $(this).val(); //0 , 1, 2
				if(list.length == 0){
					$("input[name=op_like_type]").val(op_like_type);
					$("#"+formid).submit();
				}else{
					if(list.indexOf(formid) == -1){
						$("input[name=op_like_type]").val(op_like_type);
						$("#"+formid).submit();
					} else if(list.indexOf(formid) != -1){
						alert("이미 투표에 참여하셨습니다.");
					}
					}
			});
		});
	</script>
</body>
</html>
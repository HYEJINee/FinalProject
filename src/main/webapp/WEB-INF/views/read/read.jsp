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

<script type="text/javascript">
	$(document).ready(function() {
		$("input[name=rebtn]").click(function() { //id test1 이라는 a태그 클릭시 발생
			var id =  $(this).attr('id'); 
			var nick =  $(this).next().val(); 
			$("#replyid").val(nick);
			$("#replyarea").focus();
		});
		$("input[name=chk]").click(function() { //id test1 이라는 a태그 클릭시 발생
			var chkval = $(this).val();
			if(chkval == "0"){
				$("#areaid").attr("style", "border-color: #46FFFF");
			} else if(chkval == "1"){
				$("#areaid").attr("style", "border-color: #FF3232");
			} else {
				$("#areaid").attr("style", "border-color: #66FF00");
			}
		});
	});
</script>
<body>
<%@ include file="../include/header.jsp" %>
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
				<h4 style="color: blue">찬성 : <fmt:formatNumber value="${readlist.debate_tot_pro/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#"/>%</h4>
				</div>
				<div class="col-sm-2">
					<h4 style="color: red">반대 : <fmt:formatNumber value="${readlist.debate_tot_con/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#"/>%</h4>
				</div>
				<div class="col-sm-2">
					<h4 style="color: gray">중립 : <fmt:formatNumber value="${readlist.debate_tot_neut/(readlist.debate_tot_pro + readlist.debate_tot_con + readlist.debate_tot_neut)*100}"  pattern="#"/>%</h4>
				</div>
			</div>

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
			<div class="form-group">
				<div class="col-sm-offset-4">
					<div class="col-sm-2">
						<input type="button" value="찬성" class="btn btn-info" />
					</div>
					<div class="col-sm-2">
						<input type="button" value="반대" class="btn btn-danger" />
					</div>
					<div class="col-sm-2">
						<input type="button" value="중립" class="btn btn-default" />
					</div>
				</div>
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
			</div>
			<div class="container">
		<form class="form-horizontal">
			<h2>의견</h2>
			<hr />
			<c:forEach items="${readOpinion}" var="opinion"  varStatus="status">
			<c:choose>
			<c:when test="${opinion.vote_type eq 0}">
			
			<div class="form-group">
				<div class="col-sm-1">
					<img src="#"
						style="height: 30px; width: 30px" />
				</div>
				<div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color: #46FFFF">
					<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-info" style="margin-top: 20px">찬성</span></h3>
					</div>
					<div style="text-align: right">
						<h3>
							<em>NO.${opinion.op_no} / ${status.count}</em>
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<div class="col-sm-offset-5 col-sm-1">
							<button type="button" class="btn btn btn-info"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-top"
									aria-hidden="true"></span> ${opinion.op_like}
							</button>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn btn-danger"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-bottom"
									aria-hidden="true"></span> 00
							</button>
						</div>
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default" id="btn${status.count}" name="rebtn" hidden="${opinion.user_nick}"/>
							<input type="hidden" value="${opinion.user_nick}">
						</div>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			<c:choose>
			<c:when test="${opinion.vote_type eq 1}">
			<div class="form-group ">
			
				<div class="col-sm-offset-2 col-sm-9" style="border-style: solid; border-width: 1px; border-color: #FF3232">
				<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-danger" style="margin-top: 20px">반대</span></h3>
					</div>
					
					<div style="text-align: right">
						<h3>
							<em>NO.${opinion.op_no}</em>
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<div class="col-sm-offset-5 col-sm-1">
							<button type="button" class="btn btn btn-info"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-top"
									aria-hidden="true"></span> ${opinion.op_like}
							</button>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn btn-danger"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-bottom"
									aria-hidden="true"></span> 00
							</button>
						</div>
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default" id="btn${status.count}" name="rebtn"/>
							<input type="hidden" value="${opinion.user_nick}">
						</div>
						
					</div>
				</div>
				<div class="col-sm-1">
					<img src=""
						style="height: 30px; width: 30px" />
				</div>
			</div>
			</c:when>
			</c:choose>
			
			<c:choose>
			<c:when test="${opinion.vote_type eq 2}">
			<div class="form-group ">
				<div class="col-sm-offset-2 col-sm-9" style="border-style: solid; border-width: 1px; border-color: #66FF00">
				<div class="col-sm-6">
						<h3>${opinion.user_nick}&nbsp;&nbsp;
						<span class="label label-success" style="margin-top: 20px">중립</span></h3>
					</div>
					
					<div style="text-align: right">
						<h3>
							<em>NO.${opinion.op_no}</em>
						</h3>
					</div>
					<br />
					${opinion.op_content}
					<br /> <br />
					<div>
						<div class="col-sm-4">
							<em>작성 날짜 : ${opinion.op_regdate}</em><br/>
						</div>
						<div class="col-sm-offset-5 col-sm-1">
							<button type="button" class="btn btn btn-info"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-top"
									aria-hidden="true"></span> ${opinion.op_like}
							</button>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn btn-danger"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-bottom"
									aria-hidden="true"></span> 00
							</button>
						</div>
						<div class="col-sm-1">
							<input type="button" value="답글" class="btn btn-default"  id="btn${status.count}" name="rebtn"/>
							<input type="hidden" value="${opinion.user_nick}">
						</div>
						
					</div>
				</div>
				<div class="col-sm-1">
					<img src=""
						style="height: 30px; width: 30px" />
				</div>
			</div>
			</c:when>
			</c:choose>
			
			
			</c:forEach>
			<div class="form-group">
				<div class=" col-sm-offset-5">
					<input type="button" value="이전 답글" class="btn btn-default" /> <input
						type="button" value="다음 답글" class="btn btn-default"/><br /> <br />
				</div>
			</div>
		</form>
	</div>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<h2>의견 작성</h2>
				<hr />
				<div class="col-sm-1">
					<img src=""
						style="height: 30px; width: 30px" />
				</div>
				<div class="col-sm-2">
					<h4>의견 입력 ID</h4>
					<br />
				</div>
				<div class="col-sm-5">
					<h4 class="radio-inline"><input type="radio" name="chk" id="chkok" value="0" >찬성</h4>
       				<h4 class="radio-inline"><input type="radio" name="chk" id="chkno" value="1" >반대</h4>
       				<h4 class="radio-inline"><input type="radio" name="chk" id="chkneut" value="2" >중립</h4>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-2">
					<h4 >
						 <input type="text" class="form-control" id="replyid" readonly="readonly"></h4>
				</div>
				<div class="col-sm-2">
					<h4>에 대한 답글</h4>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-9">
				<textarea id="areaid" cols="150" rows="10"  style="border-color: #46FFFF" id="replyarea"></textarea>
			</div>
			<br />
			<div class="col-sm-offset-10 col-sm-2" style="text-align: right">
				<input type="button" value="등록" class="btn btn-default btn-lg" />
			</div>
		
		</form>
	</div>
</body>
</html>
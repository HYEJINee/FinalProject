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
</head>
<body>
	<div class="container">
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
			
			<div class="form-group">
				<div class=" col-sm-offset-1 col-sm-2">
					<h2>
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${readlist.votecount}
					</h2>
				</div>
				<div class="col-sm-2">
					<h4 style="color: blue">찬성 : ${readlist.debate_pro/(readlist.debate_pro + readlist.debate_con + readlist.debate_neut)*100}%</h4>
				</div>
				<div class="col-sm-2">
					<h4 style="color: red">반대 : ${readlist.debate_con/(readlist.debate_pro + readlist.debate_con + readlist.debate_neut)*100}%</h4>
				</div>
				<div class="col-sm-2">
					<h4 style="color: gray">중립 : ${readlist.debate_neut/(readlist.debate_pro + readlist.debate_con + readlist.debate_neut)*100}%</h4>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<div class="progress">
						<div class="progress-bar progress-bar-info progress-bar-striped"
							role="progressbar" style="width: ${readlist.debate_pro/(readlist.debate_pro + readlist.debate_con + readlist.debate_neut)*100}%"></div>
						<div class="progress-bar progress-bar-danger progress-bar-striped"
							role="progressbar" style="width: ${readlist.debate_con/(readlist.debate_pro + readlist.debate_con + readlist.debate_neut)*100}%"></div>

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

			<div>
				<h2>본문</h2>
				<h4>${readlist.topic_long_cont}</h4>
				
				
				<br />
				<hr />
			</div>
			<div>
				<h2>참고자료</h2>
				<br />
				<h3>
					<a href="${readlist.topic_resource_link}">${resource.topic_resource_title}</a> 
				</h3>
				<br />
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
			<h2>의견</h2>
			<hr />

			<div class="form-group">
				<div class="col-sm-1">
					<img src="#"
						style="height: 30px; width: 30px" />
				</div>
				<div class="col-sm-9"
					style="border-style: solid; border-width: 1px; border-color: #46FFFF">
					<div class="col-sm-3">
						<h4>의견 입력 ID</h4>
					</div>
					<div class="col-sm-3">
						<h3>
							<span class="label label-info" style="margin-top: 20px">찬성</span>
						</h3>
					</div>
					<div style="text-align: right">
						<h3>
							<em>NO.1</em>
						</h3>
					</div>
					<br /> 이 존중의 의미는위에서도 얘기했지만, 자살의 조장이 아닙니다. 한 사람이 삶을 포기할 정도로 힘든
					삶을살았고, 그 삶은 어떻게형성되었으며, 이를 해결하기 위해서는 어떠한 문제를 해결해야하는지를 파악하는태도입니다. 자살을
					비판하는 사람들중 많은 사람들이 아래와 같은 태도를 보여줍니다. ‘아니 아무리 사는게 힘들었어도 자살은 아니지 않나?’,
					‘그래도 죽을 힘이 있었으면 그 힘으로 살아보지…’라는 한탄 섞인 비판을 하지만이러한 태도는 자살이란 것이가지는 사회성을
					희석시키는 태도라 생각됩니다. 우리가 정말 자살이란행위를 끊고 싶다면 그 첫 걸음은자살에 대한 ‘존중’에서 나올 수
					있다고 생각합니다. <br /> <br />
					<div>
						<div class="col-sm-offset-7 col-sm-1">
							<button type="button" class="btn btn btn-info"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-top"
									aria-hidden="true"></span> 00
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
							<input type="button" value="답글" class="btn btn-default" />
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<div class="col-sm-offset-2 col-sm-9"
					style="border-style: solid; border-width: 1px; border-color: #FF3232">
					<div class="col-sm-3">
						<h4>의견 입력 ID</h4>
					</div>
					<div class="col-sm-3">
						<h3>
							<span class="label label-danger" style="margin-top: 20px">반대</span>
						</h3>
					</div>
					<div style="text-align: right">
						<h3>
							<em>NO.2</em>
						</h3>
					</div>
					<br /> 이 존중의 의미는위에서도 얘기했지만, 자살의 조장이 아닙니다. 한 사람이 삶을 포기할 정도로 힘든
					삶을살았고, 그 삶은 어떻게형성되었으며, 이를 해결하기 위해서는 어떠한 문제를 해결해야하는지를 파악하는태도입니다. 자살을
					비판하는 사람들중 많은 사람들이 아래와 같은 태도를 보여줍니다. ‘아니 아무리 사는게 힘들었어도 자살은 아니지 않나?’,
					‘그래도 죽을 힘이 있었으면 그 힘으로 살아보지…’라는 한탄 섞인 비판을 하지만이러한 태도는 자살이란 것이가지는 사회성을
					희석시키는 태도라 생각됩니다. 우리가 정말 자살이란행위를 끊고 싶다면 그 첫 걸음은자살에 대한 ‘존중’에서 나올 수
					있다고 생각합니다. <br /> <br />
					<div>
						<div class="col-sm-offset-7 col-sm-1">
							<button type="button" class="btn btn btn-info"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-triangle-top"
									aria-hidden="true"></span> 00
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
							<input type="button" value="답글" class="btn btn-default" />
						</div>
					</div>
				</div>
				<div class="col-sm-1">
					<img src=""
						style="height: 30px; width: 30px" />
				</div>
			</div>
			<div class="form-group">
				<div class=" col-sm-offset-5">
					<input type="button" value="이전 답글" class="btn btn-default" /> <input
						type="button" value="다음 답글" class="btn btn-default" /><br /> <br />
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
				<div class="col-sm-2">
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-expanded="false">
							Action <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-2">
					<h4
						style="border-style: solid; border-width: 1px; border-color: #46FFFF">
						의견 입력 ID</h4>
				</div>
				<div class="col-sm-2">
					<h4>에 대한 답글</h4>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-9">
				<textarea cols="150" rows="10" style="border-color: #46FFFF"></textarea>
			</div>
			<br />
			<div class="col-sm-offset-10 col-sm-2" style="text-align: right">
				<input type="button" value="등록" class="btn btn-default btn-lg" />
			</div>
		</form>
	</div>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<div class="row">
	<div class="dropdown mypage-timeline-filter">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="true">
			필터<span class="caret"></span>
		</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			<li><a href="javascript:filterAll();" data-value="필터 : 모두">모두</a></li>
			<li><a href="javascript:filterTopic();" data-value="필터 : 안건">안건</a></li>
			<li><a href="javascript:filterOpinion();" data-value="필터 : 의견">의견</a></li>
			<li><a href="javascript:filterVote();" data-value="필터 : 투표">투표</a></li>
		</ul>
	</div>
</div>
<div class="mypage-timeline-list">
	<c:forEach items="${timeline}" var="mypageDTO">
		<div
			class="row mypage-timeline-row mypage-row-${mypageDTO.timeline_css }">
			<div class="col-md-3 mypage-timeline-date">${mypageDTO.timeline_date }</div>
			<div
				class="col-md-9 mypage-timeline-all mypage-timeline-${mypageDTO.timeline_css }">
				<a href="/${mypageDTO.topic_kind }/read?topic_no=${mypageDTO.topic_no }">${mypageDTO.topic_title }</a>${mypageDTO.timeline_statement }
			</div>
		</div>
	</c:forEach>
</div>
</html>
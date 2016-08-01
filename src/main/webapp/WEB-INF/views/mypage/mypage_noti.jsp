<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<c:forEach items="${getNoti}" var="notiDTO">
	<div id="noti-${notiDTO.noti_no }"
		class="alert noti-${notiDTO.noti_css }" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close" onclick="dismissNoti(${notiDTO.noti_no })">
			<span aria-hidden="true">&times;</span>
		</button>
		<c:if test="${notiDTO.noti_css eq 'reply' }">
			<a href="/read/read?topic_no=${notiDTO.topic_no }"
				onclick="dismissNoti(${notiDTO.noti_no })" class="alert-link">${notiDTO.other_user_nick }</a>님이  
							</c:if>

		<a href="/read/read?topic_no=${notiDTO.noti_no }" class="alert-link">${notiDTO.topic_title }</a>${notiDTO.noti_statement }
	</div>
</c:forEach>
</html>
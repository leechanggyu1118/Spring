<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">

	<form action="/user/login" method="post">

		<div class="mb-3">
			<label for="e" class="form-label">Email</label> <input type="text"
				class="form-control" name="email" id="e" placeholder="ID...">
		</div>

		<div class="mb-3">
			<label for="p" class="form-label">PassWord</label> <input
				type="password" class="form-control" name="pwd" id="p"
				placeholder="Password...">
		</div>
		
		<c:if test="${not empty param.errMsg }">
		<div class="mb-3 text-danger" >
			<c:choose>
				<c:when test="${param.errMsg eq 'Bad credentials' }">
					<c:set value="이메일 & 비밀번호가 일치하지 않습니다." var="errText"></c:set>
				</c:when>
				<c:otherwise>
					<c:set value="관리자에게 문의해주세요." var="errText"></c:set>
				</c:otherwise>
			</c:choose>
			${errText }
			
		</div>
			
		</c:if>

		<button type="submit" class="btn btn-primary">JOIN</button>
	</form>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>
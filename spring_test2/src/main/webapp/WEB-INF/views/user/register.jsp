<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container-md">
<h1>Member Join Page</h1>
<form action="/user/register" method="post">
		

			<div class="mb-3">
				<label for="e" class="form-label">E-mail</label> 
				<input type="email" class="form-control" name="email" id="e" placeholder="example@test.com...">
				<br>
				<button type="button" id="checkBtn" class="btn btn-outline-warning">아이디 중복체크</button>
				<div id="check"></div>
			</div>
			
			<div class="mb-3">
				<label for="p" class="form-label">PassWord</label> 
				<input type="password" class="form-control" name="pwd" id="p" placeholder="Password...">
			</div>
			
			<div class="mb-3">
				<label for="n" class="form-label">Name</label> 
				<input type="text" class="form-control" name="nickName" id="n" placeholder="Name...">
			</div>
			

			<button type="submit" class="btn btn-primary">JOIN</button>
		</form>


	</div>
	
	<!-- 아이디가 같으면..?  -->
	
	<script type="text/javascript" src="/re/js/userRegister.js"></script>
	
		<jsp:include page="../layout/footer.jsp"></jsp:include>

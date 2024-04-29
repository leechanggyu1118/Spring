<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">

	<form action="/member/login" method="post">

		<div class="mb-3">
			<label for="i" class="form-label">ID</label> <input type="text"
				class="form-control" name="id" id="i" placeholder="ID...">
		</div>

		<div class="mb-3">
			<label for="p" class="form-label">PassWord</label> <input
				type="password" class="form-control" name="pw" id="p"
				placeholder="Password...">
		</div>

		<button type="submit" class="btn btn-primary">JOIN</button>
	</form>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>
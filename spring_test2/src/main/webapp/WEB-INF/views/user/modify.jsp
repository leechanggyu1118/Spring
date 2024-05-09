<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<jsp:include page="../layout/header.jsp"></jsp:include>

<h1>User Member List</h1>
        <sec:authentication property="principal.uvo.email" var="authEmail"/>
        <sec:authentication property="principal.uvo.nickName" var="authNick"/>
        <sec:authentication property="principal.uvo.authList" var="auths"/>
        <sec:authentication property="principal.uvo.regDate" var="authRegDate"/>
        <sec:authentication property="principal.uvo.lastLogin" var="authLastLogin"/>
        <sec:authentication property="principal.uvo.authList" var="authList"/>
        <sec:authentication property="principal.uvo.pwd" var="authPwd"/>

		<div class="d-flex justify-content-around">
<form action="/user/modify" method="post">
	<div class="row">
		
			  <div class="col">
			    <div class="card text-bg-dark mb-3 border-warning mb-3" style="width: 30rem;">
			      <img src="../re/img/userImg.png" class="card-img-top" alt="...">
			      <div class="card-body">
			   	<input type="hidden"  name="email" value="${authEmail }">
			        <p class="card-title">이메일 : ${authEmail }</p>
			        <h5 class="card-title">닉네임 : <input type="text" name="nickName" value="${authNick }"></h5>
			        <h5 class="card-title">비밀번호 : <input type="text" name="pwd" placeholder="보안처리된 비밀번호"></h5>
			        
			        <p class="card-title">
			        ${auths }
					</p>
			        
			        <p class="card-text">아이디 생성일 : ${authRegDate}</p>
			    <input type="hidden"  name="lastLogin" value="${authLastLogin }">
			        <p class="card-text">마지막 접속일 : ${authLastLogin }</p>
			      </div>
			    </div>
			  </div>
		 
		</div>
			<a><button type="submit" class="btn btn-warning" id="updateBtn">수정</button></a>
			<a href="/board/list"><button type="button" class="btn btn-primary">BoardList</button></a>
			<button type="button" class="btn btn-danger" id="deleteBtn">회원삭제</button>
</form>
	</div>


	<script type="text/javascript" src="/re/js/userModify.js"></script>
	


		<jsp:include page="../layout/footer.jsp"></jsp:include>

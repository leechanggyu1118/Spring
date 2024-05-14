<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md " >

<h1>User Member List</h1>
<div class="container text-center">
<div class="row">

	<c:forEach items="${userList }" var="uvo">
	
	  <div class="col">
	    <div class="card text-bg-dark mb-3 border-warning mb-3" style="width: 25rem;">
	      <img src="../re/img/userImg.png" class="card-img-top" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">닉네임 : ${uvo.nickName }</h5>
	        <p class="card-title">이메일 : ${uvo.email }</p>
	        
	        <p class="card-title">
	        ( <c:forEach items="${uvo.authList }" var="authList">
	        ${authList.auth }
	        </c:forEach> )
			</p>
	        
	        <p class="card-text">아이디 생성일 : ${uvo.regDate}</p>
	        <p class="card-text">마지막 접속일 : ${uvo.lastLogin }</p>
	      </div>
	    </div>
	  </div>
	
	</c:forEach>
</div>
 </div>
</div>


		<jsp:include page="../layout/footer.jsp"></jsp:include>

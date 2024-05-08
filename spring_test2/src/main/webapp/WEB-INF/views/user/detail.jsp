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

<div class="row container-md">

	  <div class="col">
	    <div class="card" style="width: 20rem;">
	      <img src="../re/img/userImg.png" class="card-img-top" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">닉네임 : ${authNick }</h5>
	        <p class="card-title">이메일 : ${authEmail }</p>
	        
	        <p class="card-title">
	        ${auths }
			</p>
	        
	        <p class="card-text">아이디 생성일 : ${authRegDate}</p>
	        <p class="card-text">마지막 접속일 : ${authLastLogin }</p>
	      </div>
	    </div>
	  </div>
 
</div>


		



		<jsp:include page="../layout/footer.jsp"></jsp:include>

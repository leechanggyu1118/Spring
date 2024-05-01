<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<h1>Board Modify Page</h1>
<%-- 	<c:set value="${bdto.bvo }" var="bvo"></c:set> --%>
	<div class="container-md">
		<form action="/board/modify" method="post" >
		
			<div class="mb-3">
				<label for="n" class="form-label">bno</label> 
				<input type="text" class="form-control" name="bno" id="n" value="${bvo.bno }" readonly="readonly" placeholder="Bno...">
			</div>
			<div class="mb-3">
				<label for="t" class="form-label">title</label> 
				<input type="text" class="form-control" name="title" id="t" value="${bvo.title }" placeholder="Title...">
			</div>

			<div class="mb-3">
				<label for="w" class="form-label">writer</label> 
				<input type="text" class="form-control" name="writer" id="w" value="${bvo.writer }" readonly="readonly" placeholder="Writer...">
			</div>
			<div class="mb-3">
				<label for="r" class="form-label">regDate</label> 
				<input type="text" class="form-control" name="regDate" id="r" value="${bvo.regDate }" readonly="readonly" placeholder="Writer...">
			</div>

			<div class="mb-3">
				<label for="c" class="form-label">content</label>
				<textarea class="form-control" id="c" name="content" aria-label="With textarea" >${bvo.content }</textarea>
			</div>
			<!--파일추가  -->
			
			
			
			<%-- <!-- file upload 표시라인  -->
		<c:set value="${bdto.flist }" var="flist" />
		<div class="mb-3">
			<ul class="list-group">

				<!-- 파일 개수만큼 li를 반복하여 파일 표시 타입이 1인 경우만 표시  -->
				<!-- li => div => img  -->
				<!--	=> div => 파일이름, 작성일, span size  -->
				<c:forEach items="${flist }" var="fvo">
		
					<li class="list-group-item">
					<c:choose>
							<c:when test="${fvo.file_type ==1 }">
								<div>
									<img alt="" src="/upload/${fvo.save_dir }/${fvo.uuid}_${fvo.file_name }">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- 파일 타입이 0인 경우 아이콘 모양 하나 가져와서 넣기  -->
								</div>

							</c:otherwise>
						</c:choose>
						<div>
							<!-- 파일이름 작성 사이즈  -->
							<div>${fvo.file_name }</div>
							${fvo.reg_date } 
							<span class="badge rounded-pill text-bg-warning">${fvo.file_size }Byte</span>
							<button type="button" data-uuid="${fvo.uuid}" class="btn btn-outline-danger btn-sm file-x">X</button>
						</div>
						</li>
				</c:forEach>
			</ul>
		</div>
		
			<!-- 파일 입력 라인 추가 -->
         <div class="mb-3">
            <label for="file" class="form-label">files...</label> 
            <input type="file" class="form-control" name="files" id="file" multiple="multiple" style="display: none;">
            <button type="button" class="btn btn-info" id="trigger">FileUpload...</button>
         </div>
         
         <!-- 파일 목록 표시라인  -->
         <div class="mb-3" id="fileZone">
         </div> --%>
			
			<a><button type="submit" class="btn btn-warning" id="regBtn">수정</button></a>
			<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		</form>
	</div>
	
<!-- 	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script> -->
	
	
	
		<jsp:include page="../layout/footer.jsp"></jsp:include>
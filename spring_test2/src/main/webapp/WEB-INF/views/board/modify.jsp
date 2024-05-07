<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<h1>Board Modify Page</h1>
<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<div class="container-md">
		<form action="/board/modify" method="post" enctype="multipart/form-data" >
		
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
			
			
			
			 <!-- file upload 표시라인  -->
		<c:set value="${bdto.flist }" var="flist" />
		<div class="mb-3">
			<ul class="list-group">

				<!-- 파일 개수만큼 li를 반복하여 파일 표시 타입이 1인 경우만 표시  -->
				<!-- li => div => img  -->
				<!--	=> div => 파일이름, 작성일, span size  -->
				<c:forEach items="${flist }" var="fvo">
		
					<li class="list-group-item">
					<c:choose>
							<c:when test="${fvo.fileType ==1 }">
								<div>
									<img alt="" src="/up/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName }">
								</div>
							</c:when>
							<c:otherwise>
								<div>
								<!-- 일반 파일 다운로드  -->
									<!-- 파일 타입이 0인 경우 아이콘 모양 하나 가져와서 넣기  -->
									<a href="/up/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName }" download="${fvo.fileName }">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 16 16">
									  <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293z"/>
									  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
									</svg>
									</a>
								</div>

							</c:otherwise>
						</c:choose>
						<div>
							<!-- 파일이름 작성 사이즈  -->
							<div>${fvo.fileName }</div>
							${fvo.regDate } 
							<span class="badge rounded-pill text-bg-warning">${fvo.fileSize }Byte</span>
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
         </div> 
			
			<a><button type="submit" class="btn btn-warning" id="regBtn">수정</button></a>
			<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		</form>
	</div>
	
 	<script type="text/javascript" src="/re/js/boardModify.js"></script>
	<script type="text/javascript" src="/re/js/boardRegister.js"></script> 
	
	
	
		<jsp:include page="../layout/footer.jsp"></jsp:include>
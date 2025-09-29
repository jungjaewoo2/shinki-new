<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 취소 상세 페이지 -->
 <div id="cancelled-detail-page" class="order-detail page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">취소 상세 내역</div>
         <div class="breadcrumb">마이페이지 > 의뢰 내역 > 취소 내역 > 상세보기</div>
     </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="card">
             <div class="card-header">
                 <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                     <div>
                         <div style="font-weight: bold;">
                             <c:choose>
                                 <c:when test="${not empty request.createdAt}">
                                     ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/> ${request.status}
                                 </c:when>
                                 <c:otherwise>
                                     2025.05.29 ${request.status}
                                 </c:otherwise>
                             </c:choose>
                         </div>
                     </div>
                     <div>
                         <a href="/mypage/cancelled-orders" class="btn btn-outline-secondary btn-sm">
                             <i class="bi bi-arrow-left"></i> 목록으로
                         </a>
                     </div>
                 </div>
             </div>
             <div class="d-flex justify-content-between align-items-lg-center flex-column flex-lg-row gap-3">
                 <div class="order-type text-center bg-body-secondary rounded" style="color: #666;">
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and request.applicationType == 'HBP'}">
                                 <img src="/assets/images/app-btn1.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'LUNG'}">
                                 <img src="/assets/images/app-btn2.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'CARDIAC'}">
                                 <img src="/assets/images/app-btn3.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'KNEE'}">
                                 <img src="/assets/images/app-btn4.png">
                             </c:when>
                             <c:otherwise>
                                 <img src="/assets/images/app-btn1.png">
                             </c:otherwise>
                         </c:choose>
                     </div>
                     <div>${not empty request ? request.applicationType : 'HBP'}</div>
                 </div>
                 <div class="flex-fill align-items-center d-flex">${not empty request ? request.title : '제목 없음'}</div>
                 <div class="status-badge status-cancelled align-items-center d-flex">
                     <span class="">
                        <c:out value="${not empty request ? request.status : '상태 없음'}"/>
                     </span>
                 </div>
             </div>
         </div>
         
         <!-- 취소 정보 카드 -->
         <div class="card">
             <div class="card-header">
                 <h5 class="mb-0">취소 정보</h5>
             </div>
             <div class="card-body">
                 <div class="row">
                     <div class="col-md-6">
                         <div class="form-group mb-3">
                             <label class="form-label fw-bold">의뢰일</label>
                             <div class="form-control-plaintext">
                                 <c:choose>
                                     <c:when test="${not empty request.createdAt}">
                                         ${request.createdAt.year}년 <fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>월 <fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/>일
                                     </c:when>
                                     <c:otherwise>
                                         -
                                     </c:otherwise>
                                 </c:choose>
                             </div>
                         </div>
                     </div>
                     <div class="col-md-6">
                         <div class="form-group mb-3">
                             <label class="form-label fw-bold">취소일</label>
                             <div class="form-control-plaintext">
                                 <c:choose>
                                     <c:when test="${not empty request.updatedAt}">
                                         ${request.updatedAt.year}년 <fmt:formatNumber value="${request.updatedAt.monthValue}" pattern="00"/>월 <fmt:formatNumber value="${request.updatedAt.dayOfMonth}" pattern="00"/>일
                                     </c:when>
                                     <c:otherwise>
                                         -
                                     </c:otherwise>
                                 </c:choose>
                             </div>
                         </div>
                     </div>
                 </div>
                 
                 <div class="form-group mb-3">
                     <label class="form-label fw-bold">의뢰 제목</label>
                     <div class="form-control-plaintext">${not empty request ? request.title : '제목 없음'}</div>
                 </div>
                 
                 <div class="form-group mb-3">
                     <label class="form-label fw-bold">의뢰 내용</label>
                     <div class="form-control-plaintext border rounded p-3 bg-light" style="min-height: 100px; white-space: pre-wrap;">${not empty request ? request.content : '내용 없음'}</div>
                 </div>
                 
                 <c:if test="${not empty request.paymentAmount and request.paymentAmount > 0}">
                     <div class="form-group mb-3">
                         <label class="form-label fw-bold">결제 예정 금액</label>
                         <div class="form-control-plaintext text-danger fw-bold">
                             <fmt:formatNumber value="${request.paymentAmount}" pattern="#,###" />원
                         </div>
                     </div>
                 </c:if>
             </div>
         </div>
         
         <!-- 첨부 파일 정보 -->
         <div class="card">
             <div class="card-header">
                 <h5 class="mb-0">첨부 파일</h5>
             </div>
             <div class="card-body">
                 <c:choose>
                     <c:when test="${not empty request and not empty request.filePath}">
                         <div class="d-flex align-items-center gap-3">
                             <i class="bi bi-file-earmark text-primary fs-4"></i>
                             <div>
                                 <div class="fw-bold">${request.filePath}</div>
                                 <small class="text-muted">의뢰시 첨부된 파일</small>
                             </div>
                         </div>
                     </c:when>
                     <c:otherwise>
                         <div class="text-muted text-center py-3">
                             <i class="bi bi-file-earmark-x fs-1"></i>
                             <div class="mt-2">첨부된 파일이 없습니다.</div>
                         </div>
                     </c:otherwise>
                 </c:choose>
             </div>
         </div>
         
         <!-- 취소 사유 (댓글 시스템 활용) -->
         <div class="card">
             <div class="card-header">
                 <h5 class="mb-0">취소 관련 메모</h5>
             </div>
             <div class="card-body">
                 <!-- 댓글 목록 -->
                 <c:choose>
                     <c:when test="${not empty userComments}">
                         <c:forEach var="comment" items="${userComments}">
                             <div class="comment-item border-bottom pb-3 mb-3">
                                 <!-- 사용자 댓글 -->
                                 <div class="user-comment p-3 bg-light rounded mb-2">
                                     <div class="d-flex justify-content-between align-items-start mb-2">
                                         <div class="fw-bold text-primary">사용자 메모</div>
                                         <small class="text-muted">
                                             <fmt:formatDate value="${comment.userCreatedAt}" pattern="yyyy.MM.dd" />
                                             <c:if test="${not empty comment.member}">
                                                 (${comment.member.name})
                                             </c:if>
                                         </small>
                                     </div>
                                     <div class="comment-content mb-3" style="white-space: pre-wrap;">${comment.userContent}</div>
                                 </div>
                                 
                                 <!-- 해당 댓글의 관리자 답글들 -->
                                 <c:if test="${not empty comment.replies}">
                                     <div class="replies ms-4">
                                         <c:forEach var="reply" items="${comment.replies}">
                                             <div class="reply-item p-2 bg-warning bg-opacity-10 rounded mb-2">
                                                 <div class="d-flex justify-content-between align-items-start mb-1">
                                                     <div class="fw-bold text-warning">관리자 답글</div>
                                                     <small class="text-muted">
                                                         <fmt:formatDate value="${reply.adminCreatedAt}" pattern="yyyy.MM.dd" />
                                                         <c:if test="${not empty reply.admin}">
                                                             - ${reply.admin.name}
                                                         </c:if>
                                                     </small>
                                                 </div>
                                                 <div class="reply-content" style="white-space: pre-wrap;">${reply.adminContent}</div>
                                             </div>
                                         </c:forEach>
                                     </div>
                                 </c:if>
                             </div>
                         </c:forEach>
                     </c:when>
                     <c:otherwise>
                         <div class="text-center text-muted p-3">
                             <i class="bi bi-chat-square-text fs-1"></i>
                             <div class="mt-2">취소 관련 메모가 없습니다.</div>
                         </div>
                     </c:otherwise>
                 </c:choose>
             </div>
         </div>
     </div>
 </div>

<jsp:include page="footer.jsp" />

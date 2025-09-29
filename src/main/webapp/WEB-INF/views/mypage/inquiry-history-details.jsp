<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 문의내역조회 페이지 -->
 <div id="inquiry-history-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">문의내역조회</div>
         <div class="breadcrumb">마이페이지 > 1:1 문의 > 문의내역조회</div>
     </div>

     <div class="card flex-fill overflow-auto">
         <!-- Flash 메시지 표시 -->
         <c:if test="${not empty message}">
             <div class="alert alert-success alert-dismissible fade show" role="alert">
                 <c:out value="${message}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 <c:out value="${error}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         
         <c:if test="${not empty inquiry}">
             <div class="">
                 <div class="bg-white pt-lg-3 p-0">
                     <table class="table table-bordered m-0">
                         <colgroup>
                             <col width="20%">
                             <col width="20%">
                             <col width="20%">
                             <col width="20%">
                             <col width="10%">
                             <col width="10%">
                         </colgroup>
                         <tbody class="">
                             <tr>
                                 <th>문의유형</th>
                                 <td colspan="4" class="text-start">${inquiry.inquiryType}</td>
                             </tr>
                             <tr>
                                 <th>작성일</th>
                                 <td class="text-start">
                                     <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd"/>
                                 </td>
                                 <th>상담상태</th>
                                 <td class="text-start">
                                     <span class="badge ${inquiry.status eq '진행중' ? 'bg-warning' : inquiry.status eq '완료' ? 'bg-success' : 'bg-secondary'}">
                                         ${inquiry.status}
                                     </span>
                                 </td>
                                 <th>첨부파일</th>
                                 <td class="text-start">
                                     <c:choose>
                                         <c:when test="${not empty inquiry.filePath}">
                                             <a href="/mypage/download-inquiry-file?filePath=${fn:escapeXml(inquiry.filePath)}" class="btn btn-sm btn-outline-primary">
                                                 <i class="bi bi-download"></i> 파일 다운로드
                                             </a>
                                         </c:when>
                                         <c:otherwise>
                                             <span class="text-muted">없음</span>
                                         </c:otherwise>
                                     </c:choose>
                                 </td>
                             </tr>
                         </tbody>
                     </table>
                 <div class="form-group flex-column align-items-baseline gap-1 mt-4 border-top">
                     <div class="bg-body-tertiary p-3 w-100 text-black-50 d-flex flex-column gap-3">
                         <!-- 문의내용 -->
                         <div class="">
                             <div class="d-flex flex-column gap-3">
                                 <div>
                                     <div class="fw-bold">문의내용</div>
                                     <div class="border p-3" style="white-space: pre-wrap;">${inquiry.content}</div>
                                 </div>
                             </div>
                         </div>
                         
                         <!-- 관리자 답변 -->
                         <c:if test="${not empty inquiry.adminReply}">
                             <div>
                                 <div class="d-flex flex-column gap-3">
                                     <div>
                                         <div class="fw-bold">답변</div>
                                         <div class="bg-white p-3" style="white-space: pre-wrap;">${inquiry.adminReply}</div>
                                         <c:if test="${not empty inquiry.replyDate}">
                                             <div class="text-muted small mt-2">
                                                 <fmt:formatDate value="${inquiry.replyDate}" pattern="yyyy-MM-dd HH:mm"/>
                                             </div>
                                         </c:if>
                                         <!-- 관리자 첨부파일 다운로드 -->
                                         <c:if test="${not empty inquiry.adminReplyFilePath}">
                                             <div class="mt-2">
                                                 <a href="/mypage/download-admin-reply-file?filePath=${fn:escapeXml(inquiry.adminReplyFilePath)}" class="btn btn-sm btn-outline-success">
                                                     <i class="bi bi-download"></i> 관리자 첨부파일 다운로드
                                                 </a>
                                             </div>
                                         </c:if>
                                     </div>
                                 </div>
                             </div>
                         </c:if>
                         <!-- 댓글 입력 폼 -->
                         <form method="post" action="/mypage/inquiry-history-details/reply">
                             <input type="hidden" name="inquiryId" value="${inquiry.id}">
                             <div class="d-flex flex-column gap-1 p-3 rounded-2 border">
                                 <div class="fw-bold">댓글</div>
                                 <textarea name="content" class="form-control" rows="3" placeholder="내용을 입력하세요" required></textarea>
                                 <div class="text-end">
                                     <button type="submit" class="btn btn-primary btn-sm">등록</button>
                                 </div>
                             </div>
                         </form>
                         
                         <!-- 댓글 목록 -->
                         <c:forEach var="reply" items="${replies}">
                             <div class="d-flex flex-column gap-1 border-bottom p-1">
                                 <div class="fw-bold d-flex gap-1">
                                     <div>
                                         <fmt:formatDate value="${reply.userCreatedAt}" pattern="yyyy. MM. dd"/>
                                     </div>
                                 </div>
                                 <div style="white-space: pre-wrap;">${reply.userContent}</div>
                                 <c:if test="${not empty reply.adminContent}">
                                     <div style="white-space: pre-wrap;"><i class="bi bi-arrow-return-right"></i> ${reply.adminContent}</div>
                                 </c:if>
                             </div>
                         </c:forEach>
                     </div>
                 </div>
             </div>
             <!--<div class="d-block d-lg-none">
                 <div class="d-flex flex-column gap-1 border-bottom pb-2 pt-2">
                     <div class="order-numb align-items-center d-flex gap-1">
                         <div>5. 기능문의</div>
                         <div>/</div>
                         <div class="text-danger">진행중</div>
                     </div>
                     <div class="order-contents">수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                     <div class="form-group flex-column align-items-baseline gap-1 pt-4 border-top">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 답변</label>
                         <div class="bg-body-tertiary p-3 w-100 text-black-50">
                             <div class="d-flex flex-column gap-3 pb-1">
                                 <div class="fw-bold"><i class="bi bi-person-circle"></i> 관리자1</div>
                                 <div>
                                     <div>
                                         <div class="fw-bold mb-2"><i class="bi bi-quora"></i>. 주문현황이 어떻게 되나요?</div>
                                         <div class="bg-white p-3">주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다.주문현황은 2일 걸립니다..</div>
                                     </div>
                                 </div>
                             </div>
                             <div class="d-flex gap-3 border-bottom p-1">
                                 <div class="fw-bold d-flex gap-1"><i class="bi bi-arrow-return-right"></i>
                                     <div>사용자1</div>
                                 </div>
                                 <div>확인 감사합니다.</div>
                             </div>
                             <div class="d-flex gap-3 border-bottom p-1">
                                 <div class="fw-bold d-flex gap-1"><i class="bi bi-arrow-return-right"></i>
                                     <div>사용자1</div>
                                 </div>
                                 <div>확인 감사합니다.</div>
                             </div>
                             <div class="d-flex flex-column gap-1 p-3 rounded-2 mt-5 bg-white">
                                 <div class="fw-bold">사용자1</div>
                                 <textarea class="form-input" rows="3" placeholder="내용을 입력하세요"></textarea>
                                 <div class="text-end">등록</div>
                             </div>
                         </div>
                     </div>
                     <div class="align-items-center d-flex justify-content-end">

                         <div class="order-date">2025.01.31까지</div>
                     </div>
                 </div>

             </div>-->
         </div>
             <div class="button-group justify-content-end mt-3">
                 <button class="btn btn-secondary me-2" onclick="location.href='/mypage/inquiry-history'">목록</button>
                 <button class="btn btn-danger" onclick="deleteInquiry(${inquiry.id})">삭제</button>
             </div>
         </c:if>
         
         <c:if test="${empty inquiry}">
             <div class="alert alert-warning text-center mt-3" role="alert">
                 문의 정보를 찾을 수 없습니다.
             </div>
         </c:if>
     </div>
 </div>

 <script>
 function deleteInquiry(inquiryId) {
     if (confirm('정말로 이 문의를 삭제하시겠습니까?\n\n삭제 시 다음 내용이 모두 삭제됩니다:\n- 문의 내용\n- 관리자 답변\n- 모든 댓글 및 답변\n\n이 작업은 되돌릴 수 없습니다.')) {
         // 폼을 동적으로 생성하여 POST 요청 전송
         const form = document.createElement('form');
         form.method = 'POST';
         form.action = '/mypage/inquiry-history-details/delete';
         
         const input = document.createElement('input');
         input.type = 'hidden';
         input.name = 'inquiryId';
         input.value = inquiryId;
         
         form.appendChild(input);
         document.body.appendChild(form);
         form.submit();
     }
 }
 </script>

 <jsp:include page="footer.jsp" />
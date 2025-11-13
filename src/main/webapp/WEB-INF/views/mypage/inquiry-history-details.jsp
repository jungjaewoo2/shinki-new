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
                     <%-- 
                     <!-- 기존 table 코드 start-->
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
                                 <td colspan="5" class="text-start">${inquiry.inquiryType}</td>
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
                                            <a href="/mypage/download-inquiry-file?filePath=${fn:escapeXml(inquiry.filePath)}" class="btn btn-sm btn-outline-primary" style="font-size: 0.8rem;">
                                                <i class="bi bi-download"></i> 
                                                <c:set var="fileName" value="${fn:substringAfter(inquiry.filePath, '_')}" />
                                                <c:choose>
                                                    <c:when test="${not empty fileName}">
                                                        ${fn:escapeXml(fileName)}
                                                    </c:when>
                                                    <c:otherwise>
                                                        파일 다운로드
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                         </c:when>
                                         <c:otherwise>
                                             <span class="text-muted">없음</span>
                                         </c:otherwise>
                                     </c:choose>
                                 </td>
                             </tr>
                         </tbody>
                     </table> --%>
                     <!-- 기존 table 코드 end-->
                     
                     <!-- pc,모바일 table 코드 분리 start -->
                     <!-- pc table start -->
                     <div class="d-none d-lg-block">
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
	                                 <td colspan="5" class="text-start">${inquiry.inquiryType}</td>
	                             </tr>
	                             <tr>
	                                 <th>작성일</th>
	                                 <td class="text-start">
	                                     <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd"/>
	                                 </td>
	                                 <th>상담상태</th>
	                                 <td class="text-start">
	                                     <c:choose>
	                                         <c:when test="${inquiry.status eq '미확인'}">
	                                             <span class="badge" style="background-color: #c7a987 !important; color: white !important;">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:when test="${inquiry.status eq '답변진행중'}">
	                                             <span class="badge" style="background-color: #186623 !important; color: white !important;">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:when test="${inquiry.status eq '완료'}">
	                                             <span class="badge bg-success">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:otherwise>
	                                             <span class="badge bg-secondary">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:otherwise>
	                                     </c:choose>
	                                 </td>
	                                 <th>첨부파일</th>
	                                 <td class="text-start">
	                                     <c:choose>
	                                         <c:when test="${not empty inquiry.filePath}">
	                                            <a href="/mypage/download-inquiry-file?filePath=${fn:escapeXml(inquiry.filePath)}" class="btn btn-sm btn-outline-primary h-auto" style="font-size: 0.8rem;">
	                                                <i class="bi bi-download"></i> 
	                                                <c:set var="fileName" value="${fn:substringAfter(inquiry.filePath, '_')}" />
	                                                <c:choose>
	                                                    <c:when test="${not empty fileName}">
	                                                        ${fn:escapeXml(fileName)}
	                                                    </c:when>
	                                                    <c:otherwise>
	                                                        파일 다운로드
	                                                    </c:otherwise>
	                                                </c:choose>
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
                     </div>
                     <!-- pc table end -->
                     
                     <!-- 모바일 table start -->
                     <div class="d-block d-lg-none">
                     	<table class="table table-bordered m-0">
	                         <colgroup>
	                         </colgroup>
	                         <tbody class="">
	                             <tr>
	                                 <th>문의유형</th>
	                                 <td colspan="5" class="text-start">${inquiry.inquiryType}</td>
	                             </tr>
	                             <tr>
	                                 <th>작성일</th>
	                                 <td class="text-start">
	                                     <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd"/>
	                                 </td>
	                                </tr>
	                             <tr>
	                                 <th>상담상태</th>
	                                 <td class="text-start">
	                                     <c:choose>
	                                         <c:when test="${inquiry.status eq '미확인'}">
	                                             <span class="badge" style="background-color: #c7a987 !important; color: white !important;">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:when test="${inquiry.status eq '답변진행중'}">
	                                             <span class="badge" style="background-color: #186623 !important; color: white !important;">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:when test="${inquiry.status eq '완료'}">
	                                             <span class="badge bg-success">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:when>
	                                         <c:otherwise>
	                                             <span class="badge bg-secondary">
	                                                 ${inquiry.status}
	                                             </span>
	                                         </c:otherwise>
	                                     </c:choose>
	                                 </td>
	                                </tr>
	                             <tr>
	                                 <th>첨부파일</th>
	                                 <td class="text-start">
	                                     <c:choose>
	                                         <c:when test="${not empty inquiry.filePath}">
	                                            <a href="/mypage/download-inquiry-file?filePath=${fn:escapeXml(inquiry.filePath)}" class="btn btn-sm btn-outline-primary h-auto" style="font-size: 0.8rem;">
	                                                <i class="bi bi-download"></i> 
	                                                <c:set var="fileName" value="${fn:substringAfter(inquiry.filePath, '_')}" />
	                                                <c:choose>
	                                                    <c:when test="${not empty fileName}">
	                                                        ${fn:escapeXml(fileName)}
	                                                    </c:when>
	                                                    <c:otherwise>
	                                                        파일 다운로드
	                                                    </c:otherwise>
	                                                </c:choose>
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
                     </div>
                     <!-- 모바일 table end -->
                     <!-- pc,모바일 table 코드 분리 end -->
                     
                 <div class="form-group flex-column align-items-baseline gap-1 mt-4 border-top">
                     <div class="bg-body-tertiary p-3 w-100 text-black-50 d-flex flex-column gap-3">
                         <!-- 문의내용 -->
                         <div class="">
                             <div class="d-flex flex-column gap-3">
                                 <div>
                                     <div class="d-flex justify-content-between align-items-center mb-2">
                                         <div class="fw-bold">문의내용</div>
                                         <button type="button" class="btn btn-sm btn-outline-primary" onclick="editInquiryContent(${inquiry.id})" title="수정">
                                             <i class="bi bi-pencil"></i>
                                         </button>
                                     </div>
                                     <!-- 문의내용 보기 모드 -->
                                     <div id="inquiry-content-view-${inquiry.id}" class="border p-3" style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${inquiry.content}"/></div>
                                     <!-- 문의내용 수정 모드 -->
                                     <div id="inquiry-content-edit-${inquiry.id}" style="display: none;">
                                         <textarea class="form-control mb-2" id="inquiry-content-textarea-${inquiry.id}" rows="5" style="white-space: pre-wrap;"><c:out value="${inquiry.content}"/></textarea>
                                         <div class="d-flex gap-2 justify-content-end">
                                             <button type="button" class="btn btn-sm btn-success" onclick="saveInquiryContent(${inquiry.id})">
                                                 <i class="bi bi-check-circle"></i> 저장
                                             </button>
                                             <button type="button" class="btn btn-sm btn-secondary" onclick="cancelEditInquiryContent(${inquiry.id})">
                                                 <i class="bi bi-x-circle"></i> 취소
                                             </button>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         
                         <!-- 관리자 답변 -->
                         <c:if test="${not empty inquiry.adminReply}">
                             <div>
                                 <div class="d-flex flex-column gap-3">
                                     <div>
                                         <div class="d-flex justify-content-between align-items-center mb-2">
                                             <div class="fw-bold">답글</div>
                                             <div class="d-flex gap-2">


                                             </div>
                                         </div>
                                         <div class="admin-reply-content bg-white p-3" id="admin-reply-content-${inquiry.id}" style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${inquiry.adminReply}"/></div>
                                         <div class="admin-reply-edit-form" id="admin-reply-edit-form-${inquiry.id}" style="display: none;">
                                             <textarea class="form-control mb-2" id="admin-reply-edit-textarea-${inquiry.id}" rows="3"><c:out value="${inquiry.adminReply}"/></textarea>
                                             <div class="d-flex gap-2">
                                                 <button type="button" class="btn btn-sm btn-success" onclick="saveAdminReply(${inquiry.id})">저장</button>
                                                 <button type="button" class="btn btn-sm btn-secondary" onclick="cancelEditAdminReply(${inquiry.id})">취소</button>
                                             </div>
                                         </div>
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
                         
                        <!-- 사용자 댓글 및 관리자 답변 섹션 -->
                        <div class="border-top pt-3 mt-3">
                            <div class="fw-bold mb-3" style="font-size: 1.1rem;">
                                <i class="bi bi-chat-dots"></i> 사용자 댓글 및 관리자 댓글
                            </div>
                            
                            <!-- 댓글 목록 -->
                            <c:choose>
                                <c:when test="${not empty replies}">
                                    <c:forEach var="reply" items="${replies}">
                                        <div class="d-flex flex-column gap-2 border rounded p-3 mb-2 bg-white">
                                            <!-- 사용자 댓글 -->
                                            <div class="d-flex justify-content-between align-items-start">
                                                <div class="fw-bold d-flex gap-2 align-items-center">
                                                    <i class="bi bi-person-circle text-primary" style="font-size: 1.2rem;"></i>
                                                    <div class="text-muted small">
                                                        <fmt:formatDate value="${reply.userCreatedAt}" pattern="yyyy.MM.dd HH:mm"/>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-2">
                                                    <button type="button" class="btn btn-sm btn-outline-primary" onclick="editUserComment(${reply.id})" title="수정">
                                                        <i class="bi bi-pencil"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteUserComment(${reply.id})" title="삭제">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            
                                            <!-- 사용자 댓글 보기 모드 -->
                                            <div id="user-comment-view-${reply.id}">
                                                <div style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${reply.userContent}"/></div>
                                            </div>
                                            
                                            <!-- 사용자 댓글 수정 모드 -->
                                            <div id="user-comment-edit-${reply.id}" style="display: none;">
                                                <textarea class="form-control mb-2" id="user-comment-edit-textarea-${reply.id}" rows="3" style="white-space: pre-wrap;"><c:out value="${reply.userContent}"/></textarea>
                                                <div class="d-flex gap-2 justify-content-end">
                                                    <button type="button" class="btn btn-sm btn-success" onclick="saveUserComment(${reply.id})">
                                                        <i class="bi bi-check-circle"></i> 저장
                                                    </button>
                                                    <button type="button" class="btn btn-sm btn-secondary" onclick="cancelEditUserComment(${reply.id})">
                                                        <i class="bi bi-x-circle"></i> 취소
                                                    </button>
                                                </div>
                                            </div>
                                            
                                            <!-- 관리자 답글 -->
                                            <c:if test="${not empty reply.adminContent}">
                                                <div class="ms-4 mt-2 p-3 bg-light rounded border-start border-success border-3">
                                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                                        <div class="fw-bold text-success d-flex gap-2 align-items-center">
                                                            <i class="bi bi-arrow-return-right"></i>
                                                            <span>관리자</span>
                                                            <c:if test="${not empty reply.adminCreatedAt}">
                                                                <span class="text-muted small fw-normal">
                                                                    <fmt:formatDate value="${reply.adminCreatedAt}" pattern="yyyy.MM.dd HH:mm"/>
                                                                </span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${reply.adminContent}"/></div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <!-- 댓글이 없을 때 표시 -->
                                    <div class="text-center py-5 border rounded bg-white">
                                        <i class="bi bi-chat-dots text-muted" style="font-size: 3rem;"></i>
                                        <p class="text-muted mt-3 mb-0">등록된 댓글이 없습니다.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
                            <!-- 댓글 입력 폼 (항상 표시) -->
                            <div class="mt-3">
                                <form method="post" action="/mypage/inquiry-history-details/reply">
                                    <input type="hidden" name="inquiryId" value="${inquiry.id}">
                                    <div class="d-flex flex-column gap-2 p-3 rounded-2 border bg-white">
                                        <div class="fw-bold">
                                            <i class="bi bi-pencil-square"></i> 댓글 작성
                                        </div>
                                        <textarea name="content" class="form-control" rows="3" placeholder="댓글을 입력하세요" required></textarea>
                                        <div class="text-end">
                                            <button type="submit" class="btn btn-primary btn-sm h-auto">
                                                <i class="bi bi-send"></i> 등록
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
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
             <div class="d-flex flex-row gap-1 button-group justify-content-end mt-3">
                 <button class="btn btn-secondary" onclick="location.href='/mypage/inquiry-history'">목록</button>
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

// 관리자 답변 수정 함수
function editAdminReply(inquiryId) {
    alert('수정 버튼 클릭됨! inquiryId: ' + inquiryId);
    console.log('=== editAdminReply 시작 ===');
    console.log('inquiryId:', inquiryId);
    console.log('inquiryId 타입:', typeof inquiryId);
    
    const contentDiv = document.getElementById('admin-reply-content-' + inquiryId);
    const editForm = document.getElementById('admin-reply-edit-form-' + inquiryId);
    const textarea = document.getElementById('admin-reply-edit-textarea-' + inquiryId);
    
    console.log('contentDiv:', contentDiv);
    console.log('editForm:', editForm);
    console.log('textarea:', textarea);
    
    if (!contentDiv) {
        console.error('contentDiv를 찾을 수 없습니다. ID:', 'admin-reply-content-' + inquiryId);
        alert('답변 내용을 찾을 수 없습니다.');
        return;
    }
    
    if (!editForm) {
        console.error('editForm을 찾을 수 없습니다. ID:', 'admin-reply-edit-form-' + inquiryId);
        alert('수정 폼을 찾을 수 없습니다.');
        return;
    }
    
    if (!textarea) {
        console.error('textarea를 찾을 수 없습니다. ID:', 'admin-reply-edit-textarea-' + inquiryId);
        alert('수정 입력창을 찾을 수 없습니다.');
        return;
    }
    
    try {
        // 원래 내용을 textarea에 설정
        const originalContent = contentDiv.textContent.trim();
        console.log('원래 내용:', originalContent);
        
        textarea.value = originalContent;
        contentDiv.style.display = 'none';
        editForm.style.display = 'block';
        textarea.focus();
        textarea.select();
        console.log('수정 모드로 전환 완료');
    } catch (error) {
        console.error('수정 모드 전환 중 오류:', error);
        alert('수정 모드 전환 중 오류가 발생했습니다: ' + error.message);
    }
}

// 관리자 답변 수정 취소 함수
function cancelEditAdminReply(inquiryId) {
    const contentDiv = document.getElementById('admin-reply-content-' + inquiryId);
    const editForm = document.getElementById('admin-reply-edit-form-' + inquiryId);
    const textarea = document.getElementById('admin-reply-edit-textarea-' + inquiryId);
    
    if (contentDiv && editForm && textarea) {
        // 원래 내용으로 되돌리기
        textarea.value = contentDiv.textContent.trim();
        contentDiv.style.display = 'block';
        editForm.style.display = 'none';
    }
}

// 관리자 답변 저장 함수
function saveAdminReply(inquiryId) {
    const textarea = document.getElementById('admin-reply-edit-textarea-' + inquiryId);
    const newContent = textarea.value.trim();
    
    if (!newContent) {
        alert('답변 내용을 입력해주세요.');
        return;
    }
    
    if (confirm('답변을 수정하시겠습니까?')) {
        // 폼을 동적으로 생성하여 POST 요청 전송
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/mypage/inquiry-history-details/update-admin-reply';
        
        const inquiryIdInput = document.createElement('input');
        inquiryIdInput.type = 'hidden';
        inquiryIdInput.name = 'inquiryId';
        inquiryIdInput.value = inquiryId;
        
        const contentInput = document.createElement('input');
        contentInput.type = 'hidden';
        contentInput.name = 'adminReply';
        contentInput.value = newContent;
        
        form.appendChild(inquiryIdInput);
        form.appendChild(contentInput);
        document.body.appendChild(form);
        form.submit();
    }
}

// 관리자 답변 삭제 함수
function deleteAdminReply(inquiryId) {
    alert('삭제 버튼 클릭됨! inquiryId: ' + inquiryId);
    console.log('=== deleteAdminReply 시작 ===');
    console.log('inquiryId:', inquiryId);
    console.log('inquiryId 타입:', typeof inquiryId);
    
    if (!inquiryId) {
        console.error('inquiryId가 없습니다');
        alert('문의 ID를 찾을 수 없습니다.');
        return;
    }
    
    if (confirm('정말로 이 답변을 삭제하시겠습니까?\n\n이 작업은 되돌릴 수 없습니다.')) {
        console.log('사용자가 삭제를 확인함');
        
        try {
            // 폼을 동적으로 생성하여 POST 요청 전송
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/mypage/inquiry-history-details/delete-admin-reply';
            
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'inquiryId';
            input.value = inquiryId;
            
            form.appendChild(input);
            document.body.appendChild(form);
            
            console.log('폼 생성 완료');
            console.log('폼 action:', form.action);
            console.log('폼 method:', form.method);
            console.log('input name:', input.name);
            console.log('input value:', input.value);
            
            console.log('폼 전송 시작');
            form.submit();
        } catch (error) {
            console.error('폼 생성/전송 중 오류:', error);
            alert('삭제 요청 전송 중 오류가 발생했습니다: ' + error.message);
        }
    } else {
        console.log('사용자가 삭제를 취소함');
    }
}

// 사용자 댓글 수정 함수
function editUserComment(replyId) {
    console.log('=== 사용자 댓글 수정 시작 ===');
    console.log('replyId:', replyId);

    const viewMode = document.getElementById('user-comment-view-' + replyId);
    const editMode = document.getElementById('user-comment-edit-' + replyId);
    const textarea = document.getElementById('user-comment-edit-textarea-' + replyId);

    if (!viewMode || !editMode || !textarea) {
        alert('댓글 수정 요소를 찾을 수 없습니다.');
        return;
    }

    // 보기 모드 숨기고 수정 모드 표시
    viewMode.style.display = 'none';
    editMode.style.display = 'block';

    // 텍스트 영역에 포커스
    textarea.focus();
    textarea.select();
}

// 사용자 댓글 수정 취소 함수
function cancelEditUserComment(replyId) {
    console.log('=== 사용자 댓글 수정 취소 ===');
    console.log('replyId:', replyId);

    const viewMode = document.getElementById('user-comment-view-' + replyId);
    const editMode = document.getElementById('user-comment-edit-' + replyId);

    if (viewMode && editMode) {
        viewMode.style.display = 'block';
        editMode.style.display = 'none';
    }
}

// 사용자 댓글 저장 함수
function saveUserComment(replyId) {
    console.log('=== 사용자 댓글 저장 시작 ===');
    console.log('replyId:', replyId);

    const textarea = document.getElementById('user-comment-edit-textarea-' + replyId);
    if (!textarea) {
        alert('수정 내용을 찾을 수 없습니다.');
        return;
    }

    const newContent = textarea.value.trim();
    if (!newContent) {
        alert('댓글 내용을 입력해주세요.');
        return;
    }

    if (!confirm('댓글을 수정하시겠습니까?')) {
        return;
    }

    // 폼을 동적으로 생성하여 POST 요청 전송
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/mypage/inquiry-history-details/update-user-comment';
    
    const replyIdInput = document.createElement('input');
    replyIdInput.type = 'hidden';
    replyIdInput.name = 'replyId';
    replyIdInput.value = replyId;
    
    const contentInput = document.createElement('input');
    contentInput.type = 'hidden';
    contentInput.name = 'userContent';
    contentInput.value = newContent;
    
    form.appendChild(replyIdInput);
    form.appendChild(contentInput);
    document.body.appendChild(form);
    form.submit();
}

// 사용자 댓글 삭제 함수
function deleteUserComment(replyId) {
    console.log('=== 사용자 댓글 삭제 시작 ===');
    console.log('replyId:', replyId);

    if (!confirm('정말로 이 댓글을 삭제하시겠습니까?\n\n삭제된 댓글은 복구할 수 없습니다.')) {
        return;
    }

    // 폼을 동적으로 생성하여 POST 요청 전송
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/mypage/inquiry-history-details/delete-user-comment';

    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'replyId';
    input.value = replyId;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}

// 문의내용 수정 함수
function editInquiryContent(inquiryId) {
    console.log('=== 문의내용 수정 시작 ===');
    console.log('inquiryId:', inquiryId);

    const viewMode = document.getElementById('inquiry-content-view-' + inquiryId);
    const editMode = document.getElementById('inquiry-content-edit-' + inquiryId);
    const textarea = document.getElementById('inquiry-content-textarea-' + inquiryId);

    if (!viewMode || !editMode || !textarea) {
        alert('문의내용 수정 요소를 찾을 수 없습니다.');
        return;
    }

    // 보기 모드 숨기고 수정 모드 표시
    viewMode.style.display = 'none';
    editMode.style.display = 'block';

    // 텍스트 영역에 포커스
    textarea.focus();
    textarea.select();
}

// 문의내용 수정 취소 함수
function cancelEditInquiryContent(inquiryId) {
    console.log('=== 문의내용 수정 취소 ===');
    console.log('inquiryId:', inquiryId);

    const viewMode = document.getElementById('inquiry-content-view-' + inquiryId);
    const editMode = document.getElementById('inquiry-content-edit-' + inquiryId);

    if (viewMode && editMode) {
        viewMode.style.display = 'block';
        editMode.style.display = 'none';
    }
}

// 문의내용 저장 함수
function saveInquiryContent(inquiryId) {
    console.log('=== 문의내용 저장 시작 ===');
    console.log('inquiryId:', inquiryId);

    const textarea = document.getElementById('inquiry-content-textarea-' + inquiryId);
    if (!textarea) {
        alert('수정 내용을 찾을 수 없습니다.');
        return;
    }

    const newContent = textarea.value.trim();
    if (!newContent) {
        alert('문의내용을 입력해주세요.');
        return;
    }

    if (!confirm('문의내용을 수정하시겠습니까?')) {
        return;
    }

    // 폼을 동적으로 생성하여 POST 요청 전송
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/mypage/inquiry-history-details/update-content';

    const inquiryIdInput = document.createElement('input');
    inquiryIdInput.type = 'hidden';
    inquiryIdInput.name = 'inquiryId';
    inquiryIdInput.value = inquiryId;

    const contentInput = document.createElement('input');
    contentInput.type = 'hidden';
    contentInput.name = 'content';
    contentInput.value = newContent;

    form.appendChild(inquiryIdInput);
    form.appendChild(contentInput);
    document.body.appendChild(form);
    form.submit();
}
</script>

 <jsp:include page="footer.jsp" />
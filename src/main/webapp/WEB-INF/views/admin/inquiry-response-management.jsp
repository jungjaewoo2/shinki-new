<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">문의답변관리</div>
         <div class="breadcrumb">관리자페이지 > 1:1문의관리 > 문의답변관리</div>
     </div>

     <!-- 성공/오류 메시지 표시 -->
     <c:if test="${not empty success}">
         <div class="alert alert-success alert-dismissible fade show" role="alert">
             ${success}
             <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
         </div>
     </c:if>
     
     <c:if test="${not empty error}">
         <div class="alert alert-danger alert-dismissible fade show" role="alert">
             ${error}
             <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
         </div>
     </c:if>

     <c:if test="${not empty inquiry}">
     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <div class="card">
             <div class="d-flex flex-column gap-3 mb-3">
                 <div class="d-flex gap-3">
                     <div class="fw-bold">문의고객</div>
                     <div class="d-flex gap-3">
                         <div>(${inquiry.member != null ? inquiry.member.hospitalName : '-'} / ${inquiry.member != null ? inquiry.member.name : '-'})</div>
                         <div>/</div>
                         <div>${inquiry.member != null ? inquiry.member.phone : '-'}</div>
                         <div>/</div>
                         <div>${inquiry.member != null ? inquiry.member.email : '-'}</div>
                     </div>
                 </div>
                 <div class="d-flex flex-column gap-3">
                     <div class="d-flex gap-3">
                         <div class="fw-bold">작성일시</div>
                         <div><fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                     </div>
                     <div>
                         <div class="d-flex gap-3">
                             <div class="fw-bold">문의내용</div>
                             <div>
                                 <button class="select-btn active p-0 px-2">${inquiry.inquiryType}</button>
                             </div>
                         </div>
                         <div style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${inquiry.content}"/></div>
                     </div>
                     <c:if test="${not empty inquiry.filePath}">
                     <div class="d-flex gap-3">
                        <div class="fw-bold">파일명</div>
                        <div>
                            <a href="/admin/download-inquiry-file?filePath=${fn:escapeXml(inquiry.filePath)}" class="btn btn-sm btn-outline-primary" style="font-size: 0.8rem;">
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
                        </div>
                    </div>
                    </c:if>
                 </div>
             </div>
         </div>
         <form action="/admin/inquiry-response-management" method="post" enctype="multipart/form-data" onsubmit="return validateReply()">
             <input type="hidden" name="inquiryId" value="${inquiry.id}">
             
             <div class="card">
                 <div class="d-flex gap-3 mb-3">
                     <div class="fw-bold">처리상태</div>
                     <div>
                         <div class="d-flex gap-4">
                             <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault1" value="미확인" ${inquiry.status == '미확인' ? 'checked' : ''} ${canReply || canModify || adminAuthority == '모든권한' ? '' : 'disabled'}>
                                <label class="form-check-label" for="radioDefault1">
                                    미확인
                                </label>
                            </div>
                            <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault2" value="답변진행중" ${inquiry.status == '답변진행중' ? 'checked' : ''} ${canReply || canModify || adminAuthority == '모든권한' ? '' : 'disabled'}>
                                <label class="form-check-label" for="radioDefault2">
                                    답변진행중
                                </label>
                            </div>
                            <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault3" value="답변완료" ${inquiry.status == '답변완료' ? 'checked' : ''} ${canReply || canModify || adminAuthority == '모든권한' ? '' : 'disabled'}>
                                 <label class="form-check-label" for="radioDefault3">
                                     답변완료
                                 </label>
                             </div>
                         </div>
                     </div>
                 </div>
                <c:if test="${canReply}">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fw-bold">답변직원</div>
                        <div>
                            <c:choose>
                                <c:when test="${adminAuthority == '모든권한'}">
                                    <!-- 모든권한: 모든 관리자 선택 가능 -->
                                    <select name="adminId" class="form-select" aria-label="Default select example">
                                        <c:forEach var="admin" items="${admins}">
                                            <option value="${admin.adminNo}" ${inquiry.admin != null && inquiry.admin.adminNo == admin.adminNo ? 'selected' : (loggedInAdminId == admin.adminNo ? 'selected' : '')}>${admin.name}</option>
                                        </c:forEach>
                                    </select>
                                </c:when>
                                <c:otherwise>
                                    <!-- 답변쓰기 권한: 로그인한 관리자만 표시 (읽기 전용) -->
                                    <input type="text" class="form-control" value="${loggedInAdminName}" readonly>
                                    <input type="hidden" name="adminId" value="${loggedInAdminId}">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>
                 <c:if test="${canReply}">
                     <div class="process-content bg-body-tertiary p-3 border-top border-dark">
                     <div class="">
                         <div class="mb-3">
                             <label for="adminReply" class="form-label">답변 작성</label>
                             <textarea name="adminReply" class="form-control" id="adminReply" rows="4"><c:out value="${inquiry.adminReply != null ? inquiry.adminReply : ''}"/></textarea>
                         </div>
                         <div class="form-group">
                             <label class="form-label">첨부파일 등록</label>
                             <div id="dropArea" class="drop-area form-control d-flex flex-column align-items-center justify-content-center p-4 border rounded" style="height: 150px; cursor: pointer;">
                                 <i class="bi bi-cloud-arrow-up-fill fs-3 text-muted"></i>
                                 <p class="text-muted">파일을 여기로 드래그하거나 클릭하여 선택하세요.</p>
                                 <input class="form-control d-none" type="file" id="replyFile" name="replyFile">
                                 <div id="fileList" class="file-list mt-2"></div>
                             </div>
                         </div>
                     
                     <!-- 관리자 답변 첨부파일 표시 -->
                     <c:if test="${not empty inquiry.adminReplyFilePath}">
                         <div class="form-group mt-3">
                             <label class="form-label">답변 첨부파일</label>
                             <div class="d-flex align-items-center gap-2 p-3 bg-light border rounded">
                                 <i class="bi bi-paperclip text-primary"></i>
                                 <span class="flex-grow-1">
                                     <c:set var="adminFileName" value="${inquiry.adminReplyFilePath}"/>
                                     <c:if test="${fn:contains(adminFileName, '_')}">
                                         <c:set var="adminOriginalName" value="${fn:substring(adminFileName, fn:indexOf(adminFileName, '_') + 1, fn:length(adminFileName))}"/>
                                         <c:out value="${adminOriginalName}"/>
                                     </c:if>
                                 </span>
                                 <a href="/admin/download-admin-reply-file?filePath=${fn:escapeXml(inquiry.adminReplyFilePath)}" class="btn btn-sm btn-outline-primary">
                                     <i class="bi bi-download"></i> 다운로드
                                 </a>
                             </div>
                         </div>
                     </c:if>
                 </div>
             </div>
             </div>
                 </c:if>
         
         <div class="d-flex gap-1 justify-content-center mt-3">
             <c:if test="${canReply}">
                 <button type="submit" class="btn btn-lg btn-outline-secondary" ${canReply || adminAuthority == '모든권한' ? '' : 'disabled'}>답변하기</button>
             </c:if>
             <button type="button" class="btn btn-lg btn-secondary" onclick="location.href='/admin/inquiry-history'">목록</button>
         </div>
         </form>
         
         <!-- 사용자 댓글 목록 및 관리자 답변 섹션 -->
         <div class="card mt-4">
             <div class="card-header">
                 <h5 class="mb-0">사용자 댓글 및 관리자 답변</h5>
             </div>
             <div class="card-body">
                 <c:choose>
                     <c:when test="${not empty replies}">
                         <c:forEach var="reply" items="${replies}">
                             <div class="border rounded p-3 mb-3">
                                 <!-- 사용자 댓글 -->
                                 <div class="d-flex justify-content-between align-items-start mb-2">
                                     <div class="d-flex align-items-center gap-2">
                                         <i class="bi bi-person-circle text-primary"></i>
                                         <span class="fw-bold">사용자</span>
                                         <span class="text-muted small">
                                             <fmt:formatDate value="${reply.userCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                                         </span>
                                     </div>
                                     <c:if test="${canModify || adminAuthority == '모든권한'}">
                                         <button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteUserComment(${reply.id})" title="댓글 삭제">
                                             <i class="bi bi-trash"></i>
                                         </button>
                                     </c:if>
                                 </div>
                                 <div class="bg-light p-3 rounded mb-3" style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${reply.userContent}"/></div>
                                 
                                 <!-- 관리자 답변 -->
                                 <c:choose>
                                     <c:when test="${not empty reply.adminContent}">
                                         <div class="d-flex justify-content-between align-items-start mb-2">
                                             <div class="d-flex align-items-center gap-2">
                                                 <i class="bi bi-person-check-fill text-success"></i>
                                                 <span class="fw-bold">관리자 답글</span>
                                                 <c:if test="${not empty reply.admin}">
                                                     <span class="text-muted">(${reply.admin.name})</span>
                                                 </c:if>
                                                 <span class="text-muted small">
                                                     <fmt:formatDate value="${reply.adminCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                                                 </span>
                                             </div>
                                             <c:if test="${canModify || adminAuthority == '모든권한'}">
                                                 <div class="d-flex gap-2">
                                                     <button type="button" class="btn btn-sm btn-outline-primary" onclick="editReplyInline(${reply.id})" title="수정">
                                                         <i class="bi bi-pencil"></i>
                                                     </button>
                                                     <button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteReply(${reply.id})" title="삭제">
                                                         <i class="bi bi-trash"></i>
                                                     </button>
                                                 </div>
                                             </c:if>
                                         </div>
                                         
                                         <!-- 답글 보기 모드 -->
                                         <div id="reply-view-${reply.id}">
                                             <div class="bg-success bg-opacity-10 p-3 rounded" style="white-space: pre-wrap; word-wrap: break-word; overflow-wrap: break-word; word-break: break-word;"><c:out value="${reply.adminContent}"/></div>
                                         </div>

                                         <!-- 답글 수정 모드 -->
                                         <div id="reply-edit-${reply.id}" style="display: none;">
                                             <div class="d-flex justify-content-between align-items-start mb-2">
                                                 <div class="fw-bold text-success">관리자 답글 수정</div>
                                             </div>
                                             <textarea class="form-control mb-2" id="reply-edit-textarea-${reply.id}" rows="4" style="white-space: pre-wrap;"><c:out value="${reply.adminContent}"/></textarea>
                                             <div class="d-flex gap-2 justify-content-end">
                                                 <button type="button" class="btn btn-sm btn-success" onclick="saveReply(${reply.id})">
                                                     <i class="bi bi-check-circle"></i> 저장
                                                 </button>
                                                 <button type="button" class="btn btn-sm btn-secondary" onclick="cancelEditReply(${reply.id})">
                                                     <i class="bi bi-x-circle"></i> 취소
                                                 </button>
                                             </div>
                                         </div>
                                     </c:when>
                                     <c:otherwise>
                                         <!-- 관리자 답변 폼 -->
                                         <c:if test="${canReply}">
                                             <form method="post" action="/admin/inquiry-response-management/reply" class="mt-3">
                                                 <input type="hidden" name="replyId" value="${reply.id}">
                                                 <input type="hidden" name="inquiryId" value="${inquiry.id}">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <textarea name="adminContent" class="form-control" rows="2" 
                                                                  placeholder="관리자 답변을 입력하세요..." required></textarea>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <c:choose>
                                                            <c:when test="${adminAuthority == '모든권한'}">
                                                                <!-- 모든권한: 모든 관리자 선택 가능 -->
                                                                <select name="adminId" class="form-select" required>
                                                                    <option value="">답변 담당자 선택</option>
                                                                    <c:forEach var="admin" items="${admins}">
                                                                        <option value="${admin.adminNo}" ${loggedInAdminId == admin.adminNo ? 'selected' : ''}>${admin.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <!-- 답변쓰기 권한: 로그인한 관리자만 표시 -->
                                                                <input type="text" class="form-control" value="${loggedInAdminName}" readonly>
                                                                <input type="hidden" name="adminId" value="${loggedInAdminId}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="col-md-1 d-flex align-items-baseline">
                                                        <button type="submit" class="btn btn-success btn-sm" ${canReply || adminAuthority == '모든권한' ? '' : 'disabled'}>답변</button>
                                                    </div>
                                                </div>
                                             </form>
                                         </c:if>
                                     </c:otherwise>
                                 </c:choose>
                             </div>
                         </c:forEach>
                     </c:when>
                     <c:otherwise>
                         <div class="text-center text-muted py-4">
                             <i class="bi bi-chat-dots fs-1"></i>
                             <p class="mt-2">등록된 댓글이 없습니다.</p>
                         </div>
                     </c:otherwise>
                 </c:choose>
             </div>
         </div>
     </div>
     </c:if>

 </div>

<script>
// DOM이 로드된 후 실행
window.onload = function() {
    console.log('페이지 로드 완료 - inquiry-response-management.jsp');
    
    // 드래그 앤 드롭 기능
    var dropArea = document.getElementById('dropArea');
    var fileInput = document.getElementById('replyFile');
    var fileList = document.getElementById('fileList');

    // 드롭 영역 클릭 시 파일 입력 열기
    if (dropArea) {
        dropArea.addEventListener('click', function() {
            fileInput.click();
        });
    }

    // 파일 입력 변경 시 파일 목록 업데이트
    if (fileInput) {
        fileInput.addEventListener('change', function() {
            handleFiles(this.files);
        });
    }

    // 드래그 앤 드롭 이벤트
    if (dropArea) {
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
            document.body.addEventListener(eventName, preventDefaults, false);
        });

        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });

        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });

        dropArea.addEventListener('drop', handleDrop, false);
    }

    function preventDefaults (e) {
        e.preventDefault();
        e.stopPropagation();
    }

    function highlight(e) {
        dropArea.classList.add('dragover');
    }

    function unhighlight(e) {
        dropArea.classList.remove('dragover');
    }

    function handleDrop(e) {
        var dt = e.dataTransfer;
        var files = dt.files;
        
        fileInput.files = files;
        handleFiles(files);
    }

    function handleFiles(files) {
        if (fileList) {
            fileList.innerHTML = '';
            if (files.length > 0) {
                for (var i = 0; i < files.length; i++) {
                    var fileItem = document.createElement('div');
                    fileItem.textContent = files[i].name;
                    fileList.appendChild(fileItem);
                }
            } else {
                fileList.textContent = '선택된 파일 없음';
            }
        }
    }
};

// 답변 유효성 검사 함수
function validateReply() {
    const adminReply = document.getElementById('adminReply');
    
    if (!adminReply || !adminReply.value || adminReply.value.trim() === '') {
        alert('답변 내용을 입력해주세요.');
        if (adminReply) {
            adminReply.focus();
        }
        return false;
    }
    
    return true;
}

// JSP에서 전달받은 값들
const INQUIRY_ID = '<c:out value="${inquiry.id}"/>';

// 답글 인라인 수정 - 답글 자체를 직접 수정 영역으로 변경
function editReplyInline(replyId) {
    console.log('=== 답글 수정 시작 ===');
    console.log('replyId:', replyId);

    // 기존 답글 내용 가져오기 - 올바른 셀렉터 사용
    const replyContentElement = document.querySelector('#reply-view-' + replyId + ' .bg-success.bg-opacity-10');
    if (!replyContentElement) {
        alert('답글 내용을 찾을 수 없습니다.');
        return;
    }

    const currentContent = replyContentElement.textContent || replyContentElement.innerText;
    console.log('현재 답글 내용:', currentContent);

    // 보기 모드 숨기고 수정 모드 표시
    const viewMode = document.getElementById('reply-view-' + replyId);
    const editMode = document.getElementById('reply-edit-' + replyId);

    if (viewMode && editMode) {
        viewMode.style.display = 'none';
        editMode.style.display = 'block';

        // 텍스트 영역에 포커스
        const textarea = document.getElementById('reply-edit-textarea-' + replyId);
        if (textarea) {
            textarea.scrollIntoView({ behavior: 'smooth', block: 'center' });
            setTimeout(() => {
                textarea.focus();
                // 커서를 끝으로 이동
                textarea.setSelectionRange(textarea.value.length, textarea.value.length);
            }, 300);
        }
    }

    console.log('답글 수정 모드 활성화 완료');
}

// 답글 수정 저장
function saveReply(replyId) {
    console.log('=== 답글 저장 시작 ===');
    console.log('replyId:', replyId);

    const textarea = document.getElementById('reply-edit-textarea-' + replyId);
    if (!textarea) {
        alert('수정 내용을 찾을 수 없습니다.');
        return;
    }

    const newContent = textarea.value.trim();
    if (!newContent) {
        alert('답글 내용을 입력해주세요.');
        return;
    }

    if (!confirm('답글을 수정하시겠습니까?')) {
        return;
    }

    console.log('답글 수정 요청:', { replyId, newContent, inquiryId: INQUIRY_ID });

    // 서버로 수정 요청 전송
    fetch('/admin/inquiry-response-management/update-reply', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            replyId: replyId,
            adminContent: newContent,
            inquiryId: INQUIRY_ID
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('답글이 수정되었습니다.');
            location.reload();
        } else {
            alert('답글 수정 중 오류가 발생했습니다: ' + data.message);
        }
    })
    .catch(error => {
        console.error('답글 수정 오류:', error);
        alert('답글 수정 중 오류가 발생했습니다.');
    });
}

// 답글 수정 취소
function cancelEditReply(replyId) {
    console.log('=== 답글 수정 취소 ===');
    console.log('replyId:', replyId);

    // 보기 모드 표시하고 수정 모드 숨기기
    const viewMode = document.getElementById('reply-view-' + replyId);
    const editMode = document.getElementById('reply-edit-' + replyId);

    if (viewMode && editMode) {
        viewMode.style.display = 'block';
        editMode.style.display = 'none';

        // 원래 내용으로 복구 (textarea 값을 원래 값으로)
        const textarea = document.getElementById('reply-edit-textarea-' + replyId);
        const originalContent = document.querySelector('#reply-view-' + replyId + ' .bg-success.bg-opacity-10');
        if (textarea && originalContent) {
            textarea.value = originalContent.textContent || originalContent.innerText;
        }
    }

    console.log('답글 수정 모드 취소 완료');
}

// 답글 삭제
function deleteReply(replyId) {
    if (!confirm('정말로 이 답글을 삭제하시겠습니까?\n\n삭제된 답글은 복구할 수 없습니다.')) {
        return;
    }

    // 서버로 삭제 요청 전송
    fetch('/admin/inquiry-response-management/delete-reply', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            replyId: replyId,
            inquiryId: INQUIRY_ID
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('답글이 삭제되었습니다.');
            location.reload();
        } else {
            alert('답글 삭제 중 오류가 발생했습니다: ' + data.message);
        }
    })
    .catch(error => {
        console.error('답글 삭제 오류:', error);
        alert('답글 삭제 중 오류가 발생했습니다.');
    });
}

// 사용자 댓글 삭제
function deleteUserComment(replyId) {
    if (!confirm('정말로 이 댓글을 삭제하시겠습니까?\n\n이 댓글에 달린 모든 관리자 답글도 함께 삭제됩니다.\n삭제된 내용은 복구할 수 없습니다.')) {
        return;
    }

    console.log('사용자 댓글 삭제 요청:', { replyId, inquiryId: INQUIRY_ID });

    // 서버로 삭제 요청 전송
    fetch('/admin/inquiry-response-management/delete-user-comment', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            replyId: replyId,
            inquiryId: INQUIRY_ID
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('댓글과 연결된 모든 관리자 답글이 삭제되었습니다.');
            location.reload();
        } else {
            alert('댓글 삭제 중 오류가 발생했습니다: ' + data.message);
        }
    })
    .catch(error => {
        console.error('댓글 삭제 오류:', error);
        alert('댓글 삭제 중 오류가 발생했습니다.');
    });
}
</script>

 <jsp:include page="footer.jsp" />

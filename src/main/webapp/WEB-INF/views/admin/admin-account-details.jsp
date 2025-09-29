<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 관리자 상세 정보 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">관리자 상세 정보</div>
         <div class="breadcrumb">관리자페이지 > 관리자 > 관리자 상세 정보</div>
     </div>

    <!-- 성공/에러 메시지 -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <form action="/admin/admin-account-details/update" method="post">
             <input type="hidden" name="adminNo" value="${admin.adminNo}">
             
             <div class="card d-flex flex-row mb-1 mb-lg-0">
                 <div class="flex-column flex-lg-row d-flex gap-0 gap-lg-5 p-2">
                     <div><i class="bi bi-person-circle" style="color: #0C769E;font-size: 4em;"></i></div>
                     <div class="d-flex gap-3">
                         <div class="d-flex flex-column fw-bold gap-2" style="min-width: 60px;">
                             <div class="d-flex align-items-center" style="height: 38px;">
                                 <span>이름</span>
                             </div>
                             <div class="d-flex align-items-center" style="height: 38px;">
                                 <span>아이디</span>
                             </div>
                             <div class="d-flex align-items-center" style="height: 38px;">
                                 <span>비밀번호</span>
                             </div>
                             <div class="d-flex align-items-center" style="height: 38px;">
                                 <span>연락처</span>
                             </div>
                             <div class="d-flex align-items-center" style="height: 38px;">
                                 <span>이메일</span>
                             </div>
                         </div>
                         <div class="d-flex flex-column gap-2">
                             <div class="d-flex">
                                 <input type="text" class="form-control" name="name" value="${admin.name}" readonly style="background-color: #f8f9fa;" />
                             </div>
                             <div class="d-flex">
                                 <input type="text" class="form-control" name="adminId" value="${admin.adminId}" readonly style="background-color: #f8f9fa;" />
                             </div>
                             <div class="d-flex">
                                 <input type="password" class="form-control" name="password" value="${admin.password}" required />
                             </div>
                             <div class="d-flex">
                                 <input type="text" class="form-control" name="phone" value="${admin.phone}" placeholder="연락처를 입력하세요" />
                             </div>
                             <div class="d-flex">
                                 <input type="email" class="form-control" name="email" value="${admin.email}" placeholder="이메일을 입력하세요" />
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="card mb-3 mb-lg-0">
                 <div class="">

                     <div class="d-flex flex-column flex-lg-row gap-3 p-2">
                         <div class="w-auto flex-fill" style="max-width: 400px;">
                             <div class="fs-5 fw-bold pb-3">조직정보</div>
                             <div class="d-flex flex-column gap-2 text-body-tertiary bg-body-tertiary p-2">
                                 <div class="d-flex gap-1 align-items-center">
                                     <span class="fw-bold" style="min-width: 70px;">[ 부서명 ]</span>
                                     <input type="text" class="form-control" name="department" value="${admin.department}" style="max-width: 200px;" />
                                 </div>
                                 <div class="d-flex gap-1 align-items-center">
                                     <span class="fw-bold" style="min-width: 70px;">[ 지위 ]</span>
                                     <input type="text" class="form-control" name="position" value="${admin.position}" style="max-width: 200px;" />
                                 </div>
                                 <div class="d-flex gap-1 align-items-center">
                                     <span class="fw-bold" style="min-width: 70px;">[ 직책 ]</span>
                                     <input type="text" class="form-control" name="rank" value="${admin.rank}" style="max-width: 200px;" />
                                 </div>
                             </div>
                         </div>
                         <div class="w-auto flex-fill">
                             <div class="fs-5 fw-bold pb-3">권한부여</div>
                             <div class="d-flex flex-column gap-2 text-body-tertiary bg-body-tertiary p-2">
                                 <div class="d-flex align-items-center gap-1">
                                     <div class="d-flex"><input class="form-check-input" type="radio" name="authority" value="모든권한" id="authorityAll" <c:if test="${admin.authority eq '모든권한'}">checked</c:if>></div>
                                     <label for="authorityAll">모든권한</label>
                                 </div>
                                 <div class="d-flex align-items-center gap-1">
                                     <div class="d-flex"><input class="form-check-input" type="radio" name="authority" value="수정" id="authorityEdit" <c:if test="${admin.authority eq '수정'}">checked</c:if>></div>
                                     <label for="authorityEdit">수정</label>
                                 </div>
                                 <div class="d-flex align-items-center gap-1">
                                     <div class="d-flex"><input class="form-check-input" type="radio" name="authority" value="답변쓰기" id="authorityReply" <c:if test="${admin.authority eq '답변쓰기'}">checked</c:if>></div>
                                     <label for="authorityReply">답변쓰기</label>
                                 </div>
                                 <div class="d-flex align-items-center gap-1">
                                     <div class="d-flex"><input class="form-check-input" type="radio" name="authority" value="읽기" id="authorityRead" <c:if test="${admin.authority eq '읽기'}">checked</c:if>></div>
                                     <label for="authorityRead">읽기</label>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="d-flex gap-1 justify-content-center mt-3">
                         <button type="submit" class="btn btn-lg btn-outline-primary">저장</button>
                         <button type="button" class="btn btn-lg btn-secondary" onclick="history.back()">취소</button>
                     </div>
                 </div>
             </div>
         </form>
     </div>
 </div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 메시지 자동 사라짐 (Bootstrap Alert)
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            new bootstrap.Alert(alert);
            setTimeout(() => {
                const bsAlert = bootstrap.Alert.getInstance(alert);
                if (bsAlert) {
                    bsAlert.close();
                }
            }, 3000); // 3초 후 자동 닫기
        });
    });
</script>

<jsp:include page="footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 상담신청 내역조회 페이지 -->
 <div id="consultationListPage" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">상담신청 내역조회</div>
         <div class="breadcrumb">관리자페이지 > 상담관리 > 상담신청 내역조회</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
        <div class="card d-flex align-items-center flex-lg-row flex-column justify-content-end gap-2">
            <form method="get" action="/admin/consultation-request" class="d-flex gap-2">
                <div class="position-relative">
                    <input class="form-control" type="text" name="searchValue" placeholder="상담내용 검색" 
                           value="${searchValue}" aria-label="검색">
                    <div class="end-0 position-absolute top-50 translate-middle"><i class="bi bi-search"></i></div>
                </div>
                <button type="submit" class="btn btn-primary"><span class="fw-bold">검색</span></button>
            </form>
            <!-- 삭제 버튼 (일시 비활성화) -->
            <%-- <button type="button" class="btn btn-secondary" onclick="deleteSelectedConsultations()">
                <span class="fw-bold">삭제</span>
            </button> --%>
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
         <div class="card">
             <div class="fw-bold">총 ${totalElements}건</div>
             <div class="">
                 <table class="table table-striped table-hover table-bordered  cursor-pointer">
                     <colgroup>
                         <col width="5%">
                         <col width="15%">
                         <col width="10%">
                         <col width="15%">
                         <col width="35%">
                         <col width="20%">
                     </colgroup>
                     <thead>
                         <tr>
                             <th>NO</th>
                             <th>병원명</th>
                             <th>이름</th>
                             <th>전화번호</th>
                             <th>상담내용</th>
                             <th>상담날짜</th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <c:choose>
                             <c:when test="${not empty consultations}">
                                 <c:forEach var="consultation" items="${consultations}" varStatus="status">
                                     <tr>
                                         <td>${totalElements - (currentPage * size) - status.index}</td>
                                         <td>${consultation.hospitalName}</td>
                                         <td>${consultation.name}</td>
                                         <td>${consultation.phone}</td>
                                         <td class="text-start">
                                             <c:choose>
                                                 <c:when test="${fn:length(consultation.consultationContent) > 50}">
                                                     ${fn:substring(consultation.consultationContent, 0, 50)}...
                                                 </c:when>
                                                 <c:otherwise>
                                                     ${consultation.consultationContent}
                                                 </c:otherwise>
                                             </c:choose>
                                         </td>
                                         <td>
                                             ${consultation.consultationDate}<br>
                                             ${consultation.consultationTime}
                                         </td>
                                     </tr>
                                 </c:forEach>
                             </c:when>
                             <c:otherwise>
                                 <tr>
                                     <td colspan="6" class="text-center">등록된 상담신청이 없습니다.</td>
                                 </tr>
                             </c:otherwise>
                         </c:choose>
                     </tbody>
                 </table>
             </div>
             
             <!-- 페이징 처리 -->
             <c:if test="${totalPages > 0}">
                 <nav aria-label="Page navigation">
                     <ul class="pagination justify-content-center">
                        <!-- 이전 페이지 -->
                        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}&size=${size}<c:if test='${not empty searchValue}'>&searchValue=${searchValue}</c:if>">이전</a>
                        </li>
                         
                         <!-- 페이지 번호들 -->
                         <c:forEach begin="${currentPage - 2 < 0 ? 0 : currentPage - 2}" 
                                    end="${currentPage + 2 >= totalPages ? totalPages - 1 : currentPage + 2}" 
                                    var="i">
                             <li class="page-item ${i == currentPage ? 'active' : ''}">
                                 <a class="page-link" href="?page=${i}&size=${size}<c:if test='${not empty searchValue}'>&searchValue=${searchValue}</c:if>">${i + 1}</a>
                             </li>
                         </c:forEach>
                         
                         <!-- 다음 페이지 -->
                         <li class="page-item ${currentPage + 1 >= totalPages ? 'disabled' : ''}">
                             <a class="page-link" href="?page=${currentPage + 1}&size=${size}<c:if test='${not empty searchValue}'>&searchValue=${searchValue}</c:if>">다음</a>
                         </li>
                     </ul>
                 </nav>
             </c:if>
         </div>
     </div>
 </div>

<script>
// 삭제 기능 (추후 구현)
// function deleteSelectedConsultations() {
//     alert('삭제 기능은 아직 구현되지 않았습니다.');
// }
</script>

<jsp:include page="footer.jsp" />

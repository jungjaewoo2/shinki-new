<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">문의내역조회</div>
         <div class="breadcrumb">관리자페이지 > 1:1문의관리 > 문의내역조회</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <div class="card d-flex align-items-center flex-lg-row flex-column justify-content-end gap-2">
             <form method="get" action="/admin/inquiry-history" class="d-flex gap-2">
                 <div class="position-relative">
                     <input class="form-control" type="text" name="search" placeholder="문의내용 검색" 
                            value="${search}" aria-label="검색">
                     <div class="end-0 position-absolute top-50 translate-middle"><i class="bi bi-search"></i></div>
                 </div>
                 <button type="submit" class="btn btn-primary"><span class="fw-bold">검색</span></button>
             </form>
             <button type="button" class="btn btn-secondary"><span class="fw-bold">삭제</span></button>
         </div>
         <div class="card">
             <div class="fw-bold">총 ${totalElements}건</div>
             <div class="">
                 <table class="table table-striped table-hover table-bordered  cursor-pointer">
                     <colgroup>
                         <col width="5%">
                         <col width="5%">
                         <col width="10%">
                         <col width="10%">
                         <col width="10%">
                         <col width="40%">
                         <col width="10%">
                         <col width="10%">
                     </colgroup>
                     <thead>
                         <tr>
                             <th>
                                 <div class="form-check d-flex align-items-center justify-content-center">
                                     <input class="form-check-input" type="checkbox" value="" id="checkChecked">
                                 </div>
                             </th>
                             <th>NO</th>
                             <th class="sortable" data-column="inquiryType">문의항목<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th>소속</th>
                             <th>이름</th>
                             <th>문의내용</th>
                             <th class="sortable" data-column="createdAt">작성일<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th class="sortable" data-column="status">문의상태<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <c:forEach var="inquiry" items="${inquiries}" varStatus="status">
                         <tr style="cursor: pointer;" onclick="location.href='/admin/inquiry-response-management?id=${inquiry.id}'">
                             <td>
                                 <div class="form-check d-flex justify-content-center">
                                     <input class="form-check-input" type="checkbox" value="${inquiry.id}" name="inquiryIds">
                                 </div>
                             </td>
                             <td><c:out value="${fn:length(inquiries) - status.index}"/></td>
                             <td><c:out value="${inquiry.inquiryType}"/></td>
                             <td><c:out value="${inquiry.member != null ? inquiry.member.hospitalName : '-'}"/></td>
                             <td><c:out value="${inquiry.member != null ? inquiry.member.name : '-'}"/></td>
                             <td class="text-start">
                                 <c:choose>
                                     <c:when test="${fn:length(inquiry.content) > 30}">
                                         <c:out value="${fn:substring(inquiry.content, 0, 30)}..."/>
                                     </c:when>
                                     <c:otherwise>
                                         <c:out value="${inquiry.content}"/>
                                     </c:otherwise>
                                 </c:choose>
                             </td>
                             <td>
                                 <c:if test="${not empty inquiry.createdAt}">
                                     <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd"/>
                                 </c:if>
                             </td>
                             <td>
                                 <span class="badge ${inquiry.status eq '진행중' ? 'bg-warning' : inquiry.status eq '완료' ? 'bg-success' : 'bg-secondary'}">
                                     <c:out value="${inquiry.status}"/>
                                 </span>
                             </td>
                         </tr>
                         </c:forEach>
                     </tbody>
                 </table>
             </div>
             
             <c:if test="${empty inquiries}">
                 <div class="alert alert-info text-center mt-3" role="alert">
                     등록된 문의 내역이 없습니다.
                 </div>
             </c:if>
             
             <!-- 페이징 처리 -->
             <c:if test="${totalPages > 0}">
                 <nav aria-label="Page navigation" class="mt-3">
                     <ul class="pagination justify-content-center">
                         <c:choose>
                             <c:when test="${currentPage > 0}">
                                 <li class="page-item">
                                     <a class="page-link" href="?page=${currentPage - 1}&size=${size}&search=${search}">이전</a>
                                 </li>
                             </c:when>
                             <c:otherwise>
                                 <li class="page-item disabled">
                                     <span class="page-link">이전</span>
                                 </li>
                             </c:otherwise>
                         </c:choose>
                         
                         <c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
                             <c:choose>
                                 <c:when test="${pageNum == currentPage}">
                                     <li class="page-item active">
                                         <span class="page-link">${pageNum + 1}</span>
                                     </li>
                                 </c:when>
                                 <c:otherwise>
                                     <li class="page-item">
                                         <a class="page-link" href="?page=${pageNum}&size=${size}&search=${search}">${pageNum + 1}</a>
                                     </li>
                                 </c:otherwise>
                             </c:choose>
                         </c:forEach>
                         
                         <c:choose>
                             <c:when test="${currentPage < totalPages - 1}">
                                 <li class="page-item">
                                     <a class="page-link" href="?page=${currentPage + 1}&size=${size}&search=${search}">다음</a>
                                 </li>
                             </c:when>
                             <c:otherwise>
                                 <li class="page-item disabled">
                                     <span class="page-link">다음</span>
                                 </li>
                             </c:otherwise>
                         </c:choose>
                     </ul>
                 </nav>
             </c:if>
         </div>
     </div>
 </div>

<style>
.sortable {
    cursor: pointer;
    user-select: none;
    position: relative;
}

.sortable:hover {
    background-color: #f8f9fa;
}

.sort-icon {
    margin-left: 5px;
    transition: transform 0.2s ease;
}

.sortable.asc .sort-icon i {
    transform: rotate(180deg);
}

.sortable.desc .sort-icon i {
    transform: rotate(0deg);
}

.sortable.asc .sort-icon i::before {
    content: "\f143"; /* bi-caret-up-fill */
}

.sortable.desc .sort-icon i::before {
    content: "\f140"; /* bi-caret-down-fill */
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 전체 선택 체크박스 기능
    const selectAllCheckbox = document.getElementById('checkChecked');
    const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"][name="inquiryIds"]');
    
    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function() {
            rowCheckboxes.forEach(checkbox => {
                checkbox.checked = selectAllCheckbox.checked;
            });
        });
    }
    
    rowCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"][name="inquiryIds"]:checked');
            if (selectAllCheckbox) {
                selectAllCheckbox.checked = checkedBoxes.length === rowCheckboxes.length;
                selectAllCheckbox.indeterminate = checkedBoxes.length > 0 && checkedBoxes.length < rowCheckboxes.length;
            }
        });
    });

    // 테이블 정렬 기능
    initTableSort();
});

function initTableSort() {
    const table = document.querySelector('table');
    const tbody = table.querySelector('tbody');
    const sortableHeaders = table.querySelectorAll('.sortable');
    
    sortableHeaders.forEach(header => {
        header.addEventListener('click', function(e) {
            e.stopPropagation(); // 행 클릭 이벤트와 충돌 방지
            
            const column = this.dataset.column;
            const currentOrder = this.classList.contains('asc') ? 'desc' : 'asc';
            
            // 모든 헤더에서 정렬 클래스 제거
            sortableHeaders.forEach(h => {
                h.classList.remove('asc', 'desc');
            });
            
            // 현재 헤더에 정렬 클래스 추가
            this.classList.add(currentOrder);
            
            // 테이블 정렬 실행
            sortTable(tbody, column, currentOrder);
        });
    });
}

function sortTable(tbody, column, order) {
    const rows = Array.from(tbody.querySelectorAll('tr'));
    
    if (rows.length === 0) return;
    
    const sortedRows = rows.sort((a, b) => {
        let aValue = getCellValue(a, column);
        let bValue = getCellValue(b, column);
        
        // 날짜 처리 (작성일)
        if (column === 'createdAt') {
            aValue = new Date(aValue);
            bValue = new Date(bValue);
        }
        // 문자열 처리 (문의항목, 문의상태)
        else {
            aValue = aValue.toLowerCase();
            bValue = bValue.toLowerCase();
        }
        
        if (aValue < bValue) return order === 'asc' ? -1 : 1;
        if (aValue > bValue) return order === 'asc' ? 1 : -1;
        return 0;
    });
    
    // 정렬된 행들을 다시 추가
    sortedRows.forEach(row => tbody.appendChild(row));
}

function getCellValue(row, column) {
    const columnMap = {
        'inquiryType': 2,   // 문의항목 (3번째 컬럼, 체크박스+NO 제외하면 2)
        'createdAt': 5,     // 작성일 (6번째 컬럼, 체크박스+NO 제외하면 5)
        'status': 6         // 문의상태 (7번째 컬럼, 체크박스+NO 제외하면 6)
    };
    
    const cellIndex = columnMap[column];
    if (cellIndex === undefined) return '';
    
    const cell = row.children[cellIndex + 1]; // +1 because first column is checkbox
    return cell ? cell.textContent.trim() : '';
}
</script>

<jsp:include page="footer.jsp" />

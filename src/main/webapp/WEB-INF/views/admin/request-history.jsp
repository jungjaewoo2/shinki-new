<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">의뢰내역조회</div>
         <div class="breadcrumb">관리자페이지 > 의뢰관리 > 의뢰내역조회</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
        <div class="card d-flex align-items-center flex-lg-row flex-column justify-content-end gap-2">
            <form method="get" action="/admin/request-history" class="d-flex gap-2">
                <div class="position-relative">
                    <input class="form-control" type="text" name="search" placeholder="의뢰항목, 병원명, 이름, 제목, 의뢰내용으로 검색" aria-label="default input example" value="${search}">
                    <div class="end-0 position-absolute top-50 translate-middle"><i class="bi bi-search"></i></div>
                </div>
                <button type="submit" class="btn btn-primary"><span class="fw-bold">검색</span></button>
            </form>
            <button type="button" class="btn btn-secondary" onclick="deleteSelectedRequests()"><span class="fw-bold">삭제</span></button>
        </div>
         <div class="card">
             <div class="fw-bold">총 ${totalElements}건</div>
             <div class="">
                 <table class="table table-striped table-hover table-bordered cursor-pointer">
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
                                     <input class="form-check-input" type="checkbox" value="" id="selectAllRequests">
                                 </div>
                             </th>
                             <th>NO</th>
                             <th class="sortable" data-column="applicationType">의뢰항목<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th>병원명</th>
                             <th>이름</th>
                             <th>제목</th>
                             <th class="sortable" data-column="createdAt">주문일<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th class="sortable" data-column="status">의뢰상태<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <c:forEach var="request" items="${requests}" varStatus="status">
                             <tr onclick="location.href='/admin/view-request-details?id=${request.id}'">
                                 <td>
                                     <div class="form-check d-flex justify-content-center">
                                         <input class="form-check-input" type="checkbox" value="${request.id}" name="selectedRequests">
                                     </div>
                                 </td>
                                 <td>${totalElements - (currentPage * size) - status.index}</td>
                                 <td>${request.applicationType}</td>
                                 <td>${request.member != null ? request.member.hospitalName : '-'}</td>
                                 <td>${request.member != null ? request.member.name : '-'}</td>
                                 <td>${request.title}</td>
                                 <td>${request.createdAt.toLocalDate()}</td>
                                 <td>
                                     <c:choose>
                                         <c:when test="${request.status == '의뢰 확인중'}">의뢰 확인중</c:when>
                                         <c:when test="${request.status == '견적중'}">견적중</c:when>
                                         <c:when test="${request.status == '결제 진행'}">결제 진행</c:when>
                                         <c:when test="${request.status == '작업중'}">작업중</c:when>
                                         <c:when test="${request.status == '작업 완료'}">작업 완료</c:when>
                                         <c:when test="${request.status == '취소 요청'}">취소 요청</c:when>
                                         <c:when test="${request.status == '취소 진행중'}">취소 진행중</c:when>
                                         <c:when test="${request.status == '취소 완료'}">취소 완료</c:when>
                                         <c:otherwise>${request.status}</c:otherwise>
                                     </c:choose>
                                 </td>
                             </tr>
                         </c:forEach>
                         <c:if test="${empty requests}">
                             <tr>
                                 <td colspan="8" class="text-center">등록된 의뢰가 없습니다.</td>
                             </tr>
                         </c:if>
                     </tbody>
                 </table>
             </div>
         </div>
         
         <!-- 페이징 -->
         <nav aria-label="Page navigation" class="mt-3">
             <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="/admin/request-history?page=${currentPage - 1}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">이전</a>
                    </li>
                </c:if>
                 <c:if test="${totalPages > 0}">
                     <c:forEach begin="0" end="${totalPages - 1}" var="i">
                         <c:choose>
                             <c:when test="${i == currentPage}">
                                 <li class="page-item active">
                                     <span class="page-link">${i + 1}</span>
                                 </li>
                             </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="/admin/request-history?page=${i}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">${i + 1}</a>
                                </li>
                            </c:otherwise>
                         </c:choose>
                     </c:forEach>
                 </c:if>
                <c:if test="${currentPage < totalPages - 1}">
                    <li class="page-item">
                        <a class="page-link" href="/admin/request-history?page=${currentPage + 1}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">다음</a>
                    </li>
                </c:if>
             </ul>
         </nav>
         
         <!-- 폼과 버튼들 -->
         <form id="deleteForm" action="/admin/request-history/delete" method="post" style="display: none;">
             <input type="hidden" name="selectedRequests" id="selectedRequestsInput">
         </form>
         
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
    const selectAllCheckbox = document.getElementById('selectAllRequests');
    const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"][name="selectedRequests"]');
    
    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function() {
            rowCheckboxes.forEach(checkbox => {
                checkbox.checked = selectAllCheckbox.checked;
            });
        });
    }
    
    rowCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"][name="selectedRequests"]:checked');
            if (selectAllCheckbox) {
                selectAllCheckbox.checked = checkedBoxes.length === rowCheckboxes.length;
                selectAllCheckbox.indeterminate = checkedBoxes.length > 0 && checkedBoxes.length < rowCheckboxes.length;
            }
        });
    });
    
    // 메시지 자동 사라짐 (필요시 추가)
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        new bootstrap.Alert(alert);
        setTimeout(() => {
            const bsAlert = bootstrap.Alert.getInstance(alert);
            if (bsAlert) {
                bsAlert.close();
            }
        }, 3000);
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
    
    // 빈 행 제외 (등록된 의뢰가 없습니다 메시지)
    const dataRows = rows.filter(row => !row.querySelector('td[colspan]'));
    
    if (dataRows.length === 0) return;
    
    const sortedRows = dataRows.sort((a, b) => {
        let aValue = getCellValue(a, column);
        let bValue = getCellValue(b, column);
        
        // 날짜 처리 (주문일)
        if (column === 'createdAt') {
            aValue = new Date(aValue);
            bValue = new Date(bValue);
        }
        // 문자열 처리 (의뢰항목, 의뢰상태)
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
    
    // 빈 행이 있다면 마지막에 추가
    const emptyRows = rows.filter(row => row.querySelector('td[colspan]'));
    emptyRows.forEach(row => tbody.appendChild(row));
}

function getCellValue(row, column) {
    const columnMap = {
        'applicationType': 2,  // 의뢰항목 (3번째 컬럼, 체크박스+NO 제외하면 2)
        'createdAt': 5,        // 주문일 (6번째 컬럼, 체크박스+NO 제외하면 5)
        'status': 6            // 의뢰상태 (7번째 컬럼, 체크박스+NO 제외하면 6)
    };
    
    const cellIndex = columnMap[column];
    if (cellIndex === undefined) return '';
    
    const cell = row.children[cellIndex + 1]; // +1 because first column is checkbox
    return cell ? cell.textContent.trim() : '';
}

function deleteSelectedRequests() {
    const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"][name="selectedRequests"]:checked');
    if (checkedBoxes.length === 0) {
        alert('삭제할 의뢰를 선택해주세요.');
        return;
    }
    if (confirm('선택된 의뢰를 완전히 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')) {
        const selectedValues = Array.from(checkedBoxes).map(checkbox => checkbox.value);
        document.getElementById('selectedRequestsInput').value = selectedValues.join(',');
        document.getElementById('deleteForm').submit();
    }
}
 </script>

 <jsp:include page="footer.jsp" />

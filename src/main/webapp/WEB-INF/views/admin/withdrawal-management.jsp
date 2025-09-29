<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">탈퇴회원 관리</div>
         <div class="breadcrumb">관리자페이지 > 회원관리 > 탈퇴회원 관리</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
        <div class="card d-flex align-items-center flex-lg-row flex-column justify-content-end gap-2">
            <form method="get" action="/admin/withdrawal-management" class="d-flex gap-2">
                <div class="position-relative">
                    <input class="form-control" type="text" name="search" placeholder="회원 검색" aria-label="default input example" value="${search}">
                    <div class="end-0 position-absolute top-50 translate-middle"><i class="bi bi-search"></i></div>
                </div>
                <button type="submit" class="btn btn-primary"><span class="fw-bold">검색</span></button>
            </form>
            <button type="button" class="btn btn-outline-secondary download" onclick="downloadExcel()"><i class="bi bi-download text-warning"></i> <span class="fw-bold">탈퇴회원목록 엑셀 다운로드</span></button>
        </div>
         <div class="card">
             <div class="fw-bold">총 ${totalElements}명</div>
             <div class="">
                 <table class="table table-striped table-bordered">
                    <colgroup>
                        <col width="4%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="6%">
                    </colgroup>
                     <thead>
                         <tr>
                            <th>
                                <div class="form-check d-flex align-items-center justify-content-center">
                                    <input class="form-check-input" type="checkbox" value="" id="selectAll">
                                </div>
                            </th>
                            <th>병원</th>
                             <th>이름</th>
                             <th>아이디</th>
                             <th class="sortable" data-column="createdAt">가입일<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th>이메일</th>
                             <th>연락처</th>
                             <th class="sortable" data-column="requestCount">의뢰건수<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th class="sortable" data-column="totalPaymentAmount">총 주문금액<span class="sort-icon"><i class="bi bi-caret-down-fill"></i></span></th>
                             <th>방문수</th>
                             <th>관리</th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <c:forEach var="member" items="${members}" varStatus="status">
                             <tr>
                                <td>
                                    <div class="form-check d-flex justify-content-center">
                                        <input class="form-check-input" type="checkbox" value="${member.id}" name="selectedMembers">
                                    </div>
                                </td>
                                <td>${member.hospitalName}</td>
                                 <td>${member.name}</td>
                                 <td>${member.username}</td>
                                 <td>${member.createdAt.year}-${member.createdAt.monthValue < 10 ? '0' : ''}${member.createdAt.monthValue}-${member.createdAt.dayOfMonth < 10 ? '0' : ''}${member.createdAt.dayOfMonth}</td>
                                 <td>${member.email}</td>
                                 <td>${member.phone}</td>
                                 <td>-</td>
                                 <td>-</td>
                                 <td>-</td>
                                 <td onclick="location.href='view-member-info?memberId=${member.id}'"><i class="bi bi-gear-fill text-info cursor-pointer"></i></td>
                             </tr>
                         </c:forEach>
                         <c:if test="${empty members}">
                             <tr>
                                 <td colspan="11" class="text-center">탈퇴된 회원이 없습니다.</td>
                             </tr>
                         </c:if>
                     </tbody>
                 </table>
             </div>
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
         
         <!-- 페이징 -->
         <nav aria-label="Page navigation" class="mt-3">
             <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="/admin/withdrawal-management?page=${currentPage - 1}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">이전</a>
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
                                    <a class="page-link" href="/admin/withdrawal-management?page=${i}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">${i + 1}</a>
                                </li>
                            </c:otherwise>
                         </c:choose>
                     </c:forEach>
                 </c:if>
                <c:if test="${currentPage < totalPages - 1}">
                    <li class="page-item">
                        <a class="page-link" href="/admin/withdrawal-management?page=${currentPage + 1}&size=${size}<c:if test='${not empty search}'>&search=${search}</c:if>">다음</a>
                    </li>
                </c:if>
             </ul>
         </nav>
         
         <!-- 폼과 버튼들 -->
         <form id="restoreForm" action="/admin/withdrawal-management/restore" method="post" style="display: none;">
             <input type="hidden" name="selectedMembers" id="selectedMembersRestoreInput">
         </form>
         
         <form id="deleteForm" action="/admin/withdrawal-management/delete" method="post" style="display: none;">
             <input type="hidden" name="selectedMembers" id="selectedMembersDeleteInput">
         </form>
         
         <div class="d-flex gap-1 justify-content-center">
             <button class="btn btn-lg btn-outline-secondary" onclick="restoreSelectedMembers()">선택 복구</button>
             <button class="btn btn-lg btn-secondary" onclick="deleteSelectedMembers()">선택 삭제</button>
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
    const selectAllCheckbox = document.getElementById('selectAll');
    const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');
    
    selectAllCheckbox.addEventListener('change', function() {
        rowCheckboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    });
    
    rowCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');
            selectAllCheckbox.checked = checkedBoxes.length === rowCheckboxes.length;
            selectAllCheckbox.indeterminate = checkedBoxes.length > 0 && checkedBoxes.length < rowCheckboxes.length;
        });
    });
    
    // 메시지 자동 사라짐
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
        header.addEventListener('click', function() {
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
    
    // 빈 행 제외 (탈퇴된 회원이 없습니다 메시지)
    const dataRows = rows.filter(row => !row.querySelector('td[colspan]'));
    
    if (dataRows.length === 0) return;
    
    const sortedRows = dataRows.sort((a, b) => {
        let aValue = getCellValue(a, column);
        let bValue = getCellValue(b, column);
        
        // 숫자형 데이터 처리 (의뢰건수, 총 주문금액) - 탈퇴회원은 "-"로 표시되므로 0으로 처리
        if (column === 'requestCount' || column === 'totalPaymentAmount') {
            aValue = aValue === '-' ? 0 : (parseFloat(aValue.replace(/[^\d.-]/g, '')) || 0);
            bValue = bValue === '-' ? 0 : (parseFloat(bValue.replace(/[^\d.-]/g, '')) || 0);
        }
        // 날짜 처리 (가입일)
        else if (column === 'createdAt') {
            aValue = new Date(aValue);
            bValue = new Date(bValue);
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
        'createdAt': 3,           // 가입일 (4번째 컬럼, 체크박스 제외하면 3)
        'requestCount': 6,        // 의뢰건수 (7번째 컬럼, 체크박스 제외하면 6)
        'totalPaymentAmount': 7   // 총 주문금액 (8번째 컬럼, 체크박스 제외하면 7)
    };
    
    const cellIndex = columnMap[column];
    if (cellIndex === undefined) return '';
    
    const cell = row.children[cellIndex + 1]; // +1 because first column is checkbox
    return cell ? cell.textContent.trim() : '';
}

function restoreSelectedMembers() {
    const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');
    if (checkedBoxes.length === 0) {
        alert('복구할 회원을 선택해주세요.');
        return;
    }
    if (confirm('선택된 탈퇴 회원을 복구하시겠습니까?')) {
        const selectedValues = Array.from(checkedBoxes).map(checkbox => checkbox.value);
        document.getElementById('selectedMembersRestoreInput').value = selectedValues.join(',');
        document.getElementById('restoreForm').submit();
    }
}

function deleteSelectedMembers() {
    const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');
    if (checkedBoxes.length === 0) {
        alert('삭제할 회원을 선택해주세요.');
        return;
    }
    if (confirm('선택된 탈퇴 회원을 완전히 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')) {
        const selectedValues = Array.from(checkedBoxes).map(checkbox => checkbox.value);
        document.getElementById('selectedMembersDeleteInput').value = selectedValues.join(',');
        document.getElementById('deleteForm').submit();
    }
}

function downloadExcel() {
    // 탈퇴회원 엑셀 다운로드 링크로 이동
    window.location.href = '/admin/withdrawal-management/excel';
}
</script>

<jsp:include page="footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

<!-- 관리자 계정 페이지 -->
<div id="" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">관리자 계정</div>
        <div class="breadcrumb">관리자페이지 > 관리자 > 관리자 계정</div>
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
        <div class="card">
            <div class="d-none d-lg-block">
                <div class="d-flex justify-content-end gap-1">
                    <div class="text-end" data-bs-toggle="modal" data-bs-target="#add"><button type="button" class="btn btn-dark"><i class="bi bi-person-add fs-5"></i> 관리자 추가</button></div>
                    <div class="text-end"><button type="button" class="btn btn-danger" onclick="deleteSelectedAdmins()"><i class="bi bi-person-x fs-5"></i> 관리자 삭제</button></div>
                </div>
                <table class="table table-bordered">
                    <colgroup>
                        <col width="8%">
                        <col width="23%">
                        <col width="23%">
                        <col width="23%">
                        <col width="23%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>부서</th>
                            <th>권한</th>
                        </tr>
                    </thead>
                    <tbody class="">
                        <c:forEach var="admin" items="${admins}" varStatus="status">
                            <tr>
                                <td>
                                    <div class="form-check d-flex justify-content-center">
                                        <input class="form-check-input" type="checkbox" value="${admin.adminNo}" name="selectedAdmins">
                                    </div>
                                </td>
                                <td>${admin.name}</td>
                                <td>${admin.adminId}</td>
                                <td>${admin.department}</td>
                                <td>
                                    <div class="d-flex align-items-center justify-content-center position-relative cursor-pointer" onclick="location.href='/admin/admin-account-details?adminNo=${admin.adminNo}'">
                                        <div>${admin.authority}</div>
                                        <div class="end-0 position-absolute"><i class="bi bi-pencil-square fs-5 text-danger"></i></div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty admins}">
                            <tr>
                                <td colspan="5" class="text-center">등록된 관리자가 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>

                <!-- 페이징 -->
                <nav aria-label="Page navigation" class="mt-3">
                    <ul class="pagination justify-content-center">
                        <c:if test="${currentPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href="/admin/admin-account?page=${currentPage - 1}&size=${size}">이전</a>
                            </li>
                        </c:if>

                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <li class="page-item active">
                                        <span class="page-link">${i + 1}</span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="/admin/admin-account?page=${i}&size=${size}">${i + 1}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages - 1}">
                            <li class="page-item">
                                <a class="page-link" href="/admin/admin-account?page=${currentPage + 1}&size=${size}">다음</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>

                <!-- 페이지 정보 -->
                <div class="text-center text-muted">
                    총 ${totalElements}개의 관리자 중 ${currentPage * size + 1}-${Math.min((currentPage + 1) * size, totalElements)}번째 표시
                </div>
            </div>
            <div class="d-block d-lg-none">
                <c:forEach var="admin" items="${admins}" varStatus="status">
                    <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                        <div class="order-numb align-items-center d-flex gap-1">
                            <input class="form-check-input" type="checkbox" value="${admin.adminNo}" name="selectedAdmins">
                            <div class="d-flex gap-1">
                                <div>${admin.name}</div>
                                <div class="text-muted">(${admin.adminId})</div>
                            </div>
                        </div>
                        <div class="download-contents d-flex align-items-baseline flex-column justify-content-between">
                            <div class=""><span>[부서명]</span> ${admin.department}</div>
                            <div class="w-100">
                                <div class="align-items-center d-flex position-relative">
                                    <span>[권한]</span> ${admin.authority}
                                    <i class="bi bi-pencil-square fs-5 text-danger position-absolute end-0 cursor-pointer" 
                                       onclick="location.href='/admin/admin-account-details?adminNo=${admin.adminNo}'"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty admins}">
                    <div class="text-center p-3">등록된 관리자가 없습니다.</div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- 관리자 추가 Modal -->
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="/admin/admin-account/add" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addModalLabel">관리자 추가</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="15%">
                            <col width="18.333%">
                            <col width="15%">
                            <col width="18.333%">
                            <col width="15%">
                            <col width="18.333%">
                        </colgroup>
                        <tbody class="">
                            <tr>
                                <th class="text-center">이름</th>
                                <td colspan="2"><input type="text" class="form-control" name="name" placeholder="이름을 입력하세요" required></td>
                                <th class="text-center">아이디</th>
                                <td colspan="2"><input type="text" class="form-control" name="adminId" placeholder="아이디를 입력하세요" required></td>
                            </tr>
                            <tr>
                                <th class="text-center">비밀번호</th>
                                <td colspan="2"><input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요" required></td>
                                <th class="text-center">권한</th>
                                <td colspan="2">
                                    <select class="form-select" name="authority" required>
                                        <option value="">선택</option>
                                        <option value="모든권한">모든권한</option>
                                        <option value="수정">수정</option>
                                        <option value="답변쓰기">답변쓰기</option>
                                        <option value="읽기">읽기</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">부서명</th>
                                <td><input type="text" class="form-control" name="department" placeholder="부서명을 입력하세요"></td>
                                <th class="text-center">지위</th>
                                <td><input type="text" class="form-control" name="position" placeholder="지위를 입력하세요"></td>
                                <th class="text-center">직책</th>
                                <td><input type="text" class="form-control" name="rank" placeholder="직책을 입력하세요"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">확인</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 삭제 폼 (숨김) -->
<form id="deleteForm" action="/admin/admin-account/delete" method="post" style="display: none;">
    <input type="hidden" name="selectedAdmins" id="selectedAdminsInput">
</form>

<!-- 체크박스 전체선택 및 삭제 기능 js -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 전체 선택 체크박스 추가
        const tableHead = document.querySelector('thead tr');
        if (tableHead) {
            const selectAllTh = document.createElement('th');
            selectAllTh.innerHTML = '<input type="checkbox" id="selectAll" class="form-check-input">';
            selectAllTh.style.width = '8%'; // 이미지에 맞춰 조정
            tableHead.insertBefore(selectAllTh, tableHead.firstChild);
        }

        // 전체 선택 기능
        const selectAllCheckbox = document.getElementById('selectAll');
        const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');

        if (selectAllCheckbox) {
            selectAllCheckbox.addEventListener('change', function() {
                rowCheckboxes.forEach(checkbox => {
                    checkbox.checked = selectAllCheckbox.checked;
                });
            });
        }

        // 개별 체크박스 변경 시 전체 선택 상태 업데이트
        rowCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');
                if (selectAllCheckbox) {
                    selectAllCheckbox.checked = checkedBoxes.length === rowCheckboxes.length;
                    selectAllCheckbox.indeterminate = checkedBoxes.length > 0 && checkedBoxes.length < rowCheckboxes.length;
                }
            });
        });
        
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

    // 선택된 관리자 삭제 함수
    function deleteSelectedAdmins() {
        const checkedBoxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');

        if (checkedBoxes.length === 0) {
            alert('삭제할 관리자를 선택해주세요.');
            return;
        }

        if (confirm('선택된 관리자를 삭제하시겠습니까?')) {
            const selectedValues = Array.from(checkedBoxes).map(checkbox => checkbox.value);
            document.getElementById('selectedAdminsInput').value = selectedValues.join(',');
            document.getElementById('deleteForm').submit();
        }
    }
</script>

<jsp:include page="footer.jsp" />

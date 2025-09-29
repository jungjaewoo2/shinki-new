<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 회원정보 상세보기 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">회원정보 상세보기</div>
         <div class="breadcrumb">관리자페이지 > 회원관리 > 회원정보 상세보기</div>
     </div>

     <!-- 에러 메시지 -->
     <c:if test="${not empty error}">
         <div class="alert alert-danger alert-dismissible fade show" role="alert">
             ${error}
             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
         </div>
     </c:if>
     
     <!-- 성공 메시지 -->
     <c:if test="${not empty success}">
         <div class="alert alert-success alert-dismissible fade show" role="alert">
             ${success}
             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
         </div>
     </c:if>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <div class="card d-flex flex-lg-row flex-column justify-content-end gap-2">
             <div class="d-flex flex-column flex-fill">
                 <div class="fw-bold"><i class="bi bi-list-check text-secondary"></i> 가입정보</div>
                 <table class="table table-bordered">
                     <colgroup>
                         <col width="15%">
                         <col width="35%">
                         <col width="15%">
                         <col width="35%">
                     </colgroup>
                     <tbody class="">
                         <c:if test="${not empty member}">
                             <tr>
                                 <th>병원명</th>
                                 <td class="text-start">${member.hospitalName}</td>
                                 <th>진료과</th>
                                 <td class="text-start">${member.department}</td>
                             </tr>
                             <tr>
                                 <th>이름</th>
                                 <td class="text-start">${member.name}</td>
                                 <th>아이디</th>
                                 <td class="text-start">
                                     <div class="align-items-center d-flex justify-content-between">
                                         <div>${member.username}</div>
                                         <div>
                                             <c:choose>
                                                 <c:when test="${member.status eq 'Y'}">
                                                     <!--<button class="btn btn-dark btn-sm" onclick="withdrawMember(${member.id})">회원탈퇴</button>-->
                                                 </c:when>
                                                 <c:otherwise>
                                                     <span class="badge bg-secondary">탈퇴됨</span>
                                                 </c:otherwise>
                                             </c:choose>
                                         </div>
                                     </div>
                                 </td>
                             </tr>
                             <tr>
                                 <th>비밀번호</th>
                                 <td class="text-start">${member.password}</td>
                                 <th>추천직원</th>
                                 <td class="text-start">${member.recommendedEmployee}</td>
                             </tr>
                             <tr>
                                 <th>연락처</th>
                                 <td class="text-start">${member.phone}</td>
                                 <th>추천코드</th>
                                 <td class="text-start">${member.recommendCode}</td>
                             </tr>
                             <tr>
                                 <th>이메일</th>
                                 <td class="text-start">${member.email}</td>
                                 <th>회원가입일</th>
                                 <td class="text-start">${memberCreatedAtStr}</td>
                             </tr>
                             <tr>
                                 <th>주소</th>
                                 <td class="text-start">
                                     <div class="align-items-baseline d-flex flex-column">
                                         <!--<div><button class="btn btn-outline-secondary btn-sm">우편번호 검색</button></div>-->
                                         <div>서울시 성북구 지안빌딩 123번지</div>
                                     </div>
                                 </td>
                                 <th>회원상태</th>
                                 <td class="text-start">
                                     <c:choose>
                                         <c:when test="${member.status eq 'Y'}">
                                             <span class="badge bg-success">정상</span>
                                         </c:when>
                                         <c:otherwise>
                                             <span class="badge bg-danger">탈퇴</span>
                                         </c:otherwise>
                                     </c:choose>
                                 </td>
                             </tr>
                             <tr>
                                 <th>메모</th>
                                 <td class="text-start" colspan="3">
                                     <form id="memoForm" method="POST" action="/admin/view-member-info/save-memo">
                                         <input type="hidden" name="memberId" value="${member.id}" />
                                         <div class="align-items-center d-flex justify-content-between">
                                             <div class="flex-fill me-3">
                                                 <textarea name="memo" class="form-control" rows="3" placeholder="메모를 입력하세요...">${member.memo}</textarea>
                                             </div>
                                             <div>
                                                 <button type="submit" class="btn btn-info btn-sm text-white">저장</button>
                                             </div>
                                         </div>
                                     </form>
                                 </td>
                             </tr>
                         </c:if>
                         <c:if test="${empty member}">
                             <tr>
                                 <td colspan="4" class="text-center">회원 정보를 찾을 수 없습니다.</td>
                             </tr>
                         </c:if>
                     </tbody>
                 </table>
             </div>
             <div class="d-flex flex-column flex-fill">
                 <div class="fw-bold"><i class="bi bi-list-check text-secondary"></i> 이용/운영 정보</div>
                 <table class="table table-bordered">
                     <colgroup>
                         <col width="45%">
                         <col width="55%">
                     </colgroup>
                     <tbody class="">
                         <tr>
                             <th>가입일시</th>
                             <td class="text-start">${memberCreatedAtStr}</td>
                         </tr>
                         <tr>
                             <th>방문횟수</th>
                             <td class="text-start">${member.visitNum}회</td>
                         </tr>
                         <tr>
                             <th>최근 로그인</th>
                             <td class="text-start">2025-05-01</td>
                         </tr>
                         <tr>
                             <th>총 결제금액</th>
                             <td class="text-start">
                                 <div class="align-items-center d-flex justify-content-between">
                                     <div>
                                         <c:choose>
                                             <c:when test="${not empty totalPaymentAmount}">
                                                 <fmt:formatNumber value="${totalPaymentAmount}" pattern="#,###" />원
                                             </c:when>
                                             <c:otherwise>
                                                 0원
                                             </c:otherwise>
                                         </c:choose>
                                     </div>
                                     <div><button class="btn btn-outline-secondary btn-sm" onclick="showPaymentHistory()">구매내역보기</button></div>
                                 </div>
                                 
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
         </div>
         <div class="card">
             <div class="fw-bold fs-4">활동내역</div>
             <div class="">
                 <table class="table table-striped table-bordered">
                     <colgroup>
                         <col width="5%">
                         <col width="10%">
                         <col width="20%">
                         <col width="65%">
                     </colgroup>
                     <thead>
                         <tr>
                             <th>NO</th>
                             <th>작성일</th>
                             <th>분류</th>
                             <th>내용</th>
                         </tr>
                     </thead>
                    <tbody class="">
                        <c:choose>
                            <c:when test="${not empty activityList}">
                                <c:forEach var="activity" items="${activityList}" varStatus="status">
                                    <tr>
                                        <td>${activityList.size() - status.index}</td>
                                        <td>
                                            ${activity.createdAtStr}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${activity.type == 'request'}">
                                                    의뢰하기
                                                </c:when>
                                                <c:otherwise>
                                                    1:1문의
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-start">
                                            <c:choose>
                                                <c:when test="${activity.type == 'request'}">
                                                    ${activity.content} (${activity.applicationType})
                                                </c:when>
                                                <c:otherwise>
                                                    ${activity.content}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="text-center">활동 내역이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                 </table>
             </div>
         </div>
         <div class="d-flex gap-1 justify-content-center">
             <button class="btn btn-lg btn-info text-white">수정하기</button>
             <button class="btn btn-lg btn-secondary" onclick="location.href='membership-management'">목록</button>
         </div>
     </div>
 </div>


<!-- Modal -->
<div class="modal fade" id="order-history" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">구매내역보기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-striped table-bordered">
                     <colgroup>
                         <col width="10%">
                         <col width="20%">
                         <col width="40%">
                         <col width="15%">
                         <col width="15%">
                     </colgroup>
                     <thead>
                         <tr>
                             <th class="text-center">NO</th>
                             <th class="text-center">의뢰항목</th>
                             <th class="text-center">제목</th>
                             <th class="text-center">가격</th>
                             <th class="text-center">주문일</th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <c:choose>
                             <c:when test="${not empty paymentHistory}">
                                 <c:forEach var="payment" items="${paymentHistory}" varStatus="status">
                                     <tr>
                                         <td class="text-center">${status.count}</td>
                                         <td class="text-center">${payment.applicationType}</td>
                                         <td>${payment.title}</td>
                                         <td><fmt:formatNumber value="${payment.paymentAmount}" pattern="#,###" />원</td>
                                         <td class="text-center">${payment.createdAtStr}</td>
                                     </tr>
                                 </c:forEach>
                             </c:when>
                             <c:otherwise>
                                 <tr>
                                     <td colspan="5" class="text-center">결제 내역이 없습니다.</td>
                                 </tr>
                             </c:otherwise>
                         </c:choose>
                     </tbody>
                 </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
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
});

function withdrawMember(memberId) {
    if (confirm('이 회원을 탈퇴 처리하시겠습니까?')) {
        // 폼 생성 및 제출
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/admin/membership-management/withdraw';
        
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'selectedMembers';
        input.value = memberId;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}

function showPaymentHistory() {
    <c:choose>
        <c:when test="${not empty paymentHistory}">
            // 결제 내역이 있으면 모달 표시
            const modal = new bootstrap.Modal(document.getElementById('order-history'));
            modal.show();
        </c:when>
        <c:otherwise>
            // 결제 내역이 없으면 알림 표시
            alert('해당 내역이 없습니다.');
        </c:otherwise>
    </c:choose>
}
</script>

<jsp:include page="footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 개인정보확인/수정 페이지 -->
<div id="profile-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">개인정보확인/수정</div>
        <div class="breadcrumb">마이페이지 > MY 정보 > 개인정보확인/수정</div>
    </div>

    <div class="card flex-fill overflow-auto">
        <!-- 메시지 표시 -->
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center mx-3 mt-3" role="alert">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mx-3 mt-3" role="alert">
                ${error}
            </div>
        </c:if>
        
        <form action="/mypage/update" method="post">
            <div class="form-group">
                <label class="form-label required">병원</label>
                <input type="text" name="hospitalName" class="form-input" value="${member.hospitalName}" placeholder="병원명을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">진료과</label>
                <input type="text" name="department" class="form-input" value="${member.department}" placeholder="진료과를 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">이름</label>
                <input type="text" name="name" class="form-input" value="${member.name}" placeholder="이름을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">아이디</label>
                <input type="text" name="username" class="form-input" value="${member.username}" placeholder="아이디를 입력하세요" required readonly>
            </div>

            <div class="form-group">
                <label class="form-label">비밀번호 변경</label>
                <input type="password" name="newPassword" class="form-input" placeholder="새 비밀번호를 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label">비밀번호 확인</label>
                <input type="password" name="confirmPassword" class="form-input" placeholder="새 비밀번호를 다시 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label required">주소</label>
                <div class="d-flex gap-2">
                    <input type="text" name="address" id="address" class="form-input flex-fill" value="${member.address}" placeholder="주소를 검색해주세요" readonly required>
                    <button type="button" class="btn btn-outline-secondary" onclick="searchAddress()" style="min-width: 100px; white-space: nowrap;">주소검색</button>
                </div>
            </div>
            
            <div class="form-group">
                <label class="form-label">상세주소</label>
                <input type="text" name="addressEtc" class="form-input" value="${member.addressEtc}" placeholder="상세주소를 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label required">연락처</label>
                <input type="text" name="phone" id="phone" class="form-input" value="${member.phone}" placeholder="010-0000-0000" maxlength="13" required>
            </div>

            <div class="form-group">
                <label class="form-label">이메일</label>
                <input type="email" name="email" class="form-input" value="${member.email}" placeholder="email@example.com">
            </div>

            <div class="form-group">
                <label class="form-label">추천직원</label>
                <input type="text" name="recommendedEmployee" class="form-input" value="${member.recommendedEmployee}" placeholder="추천직원명">
            </div>

            <div class="form-group">
                <label class="form-label">추천코드</label>
                <input type="text" name="recommendCode" class="form-input" value="${member.recommendCode}" placeholder="추천코드를 입력하세요">
            </div>

            <div class="button-group justify-content-center">
                <button type="submit" class="btn btn-dark">정보 수정</button>
            </div>
        </form>
    </div>
</div>

<script>
// 주소 검색 함수
function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
            document.querySelector('input[name="addressEtc"]').focus();
        }
    }).open();
}

// 전화번호 자동 하이픈 처리 함수
function formatPhoneNumber(input) {
    // 숫자만 추출
    let value = input.value.replace(/[^0-9]/g, '');
    
    // 길이에 따라 하이픈 추가
    if (value.length >= 11) {
        // 010-1234-5678 형식 (휴대폰)
        value = value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    } else if (value.length >= 10) {
        // 02-123-4567 형식 (서울) 또는 031-123-4567 형식 (지역번호)
        if (value.startsWith('02')) {
            value = value.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
        } else {
            value = value.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        }
    } else if (value.length >= 7) {
        // 123-4567 형식 (지역번호 없는 경우)
        value = value.replace(/(\d{3})(\d{4})/, '$1-$2');
    } else if (value.length >= 4) {
        // 123-4 형식
        value = value.replace(/(\d{3})(\d{1})/, '$1-$2');
    }
    
    input.value = value;
}

// 전화번호 입력 이벤트 리스너 추가
document.addEventListener('DOMContentLoaded', function() {
    const phoneInput = document.getElementById('phone');
    if (phoneInput) {
        // 페이지 로드 시 기존 값도 포맷팅
        formatPhoneNumber(phoneInput);
        
        phoneInput.addEventListener('input', function() {
            formatPhoneNumber(this);
        });
        
        // 키보드 입력 시에도 처리
        phoneInput.addEventListener('keyup', function() {
            formatPhoneNumber(this);
        });
    }
});
</script>

<!-- 다음 우편번호 서비스 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="footer.jsp" />
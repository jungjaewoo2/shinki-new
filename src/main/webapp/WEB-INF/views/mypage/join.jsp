<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<style>
    .main-content {
        border-radius: 0.375rem;
    }

    .sidebar,
    .hamburger-btn {
        display: none;
    }

    @media (max-width: 1024px) {

        .navbar {
            padding: 0;
        }
    }

</style>

<!-- 로그인 페이지 -->
<div id="login-page" class="page d-flex flex-column h-100">


    <div class="card flex-fill h-100">
        <div class="page-title text-center m-3 m-lg-5">회원가입</div>
        
        <!-- 메시지 표시 -->
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center mx-3" role="alert">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mx-3" role="alert">
                ${error}
            </div>
        </c:if>
        <div class="overflow-x-hidden overflow-y-auto">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-5">
                    <div class="d-flex flex-column gap-2">
                        <form action="/mypage/register" method="post" onsubmit="return validateForm()">
                            <input type="hidden" name="status" value="Y">
                            <div>
                                <div class="form-group">
                                    <label class="form-label required">병원</label>
                                    <input type="text" name="hospitalName" class="form-input" placeholder="병원명을 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">진료과</label>
                                    <input type="text" name="department" class="form-input" placeholder="진료과를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">이름</label>
                                    <input type="text" name="name" class="form-input" placeholder="이름을 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">아이디</label>
                                    <input type="text" name="username" class="form-input" placeholder="아이디를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">비밀번호</label>
                                    <input type="password" name="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">비밀번호 확인</label>
                                    <input type="password" name="confirmPassword" class="form-input" placeholder="비밀번호를 다시 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">주소</label>
                                    <div class="d-flex gap-2">
                                        <input type="text" name="address" id="address" class="form-input flex-fill" placeholder="주소를 검색해주세요" readonly required>
                                        <button type="button" class="btn btn-outline-secondary" onclick="searchAddress()" style="min-width: 100px; white-space: nowrap;">주소검색</button>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="form-label">상세주소</label>
                                    <input type="text" name="addressEtc" class="form-input" placeholder="상세주소를 입력하세요">
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">연락처</label>
                                    <input type="text" name="phone" id="phone" class="form-input" placeholder="010-0000-0000" maxlength="13" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">이메일</label>
                                    <input type="email" name="email" class="form-input" placeholder="email@example.com" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">추천직원</label>
                                    <input type="text" name="recommendedEmployee" class="form-input" placeholder="추천직원명">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">추천코드</label>
                                    <input type="text" name="recommendCode" class="form-input" placeholder="추천코드를 입력하세요">
                                </div>
                            </div>
                            <div class="d-grid col-12 mx-auto mt-4">
                                <button type="submit" class="btn btn-dark">회원가입</button>
                            </div>
                        </form>
                        
                        <div class="text-center" style="margin-top: 20px;">
                            <a href="/mypage/login" class="btn-link">로그인으로 돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="termsBox_list2" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보 수집 및 이용 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents">
                    <div class="title">제1조 수집하는 개인정보 항목 및 수집방법</div>
                    <br />
                    <div>
                        Synapse 3D(이하 "회사")는 『개인정보 보호법』 및 관련 법령에 따라,
                        아래와 같이 이용자의 개인정보를 수집·이용하며, 이에 대해 동의를 받고자 합니다.
                    </div>
                    <br />

                    <div class="nb_list">1.수집항목</div>
                    <br />
                    <div class="nb_list2">1)회원가입 및 기본 서비스 제공 시</div>
                    <br />
                    <div class="dot-list">* 필수 : 이름, 휴대전화번호, 이메일 주소, 상품을 제공받는 해당 채널의 주소 및 ID, 주소지</div>
                    <br />
                    <div class="nb_list2">
                        2)마케팅 및 이벤트 안내 시 – 선택 동의
                    </div>
                    <br />
                    <div class="dot-list">
                        * 선택항목: 이름, 휴대전화번호, 이메일 주소
                    </div>
                    <div class="dot-list">
                        ※ 쿠키, 접속 IP, 브라우저 정보 등 자동 수집 항목은 별도의 ‘개인정보 처리방침’에 따릅니다.
                    </div>
                    <br />

                    <div class="nb_list">2.수집 및 이용 목적</div>
                    <br />
                    <div class="dot-list">
                        ·회원 가입 및 서비스 이용에 따른 본인 확인, 민원 응대, 고지사항 전달 등
                    </div>
                    <br />
                    <div class="dot-list">
                        ·이벤트 및 프로모션 정보 제공, 신규 서비스 안내 및 마케팅 활용 (선택 동의 시)
                    </div>
                    <br />
                    <div class="title">제2조 개인정보의 수집 및 이용 목적</div>
                    <br />

                    <div class="nb_list">3.개인정보 보유 및 이용 기간</div>
                    <br />
                    <div class="dot-list">
                        (사진 참조)
                        ※ 관련 법령에 따라 아래와 같이 별도 보존될 수 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 계약 또는 청약 철회 등에 관한 기록: 5년 (전자상거래법)
                    </div>
                    <br />
                    <div class="dot-list">
                        * 소비자 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래법)
                    </div>
                    <br />

                    <div class="nb_list">4.동의 거부권 및 거부에 따른 불이익</div>
                    <br />
                    <div class="dot-list">
                        * 귀하는 위 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 단, 필수항목에 대한 동의를 거부할 경우, 회원가입 및 서비스 제공이 제한될 수 있습니다.
                    </div>
                    <br />

                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// 회원가입 폼 유효성 검사 함수
function validateForm() {
    // 필수 필드들
    const hospitalName = document.querySelector('input[name="hospitalName"]');
    const department = document.querySelector('input[name="department"]');
    const name = document.querySelector('input[name="name"]');
    const username = document.querySelector('input[name="username"]');
    const password = document.querySelector('input[name="password"]');
    const confirmPassword = document.querySelector('input[name="confirmPassword"]');
    const address = document.querySelector('input[name="address"]');
    const phone = document.querySelector('input[name="phone"]');
    const email = document.querySelector('input[name="email"]');
    
    // 필수 필드 검증
    if (!hospitalName.value.trim()) {
        alert('병원명을 입력해주세요.');
        hospitalName.focus();
        return false;
    }
    
    if (!department.value.trim()) {
        alert('진료과를 입력해주세요.');
        department.focus();
        return false;
    }
    
    if (!name.value.trim()) {
        alert('이름을 입력해주세요.');
        name.focus();
        return false;
    }
    
    if (!username.value.trim()) {
        alert('아이디를 입력해주세요.');
        username.focus();
        return false;
    }
    
    if (!password.value.trim()) {
        alert('비밀번호를 입력해주세요.');
        password.focus();
        return false;
    }
    
    if (!confirmPassword.value.trim()) {
        alert('비밀번호 확인을 입력해주세요.');
        confirmPassword.focus();
        return false;
    }
    
    if (!address.value.trim()) {
        alert('주소를 입력해주세요.');
        address.focus();
        return false;
    }
    
    if (!phone.value.trim()) {
        alert('연락처를 입력해주세요.');
        phone.focus();
        return false;
    }
    
    if (!email.value.trim()) {
        alert('이메일을 입력해주세요.');
        email.focus();
        return false;
    }
    
    // 비밀번호 일치 확인
    if (password.value !== confirmPassword.value) {
        alert('비밀번호가 일치하지 않습니다.');
        confirmPassword.focus();
        return false;
    }
    
    // 비밀번호 길이 확인 (최소 6자)
    if (password.value.length < 6) {
        alert('비밀번호는 최소 6자 이상이어야 합니다.');
        password.focus();
        return false;
    }
    
    // 연락처 형식 확인 (간단한 형식 체크)
    const phonePattern = /^[0-9-]+$/;
    if (!phonePattern.test(phone.value)) {
        alert('연락처는 숫자와 하이픈(-)만 입력 가능합니다.');
        phone.focus();
        return false;
    }
    
    // 이메일 형식 확인
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email.value)) {
        alert('올바른 이메일 형식을 입력해주세요.');
        email.focus();
        return false;
    }
    
    // 아이디 길이 확인 (최소 4자)
    if (username.value.length < 4) {
        alert('아이디는 최소 4자 이상이어야 합니다.');
        username.focus();
        return false;
    }
    
    return true;
}

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
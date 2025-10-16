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
                                    <div class="d-flex gap-2 w-100">
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
                                    <input type="text" name="phone" id="phone" class="form-input" placeholder="전화번호를 입력하세요" maxlength="13" required>
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
                            <div class="position-relative mt-4 mb-4">
								<div class="m-auto position-relative w-50 text-center" style="background-color: #fff;z-index: 1;">동의 사항 체크</div>
								<div class="border-top position-absolute top-50 w-100"></div>
							</div>
							<div class="d-flex flex-column gap-1">
							<div class="d-flex align-items-center gap-2">
								<div>
									<input class="form-check-input" type="checkbox" id="terms-checkbox">
								</div>
								<div>
									<strong>모두 동의합니다.</strong>
								</div>
							</div>
							<div class="d-flex align-items-center gap-2">
								<div>
									<input class="form-check-input agree-item" type="checkbox" id="agree1" required>
								</div>
								<div>
									(필수)만 14세입니다.
								</div>
							</div>

							<div class="d-flex align-items-center gap-2">
								<div>
									<input class="form-check-input agree-item" type="checkbox" id="agree2" required>
								</div>
								<div class="">
									(필수) 이용 약관에 동의합니다. <span class="btn-secondary h-auto rounded-1" style="cursor: pointer;padding: 4px 8px;" data-bs-toggle="modal" data-bs-target="#termsBox_list2">더보기</span>
								</div>
							</div>

                            <div class="d-flex align-items-center gap-2">
								<div>
									<input class="form-check-input agree-item" type="checkbox" id="agree3" required>
								</div>
								<div class="">
									(필수) 개인정보 수집 및 이용에 대해 동의합니다.<span class="btn-secondary h-auto rounded-1" style="cursor: pointer;padding: 4px 8px;" data-bs-toggle="modal" data-bs-target="#termsBox_list2">더보기</span>
								</div>
							</div>
							<div class="d-flex align-items-center gap-2">
								<div>
									<input class="form-check-input agree-item" type="checkbox" id="agree4" name="termYn" value="Y">
								</div>
								<div>
									(선택) 마케팅 및 이벤트 정보 수신에 동의합니다(문자/이메일).
								</div>
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

<div class="modal fade" id="termsBox_list1" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보 수집·이용 동의서</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents"><br />
                	<div>본 동의서는 Synapse3D 서비스 이용을 위한 개인정보 및 민감정보 처리에 관한 ‘필수 동의’와 마케팅/이벤트 관련 ‘선택 동의’를 포함합니다.</div>
                	<br />
                    <div class="fw-bold fs-6">[필수] 수집·이용 항목 및 목적</div>
                    <br />
                    <table class="table table-bordered">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th class="bg-body-tertiary text-center">구분</th>
							<th class="bg-body-tertiary text-center">항목</th>
							<th class="bg-body-tertiary text-center">목적</th>
							<th class="bg-body-tertiary text-center">보유기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">의뢰자(회원) 식별</td>
							<td>이름, 소속/직책, 이메일, 휴대전화번호, 계정(ID)</td>
							<td>계정 생성·본인확인·고객지원·공지</td>
							<td>회원 탈퇴 시까지(법정 보존 예외)</td>
						</tr>
						<tr>
							<td class="align-middle">서비스 제공</td>
							<td>업로드 메타정보, 시스템 로그</td>
							<td>업로드/처리/전송, 오류 대응</td>
							<td>목적 달성 후 30일내 파기(로그 별도 정책)</td>
						</tr>
						<tr>
							<td class="align-middle">결제/정산(유료화 이후)</td>
							<td>결제수단 토큰, 청구/세금계산 정보</td>
							<td>요금 결제/정산/환불</td>
							<td>유료화 이후 관련 법정 보존기간</td>
						</tr>
					</tbody>
				</table>
                    <br /><br />

                    <div class="fw-bold fs-6">[필수-민감정보(건강정보)] 처리 동의</div>
                    <br />
                    <div class="nb_list2">① 항목: 의료영상(DICOM .DCM, ZIP), 검사 메타데이터, 분석·시뮬레이션 결과(3D/PDF 등)</div>
                    <br />
                    <div class="nb_list2">② 목적: 의뢰 목적의 분석·시뮬레이션 수행 및 산출물 제공</div>
                    <br />
                    <div class="nb_list2">③ 보유기간: 처리 완료 후 30일 이내 자동 파기(백업 포함)</div>
                    <br />
                    <div class="nb_list2">④ 동의 거부권: 동의 거부 시 해당 서비스 제공이 제한될 수 있음</div>
                    <br /><br />
                    <div class="fw-bold fs-6">[선택] 마케팅/이벤트 수신 동의</div>
                    <br />
                    <div class="nb_list2">① 항목: 이름, 이메일, 휴대전화번호, 소속/직책(선택), 관심 장비/응용분야(선택)</div>
                    <br />
                    <div class="nb_list2">② 목적: 제품 업데이트·세미나·프로모션 안내, 만족도 조사/통계 분석</div>
                    <br />
                    <div class="nb_list2">③ 보유기간: 목적 달성 또는 철회 시까지</div>
                    <br />
                    <div class="nb_list2">④ 철회 방법: master@shinkisa.co.kr 또는 고객센터 1544-8368</div>
                    <br />
                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-target="#consult" data-bs-toggle="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="termsBox_list2" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>마케팅 및 이벤트 정보 수신 동의 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents"><br />
                    <div class="fw-bold fs-6">제1조 (목적)</div>
                    <br />
                    <div>
                        본 약관은 Synapse3D 및 관련 의료영상 분석·시뮬레이션 서비스에 관한 마케팅·이벤트 정보 제공을 위하여 필요한 개인정보 수집·이용에 대한 동의 절차와 이용자의 권리·의무를 규정합니다.
                    </div>
                    <br />
					<div class="fw-bold fs-6">제2조 (수집 및 이용 항목)</div>
                    <br />
                    <table class="table table-bordered">
					<colgroup>
						<col width="25%">
						<col width="75%">
					</colgroup>
					<thead>
						<tr>
							<th class="bg-body-tertiary text-center">구분</th>
							<th class="bg-body-tertiary text-center">수집 항목</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle text-center">필수</td>
							<td>이름, 이메일 주소, 휴대전화번호</td>
						</tr>
						<tr>
							<td class="align-middle text-center">선택</td>
							<td>소속/직책, 관심 장비 및 응용 분야(Synapse3D Liver/Rectal/Colon 등)</td>
						</tr>
					</tbody>
				</table>
                    <br><br>
                    <div class="fw-bold fs-6">제3조 (이용 목적)</div>
                    <br>
					<div>1. 제품 업데이트, 버전 업그레이드, 기술 세미나/학술행사 안내</div><br>
					<div>2. 프로모션/이벤트 초대 및 참여 기회 제공</div><br>
					<div>3. 뉴스레터/서비스 공지사항/고객 사례 안내</div><br>
					<div>4. 만족도 조사, 통계 분석 및 품질 개선</div><br>
					<br><br>
					<div class="fw-bold fs-6">제4조 (보유 및 이용기간)</div>
                    <br>
					<div>동의일로부터 목적 달성 또는 동의 철회 시까지. 철회 시 지체 없이 파기합니다.</div><br>
					<br><br>
					<div class="fw-bold fs-6">제5조 (동의 철회 및 거부권)</div>
                    <br>
					<div>이용자는 언제든지 이메일(master@shinkisa.co.kr), 고객센터(1544-8368), 발송 메시지 내 수신거부 링크를 통해 철회할 수 있습니다. 동의를 거부하더라도 서비스 이용에는 제한이 없습니다.</div><br>
					<br><br>
					<div class="fw-bold fs-6">제6조 (제3자 제공 및 위탁)</div>
                    <br>
					<div>원칙적으로 제공하지 않으며, 마케팅 발송을 위해 수탁자(예: 카페24/알리고 등)에게 위탁할 수 있습니다. 수탁자는 목적 달성 후 지체 없이 파기합니다.</div><br>
					<br><br>
					<div class="fw-bold fs-6">제7조 (기타 사항)</div>
                    <br>
					<div>본 동의서는 개인정보처리방침의 ‘마케팅 및 광고 활용’ 항목과 함께 적용됩니다.</div><br>
					<br><br>
					
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
    
    // 필수 동의 사항 체크 확인
    const agree1 = document.getElementById('agree1');
    const agree2 = document.getElementById('agree2');
    const agree3 = document.getElementById('agree3');
    
    if (!agree1.checked) {
        alert('만 14세 이상 동의는 필수입니다.');
        agree1.focus();
        return false;
    }
    
    if (!agree2.checked) {
        alert('이용 약관 동의는 필수입니다.');
        agree2.focus();
        return false;
    }
    
    if (!agree3.checked) {
        alert('개인정보 수집 및 이용 동의는 필수입니다.');
        agree3.focus();
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
    
    // 최대 길이 제한
    if (value.length > 11) {
        value = value.substring(0, 11);
    }
    
    let formattedValue = '';
    
    // 02 (서울) 지역번호 처리
    if (value.startsWith('02')) {
        if (value.length <= 2) {
            formattedValue = value;
        } else if (value.length <= 5) {
            formattedValue = value.replace(/(\d{2})(\d{1,3})/, '$1-$2');
        } else if (value.length <= 9) {
            formattedValue = value.replace(/(\d{2})(\d{3})(\d{1,4})/, '$1-$2-$3');
        } else {
            formattedValue = value.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }
    // 010, 011, 016, 017, 018, 019 (휴대폰)
    // 070 (인터넷전화)
    // 031, 032, 033, 041, 042, 043, 044, 051, 052, 053, 054, 055, 061, 062, 063, 064 (지역번호)
    else if (/^(01[0-9]|02[0-9]|03[1-3]|04[1-4]|05[1-5]|06[1-4]|070)/.test(value)) {
        if (value.length <= 3) {
            formattedValue = value;
        } else if (value.length <= 6) {
            formattedValue = value.replace(/(\d{3})(\d{1,3})/, '$1-$2');
        } else if (value.length <= 10) {
            formattedValue = value.replace(/(\d{3})(\d{3})(\d{1,4})/, '$1-$2-$3');
        } else {
            formattedValue = value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }
    // 나머지 경우 (일반 번호)
    else {
        if (value.length <= 3) {
            formattedValue = value;
        } else if (value.length <= 7) {
            formattedValue = value.replace(/(\d{3,4})(\d{1,4})/, '$1-$2');
        } else {
            formattedValue = value.replace(/(\d{3,4})(\d{3,4})(\d{1,4})/, '$1-$2-$3');
        }
    }
    
    input.value = formattedValue;
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
    
    // 전체 동의 체크박스 기능
    const termsCheckbox = document.getElementById('terms-checkbox');
    const agreeItems = document.querySelectorAll('.agree-item');
    
    // "모두 동의합니다" 체크 시 하위 항목들 모두 체크
    if (termsCheckbox) {
        termsCheckbox.addEventListener('change', function() {
            agreeItems.forEach(function(item) {
                item.checked = termsCheckbox.checked;
            });
        });
    }
    
    // 하위 항목 체크 상태 변경 시 "모두 동의합니다" 체크박스 상태 업데이트
    agreeItems.forEach(function(item) {
        item.addEventListener('change', function() {
            const allChecked = Array.from(agreeItems).every(function(checkbox) {
                return checkbox.checked;
            });
            if (termsCheckbox) {
                termsCheckbox.checked = allChecked;
            }
        });
    });
});
</script>

<!-- 다음 우편번호 서비스 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const allCheckbox = document.querySelector('#terms-checkbox');
        const checkboxes = document.querySelectorAll('#agree1, #agree2, #agree4');

        // "모두 동의합니다" 체크박스 클릭 시
        allCheckbox.addEventListener('change', function() {
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // 개별 체크박스 변경 시 "모두 동의합니다" 상태 업데이트
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allChecked = Array.from(checkboxes).every(cb => cb.checked);
                allCheckbox.checked = allChecked;
            });
        });
    });
</script>

<jsp:include page="footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 의뢰하기 페이지 -->
<div id="request-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">의뢰하기</div>
        <div class="breadcrumb">마이페이지 > 의뢰하기</div>
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
        
        <form id="requestForm" action="/mypage/request" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="hidden" name="memberId" value="${memberId}">
            <input type="hidden" name="privacyAgreement" value="서비스 의뢰 동의서에 동의합니다.">
            
            <div class="form-group flex-column align-items-baseline gap-3">
                
                <label class="form-label required">서비스 의뢰 동의서</label>
                <div class="bg-body-tertiary border p-3 rounded-3" style="height: 200px;overflow-y: scroll;">
                    <strong>1. 목적 및 적용 범위</strong><br><br>
                    본 약정서는 의뢰자(의사/의료기관)가 ㈜신기사(이하 “당사”)의 신기사 자산인 Synapse3D를 이용해 환자 의료영상 데이터를 기반으로 시뮬레이션을 의뢰·활용하는 과정에서의 개인정보 처리 위탁, 보안/반출 제한, 책임범위를 정합니다.<br>
                    ※ 본 문서는 의뢰자용이며, 환자 동의서는 병원에서 별도로 수집/보관합니다.
                    <br><br>
                    <strong>2. 정의</strong><br><br>
                    - “의뢰 데이터”: 의뢰자가 업로드/제공하는 환자 영상(DICOM 등) 및 시뮬레이션에 필요한 최소 임상정보.<br>
                    - “산출물”: Synapse3D 처리 결과(이미지/모델/측정값/리포트 등).<br>
                    - “처리환경”: Synology 서버를 포함한 당사 운영 환경.
                    <br><br>
                    <strong>3. 의뢰자의 진술·보증(환자 동의·적법성)</strong><br><br>
                    의뢰자는 다음 사항을 진술·보증합니다.<br><br>
                    - 환자 동의 완료: 환자의 개인정보 수집·이용·처리 위탁 및 영상 자료 분석에 대한 사전 동의를 적법하게 받고, 그 증빙(동의서 원본/전자기록)을 기관 내 적정 기간 보관합니다.<br>
                    - 적법한 제공: 의뢰 데이터의 제공 및 당사에 대한 처리 위탁이 관련 법령(개인정보보호법, 의료법 등)에 적합합니다.<br>
                    - 최소 제공: 시뮬레이션 목적 달성에 필요최소한의 데이터만 제공합니다(가능하면 가명·비식별화 권장).<br>
                    - 부정제공 금지: 환자 동의가 불충분하거나 법적 근거가 없는 데이터는 절대 제공하지 않습니다.<br>
                    - 증빙 요구 협조: 당사가 합리적으로 요청하는 범위 내에서 동의 확보 사실을 확인할 수 있도록 협조합니다(동의서 사본 자체 제공을 요구하지 않을 수 있으나, 적법 확보에 대한 확약서/체크리스트 제공 요구 가능).<br><br>
                    위 진술·보증에 허위/위반이 있을 경우, 해당 책임은 전적으로 의뢰자에게 있으며, 이로 인해 당사에 손해가 발생하면 의뢰자는 이를 배상·면책합니다(제 10조 참조).
                    <br><br>
                    <strong>4. 개인정보 처리 위탁(수탁) 기본조건</strong><br><br>
                    의뢰자는 환자 개인정보 처리의 위탁자(관리자), 당사는 수탁자 지위로서 아래를 준수합니다.<br>
                    - 위탁 목적/범위: Synapse3D를 통한 시뮬레이션 수행 및 산출물 제공에 한함.<br>
                    - 보관 기간: 업로드/생성 시점을 기준으로 최대 30일 보관 후 영구 삭제(원본·산출물·임시파일 포함).<br>
                    - 보관/처리 환경: 당사가 운영·관리하는 Synology 서버 내에서만 처리·보관.<br>
                    - 재위탁 금지: 당사는 제3자에게 재위탁/제공하지 않음(법령상 의무 또는 의뢰자 사전 서면동의 있는 경우 제외).<br>
                    - 보안조치: 접근권한 최소화/권한분리, 전송구간 암호화, 접근·처리 로그 기록, 악성코드 방지, 취약점 점검 등 합리적 보호조치 시행.<br>
                    - 감독/점검: 의뢰자는 합리적 범위에서 수탁자 준수 여부를 점검할 수 있습니다(사전 협의·보안정책 준수 하에).<br>
                    - 파기: 보관기간 만료 또는 위탁종료 시 지체 없이 복구불가능한 방식으로 파기(백업/캐시 포함).<br>
                    - 사고 통지: 개인정보 침해사고 발생/인지 시, 관련 법령이 정한 바에 따라 지체 없이 의뢰자에게 통지하고 필요한 조치를 협의합니다.<br>
                    - 참고(운영 팁): 접근·처리 로그는 개인정보를 포함하지 않는 형태로 필요한 최소 기간 보관 후 파기 권장.
                    <br><br>
                    <strong>5. 데이터 반출·이용 제한</strong><br><br>
                    - 반출 제한: 의뢰 데이터 및 산출물은 요청자(의뢰자) 에게만 제공되며, 그 외 제3자 반출·공유·게시를 하지 않습니다.<br>
                    - 2차 활용 금지: 모델 고도화/마케팅/교육 등 2차 목적으로 절대 사용하지 않습니다(사전 서면동의 없는 한).<br>
                    - 국외 이전 없음: 처리환경은 국내 운영을 원칙으로 하며, 국외 이전을 하지 않습니다(정책 변경 시 사전 고지·동의).<br>
                    <br><br>
                    <strong>6. 서비스 및 산출물의 성격(의료자문·진단 아님)</strong><br><br>
                    - Synapse3D 산출물은 임상의의 판단을 보조하는 참고자료이며, 의료 자문·진단·처방 자체가 아닙니다.<br>
                    - 임상적 해석·최종 책임은 전적으로 의뢰자(주치의/의료기관) 에게 있습니다.<br>
                    - 당사는 산출물의 의학적 적합성/적시성/효과성에 대하여 명시적·묵시적 보증을 하지 않습니다.<br>
                    <br><br>
                    <strong>7. 운영 상세(권장 입력/체크 항목)</strong><br><br>
                    - 서버/장소: Synology 서버(운영 주체: ㈜신기사, 물리적 위치: [기입])<br>
                    - 업로드 방식: [SFTP/웹포털/전용VPN 등 기입]<br>
                    - 허용 포맷: DICOM(.dcm) 외 필요 시 [기입]<br>
                    - 필수 메타정보(최소화): 의뢰 식별자, 검사일자, 해부학적 부위/수술부위 등 목적 달성에 필요한 최소 항목<br>
                    - 삭제 시점: 업로드/생성 후 30일 경과 시 자동 삭제(조기삭제 요청 가능)<br>
                    <br><br>
                    <strong>8. 수수료·지급(해당 시)</strong><br><br>
                    - 과금 기준/범위/환불규정: [기관 정책 기입]<br>
                    - 세금계산서 및 정산 절차: [기입]
                    <br><br>
                    <strong>9. 책임 제한(한도) 및 불가항력</strong><br><br>
                    - 당사의 전체 책임은 해당 사건 발생 직전 6개월간 의뢰자가 당사에 지급한 금액 합계를 한도로 합니다(고의·중과실 제외).<br>
                    - 천재지변, 전쟁, 정전, 네트워크 장애, 제3자 서비스 중단 등 불가항력으로 인한 지연·장애에 대해서는 책임을 지지 않습니다.<br>
                    - 실무 권고: 한도 문구는 기관 정책에 맞춰 [직전 3/6/12개월 수수료 합계] 중 하나로 확정하세요.
                    <br><br>
                    <strong>10. 면책(Indemnity)</strong><br><br>
                    의뢰자의 제3자(환자 등) 클레임이 의뢰자의 동의 미비·위법 제공·오남용 등에서 기인한 경우, 의뢰자는 그로 인한 모든 손해·비용을 당사에 배상하고 면책합니다.
                    <br><br>
                    <strong>11. 비밀유지</strong><br><br>
                    각 당사자는 본 건 수행 중 알게 된 비밀정보를 제3자에게 공개하거나 본 계약 목적 외로 사용하지 않습니다(법령/정부기관 요구 제외).
                    <br><br>
                    <strong>12. 계약기간·해지</strong><br><br>
                    본 약정은 의뢰 접수 시 효력이 발생하며, 데이터 파기 완료 시까지 유효합니다.
                    어느 일방이 중대한 의무를 위반하고 상대방의 시정요구에도 불구하고 상당 기간 내 시정하지 않는 경우, 상대방은 본 약정을 해지할 수 있습니다.
                </div>
                
            </div>
            <div class="checkbox-group justify-content-end">
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="true" required> 동의합니다.
                </label>
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="false"> 동의하지 않습니다.
                </label>
            </div>

            <div class="form-group">
                <label class="form-label required">APPLICATION</label>
                <select name="applicationType" id="applicationType" class="form-select" aria-label="Default select example" required>
                    <option value="">선택</option>
                    <option value="HBP">HBP</option>
                    <option value="LUNG">LUNG</option>
                    <option value="CARDIAC">CARDIAC</option>
                    <option value="KNEE">KNEE</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label required">제목</label>
                <input type="text" name="title" id="title" class="form-input" placeholder="제목을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">의뢰내용</label>
                <textarea name="content" id="content" class="form-input" rows="5" placeholder="의뢰내용을 입력하세요" required></textarea>
            </div>

            <div class="form-group align-items-baseline flex-column gap-3">
                <label class="form-label">Image 파일 업로드</label>
                <p class="m-0 text-danger" style="font-size: 14px">첨부파일을 Zip 압축파일로 올려주시기 바랍니다.</p>
                <div id="dropArea" class="file-upload-area w-100 d-flex flex-column align-items-center justify-content-center p-4 border rounded border-dashed" style="height: 150px; cursor: pointer;">
                    <i class="bi bi-cloud-arrow-up-fill fs-3 text-muted"></i>
                    <p id="dropAreaText" class="text-muted">첨부하실 파일을 마우스로 끌어서 넣어주세요.</p>
                    <input class="form-control d-none" type="file" id="formFile" name="file" accept=".zip">
                    <div id="fileList" class="file-list mt-2"></div>
                </div>

            </div>

            <div class="button-group justify-content-center">
                <button type="submit" class="btn btn-dark">전송하기</button>
            </div>
        </form>
    </div>
</div>

<script>
// 파일 목록을 표시하는 함수
function displayFiles(files) {
    const fileList = document.getElementById('fileList');
    fileList.innerHTML = ''; // 기존 목록 초기화

    if (files.length > 0) {
        for (let i = 0; i < files.length; i++) {
            const fileItem = document.createElement('div');
            fileItem.textContent = files[i].name;
            fileList.appendChild(fileItem);
        }
        document.getElementById('dropAreaText').style.display = 'none'; // 텍스트 숨기기
    } else {
        fileList.textContent = '';
        document.getElementById('dropAreaText').style.display = 'block'; // 텍스트 보이기
    }
}

// 파일 선택 초기화 (삭제 버튼)
function clearFile() {
    document.getElementById('formFile').value = '';
    displayFiles([]); // 파일 목록 초기화
}

// 폼 유효성 검사
function validateForm() {
    const privacyAgreed = document.querySelector('input[name="privacyAgreed"]:checked');
    if (!privacyAgreed) {
        alert('서비스 의뢰 동의서에 동의해주세요.');
        return false;
    }
    
    if (privacyAgreed.value === 'false') {
        alert('서비스 의뢰 동의서에 동의해야 합니다.');
        return false;
    }
    
    const applicationType = document.getElementById('applicationType').value;
    if (!applicationType) {
        alert('APPLICATION을 선택해주세요.');
        return false;
    }
    
    const title = document.getElementById('title').value.trim();
    if (!title) {
        alert('제목을 입력해주세요.');
        return false;
    }
    
    const content = document.getElementById('content').value.trim();
    if (!content) {
        alert('의뢰내용을 입력해주세요.');
        return false;
    }
    
    const fileInput = document.getElementById('formFile');
    if (fileInput.files.length > 0) {
        const fileName = fileInput.files[0].name;
        if (!fileName.toLowerCase().endsWith('.zip')) {
            alert('ZIP 파일만 업로드 가능합니다.');
            return false;
        }
    }
    
    return true;
}

// DOM 로드 후 실행 (window.onload 사용)
window.onload = function() {
    var dropArea = document.getElementById('dropArea');
    var formFile = document.getElementById('formFile');
    var fileList = document.getElementById('fileList');

    // 드래그 기본 동작 방지 헬퍼 함수
    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    // 드래그 오버 핸들러 (하이라이트)
    function highlight(e) {
        dropArea.classList.add('dragover');
    }

    // 드래그 리브 핸들러 (하이라이트 해제)
    function unhighlight(e) {
        dropArea.classList.remove('dragover');
    }

    // 드롭 핸들러
    function dropHandler(e) {
        var dt = e.dataTransfer;
        var files = dt.files;

        if (files.length > 0) {
            var file = files[0];
            if (!file.name.toLowerCase().endsWith('.zip')) {
                alert('ZIP 파일만 업로드 가능합니다.');
                return;
            }
            formFile.files = files;
            displayFiles(files);
        }
    }

    // 드래그 앤 드롭 이벤트 등록
    if (dropArea) {
        // dropArea와 document.body에 대한 preventDefaults 등록 (inquiry.jsp와 동일하게)
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
            document.body.addEventListener(eventName, preventDefaults, false); // 전체 페이지 기본 동작 방지
        });

        // highlight 이벤트 등록
        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });

        // unhighlight 이벤트 등록
        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });

        dropArea.addEventListener('click', function() {
            formFile.click(); // 드롭 영역 클릭 시 파일 입력 열기
        });
        dropArea.addEventListener('drop', dropHandler, false);
    }

    if (formFile) {
        formFile.addEventListener('change', function() {
            displayFiles(this.files);
        });
    }
};
</script>

<jsp:include page="footer.jsp" />
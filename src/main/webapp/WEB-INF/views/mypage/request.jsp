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
                    <strong>제1조 (목적 및 적용 범위)</strong><br><br>
                    본 약정서는 의뢰자(의사/의료기관)가 ㈜신기사(“당사”)의 Synapse3D를 이용해 환자 의료영상 데이터를 기반으로 시뮬레이션을 의뢰·활용하는 과정에서의 민감정보 처리 위탁, 보안/반출 제한, 책임범위를 정합니다. (환자 동의서는 의뢰기관에서 별도 보관)<br>
                    <br><br>
                    <strong>제2조 (정의)</strong><br><br>
                    ⦁ “의뢰 데이터”: 의뢰자가 업로드/제공하는 환자 영상(DICOM .DCM, ZIP) 및 시뮬레이션에 필요한 최소 임상정보(민감정보 포함).<br>
                    ⦁ “산출물”: Synapse3D 처리 결과(이미지/3D 모델/측정값/리포트 등).<br>
                    ⦁ “처리환경”: 국내 운영 환경(서버 물리 위치: 서울특별시 서초구 강남대로34길 33). 업로드 방식: NAS 공유폴더.
                    <br><br>
                    <strong>제3조 (의뢰자의 진술·보증(환자 동의·적법성))</strong><br><br>
                    ⦁	의뢰자는 환자의 개인정보 수집·이용·처리 위탁 및 영상 분석에 관한 적법한 동의를 사전에 확보하며, 그 적법성·범위·진위에 대한 책임은 전적으로 의뢰자에게 있습니다.<br>
					⦁	당사는 의뢰자가 확보한 환자 동의의 내용·적법성을 독립적으로 검증할 의무가 없고, 이에 대해 어떠한 책임도 부담하지 않습니다.<br>
					⦁	의뢰자의 동의 미비·부적법한 제공으로 인한 민원·분쟁·손해가 발생한 경우 모든 법적·행정적 책임은 의뢰자에게 귀속되며, 의뢰자는 당사를 면책하고 손해를 배상합니다(제10조).
					<br><br>
                    <strong>제4조 (개인정보 처리 위탁(수탁) 기본조건)</strong><br><br>
                    ⦁	위탁 목적/범위: Synapse3D 시뮬레이션 수행 및 산출물 제공에 한함.<br>
					⦁	보관 기간: 업로드/생성 기준 최대 30일 후 영구 삭제(원본·산출물·임시파일·백업 포함).<br>
					⦁	보관/처리 환경: 국내 운영 환경에서만 처리. 국외 이전 없음(변경 필요 시 사전 고지·동의).<br>
					⦁	재위탁 금지: 법령 또는 의뢰자 사전 서면 동의 있는 경우 제외.<br>
					⦁	보안조치: 권한 최소화·분리, 전송구간 암호화, 접근/처리 로그, 악성코드 방지, 취약점 점검.<br>
					⦁	감독/점검: 의뢰자는 합리적 범위에서 준수 여부 점검 가능(사전 협의).<br>
					⦁	파기: 기한 만료 또는 위탁 종료 시 지체 없이 복구 불가 방식으로 파기, 로그 보관은 법정 범위 내.<br>
					⦁	사고 통지: 침해사고 인지 시 지체 없이 통지·협의.
					<br><br>
                    <strong>제5조 (데이터 반출·이용 제한 및 비식별 내부 활용)</strong><br><br>
                    ⦁	반출 제한: 의뢰자에게만 제공, 제3자 반출·공유·게시 금지.<br>
					⦁	의뢰자가 데이터를 업로드하여 의뢰함으로써, 회사는 개인을 식별할 수 없도록 비가역적 비식별 처리를 거친 데이터 또는 통계 정보를 샘플 제작, 품질검증(QA), 알고리즘 성능 개선, 서비스 연구·개선의 내부 목적에 한하여 보관·활용할 수 있습니다.<br>
					⦁	원본(식별 가능) 데이터 및 산출물은 30일을 초과하여 보관하지 않습니다.
					<br><br>
                    <strong>제6조 (서비스 및 산출물의 성격(의료자문·진단 아님))</strong><br><br>
                    ⦁	산출물은 임상 판단 보조용 참고자료이며, 의료 자문·진단·처방이 아님.<br>
					⦁	임상적 해석·최종 책임은 의뢰자에게 있음.<br>
					⦁	의학적 적합성/효과성/적시성에 대해 명시적·묵시적 보증을 하지 않음.
                    <br><br>
                    <strong>제7조 (운영 상세)</strong><br><br>
                    ⦁	서버/장소: 서울특별시 서초구 강남대로34길 33<br>
					⦁	업로드 방식: NAS 공유폴더<br>
					⦁	허용 포맷: DICOM(.DCM), ZIP 업로드<br>
					⦁	필수 메타정보: 의뢰 식별자, 검사일자, 해부학적/수술 부위 등 최소 항목<br>
					⦁	삭제: 업로드/생성 후 30일 경과 시 자동 삭제(조기삭제 요청 가능)
                    <br><br>
                    <strong>제8조 (데이터 비식별화 의무 및 당사의 정정권한)</strong><br><br>
                    ⦁	의뢰 데이터는 가능한 한 환자 식별정보를 제외(삭제·가명처리)하여 제공해야 합니다.<br>
					⦁	의뢰 데이터에 환자 식별정보가 포함된 경우, 회사는 업무 수행을 위해 필요한 범위에서 해당 정보를 임의로 삭제·비식별화할 수 있으며, 이로 인한 데이터 형식·메타데이터 변경에 대해서는 책임을 지지 않습니다.<br>
					⦁	비식별 처리 예시: DICOM 헤더 내 개인식별자 제거, 픽셀 상 식별 텍스트 마스킹, 재식별 위험 최소화 조치.
                    <br><br>
                    <strong>제9조 (수수료·지급(해당 시))</strong><br><br>
                    ⦁	과금 기준/환불 규정: 현재 무료 운영, 유료화 시 별도 정책 고지 예정<br>
					⦁	세금계산서/정산 절차: 유료화 이후 정책에 따름
                    <br><br>
                    <strong>제10조 (면책(Indemnity))</strong><br><br>
                    의뢰자의 동의 미비·위법 제공·오남용 등으로 발생한 제3자 청구에 대해 의뢰자는 회사(임직원·수탁자 포함)를 면책하고, 회사가 부담한 손해(소송비용·합의금 포함)를 즉시 배상합니다.
                    <br><br>
                    <strong>제11조 (책임 제한 및 불가항력)</strong><br><br>
                    ⦁	회사 총 책임 한도: 해당 사유 발생 직전 6개월간 수수료 합계(고의·중과실 제외).<br>
					⦁	천재지변, 전쟁, 정전, 네트워크 장애, 제3자 서비스 중단 등 불가항력 면책.
                    <br><br>
                    <strong>제12조 (비밀유지)</strong><br><br>
                    계약 수행 중 알게 된 비밀정보를 제3자에게 공개하거나 목적 외 사용 금지(법령/정부기관 요구 제외).
                    <strong>제13조 (계약기간·해지 및 존속 조항)</strong><br><br>
                    ⦁	효력: 의뢰 접수 시 발생, 데이터 파기 완료 시까지 유효.<br>
					⦁	해지: 중대한 의무 위반 시 시정 요구 후 상당 기간 내 미시정 시 해지 가능.<br>
					⦁	존속: 제4조·제5조·제10조·제11조는 계약 종료 후에도 유효.
                    <br><br>
                    <strong>제13의2. 준거법 및 관할</strong><br><br>
                    본 약정은 대한민국 법률에 따르며, 분쟁은 서울중앙지방법원을 제1심 전속관할로 합니다.
                    <br><br>
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
                <div class="d-flex flex-column flex-lg-row justify-content-between w-100" style="font-size: 14px">
                	<span class="m-0 text-danger">(필수) 첨부파일은 Zip 형식만 첨부 가능하며, 환자 정보는 익명으로 변환 후 첨부 바랍니다.</span>
                	<label class="checkbox-item">
                    	<input type="radio" name="" value="true" required> 확인했습니다.
                	</label>
                </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

<!-- 의뢰 수정 페이지 -->
<div id="request-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">의뢰 수정</div>
        <div class="breadcrumb">마이페이지 > 의뢰하기 > 의뢰 수정</div>
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
        
        <form id="requestForm" action="/mypage/update-request" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="${request.id}">
            <input type="hidden" name="memberId" value="${memberId}">
            
            <div class="form-group flex-column align-items-baseline gap-3">
                <label class="form-label required">1. 환자 정보 보호 동의서</label>
                <textarea name="privacyAgreement" id="privacyAgreement" class="form-input" rows="2" placeholder="내용을 입력하세요" required>${request.privacyAgreement}</textarea>
            </div>
            <div class="checkbox-group justify-content-end">
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="true" required ${request.privacyAgreed ? 'checked' : ''}> 동의합니다.
                </label>
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="false" ${!request.privacyAgreed ? 'checked' : ''}> 동의하지 않습니다.
                </label>
            </div>

            <div class="form-group">
                <label class="form-label required">APPLICATION</label>
                <select name="applicationType" id="applicationType" class="form-select" aria-label="Default select example" required>
                    <option value="">선택</option>
                    <option value="HBP" ${request.applicationType == 'HBP' ? 'selected' : ''}>HBP</option>
                    <option value="LUNG" ${request.applicationType == 'LUNG' ? 'selected' : ''}>LUNG</option>
                    <option value="CARDIAC" ${request.applicationType == 'CARDIAC' ? 'selected' : ''}>CARDIAC</option>
                    <option value="KNEE" ${request.applicationType == 'KNEE' ? 'selected' : ''}>KNEE</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label required">제목</label>
                <input type="text" name="title" id="title" class="form-input" placeholder="제목을 입력하세요" value="${request.title}" required>
            </div>

            <div class="form-group">
                <label class="form-label required">의뢰내용</label>
                <textarea name="content" id="content" class="form-input" rows="5" placeholder="의뢰내용을 입력하세요" required>${request.content}</textarea>
            </div>

            <div class="form-group align-items-baseline flex-column gap-3">
                <label class="form-label">Image 파일 업로드</label>
                <p class="m-0 text-danger" style="font-size: 14px">첨부파일을 Zip 압축파일로 올려주시기 바랍니다.</p>
                <div id="dropArea" class="file-upload-area w-100 d-flex flex-column align-items-center justify-content-center p-4 border rounded border-dashed" style="height: 150px; cursor: pointer;">
                    <i class="bi bi-cloud-arrow-up-fill fs-3 text-muted"></i>
                    <p id="dropAreaText" class="text-muted">첨부하실 파일을 마우스로 끌어서 넣어주세요.</p>
                    <input class="form-control d-none" type="file" id="formFile" name="file" accept=".zip">
                    <div id="fileList" class="file-list mt-2">
                        <c:if test="${not empty request.filePath}">
                            <div class="d-flex align-items-center gap-2">
                                <span>기존 파일: ${request.filePath}</span>
                                <button type="button" class="btn btn-sm btn-danger" onclick="return removeExistingFile(event);">삭제</button>
                            </div>
                        </c:if>
                    </div>
                </div>
                <input type="hidden" id="existingFilePath" name="existingFilePath" value="${request.filePath}">
                <input type="hidden" id="removeExistingFileFlag" name="removeExistingFileFlag" value="false">
            </div>

            <div class="button-group justify-content-center">
                <button type="submit" class="btn btn-dark">수정하기</button>
            </div>
        </form>
    </div>
</div>

<script>
// 파일 목록을 표시하는 함수
function displayFiles(files) {
    console.log('displayFiles 호출됨, 파일 개수:', files.length);
    const fileList = document.getElementById('fileList');
    console.log('fileList 요소:', fileList);
    fileList.innerHTML = ''; // 기존 목록 초기화

    if (files.length > 0) {
        for (let i = 0; i < files.length; i++) {
            console.log('파일 추가 중:', files[i].name);
            const fileItem = document.createElement('div');
            fileItem.className = 'd-flex align-items-center gap-2';
            
            const fileName = document.createElement('span');
            fileName.textContent = '선택된 파일: ' + files[i].name;
            
            const removeBtn = document.createElement('button');
            removeBtn.type = 'button';
            removeBtn.className = 'btn btn-sm btn-danger';
            removeBtn.textContent = '삭제';
            removeBtn.onclick = function(e) {
                e.preventDefault();
                e.stopPropagation();
                clearFile();
                return false;
            };
            
            fileItem.appendChild(fileName);
            fileItem.appendChild(removeBtn);
            fileList.appendChild(fileItem);
            console.log('파일 항목 추가됨');
        }
        document.getElementById('dropAreaText').style.display = 'none'; // 텍스트 숨기기
        console.log('드롭 영역 텍스트 숨김');
    } else {
        fileList.textContent = '';
        document.getElementById('dropAreaText').style.display = 'block'; // 텍스트 보이기
        console.log('파일 목록 초기화');
    }
}

// 파일 선택 초기화 (삭제 버튼)
function clearFile() {
    const formFile = document.getElementById('formFile');
    formFile.value = '';
    displayFiles([]); // 파일 목록 초기화
}

// 폼 유효성 검사
function validateForm() {
    const privacyAgreement = document.getElementById('privacyAgreement').value.trim();
    if (!privacyAgreement) {
        alert('환자 정보 보호 동의서 내용을 입력해주세요.');
        return false;
    }
    
    const privacyAgreed = document.querySelector('input[name="privacyAgreed"]:checked');
    if (!privacyAgreed) {
        alert('환자 정보 보호 동의서에 동의해주세요.');
        return false;
    }
    
    if (privacyAgreed.value === 'false') {
        alert('환자 정보 보호 동의서에 동의해야 합니다.');
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

function removeExistingFile(event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    
    if (confirm('기존 파일을 삭제하시겠습니까?')) {
        console.log('기존 파일 삭제 시작');
        const fileList = document.getElementById('fileList');
        
        fileList.innerHTML = ''; // 기존 파일 표시 제거
        document.getElementById('removeExistingFileFlag').value = 'true'; // 기존 파일 삭제 플래그 설정
        // existingFilePath는 초기화하지 않음 (새 파일 선택 시 플래그 설정을 위해 유지)
        document.getElementById('dropAreaText').style.display = 'block'; // 드롭 영역 텍스트 표시
        console.log('기존 파일 삭제 완료, removeExistingFileFlag:', document.getElementById('removeExistingFileFlag').value);
    }
    
    return false;
}

// DOM 로드 후 실행 (window.onload 사용)
window.onload = function() {
    var dropArea = document.getElementById('dropArea');
    var formFile = document.getElementById('formFile');
    var fileList = document.getElementById('fileList');
    
    // 기존 파일이 있으면 드롭 영역 텍스트 숨기기
    if (fileList && fileList.children.length > 0) {
        document.getElementById('dropAreaText').style.display = 'none';
    }

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
        console.log('드롭 핸들러 시작');
        var dt = e.dataTransfer;
        var files = dt.files;

        if (files.length > 0) {
            console.log('드롭된 파일:', files[0].name);
            var file = files[0];
            if (!file.name.toLowerCase().endsWith('.zip')) {
                alert('ZIP 파일만 업로드 가능합니다.');
                return;
            }
            formFile.files = files;
            displayFiles(files);
            // 기존 파일이 있으면 삭제 플래그 설정
            if (document.getElementById('existingFilePath').value) {
                document.getElementById('removeExistingFileFlag').value = 'true';
                console.log('드롭으로 인한 기존 파일 삭제 플래그 설정');
            }
        }
    }

    // 드래그 앤 드롭 이벤트 등록
    if (dropArea) {
        // dropArea와 document.body에 대한 preventDefaults 등록
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
            document.body.addEventListener(eventName, preventDefaults, false);
        });

        // highlight 이벤트 등록
        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });

        // unhighlight 이벤트 등록
        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });

        // 드롭 영역 클릭 시 파일 선택창 열기 (fileList 내부 클릭 제외)
        dropArea.addEventListener('click', function(e) {
            // fileList 또는 그 내부 요소를 클릭한 경우 파일 선택창 열지 않음
            if (fileList.contains(e.target) && e.target !== dropArea) {
                return;
            }
            formFile.click();
        });
        
        dropArea.addEventListener('drop', dropHandler, false);
    }

    if (formFile) {
        formFile.addEventListener('change', function() {
            console.log('파일 선택됨:', this.files.length);
            if (this.files.length > 0) {
                console.log('파일명:', this.files[0].name);
                displayFiles(this.files);
                // 새 파일이 선택되면 기존 파일 삭제 플래그 설정
                var existingPath = document.getElementById('existingFilePath').value;
                console.log('기존 파일 경로:', existingPath);
                if (existingPath && existingPath.trim() !== '') {
                    document.getElementById('removeExistingFileFlag').value = 'true';
                    console.log('기존 파일 삭제 플래그 설정됨');
                }
            }
        });
    }
};
</script>

<jsp:include page="footer.jsp" />
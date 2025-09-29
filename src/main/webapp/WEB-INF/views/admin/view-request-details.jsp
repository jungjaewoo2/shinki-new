<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">의뢰내용 상세보기</div>
         <div class="breadcrumb">관리자페이지 > 의뢰관리 > 의뢰내용 상세보기</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <!-- 메시지 표시 -->
         <c:if test="${not empty success}">
             <div class="alert alert-success alert-dismissible fade show" role="alert">
                 ${success}
                 <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
             </div>
         </c:if>
         
         <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 ${error}
                 <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
             </div>
         </c:if>
         
         <div class="card">
             <div class="card d-flex flex-column gap-3 mb-3">
                 <div class="d-flex gap-3">
                     <div class="fw-bold">주문고객</div>
                     <div class="d-flex gap-3">
                        <div>(${request.member.hospitalName} / ${request.member.username})</div>
                         <div>/</div>
                        <div>${request.member.phone}</div>
                         <div>/</div>
                        <div>${request.member.email}</div>
                     </div>
                 </div>
                 <div class="d-flex gap-3">
                     <!--<div class="d-flex gap-3">
                         <div class="fw-bold">주문번호</div>
                        <div>${request.id}</div>
                     </div>-->
                    <div class="d-flex gap-3">
                        <div class="fw-bold">주문일시</div>
                       <div>
                           <c:choose>
                               <c:when test="${request.createdAt != null}">
                                   ${request.createdAt.toString().replace('T', ' ').substring(0, 19)}
                               </c:when>
                               <c:otherwise>-</c:otherwise>
                           </c:choose>
                       </div>
                    </div>
                     <div class="d-flex gap-3">
                         <div class="fw-bold">추천코드</div>
                        <div>${request.member.recommendCode != null ? request.member.recommendCode : '-'}</div>
                     </div>
                 </div>
             </div>
             <div class="">
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
                        <input type="radio" name="privacy" value="agree" ${request.privacyAgreed ? 'checked' : ''} disabled> 동의합니다.
                    </label>
                    <label class="checkbox-item">
                        <input type="radio" name="privacy" value="disagree" ${!request.privacyAgreed ? 'checked' : ''} disabled> 동의하지 않습니다.
                     </label>
                 </div>
             </div>
             <div class="">
                 <div class="">
                     <table class="table table-bordered ">
                         <colgroup>
                             <col width="15%">
                             <col width="85%">
                         </colgroup>
                         <tbody class="text-start">
                             <tr>
                                 <th class="text-start">
                                     <label class="form-label required w-100">Application</label>
                                 </th>
                                 <td class="text-start">
                                     <c:choose>
                                         <c:when test="${request.applicationType == 'HBP'}">심장혈관</c:when>
                                         <c:when test="${request.applicationType == 'LUNG'}">폐</c:when>
                                         <c:when test="${request.applicationType == 'CARDIAC'}">심장</c:when>
                                         <c:when test="${request.applicationType == 'KNEE'}">무릎</c:when>
                                         <c:otherwise>${request.applicationType}</c:otherwise>
                                     </c:choose>
                                 </td>
                             </tr>
                             <tr>
                                 <th class="text-start"><label class="form-label required w-100">제목</label></th>
                                 <td class="text-start">${request.title}</td>
                             </tr>
                             <tr>
                                 <th class="text-start"><label class="form-label required w-100">의뢰내용</label></th>
                                 <td class="text-start" style="white-space: pre-wrap; word-wrap: break-word;">${request.content}</td>
                             </tr>
                             <tr>
                                 <th class="text-start">첨부파일</th>
                                 <td class="text-start">
                                    <c:choose>
                                        <c:when test="${not empty request.filePath}">
                                     <div class="d-flex align-items-center gap-5 w-100">
                                         <div class="d-flex flex-column flex-fill gap-1">
                                             <div class="d-flex align-items-end gap-3">
                                                 <div class="d-flex gap-3">
                                                     <span>1. </span>
                                                     <a href="/admin/download-request-file?filePath=${request.filePath}" class="text-decoration-none">
                                                         <img src="../assets_admin/images/download-icon.png" alt="다운로드">
                                                     </a>
                                                 </div>
                                                        <div>
                                                            <c:choose>
                                                                <c:when test="${fn:contains(request.filePath, '_')}">
                                                                    ${fn:substring(request.filePath, fn:indexOf(request.filePath, '_') + 1, -1)}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${request.filePath}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                 <div class="btn p-0"><i class="bi bi-trash3"></i></div>
                                             </div>
                                         </div>
                                     </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div>첨부파일이 없습니다.</div>
                                        </c:otherwise>
                                    </c:choose>
                                 </td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
             <div class="mb-3">
                 <div class="fw-bold">작업 완료된 첨부 파일</div>
                 <div class="d-flex align-items-center gap-5 border p-3">
                     <div class="d-flex flex-column flex-fill gap-1">
                         <!-- 관리자가 업로드한 작업 완료 파일들만 표시 -->
                         <c:choose>
                             <c:when test="${request.status == '작업 완료' && not empty request.adminFilePath}">
                                 <c:set var="adminFiles" value="${fn:split(request.adminFilePath, '|')}"/>
                                 <c:forEach var="adminFile" items="${adminFiles}" varStatus="status">
                                     <c:if test="${not empty fn:trim(adminFile)}">
                                         <div class="d-flex align-items-end gap-3 border-bottom pb-2 mb-2">
                                             <div class="d-flex gap-3">
                                                 <span>${status.index + 1}. </span>
                                                 <a href="/admin/download-request-file?filePath=${fn:trim(adminFile)}" class="text-decoration-none">
                                                     <img src="../assets_admin/images/download-icon.png" alt="다운로드">
                                                 </a>
                                             </div>
                                             <div class="flex-grow-1">
                                                 <c:choose>
                                                     <c:when test="${fn:contains(fn:trim(adminFile), '_')}">
                                                         ${fn:substring(fn:trim(adminFile), fn:indexOf(fn:trim(adminFile), '_') + 1, -1)}
                                                     </c:when>
                                                     <c:otherwise>
                                                         ${fn:trim(adminFile)}
                                                     </c:otherwise>
                                                 </c:choose>
                                             </div>
                                             <div>
                                                 <button type="button" class="btn btn-sm btn-outline-danger" 
                                                         onclick="deleteAdminFile('${fn:trim(adminFile)}')" 
                                                         title="파일 삭제">
                                                     <i class="bi bi-trash3"></i>
                                                 </button>
                                             </div>
                                         </div>
                                     </c:if>
                                 </c:forEach>
                             </c:when>
                             <c:when test="${request.status == '작업 완료'}">
                                 <div class="text-muted">작업 완료된 파일이 없습니다.</div>
                             </c:when>
                             <c:otherwise>
                                 <div class="text-muted">작업이 완료되면 파일이 표시됩니다.</div>
                             </c:otherwise>
                         </c:choose>
                     </div>
                     
                     <!-- 전체 다운로드 버튼 (관리자 파일이 있는 경우만) -->
                     <c:if test="${request.status == '작업 완료' && not empty request.adminFilePath}">
                         <div class="all-download-btn">
                             <button class="btn btn-outline-secondary download" onclick="downloadAllFiles()">
                                 <i class="bi bi-download text-warning"></i> 
                                 <span class="fw-bold">전체 다운로드</span>
                             </button>
                         </div>
                     </c:if>
                 </div>
             </div>
             <div class="">
                 <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">댓글 작성</label>
                     <!--댓글 ui 추가-->
                     <div class="form-group flex-column align-items-baseline gap-1 mb-0">
                         <div class="bg-body-tertiary w-100 text-black-50 d-flex flex-column gap-3">
                            <c:choose>
                                <c:when test="${not empty userComments}">
                                    <c:forEach var="comment" items="${userComments}" varStatus="status">
                                        <div class="comment-item border-bottom pb-3">
                                            <!-- 사용자 댓글 -->
                                            <div class="user-comment p-3 bg-white rounded mb-2">
                                                <div class="d-flex justify-content-between align-items-start mb-2">
                                                    <div class="fw-bold text-primary">사용자 댓글</div>
                                                    <small class="text-muted">
                                                        <c:choose>
                                                            <c:when test="${comment.userCreatedAt != null}">
                                                                <fmt:formatDate value="${comment.userCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                                                            </c:when>
                                                            <c:otherwise>-</c:otherwise>
                                                        </c:choose>
                                                    </small>
                                                </div>
                                                <div class="comment-content mb-3" style="white-space: pre-wrap;">${comment.userContent}</div>
                                                
                             <!-- 답글 작성 폼 -->
                             <c:if test="${canReply}">
                                 <div class="reply-form">
                                     <form method="post" action="/admin/view-request-details/reply-to-comment">
                                         <input type="hidden" name="requestId" value="${request.id}">
                                         <input type="hidden" name="parentId" value="${comment.id}">
                                         <div class="mb-2">
                                             <textarea name="adminContent" class="form-control" rows="2" placeholder="답글을 입력하세요"></textarea>
                                         </div>
                                         <div class="text-end">
                                             <button type="submit" class="btn btn-primary btn-sm">답글 등록</button>
                                         </div>
                                     </form>
                                 </div>
                             </c:if>
                                            </div>
                                            
                                            <!-- 해당 댓글의 답글들 -->
                                            <c:set var="replies" value="${comment.replies}" />
                                            <c:if test="${not empty replies}">
                                                <div class="replies ms-4">
                                                    <c:forEach var="reply" items="${replies}">
                                                        <div class="reply-item p-2 bg-light rounded mb-2">
                                                            <div class="d-flex justify-content-between align-items-start mb-1">
                                                                <div class="fw-bold text-success">관리자 답글</div>
                                                                <small class="text-muted">
                                                                    <c:choose>
                                                                        <c:when test="${reply.adminCreatedAt != null}">
                                                                            <fmt:formatDate value="${reply.adminCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                                                                        </c:when>
                                                                        <c:otherwise>-</c:otherwise>
                                                                    </c:choose>
                                                                </small>
                                                            </div>
                                                            <div class="reply-content" style="white-space: pre-wrap;">${reply.adminContent}</div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="p-3 text-center text-muted">
                                        등록된 댓글이 없습니다.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                         </div>
                     </div>
                     <!--답변 ui 추가-->
                 </div>
             </div>
         </div>
         <div class="card">
             <div class="d-flex gap-3 mb-1">
                 <div class="fw-bold">처리상태</div>
                 <div>
                    <form method="post" action="/admin/view-request-details/update-status">
                        <input type="hidden" name="requestId" value="${request.id}">
                     <div class="d-flex gap-4">
                         <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault1" value="의뢰 확인중" ${request.status == '의뢰 확인중' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                             <label class="form-check-label" for="radioDefault1">
                                 의뢰 확인중
                             </label>
                         </div>
                         <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault2" value="견적중" ${request.status == '견적중' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                             <label class="form-check-label" for="radioDefault2">
                                 견적중
                             </label>
                         </div>
                         <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault3" value="결제 진행" ${request.status == '결제 진행' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                             <label class="form-check-label" for="radioDefault3">
                                 결제 진행
                             </label>
                         </div>
                         <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault4" value="작업중" ${request.status == '작업중' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                             <label class="form-check-label" for="radioDefault4">
                                 작업중
                             </label>
                         </div>
                         <div class="form-check d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="status" id="radioDefault5" value="작업 완료" ${request.status == '작업 완료' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                             <label class="form-check-label" for="radioDefault5">
                                 작업 완료
                             </label>
                         </div>
                     </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary" ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>상태 변경</button>
                        </div>
                    </form>
                 </div>
             </div>
             
             <!-- 취소상태 섹션 추가 -->
             <div class="d-flex gap-3 mb-1 mt-3">
                 <div class="fw-bold">취소상태</div>
                 <div>
                    <form method="post" action="/admin/view-request-details/update-cancel-status">
                        <input type="hidden" name="requestId" value="${request.id}">
                 <div class="d-flex gap-4">
                     <div class="form-check d-flex align-items-center gap-2">
                            <input class="form-check-input" type="radio" name="statusCancel" id="cancelRadio6" value="취소 요청" ${request.status == '취소 요청' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                         <label class="form-check-label" for="cancelRadio6">
                             취소 요청
                         </label>
                     </div>
                     <div class="form-check d-flex align-items-center gap-2">
                            <input class="form-check-input" type="radio" name="statusCancel" id="cancelRadio7" value="취소 진행중" ${request.status == '취소 진행중' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                         <label class="form-check-label" for="cancelRadio7">
                             취소 진행중
                         </label>
                     </div>
                     <div class="form-check d-flex align-items-center gap-2">
                            <input class="form-check-input" type="radio" name="statusCancel" id="cancelRadio8" value="취소 완료" ${request.status == '취소 완료' ? 'checked' : ''} ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>
                         <label class="form-check-label" for="cancelRadio8">
                             취소 완료
                         </label>
                     </div>
                 </div>
                    <div class="mt-3">
                        <button type="submit" class="btn btn-warning" ${!canModify && adminAuthority != '모든권한' ? 'disabled' : ''}>상태 변경</button>
                    </div>
                    </form>
                 </div>
             </div>
             
             <!-- 결제금액 관리 섹션 -->
             <c:if test="${canModify || adminAuthority == '모든권한'}">
                 <div class="d-flex gap-3 mb-1 mt-3">
                     <div class="fw-bold">결제금액 관리</div>
                     <div>
                         <form method="post" action="/admin/view-request-details/update-payment">
                             <input type="hidden" name="requestId" value="${request.id}">
                             <div class="d-flex align-items-center gap-3">
                                 <div class="d-flex align-items-center gap-2">
                                     <input type="number" name="paymentAmount" id="paymentAmount" class="form-control" 
                                            style="width: 200px;" value="${request.paymentAmount != null ? request.paymentAmount : ''}" 
                                            placeholder="금액을 입력하세요">
                                 </div>
                                 <button type="submit" class="btn btn-success">결제정보 저장</button>
                             </div>
                         </form>
                     </div>
                 </div>
             </c:if>
             
             <div class="process-content bg-body-tertiary p-3 border-top border-dark">
                 <div class="content-list">
                     <div class="fw-bold">결제수단</div>
                     <div class="d-flex gap-3 pb-1">
                         <div>
                             <c:choose>
                                 <c:when test="${not empty request.paymentMethod}">
                                     ${request.paymentMethod}
                                 </c:when>
                                 <c:otherwise>
                                     계좌입금 or 신용카드
                                 </c:otherwise>
                             </c:choose>
                         </div>
                         <div>/</div>
                         <div>
                             <c:choose>
                                 <c:when test="${not empty request.paymentStatus}">
                                     ${request.paymentStatus}
                                 </c:when>
                                 <c:otherwise>
                                     일시불 및 할부내역 입력
                                 </c:otherwise>
                             </c:choose>
                         </div>
                     </div>
                    <div class="border-top d-flex gap-3 justify-content-end pt-1">
                        <div class="fw-bold">총 결제금액</div>
                        <div>
                           <!-- 디버깅: paymentAmount 값 확인 -->
                           <c:choose>
                               <c:when test="${not empty request.paymentAmount}">
                                   <fmt:formatNumber value="${request.paymentAmount}" pattern="#,###" />원
                               </c:when>
                              <c:otherwise>
                                  0원
                              </c:otherwise>
                           </c:choose>
                        </div>
                    </div>
                 </div>

                 <div class="content-list">
                     <div class="file-upload-area w-100 border border-dashed border-2 p-4 text-center" 
                          ondrop="dropHandler(event);" ondragover="dragOverHandler(event);" ondragleave="dragLeaveHandler(event);"
                          style="border-color: #6c757d; background-color: #f8f9fa; min-height: 150px;">
                         <div class="upload-icon mb-3">
                             <i class="bi bi-cloud-upload" style="font-size: 3rem; color: #6c757d;"></i>
                         </div>
                         <p class="mb-3 text-muted">첨부하실 파일을 마우스로 끌어서 넣어주세요.</p>

                         <div class="mb-3">
                             <input class="form-control" type="file" id="fileInput" multiple style="display: none;" accept="*/*">
                             <button type="button" class="btn btn-outline-primary" onclick="document.getElementById('fileInput').click()">
                                 <i class="bi bi-plus-circle"></i> 파일 선택
                             </button>
                         </div>
                         
                         <small class="text-muted">여러 파일을 동시에 선택할 수 있습니다.</small>
                     </div>

                     <!-- 선택된 파일 목록 -->
                     <div id="selectedFilesList" class="mt-3" style="display: none;">
                         <h6 class="text-primary">
                             <i class="bi bi-files"></i> 선택된 파일 (0개)
                         </h6>
                         <div id="filesList" class="list-group"></div>
                     </div>
                     
                     <div class="button-group flex-row justify-content-end gap-2 w-100 mt-3">
                         <button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteSelectedFiles()" disabled>
                             <i class="bi bi-trash"></i> 선택 삭제
                         </button>
                         <button type="button" class="btn btn-primary" id="uploadBtn" onclick="uploadFiles()" disabled>
                             <i class="bi bi-upload"></i> 업로드
                         </button>
                     </div>
                 </div>
             </div>

         </div>
         <div class="d-flex gap-1 justify-content-center mt-3">
             <!--<button class="btn btn-lg btn-outline-secondary" onclick="location.href='/admin/view-request-details?id=${request.id}'">확인</button>-->
             <button class="btn btn-lg btn-secondary" onclick="location.href='/admin/request-history'">목록</button>
         </div>
     </div>
 </div>

<!-- 처리상태 JS -->
<script>
    // 파일 업로드 관련 변수
    let selectedFiles = [];
    let selectedFileIds = [];
    let fileUploadSystem = null;
    
    // JSP에서 전달받은 값들
    const REQUEST_ID = '<c:out value="${request.id}"/>';

    // 파일 업로드 시스템 객체
    class FileUploadSystem {
        constructor() {
            this.selectedFiles = [];
            this.selectedFileIds = [];
            this.isInitialized = false;
            this.fileInput = null;
            this.filesList = null;
            this.selectedFilesList = null;
            this.uploadBtn = null;
            this.deleteBtn = null;
        }

        // 초기화
        init() {
            console.log('=== FileUploadSystem 초기화 시작 ===');
            
            // DOM 요소들 찾기
            this.fileInput = document.getElementById('fileInput');
            this.filesList = document.getElementById('filesList');
            this.selectedFilesList = document.getElementById('selectedFilesList');
            this.uploadBtn = document.getElementById('uploadBtn');
            this.deleteBtn = document.getElementById('deleteBtn');

            // 요소 존재 확인
            if (!this.fileInput || !this.filesList || !this.selectedFilesList) {
                console.error('필수 DOM 요소를 찾을 수 없습니다!');
                return false;
            }

            // 기존 이벤트 리스너 제거
            if (this.fileInput) {
                const newFileInput = this.fileInput.cloneNode(true);
                this.fileInput.parentNode.replaceChild(newFileInput, this.fileInput);
                this.fileInput = newFileInput;
            }

            // 이벤트 리스너 등록
            this.setupEventListeners();
            
            // 초기 상태 설정
            this.reset();
            this.updateDisplay();
            
            this.isInitialized = true;
            console.log('=== FileUploadSystem 초기화 완료 ===');
            return true;
        }

        // 이벤트 리스너 설정
        setupEventListeners() {
            if (this.fileInput) {
                this.fileInput.addEventListener('change', (e) => this.handleFileSelect(e));
            }
        }

        // 드래그 앤 드롭 이벤트 핸들러들
        dragOverHandler(ev) {
            ev.preventDefault();
            ev.dataTransfer.dropEffect = "copy";
            ev.currentTarget.style.backgroundColor = '#e3f2fd';
            ev.currentTarget.style.borderColor = '#2196f3';
        }

        dragLeaveHandler(ev) {
            ev.currentTarget.style.backgroundColor = '#f8f9fa';
            ev.currentTarget.style.borderColor = '#6c757d';
        }

        dropHandler(ev) {
            ev.preventDefault();
            ev.currentTarget.style.backgroundColor = '#f8f9fa';
            ev.currentTarget.style.borderColor = '#6c757d';
            const files = Array.from(ev.dataTransfer.files);
            console.log('드래그 앤 드롭 파일:', files);
            this.addFiles(files);
        }

        // 파일 선택 핸들러
        handleFileSelect(e) {
            console.log('=== 파일 선택 이벤트 ===');
            if (e.target.files && e.target.files.length > 0) {
                const files = Array.from(e.target.files);
                console.log('선택된 파일들:', files.map(f => f.name));
                this.addFiles(files);
            }
        }

        // 파일 추가
        addFiles(files) {
            console.log('파일 추가 시작:', files.length + '개');
            
            files.forEach(file => {
                if (!this.selectedFiles.some(f => f.name === file.name && f.size === file.size)) {
                    this.selectedFiles.push(file);
                    console.log('파일 추가됨:', file.name);
                }
            });
            
            this.updateDisplay();
            this.updateButtons();
        }

        // 파일 목록 표시 업데이트
        updateDisplay() {
            if (!this.filesList || !this.selectedFilesList) return;

            if (this.selectedFiles.length === 0) {
                this.selectedFilesList.style.display = 'none';
                return;
            }

            this.selectedFilesList.style.display = 'block';

            // 제목 업데이트
            const titleElement = this.selectedFilesList.querySelector('h6');
            if (titleElement) {
                titleElement.innerHTML = '<i class="bi bi-files"></i> 선택된 파일 (' + this.selectedFiles.length + '개)';
            }

            // 파일 목록 렌더링
            this.filesList.innerHTML = '';
            this.selectedFiles.forEach((file, index) => {
                const fileItem = document.createElement('div');
                fileItem.className = 'list-group-item d-flex justify-content-between align-items-center';
                fileItem.innerHTML = 
                    '<div class="d-flex align-items-center">' +
                        '<input type="checkbox" class="form-check-input me-2" id="file_' + index + '" onchange="fileUploadSystem.updateSelectedFiles()">' +
                        '<div>' +
                            '<label for="file_' + index + '" class="mb-0 fw-bold">' + file.name + '</label>' +
                            '<br>' +
                            '<small class="text-muted">' + this.formatFileSize(file.size) + '</small>' +
                        '</div>' +
                    '</div>' +
                    '<div>' +
                        '<span class="badge bg-secondary">' + this.getFileType(file.name) + '</span>' +
                    '</div>';
                this.filesList.appendChild(fileItem);
            });
        }

        // 선택된 파일 업데이트
        updateSelectedFiles() {
            this.selectedFileIds = [];
            const checkboxes = document.querySelectorAll('#filesList input[type="checkbox"]:checked');
            checkboxes.forEach(checkbox => {
                const index = parseInt(checkbox.id.split('_')[1]);
                this.selectedFileIds.push(index);
            });
            this.updateButtons();
        }

        // 버튼 상태 업데이트
        updateButtons() {
            if (this.uploadBtn) {
                this.uploadBtn.disabled = this.selectedFiles.length === 0;
            }
            if (this.deleteBtn) {
                this.deleteBtn.disabled = this.selectedFileIds.length === 0;
            }
        }

        // 선택된 파일 삭제
        deleteSelectedFiles() {
            if (this.selectedFileIds.length === 0) {
                alert('삭제할 파일을 선택해주세요.');
                return;
            }
            
            // 역순으로 삭제 (인덱스 변화 방지)
            this.selectedFileIds.sort((a, b) => b - a).forEach(index => {
                this.selectedFiles.splice(index, 1);
            });
            
            this.selectedFileIds = [];
            this.updateDisplay();
            this.updateButtons();
        }

        // 파일 업로드
        uploadFiles() {
            if (this.selectedFiles.length === 0) {
                alert('업로드할 파일을 선택해주세요.');
                return;
            }

            const formData = new FormData();
            this.selectedFiles.forEach(file => {
                formData.append('files', file);
            });
            formData.append('requestId', REQUEST_ID);

            fetch('/admin/upload-admin-files', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('파일이 성공적으로 업로드되었습니다.');
                    this.reset();
                    location.reload();
                } else {
                    alert('파일 업로드 중 오류가 발생했습니다: ' + data.message);
                }
            })
            .catch(error => {
                console.error('업로드 오류:', error);
                alert('파일 업로드 중 오류가 발생했습니다.');
            });
        }

        // 시스템 리셋
        reset() {
            this.selectedFiles = [];
            this.selectedFileIds = [];
            if (this.fileInput) this.fileInput.value = '';
            this.updateDisplay();
            this.updateButtons();
        }

        // 파일 크기 포맷팅
        formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
        }

        // 파일 타입 가져오기
        getFileType(fileName) {
            const extension = fileName.split('.').pop().toLowerCase();
            const typeMap = {
                'pdf': 'PDF', 'doc': 'DOC', 'docx': 'DOCX', 'xls': 'XLS', 'xlsx': 'XLSX',
                'jpg': 'JPG', 'jpeg': 'JPEG', 'png': 'PNG', 'gif': 'GIF', 'txt': 'TXT',
                'zip': 'ZIP', 'rar': 'RAR'
            };
            return typeMap[extension] || extension.toUpperCase();
        }
    }

    // 글로벌 함수들 (HTML에서 호출)
    function dragOverHandler(ev) {
        if (fileUploadSystem) fileUploadSystem.dragOverHandler(ev);
    }

    function dragLeaveHandler(ev) {
        if (fileUploadSystem) fileUploadSystem.dragLeaveHandler(ev);
    }

    function dropHandler(ev) {
        if (fileUploadSystem) fileUploadSystem.dropHandler(ev);
    }

    function deleteSelectedFiles() {
        if (fileUploadSystem) fileUploadSystem.deleteSelectedFiles();
    }

    function uploadFiles() {
        if (fileUploadSystem) fileUploadSystem.uploadFiles();
    }

    // 전체 다운로드 함수
    function downloadAllFiles() {
        const downloadLinks = document.querySelectorAll('a[href*="download-request-file"]');
        
        if (downloadLinks.length === 0) {
            alert('다운로드할 파일이 없습니다.');
            return;
        }
        
        // 각 파일을 순차적으로 다운로드
        downloadLinks.forEach((link, index) => {
            setTimeout(() => {
                // 새 창에서 다운로드 링크 실행
                const downloadFrame = document.createElement('iframe');
                downloadFrame.style.display = 'none';
                downloadFrame.src = link.href;
                document.body.appendChild(downloadFrame);
                
                // 다운로드 완료 후 iframe 제거
                setTimeout(() => {
                    document.body.removeChild(downloadFrame);
                }, 1000);
            }, index * 500); // 500ms 간격으로 순차 다운로드
        });
        
        alert(`총 ${downloadLinks.length}개 파일의 다운로드를 시작합니다.`);
    }

    // 관리자 파일 삭제 함수
    function deleteAdminFile(fileName) {
        if (!fileName || fileName.trim() === '') {
            alert('삭제할 파일명이 올바르지 않습니다.');
            return;
        }
        
        // 파일명에서 타임스탬프 제거하여 원본 파일명 표시
        let displayName = fileName;
        if (fileName.includes('_')) {
            displayName = fileName.substring(fileName.indexOf('_') + 1);
        }
        
        if (!confirm(`정말로 "${displayName}" 파일을 삭제하시겠습니까?\n\n삭제된 파일은 복구할 수 없습니다.`)) {
            return;
        }
        
        // 서버로 삭제 요청 전송
        fetch('/admin/delete-admin-file', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                requestId: REQUEST_ID,
                fileName: fileName.trim()
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('파일이 성공적으로 삭제되었습니다.');
                location.reload(); // 페이지 새로고침하여 변경사항 반영
            } else {
                alert('파일 삭제 중 오류가 발생했습니다: ' + data.message);
            }
        })
        .catch(error => {
            console.error('파일 삭제 오류:', error);
            alert('파일 삭제 중 오류가 발생했습니다.');
        });
    }

    // DOM 로드 완료 후 실행
    document.addEventListener('DOMContentLoaded', function() {
        console.log('=== DOM 로드 완료 ===');
        
        const radios = document.querySelectorAll('input[name="status"]');
        const allDownloadBtn = document.querySelector('.all-download-btn');
        const processContent = document.querySelector('.process-content');
        const contentLists = document.querySelectorAll('.process-content > .content-list');

        // 파일 업로드 시스템 초기화
        fileUploadSystem = new FileUploadSystem();

        function updateDisplay() {
            console.log('=== 상태 표시 업데이트 ===');
            
            // 모든 요소의 표시를 초기화
            if (allDownloadBtn) allDownloadBtn.style.display = 'none';
            if (processContent) processContent.style.display = 'none';
            contentLists.forEach(list => list.style.display = 'none');

            // 현재 선택된 상태 확인
            let currentStatus = 'none';
            if (document.querySelector('#radioDefault1')?.checked) currentStatus = '의뢰 확인중';
            else if (document.querySelector('#radioDefault2')?.checked) currentStatus = '견적중';
            else if (document.querySelector('#radioDefault3')?.checked) currentStatus = '결제 진행';
            else if (document.querySelector('#radioDefault4')?.checked) currentStatus = '작업중';
            else if (document.querySelector('#radioDefault5')?.checked) currentStatus = '작업 완료';
            
            console.log('현재 처리 상태:', currentStatus);

            // 상태별 UI 표시/숨김
            switch(currentStatus) {
                case '의뢰 확인중':
                    break;
                case '견적중':
                    if (allDownloadBtn) allDownloadBtn.style.display = 'block';
                    break;
                case '결제 진행':
                    if (allDownloadBtn) allDownloadBtn.style.display = 'block';
                    if (processContent) processContent.style.display = 'block';
                    if (contentLists[0]) contentLists[0].style.display = 'block';
                    break;
                case '작업중':
                    console.log('🔧 작업중 상태 - 파일 업로드 영역 활성화');
                    if (allDownloadBtn) allDownloadBtn.style.display = 'block';
                    if (processContent) processContent.style.display = 'block';
                    if (contentLists[0]) contentLists[0].style.display = 'none';
                    if (contentLists[1]) contentLists[1].style.display = 'block';
                    
                    // 파일 업로드 시스템 초기화
                    setTimeout(() => {
                        if (fileUploadSystem && !fileUploadSystem.isInitialized) {
                            fileUploadSystem.init();
                        }
                    }, 100);
                    break;
                case '작업 완료':
                    break;
            }
        }

        // 라디오 버튼 이벤트 리스너 등록
        radios.forEach(radio => {
            radio.addEventListener('change', updateDisplay);
        });

        // 초기 상태 설정
        updateDisplay();
        
        // 페이지 로드 시 파일 업로드 시스템 초기화 시도
        setTimeout(() => {
            if (fileUploadSystem && !fileUploadSystem.isInitialized) {
                fileUploadSystem.init();
            }
        }, 500);
    });
</script>

<jsp:include page="footer.jsp" />

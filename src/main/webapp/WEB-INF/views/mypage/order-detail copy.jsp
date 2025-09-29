<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="order-detail page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">의뢰 현황</div>
         <div class="breadcrumb">마이페이지 > 의뢰 내역 > 의뢰 목록 / 현황</div>
     </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="card">
             <div class="card-header">
                 <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                     <div>
                         <div style="font-weight: bold;">
                             <c:choose>
                                 <c:when test="${not empty request.createdAt}">
                                     ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/>                                  </c:when>
                                 <c:otherwise>
                                     2025.05.29 ${request.status}
                                 </c:otherwise>
                             </c:choose>
                         </div>

                     </div>
                 </div>

             </div>
             <div class="d-flex justify-content-between align-items-lg-center flex-column flex-lg-row gap-3">
                 <div class="order-type text-center bg-body-secondary rounded" style="color: #666;">
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and request.applicationType == 'HBP'}">
                                 <img src="/assets/images/app-btn1.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'LUNG'}">
                                 <img src="/assets/images/app-btn2.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'CARDIAC'}">
                                 <img src="/assets/images/app-btn3.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'KNEE'}">
                                 <img src="/assets/images/app-btn4.png">
                             </c:when>
                             <c:otherwise>
                                 <img src="/assets/images/app-btn1.png">
                             </c:otherwise>
                         </c:choose>
                     </div>
                     <div>${not empty request ? request.applicationType : 'HBP'}</div>
                 </div>
                 <div class="flex-fill align-items-center d-flex">${not empty request ? request.title : '제목 없음'}</div>
                 <div class="status-badge status-progress align-items-center d-flex">
                     <span class="">
                        <c:out value="${not empty request ? request.status : '상태 없음'}"/>
                     </span>
                 </div>
             </div>
         </div>
         
         
         <!---진행바 시작-->
         <div class="card progress-box d-flex gap-3">
             <div>
                 <div class="progress-stacked">
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '의뢰 확인중' || request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">의뢰 확인중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">견적중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">결제 진행</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">작업중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.status == '작업 완료' ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">작업 완료</span></div>
                     </div>
                 </div>
             </div>
            
            
            
            
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step1-panel">
                 <div class="fw-bold mb-3 progress-title">1단계_접수 및 파일 업로드</div>
                 <div class="bg-white p-3">
                     <div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 서비스 의뢰 동의서</label>
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
                     <!--<div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 의뢰내용</label>
                         <textarea class="form-input" rows="1" placeholder="내용을 입력하세요" readonly>${not empty request ? request.content : ''}</textarea>
                     </div>-->
                     
                     <!--댓글 ui 추가-->
                     <div class="form-group flex-column align-items-baseline gap-1">

                        <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 답변</label>
                        <div class="bg-body-tertiary w-100 text-black-50 d-flex flex-column gap-3">
                            <div class="">
                                <div class="form-group flex-column align-items-baseline gap-1">
                                    <div class="bg-body-tertiary p-3 w-100 text-black-50 d-flex flex-column gap-3">
                                        <div class="">
                                            <div class="d-flex flex-column gap-3">
                                                <!--<div class="fw-bold"><i class="bi bi-person-circle"></i> 관리자1</div>-->

                                            </div>

                                        </div>
                                        <div>


                                        </div>
                                        <!-- 댓글 작성 폼 -->
                                        <form action="/mypage/order-detail/${request.id}/reply" method="post" class="d-flex flex-column gap-1 p-3 rounded-2 border">
                                            <div class="fw-bold">댓글</div>
                                            <textarea name="content" class="form-input" rows="3" placeholder="내용을 입력하세요" required></textarea>
                                            <div class="text-end">
                                                <button type="submit" class="btn btn-primary btn-sm">등록</button>
                                            </div>
                                        </form>
                                        
                                        <!-- 댓글 목록 -->
                                        <c:forEach var="comment" items="${userComments}">
                                            <div class="comment-item border-bottom pb-3 mb-3">
                                                <!-- 사용자 댓글 -->
                                                <div class="user-comment p-3 bg-white rounded mb-2">
                                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                                        <div class="fw-bold text-primary">사용자 댓글</div>
                                                        <small class="text-muted">
                                                            <fmt:formatDate value="${comment.userCreatedAt}" pattern="yyyy.MM.dd" />
                                                            <c:if test="${not empty comment.member}">
                                                                (${comment.member.name})
                                                            </c:if>
                                                        </small>
                                                    </div>
                                                    <div class="comment-content mb-3" style="white-space: pre-wrap;">${comment.userContent}</div>
                                                </div>
                                                
                                                <!-- 해당 댓글의 관리자 답글들 -->
                                                <c:if test="${not empty comment.replies}">
                                                    <div class="replies ms-4">
                                                        <c:forEach var="reply" items="${comment.replies}">
                                                            <div class="reply-item p-2 bg-light rounded mb-2">
                                                                <div class="d-flex justify-content-between align-items-start mb-1">
                                                                    <div class="fw-bold text-success">관리자 답글</div>
                                                                    <small class="text-muted">
                                                                        <fmt:formatDate value="${reply.adminCreatedAt}" pattern="yyyy.MM.dd" />
                                                                        <c:if test="${not empty reply.admin}">
                                                                            - ${reply.admin.name}
                                                                        </c:if>
                                                                    </small>
                                                                </div>
                                                                <div class="reply-content" style="white-space: pre-wrap;">${reply.adminContent}</div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                        
                                        <c:if test="${empty userComments}">
                                            <div class="text-center text-muted p-3">
                                                등록된 댓글이 없습니다.
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--댓글 ui 추가-->
                    
                     
                     
                     
                     
                     
                     
                     
                     
                     <div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 파일 업로드 현황</label>
                         <c:if test="${not empty request and not empty request.filePath}">
                             <div class="text-success">${request.filePath}</div>
                         </c:if>
                         <c:if test="${empty request or empty request.filePath}">
                             <div class="text-muted">업로드된 파일이 없습니다.</div>
                         </c:if>
                     </div>
                        <div class="text-center">
                          <c:choose>
                              <c:when test="${not empty request and (request.status == '작업 완료' || request.status == '취소 진행중' || request.status == '취소 완료')}">
                                  <button class="btn btn-danger" style="flex: 1;" disabled>수정하기</button>
                                  <button type="button" class="btn btn-secondary" style="flex: 1;" disabled>취소하기</button>
                              </c:when>
                              <c:otherwise>
                                  <a href="/mypage/edit-request/${request.id}" class="btn btn-danger" style="flex: 1;">수정하기</a>
                                  <button type="button" class="btn btn-secondary" style="flex: 1;" onclick="cancelRequest('${request.id}', event)" data-status="<c:out value="${request.status}"/>">취소하기</button>
                              </c:otherwise>
                          </c:choose>
                       </div>
                 </div>
             
             
             
             
             
             
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step2-panel">
                 <div class="fw-bold mb-3 progress-title">2단계_상담 및 견적안내</div>
                 <div class="align-items-center d-flex flex-column gap-3 bg-white p-3">
                     <div class="custom-spinner">
                         <!--<span class="spinner-dot"></span>-->
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                     </div>
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료')}">견적 완료</c:when>
                             <c:otherwise>견적중</c:otherwise>
                         </c:choose>
                     </div>
                     <div class="text-black-50">
                         <c:choose>
                             <c:when test="${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료')}">견적이 완료되었습니다.</c:when>
                             <c:otherwise>요청하신 내용으로 연락 예정입니다.</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step3-panel">
                 <div class="fw-bold mb-3 progress-title">3단계_결제정보</div>
                 <div class="bg-white p-3">
                     <div class="border-bottom pb-3" style="border-bottom: 1px dashed #d9d9d9 !important;">
                         <div class="fw-bold pb-3">결제수단</div>
                         <div class="text-secondary">계좌입금 or 신한카드 / 일시불 및 할부내역 입력</div>
                     </div>
                     <div class="d-flex justify-content-end gap-3 pt-1">총 결제금액 <span class="text-danger fw-bold">20,000,000원</span></div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step4-panel">
                 <div class="fw-bold mb-3 progress-title">4단계_작업 수행</div>
                 <div class="align-items-center d-flex flex-column gap-3 justify-content-center bg-white p-3">
                     <div class="custom-spinner">
                         <!--<span class="spinner-dot"></span>-->
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                     </div>
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and request.status == '작업 완료'}">작업 완료</c:when>
                             <c:when test="${not empty request and request.status == '작업중'}">작업중</c:when>
                             <c:otherwise>대기중</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step5-panel">
                 <div class="fw-bold mb-3 progress-title">5단계_작업 완료</div>
                 <div class="d-none d-lg-block bg-white p-3">
                     <c:choose>
                         <c:when test="${not empty request and request.status == '작업 완료'}">
                             <div class="">첨부파일을 다운로드하여 결과물을 확인해보세요.</div>
                         </c:when>
                         <c:otherwise>
                             <div class="text-muted">작업이 완료되면 결과물을 확인할 수 있습니다.</div>
                         </c:otherwise>
                     </c:choose>
                                           <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>No.</th>
                                  <th>의뢰내용</th>
                                  <th>다운로드 상태</th>
                                  <th>첨부파일</th>
                              </tr>
                          </thead>
                          <tbody class="">
                              <c:choose>
                                  <c:when test="${not empty request and request.status == '작업 완료'}">
                                      <tr>
                                          <td>Project${request.id}</td>
                                          <td class="w-50">
                                              <div class="request-details">${request.content}</div>
                                          </td>
                                          <td>작업 완료</td>
                                          <td>
                                              <c:if test="${not empty request.filePath}">
                                                  <button type="button" class="btn" onclick="downloadFile('${request.id}', '${request.filePath}')">
                                                      <img src="/assets/images/download-icon.png">
                                                  </button>
                                              </c:if>
                                              <c:if test="${empty request.filePath}">
                                                  <span class="text-muted">파일 없음</span>
                                              </c:if>
                                          </td>
                                      </tr>
                                  </c:when>
                                  <c:otherwise>
                                      <tr>
                                          <td colspan="4" class="text-center text-muted">작업이 완료되면 결과물을 확인할 수 있습니다.</td>
                                      </tr>
                                  </c:otherwise>
                              </c:choose>
                          </tbody>
                      </table>
                </div>
                                 <div class="d-block d-lg-none">
                     <c:choose>
                         <c:when test="${not empty request and request.status == '작업 완료'}">
                             <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                                 <div class="order-numb align-items-center d-flex justify-content-between">
                                     <div>No. Project${request.id}</div>
                                     <div>
                                         <c:if test="${not empty request.filePath}">
                                             <button type="button" class="btn btn-sm" onclick="downloadFile('${request.id}', '${request.filePath}')">
                                                 <img src="/assets/images/download-icon.png">
                                             </button>
                                         </c:if>
                                         <c:if test="${empty request.filePath}">
                                             <span class="text-muted">파일 없음</span>
                                         </c:if>
                                     </div>
                                 </div>
                                 <div class="order-contents">${request.content}</div>
                                 <div class="align-items-center d-flex justify-content-end">
                                     <div class="order-date">작업 완료</div>
                                 </div>
                             </div>
                         </c:when>
                         <c:otherwise>
                             <div class="text-center text-muted py-3">
                                 작업이 완료되면 결과물을 확인할 수 있습니다.
                             </div>
                         </c:otherwise>
                     </c:choose>
                 </div>
            </div>
         <!---진행바 끝-->






        </div>
    </div>
</div>

<!--<script>
document.addEventListener('DOMContentLoaded', function () {
    // 모든 .progress-step과 .prog-pane 요소를 선택
    const progressSteps = document.querySelectorAll('.progress-step');
    const progPanes = document.querySelectorAll('.prog-pane');

    // 초기 상태 설정: .active인 .progress-step에 맞는 .prog-pane만 표시
    function updatePanes() {
        // 모든 .prog-pane을 먼저 숨김
        progPanes.forEach(pane => {
            pane.style.display = 'none';
        });

        // .active 클래스가 있는 .progress-step을 찾아 해당 인덱스의 .prog-pane을 표시
        progressSteps.forEach((step, index) => {
            if (step.classList.contains('active')) {
                progPanes[index].style.display = 'block';
            }
        });
    }

    // 초기 로드 시 실행
    updatePanes();

    // .progress-step 클릭 시 .active 클래스 토글 및 .prog-pane 업데이트
    progressSteps.forEach(step => {
        step.addEventListener('click', function () {
            // 모든 .progress-step에서 .active 클래스 제거
            progressSteps.forEach(s => s.classList.remove('active'));
            // 클릭한 .progress-step에 .active 클래스 추가
            this.classList.add('active');
            // .prog-pane 업데이트
            updatePanes();
        });
    });
});
</script>-->

<script>
    document.addEventListener('DOMContentLoaded', function() {
   // 모든 .progress-step과 .prog-pane 요소를 선택
   const progressSteps = document.querySelectorAll('.progress-step');
   const progPanes = document.querySelectorAll('.prog-pane');

   // 마지막 .active 단계에 둥근 테두리 스타일 추가
   function updateActiveStepStyles() {
       // 모든 .progress-step에서 기존 스타일 초기화
       progressSteps.forEach(step => {
           step.style.borderTopRightRadius = '0';
           step.style.borderBottomRightRadius = '0';
       });

       // .active 클래스를 가진 마지막 요소 찾기
       const activeSteps = document.querySelectorAll('.progress-step.active');
       const lastActiveStep = activeSteps[activeSteps.length - 1];

       // 마지막 .active 요소에 둥근 테두리 스타일 추가
       if (lastActiveStep) {
           lastActiveStep.style.borderTopRightRadius = '50px';
           lastActiveStep.style.borderBottomRightRadius = '50px';
       }
   }

   // 특정 .prog-pane만 표시하는 함수
   function updatePanes(activeIndex) {
       // 모든 .prog-pane을 숨김
       progPanes.forEach(pane => {
           pane.style.display = 'none';
       });

       // activeIndex에 해당하는 .prog-pane만 표시
       if (activeIndex >= 0 && activeIndex < progPanes.length) {
           progPanes[activeIndex].style.display = 'block';
       }
   }

   // .active 클래스 업데이트: 클릭한 단계까지 모든 이전 단계에 .active 추가
   function updateActiveSteps(clickedIndex) {
       // 모든 .progress-step에서 .active 클래스 제거
       progressSteps.forEach(step => step.classList.remove('active'));

       // 클릭한 단계까지 모든 이전 단계에 .active 클래스 추가
       for (let i = 0; i <= clickedIndex; i++) {
           progressSteps[i].classList.add('active');
       }

       // .prog-pane 업데이트 (클릭한 단계에 해당하는 패널만 표시)
       updatePanes(clickedIndex);

       // 마지막 .active 단계에 스타일 적용
       updateActiveStepStyles();
   }

   // 초기 상태 설정
   function initialize() {
       // 초기 상태에서 첫 번째 .progress-step에 .active 추가
       if (progressSteps.length > 0) {
           progressSteps[0].classList.add('active');
           updatePanes(0);
           updateActiveStepStyles();
       }
   }

   // 초기 로드 시 실행
   initialize();

   // .progress-step 클릭 시 .active 클래스 업데이트 및 .prog-pane 업데이트
   progressSteps.forEach((step, index) => {
       step.addEventListener('click', function() {
           updateActiveSteps(index);
       });
   });
});
</script>

<jsp:include page="footer.jsp" />
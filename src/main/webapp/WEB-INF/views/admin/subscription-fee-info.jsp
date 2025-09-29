<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">구독료 안내</div>
         <div class="breadcrumb">관리자페이지 > 관리자 > 구독료 안내</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <div class="card">
             <div class="text-end">(VAT 포함)</div>
             <div class="d-none d-lg-block">
                 <table class="table table-bordered">
                     <colgroup>
                         <col width="33.333%">
                         <col width="33.333%">
                         <col width="33.333%">
                     </colgroup>
                     <thead>
                         <tr>
                             <th>Example</th>
                             <th>Operation</th>
                             <th>Subscription Cost</th>
                         </tr>
                     </thead>
                     <tbody class="">
                         <tr>
                             <td>1.Operaton 요청</td>
                             <td>
                                 * RUL S1 Segmentectomy<br>
                                 + RUL Lobectomy
                             </td>
                             <td>990,000원</td>
                         </tr>
                         <tr>
                             <td>1.Operaton 요청</td>
                             <td>
                                 * RUL S1 Segmentectomy<br>
                                 + RUL Lobectomy
                             </td>
                             <td>1,210,000원</td>
                         </tr>
                         <tr>
                             <td>1.Operaton 요청</td>
                             <td>
                                 * RUL S1 Segmentectomy<br>
                                 + RUL Lobectomy<br>
                                 + RUL Pneumonectomy
                             </td>
                             <td>1,430,000원</td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             <div class="d-block d-lg-none">
                 <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                     <div class="order-numb align-items-center d-flex gap-1">
                         <div>1.Operaton 요청</div>
                     </div>
                     <div class="download-contents d-flex align-items-baseline flex-column justify-content-between">
                         <div class="">* RUL S1 Segmentectomy<br>+ RUL Lobectomy</div>
                         <div class="w-100">
                             <div class="align-items-center d-flex justify-content-end gap-1"><span>[Subscription Cost]</span> <span class=""> 990,000원</span></div>
                         </div>
                     </div>

                 </div>
                 <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                     <div class="order-numb align-items-center d-flex gap-1">
                         <div>2.Operaton 요청</div>
                     </div>
                     <div class="download-contents d-flex align-items-baseline flex-column justify-content-between">
                         <div class="">* RUL S1 Segmentectomy<br>+ RUL Lobectomy</div>
                         <div class="w-100">
                             <div class="align-items-center d-flex justify-content-end gap-1"><span>[Subscription Cost]</span> <span class=""> 1,210,000원</span></div>
                         </div>
                     </div>

                 </div>
                 <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                     <div class="order-numb align-items-center d-flex gap-1">
                         <div>3.Operaton 요청</div>
                     </div>
                     <div class="download-contents d-flex align-items-baseline flex-column justify-content-between">
                         <div class="">* RUL S1 Segmentectomy<br>+ RUL Lobectomy<br>+ RUL Pneumonectomy</div>
                         <div class="w-100">
                             <div class="align-items-center d-flex justify-content-end gap-1"><span>[Subscription Cost]</span> <span class=""> 1,430,000원</span></div>
                         </div>
                     </div>

                 </div>
             </div>
             <div>
                 <div><i class="bi bi-tags"></i> 기본구조는 운용 비용과 기본 Operation 요금으로 구성되며, Operation 추가 시마다 별도 비용이 발생됩니다.</div>
                 <div><i class="bi bi-tags"></i> Application Specialist 방문 지원 요청시, 출장비 440,000원이 별도로 발생할 수 있습니다.</div>
                 <div><i class="bi bi-tags"></i> Data 불량 시 추가 요금이 발생할 수 있습니다. (*불량 Date는 수작업의 시간을 더 많이 요구합니다.)</div>
             </div>
         </div>
     </div>
 </div>
 <div class=" mask bg-dark h-100 opacity-50 position-absolute top-0 w-100">
     <div class="fs-1 position-absolute text-white top-50 start-50 translate-middle">비활성화</div>
 </div>
 <jsp:include page="footer.jsp" />

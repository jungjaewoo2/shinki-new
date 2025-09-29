<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<style>
    .floating-btn {box-shadow: 1px 1px 10px 4px rgba(198, 198, 198, .5);}
</style>

 <!-- All Application Page -->
 <section id="all-application" class="all-application page-section">
     <div class="dynamic-backdrop">
         <div class="gradient-glow"></div>
     </div>

     <div class="container">
         <div class="row align-items-stretch d-flex flex-wrap">
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1" style="font-size: 2rem; margin-top: 0.75rem;">
                 <span class="pill">All Application</span>
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center">
                     <div>All Application</div>
                 </div>
             </h2>
             <div class="col-12 p-0 mb-3">
                 <div><img src="/assets/images/catalog01.jpg" width="100%"></div>
                 <div><img src="/assets/images/catalog02.jpg" width="100%"></div>
             </div>
             <!-- Head -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style=" margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #156082;">
                     <div class="text-white">Head</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Brain Perfusion CT</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>동적 CT 영상을 통한 뇌혈류 변화 분석</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Brain Perfusion MR</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>전체 뇌를 촬영한 동적 CT영상을 사용하여 뇌혈류의</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">4D Perfusion</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon02.png">
                         </div>
                     </div>
                     <div>전체 뇌를 촬영한 동적 CT영상을 통해 뇌혈류의 변화를 분석할 수 있습니다.</div>
                 </div>


             </div>
             <div class="heart-list col-12 col-lg-6 d-flex flex-column gap-1 px-0 px-lg-1 mt-1 mt-lg-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Craniotomy/ Tensor Analysis</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                     </div>
                     <div>뇌의 백질 영역을 연구하기 위해 텐서 분석 방법을 사용하여 백질 추적 경로를 추출하고 관찰할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Dental MPR</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon02.png">
                         </div>
                     </div>
                     <div>임플란트 수술을 계획하는 데 도움이 되는 치아와 치조골을 생성하고 표시합니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Vessel Extraction</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon02.png">
                         </div>
                     </div>
                     <div>뇌의 동맥, 정맥, 그리고 석회화 된 부분을 자동으로 구분해줍니다</div>
                 </div>
             </div>
             <div class="border-top col-12 mt-3 pt-2 pb-2">
                 <div class="modality d-flex align-items-center justify-content-end gap-2">
                     <img  class="multi-btn" src="/assets/images/modality_icon03.png">
                     CT + MRI 둘다 가능
                 </div>
             </div>
             <!-- Heart -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style="margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #e95da3;">
                     <div class="text-white">Heart</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Coronary Analysis MR</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon01.png">
                             </div>
                         </div>
                     </div>
                     <div>다양한 평가를 위한 모든 관상동맥을 자동 분할할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Coronary Analysis CT</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>심장과 관상동맥을 자동으로 추출하여 형태학적 특성과 질적 특성을 분석할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Cardiac Function MR</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>다중 단계 MRI 데이터를 사용하여 자동으로 심장 기능 지표인 EF, EDV, ESV, SV 등을 계산할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Cardiac Function CT</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>다중 단계 CT 데이터를 사용하여 자동으로 심장 기능 지표인 EF, EDV, ESV, SV 등을 계산할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Delayed Enhancement</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>지연된 조영제 강화 영상을 이용해 심근의 생존 가능성을 평가할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Calcium Scoring</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>Agatston 점수를 활용하여 관상동맥을 자동으로 라벨링하고 석회화 정도를 평가할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Cardiac Tx Map</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>심근 영역에 대한 ECV(Extra-Cellular Volume) 맵과 다른 질적 평가 결과를 표시할 수 있다.</div>
                 </div>

             </div>
             <div class="heart-list col-12 col-lg-6 d-flex flex-column gap-1 px-0 px-lg-1 mt-1 mt-lg-0">
                 <div class="d-flex flex-column justify-content-between gap-1 p-0">
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Aortic Valve Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>TAVI(경피적 대동맥판막 삽입술)를 위해 대동맥판막의 수술 전 시뮬레이션을 분석하고 측정할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Cardiac Perfusion MR</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon01.png">
                                 </div>
                             </div>
                         </div>
                         <div>스트레스와 휴식 상태에서 촬영한 MRI를 사용하여 심근의 세분화된 영역에 대한 시간-강도 곡선을 보여주며 심근 허혈을 분석할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Cardiac Perfusion CT</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                         <div>스트레스와 휴식 상태에서 촬영한 4D CT 영상을 사용하여 심근 허혈 영역을 다양한 방법으로 분석할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Cardiac Fusion</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>심장의 형태학적 특징과 기능적 정보를 결합한 융합 이미지를 관찰한다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">4-Chamber Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>각 심실의 기능을 평가하기 위해 심장의 4개의 심방과 대동맥을 자동으로 분할할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Cardiac Ablation Anaysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>폐정맥을 좌심방 영역에서 추출하여 절제술을 위한 수술 전 시뮬레이션을 수행할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Mitral Valve Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>경피적 승모판막 치환술(TMV)계획을 수립하기 위해 승모판막의 크기와 형태를 측정할 수 있다.</div>
                     </div>
                 </div>

             </div>
             <!-- Chest -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style="margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #de903a;">
                     <div class="text-white">Chest</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Lung Analysis / Airway</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>폐 결절, 기관지, 그리고 저강도 영역을 분석할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Lung Analysis Resection</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>폐 절제술을 계획하기 위해 각 폐 영역을 자동으로 추출하여 수술 전 시뮬레이션을 수행할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Lung Analysis Scope</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>폐 병변에 도달하기 위한 최적 경로를 계획하여 기관지경 수술 전 시뮬레이션을 수행할 수 있다.</div>
                 </div>


             </div>
             <div class="heart-list col-12 col-lg-6 d-flex flex-column align-items-center gap-1 px-0 px-lg-1 mt-1 mt-lg-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Rib Viewer</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>척추와 갈비뼈를 자동으로 추출하고 라벨링한 후, 해당 부위의 3D 이미지와 곡선 평면(CPR) 이미지를 관찰할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Breast Analysis MR</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>동적 MRI 영상을 사용하여 유방 종양을 분석하고 BI-RADS (유방영상 보고 및 데이터 시스템) 보고서를 생성할 수 있다. </div>
                 </div>
             </div>
             <!-- Lower limbs -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style="margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #853e13;">
                     <div class="text-white">Lower limbs</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Knee Joint Analysis</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon01.png">
                             </div>
                         </div>
                     </div>
                     <div>무릎 관절의 MRI 이미지에서 뼈, 연골, 반월판을 추출하여 관찰할 수 있다.</div>
                 </div>

             </div>
             <!-- Abdomen -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style="margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #275317;">
                     <div class="text-white">Abdomen</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Liver Analysis CT</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                     </div>
                     <div>수술 전 간 절제술 계획을 수립하기 위해 간과 그 주변 장기를 추출 할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Liver Analysis MRI</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon01.png">
                             </div>
                         </div>
                     </div>
                     <div>간 MRI의 동적 영상을 분석하여 간의 영역을 계산하고, CT를 이용한 간 분석의 세분화 결과를 적용할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Pancreas Analysis</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>수술 전 췌장과 그 주변 장기를 추출하여 분석하고 계획을 세울 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Kidney Volumetry</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                     </div>
                     <div>다낭성 신장을 추출하고, 신장의 부피를 과거의 결과와 비교하여 시간이 지남에 따라 변화를 확인할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Kidney Analysis</div>
                         <div class="align-items-center d-flex gap-1">
                             <div>Only FUJI</div>
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                     </div>
                     <div>수술 전 분석 및 계획을 위해 신장과 그 주변 장기를 추출할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Prostate Viewer</div>
                         <div class="align-items-center d-flex gap-1">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon01.png">
                             </div>
                         </div>
                     </div>
                     <div>여러 MRI 시리즈를 사용하여 전립선 종양을 분석하고, PI-RADS (전립선 영상 보고 및 데이터 시스템) 보고서를 생성할 수 있다.</div>
                 </div>

             </div>
             <div class="heart-list col-12 col-lg-6 d-flex flex-column gap-1 px-0 px-lg-1 mt-1 mt-lg-0">
                 <div class="d-flex flex-column justify-content-between gap-1 p-0">
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Abdominal Perfusion CT</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>췌장을 포함한 복부 장기들의 혈류를 시간에 따라 분석할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Colon Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>CTC(컴퓨터 단층 촬영 대장 검사) 검사에서 3D 비행 관찰 또는 2D 리뷰를 사용하여 대장에서 용종이나 다른 병변을 탐지할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">3D Fat Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>여러 평면에서 피하 지방, 내장 지방, 그리고 골격근의 면적과 부피를 계산할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">2D Fat Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon02.png">
                                 </div>
                             </div>
                         </div>
                         <div>2D 이미지에서 피하 지방, 내장 지방, 그리고 골격근의 면적을 계산할 수 있다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Rectal Analysis</div>
                             <div class="align-items-center d-flex gap-1">
                                 <div>Only FUJI</div>
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon01.png">
                                 </div>
                             </div>
                         </div>
                         <div>수술 전 분석과 계획을 위해 MRI 이미지에서 직장과 그 주변 장기를 추출할 수 있다.</div>
                     </div>
                 </div>
             </div>
             <!-- Common -->
             <h2 class="align-items-center d-flex flex-column gap-2 mb-1 p-0" style="margin: 50px 0 30px !important">
                 <div class="d-flex flex-column justify-content-center flex-lg-row gap-4 w-100 text-center" style="background: #78206e;">
                     <div class="text-white">Common</div>
                 </div>
             </h2>
             <div class="col-12 col-lg-6 d-flex flex-column justify-content-between gap-1 p-0">
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Sector MPR</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon03.png">
                         </div>
                     </div>
                     <div>가상 초음파 이미지를 관찰할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Combination</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon03.png">
                         </div>
                     </div>
                     <div>여러 개의 이미지를 하나의 화면에 통합하여 볼 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Nuclear Medicine Viewer</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon03.png">
                         </div>
                     </div>
                     <div>CT 이미지와 핵의학 이미지(SPECT 또는 PET)를 융합하고, 그 결과로 SUV(표준화된 섭취량)를 측정할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">ADC Viewer</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>MRI 확산강도 영상(DWI)에서 ADC(수치 확산 계수) 값을 계산하고 이를 시각적으로 표현할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">IVIM</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>MRI 확산강도 영상(DWI)에서 확산 계수를 계산하여 ADC, EADC 또는 기타 맵을 시각적으로 표현할 수 있다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Oncology Viewer</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon03.png">
                         </div>
                     </div>
                     <div>고형암의 변화를 PERCIST, RECIST, 또는 기타 기준을 사용하여 시간에 따라 확인하고 추적할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Endoscope Simulator</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                     </div>
                     <div>흉부 및 복부의 복강경 수술을 위한 수술 전 계획을 가상 내시경으로 수행할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Interventional Radiology Simulator</div>
                         <div class="align-items-center d-flex gap-1">
                             <img src="/assets/images/feature-icon.png" width="30">
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                     </div>
                     <div>수술 전 중재적 영상 계획은 표적 부위와 경로를 추출하여 수행될 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Tx Map</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>MRI 신호 값에서 도출된 다양한 Tx 값 계산.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">MR Flow Analysis</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>혈류량과 유속을 계산할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">4D Flow</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon01.png">
                         </div>
                     </div>
                     <div>지정된 ROI의 혈류량, 유속, 및 벡터를 계산하고 3D로 시각화할 수 있습니다.</div>
                 </div>
                 <div class="all-list d-flex flex-column">
                     <div class="d-flex align-items-center justify-content-between gap-1">
                         <div class="all-title">Surface Viewer</div>
                         <div class="modality d-flex justify-content-end">
                             <img src="/assets/images/modality_icon03.png">
                         </div>
                     </div>
                     <div>추출된 마스크 영역에서 표면 모델을 자동으로 생성하고 편집할 수 있습니다.</div>
                 </div>

             </div>
             <div class="heart-list col-12 col-lg-6 d-flex flex-column gap-1 px-0 px-lg-1 mt-1 mt-lg-0">
                 <div class="d-flex flex-column justify-content-between gap-1 p-0">
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Dual Energy Analysis</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon02.png">
                             </div>
                         </div>
                         <div>두 가지 다른 튜브 전압을 가진 CT 이미지를 사용하여 다양한 분석을 수행할 수 있습니다.</div>
                     </div>
                 </div>
                 <div class="d-flex flex-column justify-content-between gap-1 p-0">
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">2D Viewer</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>CT, MRI 또는 기타 DICOM 이미지를 표시할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">3D Viewer</div>
                             <div class="align-items-center d-flex gap-1">
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon03.png">
                                 </div>
                             </div>
                         </div>
                         <div>3D 또는 MPR(다중 평면 재구성) 및 가상 내시경의 표시와 측정이 가능합니다</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">4D Viewer</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>다중 위상 이미지를 로드하고 시간 정보를 기반으로 재생할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Dynamic Data Viewer</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>시간에 걸쳐 수집된 데이터를 기반으로 시간-강도 곡선(Time-Intensity Curves)을 관찰할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">3D Compositor</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>여러 시리즈 이미지를 동일한 공간에 융합하여 3D 이미지를 표시할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">3D Comparison</div>
                             <div class="align-items-center d-flex gap-1">
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon03.png">
                                 </div>
                             </div>
                         </div>
                         <div>여러 시리즈 이미지를 동기화하여 나란히 표시할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Slicer</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>주로 복잡한 척추 분석을 지원하기 위해 모든 횡단면을 관찰할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">Fusion</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>다양한 모달리티에서 얻은 이미지를 융합하여 표시할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">2D Fusion</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>두 개의 시리즈 이미지를 융합하여 저장할 수 있습니다</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">General CPR</div>
                             <div class="align-items-center d-flex gap-1">
                                 <img src="/assets/images/feature-icon.png" width="30">
                                 <div class="modality d-flex justify-content-end">
                                     <img src="/assets/images/modality_icon03.png">
                                 </div>
                             </div>
                         </div>
                         <div>CPR(심폐소생술) 혈관 이미지를 생성하여 협착 및 석회화 등을 포함한 임상 분석에 사용할 수 있습니다.</div>
                     </div>
                     <div class="all-list d-flex flex-column">
                         <div class="d-flex align-items-center justify-content-between gap-1">
                             <div class="all-title">MPR Reformat</div>
                             <div class="modality d-flex justify-content-end">
                                 <img src="/assets/images/modality_icon03.png">
                             </div>
                         </div>
                         <div>모든 횡단면 이미지를 생성, 인쇄 및 저장할 수 있습니다.</div>
                     </div>
                 </div>
             </div>

         </div>
     </div>
 </section>

 <jsp:include page="footer.jsp" />
 <script>
     window.addEventListener('resize', matchHeight);
     window.addEventListener('load', matchHeight);

     function matchHeight() {
         const leftColumn = document.querySelector('.row .col-12.col-lg-6:first-child');
         const rightColumn = document.querySelector('.row .col-12.col-lg-6:last-child');
         const leftHeight = leftColumn.offsetHeight;
         rightColumn.style.height = `${leftHeight}px`;
     }

 </script>

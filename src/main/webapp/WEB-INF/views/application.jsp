<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <style>
     /* 기존 CSS 유지 */
     /* Swiper를 .container의 배경으로 설정하기 위한 CSS */
     .page-section {
         position: relative;
         overflow: hidden;
     }

     .swiper.mySwiperLiver,
     .swiper.mySwiperPancreas {
         width: 100%;
     }

     /* Swiper 내비게이션 버튼 스타일링 */
     .swiper-button-prev-liver,
     .swiper-button-next-liver,
     .swiper-button-prev-pancreas,
     .swiper-button-next-pancreas {
         color: #fff !important;
         z-index: 10;
     }

     .swiper-button-prev-liver:after,
     .swiper-button-next-liver:after,
     .swiper-button-prev-pancreas:after,
     .swiper-button-next-pancreas:after {
         font-family: swiper-icons;
         font-size: 24px;
         text-transform: none !important;
         letter-spacing: 0;
         font-variant: initial;
         line-height: 1;
         display: none;
     }

     .swiper-button-prev-liver:after,
     .swiper-button-prev-pancreas:after {
         content: 'prev';
     }

     .swiper-button-next-liver:after,
     .swiper-button-next-pancreas:after {
         content: 'next';
     }

     /* 기존 마스크 및 기타 스타일 유지 */
     .mask {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         background-color: #000;
         z-index: 1;
         height: 100%;
         opacity: .3;
     }

     .swiper-slide-active {
         opacity: 1 !important;
     }

     .swiper-slide {
         opacity: 0;
         transition: opacity 2s cubic-bezier(0.33, 1, 0.68, 1);
         text-align: center;
         height: 596px;
     }

     .swiper-slide img {
         width: 512px;
         height: 512px;
     }

     @media (max-width: 1024px) {
         .swiper-slide img {
             width: 100%;
             height: auto;
         }
         
         .swiper-slide {
             height: auto;
         }
     }

     .container>.text-center,
     .container>.feature-grid {
         position: relative;
         z-index: 10;
     }

     /* Swiper 페이지 네비게이션 스타일링 */

     .swiper-button-next-liver,
     .swiper-button-prev-liver,
     .swiper-button-next-pancreas,
     .swiper-button-prev-pancreas {
         position: absolute;
         top: 50%;
         transform: translateY(-50%);
     }

     .swiper-button-next-liver,
     .swiper-button-next-pancreas {
         right: var(--swiper-navigation-sides-offset, -30px);
     }

     .swiper-button-prev-liver,
     .swiper-button-prev-pancreas {
         left: var(--swiper-navigation-sides-offset, -10px);
     }

     .swiper-horizontal>.swiper-pagination-bullets,
     .swiper-pagination-bullets.swiper-pagination-horizontal {
         z-index: 1;
         position: absolute;
         bottom: 30px !important;
     }

 </style>

 <!-- Application Page -->
 <section id="application" class="application-details page-section">
     <div class="dynamic-backdrop">
         <div class="gradient-glow"></div>
     </div>

     <div class="container">
         <h2 class="align-items-baseline d-flex flex-column gap-2 mb-4" style="font-size: 3rem; margin-top: 0.75rem;">
             <span class="pill">HBP</span>
             <!--<span class="fw-bold" style="font-size: 3rem;">HBP</span>-->
             <div class="d-flex flex-column flex-lg-row gap-4 w-100">
                 <div class="fw-bold">Hepatobiliary phase</div>
                 <div class="d-flex flex-fill justify-content-between">
                     <div class="d-flex align-items-center gap-1">
                         <img src="assets/images/application_icon02.png" width="30" height="30">
                         <img src="assets/images/application_icon01.png" width="30" height="30">
                     </div>
                     <div class="d-flex flex-fill justify-content-end">
                         <div class="app-btn align-items-end d-flex justify-content-end" style="padding-right: 60px;"><button class="btn px-4 text-white rounded-5" onclick="location.href='/mypage/request'" style="background: linear-gradient(to right, #975cf8, #5d55fe);">의뢰하기 <i class="bi bi-arrow-right"></i></button></div>
                     </div>
                 </div>
             </div>
         </h2>

         <div class="row d-flex justify-content-between flex-lg-row gap-5 gap-lg-0">
             <div class="col-12 col-xl-5">
                 <div class="accordion" id="accordionExample">
                     <div class="accordion-item">
                         <h2 class="accordion-header position-relative">
                             <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                 Liver Analysis
                             </button>
                         </h2>
                         <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>- 조영 증강된 CT image를 기반으로 MRI image를 fusion하여 Liver 및 Blood vessel region 등을 3D로 재구성하고 결과를 관찰할 수 있습니다.</li>
                                     <li>- SPECT image를 활용하여 각 region 별 검출률을 확인할 수 있습니다.</li>
                                     <li>- 수동 및 자동으로 Lobe, Segment 및 임의의 territory를 분리할 수 있으며, 분리한 Region의 절제면, 절제면에서의 Vessel 관찰 및 territory의 volume 등을 측정할 수 있습니다.</li>
                                     <li>- 3D로 재구성 된 복합적인 장기들을 Laparascopic view로 관찰할 수 있습니다.</li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_01">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                     <div class="accordion-item">
                         <h2 class="accordion-header position-relative">
                             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                 Pancreas Analysis
                             </button>
                         </h2>
                         <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>- 조영 증강된 CT image를 사용하여 Pancreas, Vessel 및 주변 장기 등을 3D로 재구성하고 관찰할 수 있습니다.</li>
                                     <li>- Pancreatic duct를 따라 절단면을 설정하여 Remnant pancreas volume 등을 측정할 수 있으며, 절단면에서의 Pancreatic duct의 위치를 관찰하고 diameter를 측정할 수 있습니다.</li>
                                     <li>- 3D로 재구성 된 복합적인 장기들을 Laparasopic view로 관찰할 수 있습니다.</li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_01">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-12 col-xl-6">
                 <!-- Liver Analysis용 Swiper -->
                 <div class="swiper mySwiperLiver" id="swiperLiver">
                     <div class="swiper-wrapper">
                         <div class="swiper-slide slide01">
                             <img src="assets/images/tab1-cont-img01.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Cut plane view</div>

                         </div>
                         <div class="swiper-slide slide02">
                             <img src="assets/images/tab1-cont-img02.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Drainage area map</div>

                         </div>
                         <div class="swiper-slide slide03">
                             <img src="assets/images/tab1-cont-img03.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Liver 3D</div>

                         </div>
                         <div class="swiper-slide slide04">
                             <img src="assets/images/tab1-cont-img04.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">MRI fusion</div>

                         </div>
                         <div class="swiper-slide slide05">
                             <img src="assets/images/tab1-cont-img05.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Patial Resection</div>

                         </div>
                         <div class="swiper-slide slide05">
                             <img src="assets/images/tab1-cont-img06.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Region segmentation</div>

                         </div>
                         <div class="swiper-slide slide05">
                             <img src="assets/images/tab1-cont-img07.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">Segmentation</div>

                         </div>
                         <div class="swiper-slide slide05">
                             <img src="assets/images/tab1-cont-img08.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pt-1">SPECT fusion</div>

                         </div>
                     </div>
                     <!--<div class="swiper-pagination-liver text-center"></div>-->
                     <div class="swiper-button-next-liver"><img class="w-75" src="assets/images/arrow-left.png"></div>
                     <div class="swiper-button-prev-liver"><img class="w-75" src="assets/images/arrow-right.png"></div>
                 </div>
                 <!-- Pancreas Analysis용 Swiper -->
                 <div class="swiper mySwiperPancreas" id="swiperPancreas" style="display: none;">
                     <div class="swiper-wrapper">
                         <div class="swiper-slide slide01">
                             <img src="assets/images/pancreas-img01.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4 pb-4">Pancreas 3D</div>

                         </div>
                     </div>
                     <!--<div class="swiper-pagination-pancreas text-center"></div>-->
                     <div class="swiper-button-next-pancreas"></div>
                     <div class="swiper-button-prev-pancreas"></div>
                 </div>
             </div>
         </div>
     </div>
 </section>

 <!-- Modal -->
 <div class="modal fade" id="func_01" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <h1 class="modal-title fs-2 fw-bold mt-0" id="exampleModalLabel">Function.</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon01.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">3D Reconstruction</div>
                         <ul>
                             <li>- 3Phase CT를 기반으로 MRI 및 SPECT image를 fusion하여 3D를 구성할 수 있습니다.</li>
                             <li>- 각 Phase의 Liver의 위치 차이를 자동(Rigid 및 Non-rigid) 및 수동으로 조정할 수 있습니다.</li>
                             <li>- Liver, Tumor, Vessel, 주변 장기들을 자동, 반자동 및 수동으로 추출할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon02.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Region division</div>
                         <ul>
                             <li>- 특정 지점의 Blood vesse의 territory regio을 자동 및 수동으로 여러 개의 resection regio으로 분할할 수 있습니다.</li>
                             <li>- 분할된 region의 volume을 자동으로 측정할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon03.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Observation</div>
                         <ul>
                             <li>- Surface rendering 기능을 제공하여 복잡한 3D 구조의 관찰을 용이하게 합니다.</li>
                             <li>- Cut plane 및 Cut plane에서 통과 혈관 등을 관찰할 수 있습니다.</li>
                             <li>- 분할된 Region의 volume 등을 자동으로 측정할 수 있습니다.</li>
                             <li>- Region division에 대한 정보를 report로 기록하고 관리할 수 있습니다.</li>
                             <li>- 3D PDF, stl 등 여러가지 파일 형태로 추출할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon04.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Endoscopic view</div>
                         <ul>
                             <li>- Insertion port와 Target을 설정하고 Port부터 Target까지의 거리를 측정할 수 있습니다.</li>
                             <li>- 여러 개의 insertion port 및 Target을 설정하여 각 port간의 거리 및 각 port에서 tartget간의 거리를 자동으로 측정할 수 있습니다.</li>
                             <li>- Port를 통해 삽입된 카메라를 통해 보이는 view를 3D로 관찰하고 target까지의 남은 진행 거리를 실시간으로 확인할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

 <!-- Modal -->
 <div class="modal fade" id="func_02" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <h1 class="modal-title fs-2 fw-bold mt-0" id="exampleModalLabel">Function.</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon01.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">3D Reconstruction</div>
                         <ul>
                             <li>- 3Phase CT image를 동시에 load하여 3D를 구성할 수 있습니다.</li>
                             <li>- 각 Phase의 위치 차이를 자동 및 수동으로 조정할 수 있습니다.</li>
                             <li>- Pancreas, Tumor, Vessel, 주변 장기 등을 자동, 반자동 및 수동으로 추출할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon02.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Region division</div>
                         <ul>
                             <li>- Pancreatic duct를 따라 Cut plane을 설정하고 Region을 분할할 수 있습니다.</li>
                             <li>- Remnant pancreas volume을 자동으로 측정할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon03.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Observation</div>
                         <ul>
                             <li>- Surface rendering 기능을 제공하여 복잡한 3D 구조의 관찰을 용이하게 합니다.</li>
                             <li>- Cut plane 및 Cut plane에서 Pancreatic duct의 위치 및 diameter 등을 관찰할 수 있습니다.</li>
                             <li>- 분할된 Region의 volume 등을 관찰할 수 있습니다.</li>
                             <li>- Region division에 대한 정보를 report로 기록하고 관리할 수 있습니다.</li>
                             <li>- 3D PDF, stl 등 여러가지 파일 형태로 추출할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="assets/images/function-icon04.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Endoscopic view</div>
                         <ul>
                             <li>- Insertion port와 Target을 설정하고 Port부터 Target까지의 거리를 측정할 수 있습니다.</li>
                             <li>- 여러 개의 insertion port 및 Target을 설정하여 각 port간의 거리 및 각 port에서 tartget간의 거리를 자동으로 측정할 수 있습니다.</li>
                             <li>- Port를 통해 삽입된 카메라를 통해 보이는 view를 3D로 관찰하고 target까지의 남은 진행 거리를 실시간으로 확인할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>


 <!-- Modal (기존 코드 유지) -->
 <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <h1 class="modal-title fs-5 mt-0" id="imageModalLabel">확대 이미지</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <img src="" width="100%" id="modalImage">
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-dark" data-bs-dismiss="modal">닫기</button>
             </div>
         </div>
     </div>
 </div>

 <!-- Modal -->
 <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <h1 class="modal-title fs-5 mt-0" id="imageModalLabel">확대 이미지</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <img src="" width="100%" id="modalImage">
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-dark" data-bs-dismiss="modal">닫기</button>
             </div>
         </div>
     </div>
 </div>

 <!-- Swiper JS -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

 <script>
     // Swiper 인스턴스 초기화
     var swiperLiver = new Swiper(".mySwiperLiver", {
         slidesPerView: 1,
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination-liver",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-liver",
             prevEl: ".swiper-button-prev-liver",
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 spaceBetween: 0,
             },
         },
         loop: true,
     });

     var swiperPancreas = new Swiper(".mySwiperPancreas", {
         slidesPerView: 1,
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination-pancreas",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-pancreas",
             prevEl: ".swiper-button-prev-pancreas",
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 spaceBetween: 0,
             },
         },
         loop: true,
     });

     // 아코디언 이벤트 리스너
     document.addEventListener('DOMContentLoaded', function() {
         const swiperLiverContainer = document.querySelector('#swiperLiver');
         const swiperPancreasContainer = document.querySelector('#swiperPancreas');

         // 초기 상태: Liver Analysis용 Swiper만 표시
         swiperLiverContainer.style.display = 'block';
         swiperPancreasContainer.style.display = 'none';

         // 아코디언이 열릴 때 Swiper 전환
         document.querySelector('#collapseOne').addEventListener('shown.bs.collapse', function() {
             swiperLiverContainer.style.display = 'block';
             swiperPancreasContainer.style.display = 'none';
             swiperLiver.update(); // Swiper 새로고침
         });

         document.querySelector('#collapseTwo').addEventListener('shown.bs.collapse', function() {
             swiperLiverContainer.style.display = 'none';
             swiperPancreasContainer.style.display = 'block';
             swiperPancreas.update(); // Swiper 새로고침
         });

         // 모달 이미지 업데이트
         const slides = document.querySelectorAll('.swiper-slide');
         const modal = document.querySelector('#imageModal');
         const modalImg = modal.querySelector('#modalImage');
         const modalTitle = modal.querySelector('#imageModalLabel');

         slides.forEach(slide => {
             const img = slide.querySelector('img');
             const title = slide.querySelector('div').textContent;
             img.addEventListener('click', function() {
                 const imgSrc = this.getAttribute('src');
                 modalImg.setAttribute('src', imgSrc);
                 modalTitle.textContent = title; // 모달 제목 업데이트
             });
         });
     });

 </script>

<jsp:include page="footer.jsp" />

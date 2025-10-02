<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <style>
     /* Swiper를 .container의 배경으로 설정하기 위한 CSS */
     .page-section {
         position: relative;
         overflow: hidden;
     }

     .swiper.mySwiper {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         height: 100%;
         z-index: -1;
     }

     .swiper-slide video {
         width: 100%;
         height: 100%;
         object-fit: cover;
     }

     .swiper-slide-active {
         opacity: 1 !important;
     }

     .swiper-slide {
         opacity: 0;
         transition: opacity 2s cubic-bezier(0.33, 1, 0.68, 1);
         text-align: center;
     }

     .container>.text-center,
     .container>.feature-grid {
         position: relative;
         z-index: 10;
     }

     /* Swiper 페이지 네비게이션 스타일링 */

     .swiper-button-prev,
     .swiper-button-next {
         color: #fff;
         z-index: 10;
     }

     .swiper.mySwiper3 {
         width: 100%;
     }

     .swiper-button-prev2,
     .swiper-button-next2 {
         color: #fff !important;
         z-index: 10;
     }

     .swiper-button-next2,
     .swiper-button-prev2 {
         position: absolute;
         top: var(--swiper-navigation-top-offset, 50%);
         width: calc(var(--swiper-navigation-size) / 44 * 27);
         height: var(--swiper-navigation-size);
         margin-top: calc(0px - (var(--swiper-navigation-size) / 2));
         z-index: 10;
         cursor: pointer;
         display: flex;
         align-items: center;
         justify-content: center;
         color: #888 !important;
     }

     .swiper-button-prev2,
     .swiper-rtl .swiper-button-next2 {
         left: unset;
         right: 50px;
     }

     .swiper-button-next2,
     .swiper-rtl .swiper-button-prev2 {
         right: var(--swiper-navigation-sides-offset, 10px);
         left: auto;
     }

     .swiper-button-next:after,
     .swiper-button-prev:after {
         font-size: 24px;
     }

     .swiper-button-prev2:after,
     .swiper-rtl .swiper-button-next2:after {
         content: 'prev';
     }

     .swiper-button-next2:after,
     .swiper-rtl .swiper-button-prev2:after {
         content: 'next';
     }

     .swiper-button-next2:after,
     .swiper-button-prev2:after {
         font-family: swiper-icons;
         font-size: 24px;
         text-transform: none !important;
         letter-spacing: 0;
         font-variant: initial;
         line-height: 1;
     }

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
         background: #000;
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

     .swiper-button-next-airway,
     .swiper-button-prev-airway,
     .swiper-button-next-resection,
     .swiper-button-prev-resection,
     .swiper-button-next-scope,
     .swiper-button-prev-scope {
         position: absolute;
         top: 50%;
         background-color: rgb(0, 0, 0, .4);
         width: 30px;
         height: 30px;
         text-align: center;
         border-radius: 4px;
     }

     .swiper-button-next-airway,
     .swiper-button-next-resection,
     .swiper-button-next-scope {
         right: var(--swiper-navigation-sides-offset, 10px);
     }

     .swiper-button-prev-airway,
     .swiper-button-prev-resection,
     .swiper-button-prev-scope {
         left: var(--swiper-navigation-sides-offset, 10px);
     }

     .swiper-horizontal>.swiper-pagination-bullets,
     .swiper-pagination-bullets.swiper-pagination-horizontal {
         z-index: 1;
         position: absolute;
         bottom: 30px !important;
     }
     
     /* Swiper 페이지 네비게이션 스타일링 */

     .swiper-button-next-liver,
     .swiper-button-prev-liver,
     .swiper-button-next-pancreas,
     .swiper-button-prev-pancreas {
         position: absolute;
         top: 50%;
         transform: translateY(-50%);
         z-index: 1000000;
     }

     .swiper-button-next-liver,
     .swiper-button-next-pancreas {
         right: var(--swiper-navigation-sides-offset, -60px);
     }

     .swiper-button-prev-liver,
     .swiper-button-prev-pancreas {
         left: var(--swiper-navigation-sides-offset, -30px);
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
             <span class="pill fw-bold">CARDIAC</span>
             <div class="d-flex flex-column flex-lg-row gap-4 w-100">
                 <div class="fw-bold">CARDIAC</div>
                 <div class="d-flex flex-fill justify-content-between">
                     <div class="d-flex align-items-center gap-1">
                         <img src="/assets/images/application_icon02.png" width="30" height="30">
                         <img src="/assets/images/application_icon01.png" width="30" height="30">
                     </div>
                     <div class="d-flex flex-fill justify-content-end">
                         <div class="align-items-end d-flex justify-content-end" style="padding-right: 110px;"><button class="btn px-4 text-white rounded-5" onclick="location.href='/mypage/request'" style="background: linear-gradient(to right, #975cf8, #5d55fe);">의뢰하기 <i class="bi bi-arrow-right"></i></button></div>
                     </div>
                 </div>
             </div>
         </h2>

         <div class="row d-flex justify-content-between flex-lg-row gap-5 gap-lg-0">
             <div class="col-12 col-xl-5">
                 <div class="accordion" id="accordionExample">
                     <div class="accordion-item">
                         <h2 class="accordion-header">
                             <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                 Cardiac Analysis
                             </button>
                         </h2>
                         <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>ￚ </li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_01">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-12 col-xl-6">
             <div class="position-relative">
                 <div class="swiper mySwiper3">
                     <div class="swiper-wrapper">
                         <div class="swiper-slide slide01">
                             
                             <img src="/assets/images/tab1-cont-img03.png" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4">이미지 타이틀</div>
                         </div>
                         <div class="swiper-slide slide02">
                             
                             <img src="/assets/images/cardiac-analysis-img02.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4">이미지 타이틀</div>
                         </div>
                         <div class="swiper-slide slide03">
                             
                             <img src="/assets/images/cardiac-analysis-img03.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4">이미지 타이틀</div>
                         </div>
                         <div class="swiper-slide slide04">
                             
                             <img src="/assets/images/cardiac-analysis-img04.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4">이미지 타이틀</div>
                         </div>
                         <div class="swiper-slide slide05">
                             
                             <img src="/assets/images/cardiac-analysis-img05.jpg" width="" data-bs-toggle="modal" data-bs-target="#imageModal">
                             <div class="slide-title fs-4">이미지 타이틀</div>
                         </div>
                     </div>
                     <!--<div class="swiper-pagination2 text-center"></div>-->
                     
                 </div>
                 <div class="swiper-button-next-liver"><img class="w-75" src="assets/images/arrow-left.png"></div>
                  <div class="swiper-button-prev-liver"><img class="w-75" src="assets/images/arrow-right.png"></div>
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
                     <div><img src="/assets/images/function-icon01.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">3D Reconstruction</div>
                         <ul>
                             <li>- </li>
                         </ul>
                     </div>
                 </div>
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
     var swiper3 = new Swiper(".mySwiper3", {
         slidesPerView: 1,
         /* Default to 1 slide per view on mobile */
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination2",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-liver",
             prevEl: ".swiper-button-prev-liver",
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 /* Show 3 slides on screens >= 768px */
                 spaceBetween: 0,
             },
         },
         loop: true,
     });

 </script>
 <script>
     document.addEventListener('DOMContentLoaded', function() {
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

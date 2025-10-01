<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <style>
/* 기존 CSS 유지 및 Swiper 관련 스타일 추가/수정 */
.page-section {
	position: relative;
	overflow: hidden;
}

.swiper.mySwiperAirway, .swiper.mySwiperResection, .swiper.mySwiperScope
	{
	width: 100%;
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

.container>.text-center, .container>.feature-grid {
	position: relative;
	z-index: 10;
}

/* Swiper 내비게이션 버튼 스타일링 */
.swiper-button-prev-airway, .swiper-button-next-airway,
	.swiper-button-prev-resection, .swiper-button-next-resection,
	.swiper-button-prev-scope, .swiper-button-next-scope {
	color: #fff !important;
	z-index: 10;
}

.swiper-button-prev-airway:after, .swiper-button-next-airway:after,
	.swiper-button-prev-resection:after, .swiper-button-next-resection:after,
	.swiper-button-prev-scope:after, .swiper-button-next-scope:after {
	font-family: swiper-icons;
	font-size: 24px;
	text-transform: none !important;
	letter-spacing: 0;
	font-variant: initial;
	line-height: 1.3;
}

.swiper-button-prev-airway:after, .swiper-button-prev-resection:after,
	.swiper-button-prev-scope:after {
	/* content: 'prev'; */
	
}

.swiper-button-next-airway:after, .swiper-button-next-resection:after,
	.swiper-button-next-scope:after {
	/* content: 'next'; */
	
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
}

@media ( max-width : 1024px) {
	.swiper-slide img {
		width: 100%;
		height: auto;
	}
	.swiper-slide {
		height: auto;
	}
}

.container>.text-center, .container>.feature-grid {
	position: relative;
	z-index: 10;
}

/* Swiper 페이지 네비게이션 스타일링 */
.swiper-button-next-airway, .swiper-button-prev-airway,
	.swiper-button-next-resection, .swiper-button-prev-resection,
	.swiper-button-next-scope, .swiper-button-prev-scope {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

.swiper-button-next-airway, .swiper-button-next-resection,
	.swiper-button-next-scope {
	right: var(--swiper-navigation-sides-offset, -30px);
}

.swiper-button-prev-airway, .swiper-button-prev-resection,
	.swiper-button-prev-scope {
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
             <span class="pill fw-bold" style="">LUNG</span>
             <div class="d-flex flex-column flex-lg-row gap-4 w-100">
                 <div class="fw-bold">Lung</div>
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
                                 Lung Analysis / Airway
                             </button>
                         </h2>
                         <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>- CT image에서 Airway, Lung field의 Low attenuation area를 분석할 수 있습니다.</li>
                                     <li>- 자동으로 Lung의 좌우 및 5개의 Lobe를 분리하고 임의의 bronchus 지점을 기준으로 territory를 분리할 수 있습니다.</li>
                                     <li>- 분리한 각 영역에서의 LAA region의 volume, rate 및 mean CT value를 측정할 수 있습니다.</li>
                                     <li>- LAA region의 군집도를 시각화하여 평가할 수 있습니다.</li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_01">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                     <div class="accordion-item">
                         <h2 class="accordion-header">
                             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                 Lung Analysis Resection
                             </button>
                         </h2>
                         <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>- 조영 증강된 CT image를 사용하여 Lung, Airway, Vessel, tumor 등을 추출하고 3D로 재구성하고 결과를 관찰할 수 있습니다.</li>
                                     <li>- 임의의 Vascular point에서 territory를 분리하고 절제면, 절제면에서의 Vessel 및 territory의 volume 등을 측정할 수 있습니다.</li>
                                     <li>- 영역을 분리하고 tumor에서 plane 까지의 최소거리를 자동으로 측정할 수 있습니다.</li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_02">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                     <div class="accordion-item">
                         <h2 class="accordion-header">
                             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 Lung Analysis Scope
                             </button>
                         </h2>
                         <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                             <div class="accordion-body">
                                 <ul>
                                     <li>- CT image를 사용하여 nodule까지의 path를 구성하고 관찰할 수 있습니다.</li>
                                     <li>- Bronchus의 직경 End-point부터 Nodule 까지의 거리 등을 확인하며 가상 내시경을 진행할 수 있습니다.</li>
                                 </ul>
                                 <button class="btn rounded-5 text-white" type="button" style="background-color: #2b88f6" data-bs-toggle="modal" data-bs-target="#func_03">Function 알아보기</button>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-12 col-xl-6">
                 <!-- Lung Analysis / Airway Swiper -->
                 <div class="swiper mySwiperAirway" id="swiperAirway">
                     <div class="swiper-wrapper">
						<div class="swiper-slide slide01">

							<img src="/assets/images/Airway-img01.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Bronchus CPR</div>
						</div>
						<div class="swiper-slide slide02">

							<img src="/assets/images/Airway-img02.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Cluster View</div>
						</div>
						<div class="swiper-slide slide03">

							<img src="/assets/images/Airway-img03.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Goddard Score</div>
						</div>
						<div class="swiper-slide slide04">

							<img src="/assets/images/Airway-img04.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">LAA View</div>
						</div>
						<div class="swiper-slide slide05">

							<img src="/assets/images/Airway-img05.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Axial view</div>
						</div>
					</div>
                     <!--<div class="swiper-pagination-airway text-center"></div>-->
                     <div class="swiper-button-next-airway">
						<img class="w-75" src="assets/images/arrow-left.png">
					</div>
					<div class="swiper-button-prev-airway">
						<img class="w-75" src="assets/images/arrow-right.png">
					</div>
                 </div>
                 <!-- Lung Analysis Resection Swiper -->
                 <div class="swiper mySwiperResection" id="swiperResection" style="display: none;">
                     <div class="swiper-wrapper">
						<div class="swiper-slide slide01">

							<img src="/assets/images/resection-img01.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Cut Plane</div>
						</div>
						<div class="swiper-slide slide02">

							<img src="/assets/images/resection-img02.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">GGN Analysis</div>
						</div>
						<div class="swiper-slide slide03">

							<img src="/assets/images/resection-img03.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Lung 3D</div>
						</div>
						<div class="swiper-slide slide04">

							<img src="/assets/images/resection-img04.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Vessel rendering</div>
						</div>
						<div class="swiper-slide slide05">

							<img src="/assets/images/resection-img05.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Territory</div>
						</div>
						<div class="swiper-slide slide06">

							<img src="/assets/images/resection-img06.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Various view</div>
						</div>
					</div>
                     <!--<div class="swiper-pagination-resection text-center"></div>-->
                     <div class="swiper-button-next-resection"><img class="w-75" src="assets/images/arrow-left.png"></div>
					<div class="swiper-button-prev-resection"><img class="w-75" src="assets/images/arrow-right.png"></div>
                 </div>
                 <!-- Lung Analysis Scope Swiper -->
                 <div class="swiper mySwiperScope" id="swiperScope" style="display: none;">
                     <div class="swiper-wrapper">
						<div class="swiper-slide slide01">

							<img src="/assets/images/scope-img01.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Path Creation</div>
						</div>
						<div class="swiper-slide slide02">

							<img src="/assets/images/scope-img02.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">Variouse view</div>
						</div>
						<div class="swiper-slide slide03">

							<img src="/assets/images/scope-img03.jpg" width=""
								data-bs-toggle="modal" data-bs-target="#imageModal">
							<div class="slide-title fs-4 pt-1">VE view</div>
						</div>
					</div>
                     <!--<div class="swiper-pagination-scope text-center"></div>-->
                     <div class="swiper-button-next-scope"><img class="w-75" src="assets/images/arrow-left.png"></div>
					<div class="swiper-button-prev-scope"><img class="w-75" src="assets/images/arrow-right.png"></div>
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
                             <li>- Lung의 좌, 우 및 5개 Lobe를 자동으로 추출할 수 있습니다.</li>
                             <li>- Lung, bronchus, vessel, tumor 및 주변장기 등을 자동으로 추출할 수 있습니다.</li>
                             <li>- Interlobar plane, Diaphragm과 Lung 사이의 Surface를 자동으로 추출하고 관찰할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon05.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Nodule information</div>
                         <ul>
                             <li>- Nodule의 maximum CT value, mean CT value standard deviation을 측정할 수 있습니다.</li>
                             <li>- Nodule의 intensity histogram을 측정할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon06.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Airway information</div>
                         <ul>
                             <li>- Airway의 path를 선택하고 CPR 영상으로 재구성할 수 있습니다.</li>
                             <li>- Airway의 inner / outer wall diameter를 측정하고 graph로 관찰할 수 있습니다.</li>
                             <li>- 특정 지점을 선택하여 차지하는 territory를 분리할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon07.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">LAA view</div>
                         <ul>
                             <li>- 2D 및 3D image에서 color overlay를 통해 LAA region을 관찰할 수 있습니다.</li>
                             <li>- Lung의 좌, 우, 5개 Lobe 및 추가적으로 분리한 territory에 대한 정보를 별도로 관찰할 수 있습니다.</li>
                             <li>- 각 영역의 volume, LAA region의 rate, mean CT value 및 Histogram 등을 관찰 할 수 있습니다.</li>
                             <li>- Goddard score를 통해 LAA region을 평가할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon08.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Cluster view</div>
                         <ul>
                             <li>- LAA 영역을 2D 및 3D image에서 군집화하여 관찰할 수 있습니다.</li>
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
                     <div><img src="/assets/images/function-icon01.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">3D Reconstruction</div>
                         <ul>
                             <li>- Lung의 좌, 우 및 5개 Lobe를 자동으로 추출할 수 있습니다.</li>
                             <li>- Lung field, bronchus, Pulmonary artery, Pulmonary vein, tumor를 자동으로 추출할 수 있습니다.</li>
                             <li>- Interlobar plane, Diaphragm과 Lung 사이의 Surface를 자동으로 추출하고 관찰할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon09.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Tumor information</div>
                         <ul>
                             <li>- Tumor의 volume, maximum CT value, minimum CT value, mean CT value, standard deviation을 측정할 수 있습니다.</li>
                             <li>- Tumor의 intensity histogram을 측정할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon02.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Region division</div>
                         <ul>
                             <li>- Airway 혹은 Vessel의 특정 지점을 선택하여 territory를 분리할 수 있습니다.</li>
                             <li>- Smoothing surface 기능을 제공하여 복잡한 3D 구조의 관찰을 용이하게 합니다.</li>
                             <li>- Cut plane 및 Cut plane을 관통하는 Vessel을 관찰할 수 있습니다.</li>
                             <li>- Tumor에서 cut plane, interlobar plane 등 까지의 최소 거리를 자동으로 측정할 수 있습니다.</li>
                             <li>- 3D PDF, stl 등 여러가지 파일 형태로 추출할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 
 <!-- Modal -->
 <div class="modal fade" id="func_03" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                             <li>- Lung, Airway, vessel을 자동으로 추출할 수 있습니다.</li>
                             <li>- 형성된 Airway path의 CPR image를 자동으로 생성할 수 있습니다.</li>
                             <li>- Tumor, Lymph node를 추출하고 기관지내시경을 통해 접근하기 위한 경로를 생성할 수 있습니다.</li>
                         </ul>
                     </div>
                 </div>
                 <div class="function-box d-flex flex-column flex-lg-row gap-3">
                     <div><img src="/assets/images/function-icon10.png" height=""></div>
                     <div>
                         <div class="fw-bold fs-3">Virtual endoscope</div>
                         <ul>
                             <li>- 임의의 path 길이를 측정할 수 있습니다.</li>
                             <li>- 임의의 지점에서 Airway의 diameter를 측정할 수 있습니다.</li>
                             <li>- Path의 총 진행거리, minimum diameter, path의 말단부터 target까지의 거리 등을 측정할 수 있습니다.</li>
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
     // Swiper 인스턴스 초기화
     var swiperAirway = new Swiper(".mySwiperAirway", {
         slidesPerView: 1,
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination-airway",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-airway",
             prevEl: ".swiper-button-prev-airway",
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 spaceBetween: 0,
             },
         },
         loop: true,
     });

     var swiperResection = new Swiper(".mySwiperResection", {
         slidesPerView: 1,
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination-resection",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-resection",
             prevEl: ".swiper-button-prev-resection",
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 spaceBetween: 0,
             },
         },
         loop: true,
     });

     var swiperScope = new Swiper(".mySwiperScope", {
         slidesPerView: 1,
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination-scope",
             clickable: true,
         },
         navigation: {
             nextEl: ".swiper-button-next-scope",
             prevEl: ".swiper-button-prev-scope",
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
         const swiperAirwayContainer = document.querySelector('#swiperAirway');
         const swiperResectionContainer = document.querySelector('#swiperResection');
         const swiperScopeContainer = document.querySelector('#swiperScope');

         // 초기 상태: Lung Analysis / Airway Swiper만 표시
         swiperAirwayContainer.style.display = 'block';
         swiperResectionContainer.style.display = 'none';
         swiperScopeContainer.style.display = 'none';

         // 아코디언이 열릴 때 Swiper 전환
         document.querySelector('#collapseOne').addEventListener('shown.bs.collapse', function() {
             swiperAirwayContainer.style.display = 'block';
             swiperResectionContainer.style.display = 'none';
             swiperScopeContainer.style.display = 'none';
             swiperAirway.update();
         });

         document.querySelector('#collapseTwo').addEventListener('shown.bs.collapse', function() {
             swiperAirwayContainer.style.display = 'none';
             swiperResectionContainer.style.display = 'block';
             swiperScopeContainer.style.display = 'none';
             swiperResection.update();
         });

         document.querySelector('#collapseThree').addEventListener('shown.bs.collapse', function() {
             swiperAirwayContainer.style.display = 'none';
             swiperResectionContainer.style.display = 'none';
             swiperScopeContainer.style.display = 'block';
             swiperScope.update();
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
                 modalTitle.textContent = title;
             });
         });
     });

 </script>

<jsp:include page="footer.jsp" />

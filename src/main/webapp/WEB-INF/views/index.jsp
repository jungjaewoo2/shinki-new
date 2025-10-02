<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<style>
    
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
    }

    .swiper-slide img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .container>.text-center,
    .container>.feature-grid {
        position: relative;
        z-index: 10;
    }

    .swiper-pagination,
    .swiper-pagination2 {
        z-index: 2;
    }

    .swiper-button-prev,
    .swiper-button-next,
    .swiper-button-prev2,
    .swiper-button-next2,
    .swiper-button-prev3,
    .swiper-button-next3 {
        color: #fff;
        z-index: 10;
    }

    .swiper.mySwiper2 {
        position: absolute;
        left: 0;
        width: 95%;
        height: 100%;
        z-index: -1;
        padding: 0 !important;
    }

    .swiper.mySwiper2 .swiper-slide {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper.mySwiper2 {
        position: relative;
        height: auto;
        z-index: 1;
        margin-bottom: 50px;
    }

    .swiper.mySwiper2 .swiper-slide {
        width: 100%;
        height: 650px;
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 1;
        transition: opacity 0.5s ease;
    }

    .use-box:hover {
        box-shadow: 2px 4px 16px #00000029;
        transform: scale3d(1.01, 1.01, 1.01);
    }

    .swiper.mySwiper2 .swiper-slide-active {
        opacity: 1;
    }

    .use-box {
        width: 100%;
        max-width: 410px;
        margin: 0 auto;
        box-sizing: border-box;
    }

    .swiper.mySwiper3 {
        position: absolute;
        left: 0;
        width: 100%;
        height: 100%;
    }

    @media (min-width: 768px) {
        .swiper.mySwiper2 .swiper-slide {
            width: 33.33%;
        }
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
    }

    .swiper-button-prev2,
    .swiper-rtl .swiper-button-next2 {
        left: 0;
    }

    .swiper-button-next2,
    .swiper-rtl .swiper-button-prev2 {
        right: 0;
    }

    .swiper-button-prev2:after,
    .swiper-rtl .swiper-button-next2:after {
    }

    .swiper-button-next2:after,
    .swiper-rtl .swiper-button-prev2:after {
    }

    .swiper-button-next2:after,
    .swiper-button-prev2:after {
        font-family: swiper-icons;
        font-size: 30px;
        text-transform: none !important;
        letter-spacing: 0;
        font-variant: initial;
        line-height: 1;

    }

    .use-swiperBtn {
        top: 65%;
        width: 100%;
        left: 50%;
        transform: translateX(-50%);
        z-index: 1;
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

    #home-tab-pane .carousel-content {
        display: flex;
        width: 100%;
        transition: transform 0.5s ease-in-out;
    }

    #home-tab-pane .carousel-item {
        flex: 0 0 100%;
        display: none;
    }

    #home-tab-pane .carousel-item.active {
        display: block;
    }

    @media (min-width: 1025px) {
        #application .container-fluid {
            width: 80% !important;
        }
    }

</style>


<div class="">
    <!-- Home Page -->
    <section id="home" class="page-section active">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
            <div class="moving-blob-1"></div>
            <div class="moving-blob-2"></div>
        </div>

        <div class="container">
            <!-- Swiper (배경으로 사용) -->
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="assets/images/main-video.mp4" type="video/mp4">
                        </video>
                        <div class="main-title main-f text-center" style="margin: 0 auto;">
                        	<h1>Synapse 3D</h1>
                            <!-- <div style="height:120px"><img src="/assets/images/logo_W.png" height="45"></div> -->
                            <p class="subtitle m-lg-5">
                                Synapse 3D는 후지필름 고유의 3D 재구성 기술을 기반으로 CT 및 MRI 등의<br>영상을 정밀하게 시각화하고 분석하는 고성능 의료 영상 소프트웨어입니다.
                            </p>
                            <div class="button-group justify-content-center">
                                <button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="assets/images/main-video2.mp4" type="video/mp4">
                        </video>
                        <div class="main-title" style="margin: 0 auto;">
                            <h1>Clarity<br>In<br>Beyond<br>Every<br>Dimension</h1>
                            <p class="subtitle m-5 ms-0">
                                Accurate, high-resolution 3D visualization to support better diagnosis<br>
                                더 나은 진단을 위한 정확성과 고해상도를 갖춘 3D 영상을 제공합니다.

                            </p>
                            <div class="button-group">
                                <button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;position: absolute;bottom: 0;z-index: 10;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="assets/images/main-video3.mp4" type="video/mp4">
                        </video>
                        <div class="main-title" style="margin: 0 auto;">
                            <h1>Visualize<br>the Invisible.</h1>
                            <p class="subtitle m-5 ms-0">
                                보이지 않는 내부 구조의 정밀하게 시각화합니다.
                            </p>
                            <div class="button-group">
                                <button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="swiper-pagination"></div>
            <!--<div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>-->
            <!--<div class="mask"></div>-->
        </div>
    </section>
    <section id="application" class="page-section pt-5 pb-5">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>

        <div class="container-fluid">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2.5rem; margin-top: 0.75rem;"><span class="pill">Application</span> 애플리케이션</h2>
            <div class="d-flex  justify-content-between flex-column flex-md-row flex-lg-row gap-2 gap-lg-3 ps-1">
                <ul class="nav nav-tabs d-flex gap-lg-2 border-bottom-0 p-2" id="myTab" role="tablist" style="border-radius: 1.5rem;background: rgba(218, 218, 218, .2);padding: 1px;box-shadow: 1px 0px 4px 5px rgba(255, 255, 255, .3);">
                    <li class="nav-item hbp" role="presentation">
                        <button class="nav-link active align-items-end d-flex justify-content-center" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">HBP</button>
                    </li>
                    <li class="nav-item lung" role="presentation">
                        <button class="nav-link align-items-end d-flex justify-content-center" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">LUNG</button>
                    </li>
                    <li class="nav-item cardiac" role="presentation">
                        <button class="nav-link align-items-end d-flex justify-content-center" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">CARDIAC</button>
                    </li>
                    <li class="nav-item knee" role="presentation">
                        <button class="nav-link align-items-end d-flex justify-content-center" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false">KNEE</button>
                    </li>
                </ul>
                <div class="align-items-end d-flex justify-content-end"><button class="btn px-4 text-white rounded-5" style="background: linear-gradient(to right, #975cf8, #5d55fe);" onclick="location.href='./mypage/request.html'">의뢰하기 <i class="bi bi-arrow-right"></i></button></div>
            </div>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                    <div class="carousel">
                        <div class="carousel-content">
                            <div class="carousel-item active text-center">
                                <div class="d-flex align-items-center flex-column flex-md-row flex-xl-row justify-content-between gap-lg-5">
                                    <div class="carousel-txt align-items-center align-items-md-baseline align-items-lg-baseline d-flex flex-column gap-lg-5 w-50" style="padding-left: 150px;">
                                        <div class="txt-lg" style="font-size: 150px; -webkit-box-reflect: below -110px linear-gradient(to bottom, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));">LIVER</div>
                                        <div class="txt-sub">
                                            <div>혈관 선택으로 간단하게 절단면 확인</div>
                                            <div>Region 부위 volume의 정확한 측정</div>
                                        </div>
                                        <div class="start-0 button-group justify-content-center justify-content-lg-end"><button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                    </div>
                                    <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3 w-50 carousel-img">
                                        <div class="">
                                            <img src="assets/images/tab1-cont-img01.png" width="800" height="516" style="padding-right: 100px;">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="carousel-item active text-center">
                                <div class="d-flex align-items-center flex-column flex-md-row flex-xl-row justify-content-between gap-lg-5">
                                    <div class="carousel-txt align-items-center align-items-md-baseline align-items-lg-baseline d-flex flex-column gap-lg-5 w-50" style="padding-left: 150px;">
                                        <div class="txt-lg" style="font-size: 150px;letter-spacing: -.1em; -webkit-box-reflect: below -110px linear-gradient(to bottom, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));">PANCREAS</div>
                                        <div class="txt-sub">
                                            <div>췌장 주변 장기나 혈관의 자동추출. </div>
                                            <div>그 관계성을 3D Simulation을 통해 관찰.</div>
                                        </div>
                                        <div class="button-group justify-content-center justify-content-lg-end"><button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                        <div class="txt-sub">
                                            <div></div>
                                            <div></div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3 w-50 carousel-img">
                                        <div class="">
                                            <img src="assets/images/tab1-cont-img01-2.jpg" width="800" height="516" style="padding-right: 50px;">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-controls">
                            <button class="carousel-prev justify-content-start justify-content-lg-end fs-1" onclick="prevSlide()"><img class="w-75" src="assets/images/arrow-right.png"></button>
                            <button class="carousel-next justify-content-end justify-content-lg-start fs-1" onclick="nextSlide()"><img class="w-75" src="assets/images/arrow-left.png"></button>
                        </div>
                        <div class="carousel-dots">
                            <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                            <button class="carousel-dot" onclick="setCarouselSlide(1)"></button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                    <div class="carousel">
                        <div class="carousel-content">
                            <div class="carousel-item active text-center">
                                <div class="d-flex align-items-center flex-column flex-md-row flex-xl-row justify-content-between gap-lg-5">
                                    <div class="carousel-txt align-items-center align-items-md-baseline align-items-lg-baseline d-flex flex-column gap-lg-5 w-50" style="padding-left: 150px;">
                                        <div class="txt-lg" style="font-size: 150px; -webkit-box-reflect: below -110px linear-gradient(to bottom, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));">LUNG</div>
                                        <div class="txt-sub">
                                            <div>폐동맥(PA), 폐정맥(PV), 기관지, </div>
                                            <div>폐엽을 자동으로 추출.</div>
                                        </div>
                                        <div class="button-group justify-content-center justify-content-lg-end"><button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                    </div>
                                    <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3 w-50 carousel-img">
                                        <div class="">
                                            <img src="assets/images/tab1-cont-img02.png" width="" height="516" style="padding-right: 50px;">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-dots">
                            <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                    <div class="carousel">
                        <div class="carousel-content">
                            <div class="carousel-item active text-center">
                                <div class="d-flex align-items-center flex-column flex-md-row flex-xl-row justify-content-between gap-lg-5">
                                    <div class="carousel-txt align-items-center align-items-md-baseline align-items-lg-baseline d-flex flex-column gap-lg-5 w-50" style="padding-left: 150px;">
                                        <div class="txt-lg" style="font-size: 150px; -webkit-box-reflect: below -110px linear-gradient(to bottom, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));">CARDIAC</div>
                                        <div class="txt-sub">
                                            <div>심방(Atrium), 심실(Ventricle), 심근(Myocardium), </div>
                                            <div>판막(Valve), 관상동맥(Coronary Arteries) 등 </div>
                                            <div>심장의 여러 구조물들의 분석 및 정량적 평가.</div>
                                        </div>
                                        <div class="button-group justify-content-end"><button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                    </div>
                                    <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3 w-50 carousel-img">
                                        <div class="">
                                            <img src="assets/images/tab1-cont-img03.png" width="800" height="516" style="padding-right: 50px;">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-dots">
                            <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
                    <div class="carousel">
                        <div class="carousel-content">
                            <div class="carousel-item active text-center">
                                <div class="d-flex align-items-center flex-column flex-md-row flex-xl-row justify-content-between gap-lg-5">
                                    <div class="carousel-txt align-items-center align-items-md-baseline align-items-lg-baseline d-flex flex-column gap-lg-5 w-50" style="padding-left: 150px;">
                                        <div class="txt-lg" style="font-size: 150px; -webkit-box-reflect: below -110px linear-gradient(to bottom, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));">KNEE</div>
                                        <div class="txt-sub">
                                            <div>무릎 연골(Cartilage)의 자동 추출. </div>
                                            <div>Thickness와 Volume,Loss area의 분석 및 정량적 평가.</div>
                                        </div>
                                        <div class="button-group justify-content-end"><button class="btn-secondary" onclick="location.href='all-application.html'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                    </div>
                                    <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3 w-50 carousel-img">
                                        <div class="">
                                            <img src="assets/images/tab1-cont-img04.jpg" width="" height="516" style="padding-right: 50px;">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-dots">
                            <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </section>
    <section id="business" class="page-section transition-transform-bg">
        <div class="container-fluid">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2.5rem; margin-top: 4rem;margin-bottom: 67px !important;"><span class="pill">Feature introduction</span> 기능 소개</h2>
            <div class="align-items-center d-flex gap-1 justify-content-end mb-3">
                <img src="assets/images/feature-icon.png" width="30">
                <span>REiLI의 독보적인 AI기술력과 함께합니다.</span>
            </div>
            <div class="d-flex flex-wrap justify-content-between">
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon01.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">One click Extraction</div>
                        <div>Fujifilm의 혁신적인 AI 기반기술로 간편하고<br>높은 정확도를 가진 자동 추출 기능</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon02.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Accurate Volumetry</div>
                        <div>특정 장기나 분할된 영역의 부피를 자동으로 정확하게 측정</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon03.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Segmentation of territory</div>
                        <div>One click으로 기능적 영역의 자동적 분할</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon04.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Pre-operative Simulation</div>
                        <div>수술 전 Region Division이나 Virtual Endoscopy를<br>통한 수술 계획 설정</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon05.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">3D Reconstruction</div>
                        <div>정확하고 간편한 해부학적 구조의 시각화를 통한 직관적인 관찰</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon06.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Various Visualization Tool</div>
                        <div>다양한 시각화 도구를 통한 영상 분석 및 시각화</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon07.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Fast Data Processing</div>
                        <div>대용량 의료 정보를 고속으로 처리</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon08.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Intuitive Interface</div>
                        <div>직관적인 인터페이스를 통한 쉽고 효과적인 사용</div>
                    </div>
                </div>
                <div class="business-box rounded-5 d-flex align-items-lg-center gap-3 p-4">
                    <div><img src="assets/images/business-icon09.png" width="88"></div>
                    <div class="business-txt">
                        <div class="feature-title">Support for Various Data Formats</div>
                        <div>DCM format 외 3D PDF, Offline VR,STL<br>file 등 다양한 파일 포맷 지원</div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5 pb-5"><button class="btn rounded-5 text-white btn-lg" onclick="location.href='all-application.html'" style="background: linear-gradient(to right, #427290, #0d5e83, #106287)">View all application</button></div>
        </div>
    </section>
    <section id="type" class="page-section transition-transform-bg">
        <div class="container-fluid">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2.5rem; margin-top: 4rem;"><span class="pill">Type introduction</span> 타입 소개</h2>
            <div class="d-flex flex-column flex-lg-row justify-content-between gap-3 gap-lg-2">
                <div class="type-box p-4 p-lg-5 rounded-5 cursor-pointer" data-bs-toggle="modal" data-bs-target="#type-1">
                    <div class="d-flex gap-lg-3 gap-xl-5 align-items-center flex-column flex-lg-row justify-content-center">
                        <div># CCU 최대 10대</div>
                        <div># 고가용성(HA)</div>
                        <div># 중앙집중형 관리</div>
                    </div>
                    <div class="type-title">Server/Client Type</div>
                    <div class="type-sub">Server H/W 및 S/W 안전성이 우수하고<br><span>다수 Client (CCU 최대 10대)에서 Synapse 구동이 가능.</span></div>
                    <div class="type-img"><img src="assets/images/type1-img01.png"></div>
                    <div class="text-center"><button class="btn text-white rounded-5 btn-lg" style="background: linear-gradient(to right, #427290, #0d5e83, #106287);">Learn more</button></div>
                </div>
                <div class="type-box p-4 p-lg-5 rounded-5 cursor-pointer" data-bs-toggle="modal" data-bs-target="#type-2">
                    <div class="d-flex gap-lg-3 gap-xl-5 align-items-center flex-column flex-lg-row justify-content-center">
                        <div># 단일 PC</div>
                        <div># 네트워크 연동</div>
                        <div># 신속한 3D 가공</div>
                    </div>
                    <div class="type-title">Stand-alone Type</div>
                    <div class="type-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해<br>촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행.</div>
                    <div class="type-img"><img src="assets/images/type1-img02.png"></div>
                    <div class="text-center"><button class="btn text-white rounded-5 btn-lg" style="background: linear-gradient(to right, #155796, #0e4173, #0f4376);">Learn more</button></div>
                </div>
            </div>
        </div>
    </section>
    <section id="use-cases" class="page-section transition-transform-bg">
        <div class="container-fluid d-flex flex-column position-relative">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2.5rem; margin-top: 4rem;"><span class="pill">Use-cases</span> 활용 사례</h2>

            <div class="swiper mySwiper2 p-3">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.4174/astr.2019.97.3.124" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                </div>
                                <div class="use-name">Can we delineate preoperatively the right and ventral margins of caudate lobe of the liver?</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Xue-Yin Shen, Hee-Jung Wang, Bong-Wan Kim, Sung-Yeon Hong, Mi-Na Kim, and Xu-Guang Hu.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2019, Annals of Surgical Treatment and Research, 97(3), 124–129
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.4174/astr.2019.97.3.124</div>
                                    </div>
                                </div>

                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">

                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png" width="34"></div>

                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1371/journal.pone.0276600" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Three-dimensional simulation of the pancreatic parenchyma, pancreatic duct and vascular arrangement in pancreatic surgery using a deep learning algorithm.</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ryoichi Miyamoto , Amane Takahashi, Aya Ogasawara, Toshiro Ogura, Kei Kitamura, Hiroyuki Ishida, Shinichi Matsudaira, Satoshi Nozu, Yoshiyuki Kawashima.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2022, PLOS ON, N 10, p. e0276600
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1371/journal.pone.0276600</div>
                                    </div>
                                </div>

                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png" width="34"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1093/ejcts/ezu375" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">High-quality 3-dimensional image simulation for pulmonary lobectomy and segmentectomy: results of preoperative assessment of pulmonary vessels and short-term surgical outcomes in consecutive patients undergoing video-assisted thoracic surgery.</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Masaru Hagiwara, Yoshihisa Shimada, Yasufumi Kato, Kimitoshi Nawa, Yojiro Makino, Hideyuki Furumoto, Soichi Akata, Masatoshi Kakihana, Naohiro Kajiwara, Tatsuo Ohira, Hisashi Saji, Norihiko Ikeda
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2014, European Journal of Cardio-Thoracic Surgery, 46(1), 24–30.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1093/ejcts/ezu375</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1007/s12072-018-9874-x" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                </div>
                                <div class="use-name">Evaluation of liver function using gadolinium-ethoxybenzyl-diethylenetriamine pentaacetic acid enhanced magnetic resonance imaging based on a three-dimensional volumetric analysis system</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Masashi Kudo, Naoto Gotohda, Motokazu Sugimoto, Tatsushi Kobayashi, Motohiro Kojima, Shinichiro Takahashi, Masaru Konishi & Ryuichi Hayashi
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2018, Hepatology International, 12(5), 447–456.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1007/s12072-018-9874-x</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1007/s00534-012-0573-z" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                </div>
                                <div class="use-name">Novel virtual hepatectomy is useful for evaluation of the portal territory for anatomical sectionectomy, segmentectomy, and hemihepatectomy</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Shun-ichi Ariizumi, Yutaka Takahashi, Yoshihito Kotera, Akiko Omori, Godai Yoneda, Han Mu, Satoshi Katagiri, Hiroto Egawa, Masakazu Yamamoto.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2012, Journal of Hepato-Biliary-Pancreatic Sciences, 19(3), 230–237.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1007/s00534-012-0573-z</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1016/j.amjsurg.2013.01.041" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                    <div class="use-name"></div>
                                </div>
                                <div class="use-name">Planning of anatomical liver segmentectomy and subsegmentectomy with 3-dimensional simulation software</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Takeshi Takamoto, M.D., Ph.D. takamoto@nifty.com ∙ Takuya Hashimoto, M.D., Ph.D. ∙ Satoshi Ogata, M.D., Ph.D. ∙ Kazuto Inoue, M.D., Ph.D. ∙ Yoshikazu Maruyama, M.D. ∙ Akiyuki Miyazaki, M.D. ∙ Masatoshi Makuuchi, M.D., Ph.D.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2013, The American Journal of Surgery, 206(4), 530–538.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1016/j.amjsurg.2013.01.041</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.12659/AOT.882633" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                </div>
                                <div class="use-name">The usefulness of a high-speed 3D-image analysis system in pediatric living donor liver transplantation</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Kyoko Mochizuki, Mitsuhisa Takatsuki, Akihiko Soyama, Masaaki Hidaka, Masayuki Obatake, Susumu Eguchi
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2012, Annals of Transplantation, 17(1), 31–34.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.12659/AOT.882633</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1007/s11605-019-04234-9" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon04.png"><span>Liver</span>
                                </div>
                                <div class="use-name">Validation of Functional Assessment for Liver Resection Considering Venous Occlusive Area after Extended Hepatectomy</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Hidetoshi Nitta, Yuki Kitano, Tatsunori Miyata, Shigeki Nakagawa, Kosuke Mima, Hirohisa Okabe, Hiromitsu Hayashi, Katsunori Imai, Yo-ichi Yamashita, Akira Chikamoto, Toru Beppu, Hideo Baba
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2020, Journal of Gastrointestinal Surgery, 24(7), 1510–1519.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1007/s11605-019-04234-9</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1002/jhbp.84" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Computer assisted surgery, preoperative planning and navigation for pancreatic cancer</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Yuta Abe, Osamu Itano, Minoru Kitago, Masahiro Shinoda, Hiroshi Yagi, Taizo Hibi, Kiminori Takano, Naokazu Chiba, Shigeyuki Kawachi, Motohide Shimazu, Yuko Kitagawa
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2014, Journal of Hepato-Biliary-Pancreatic Sciences, 21(4), 251–255.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1002/jhbp.84</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1159/000484894" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Impact of Three-Dimensional Surgical Simulation on Pancreatic Surgery</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ryoichi Miyamoto, Yukio Oshiro, Ken Nakayama, Nobuhiro Ohkohchi
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2017, Gastrointestinal Tumors, 4(3–4), 84–89.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1159/000484894</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.7759/cureus.55907" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Laparoscopic Distal Pancreatectomy Using Three-Dimensional Computer Graphics for Surgical Navigation With a Deep Learning Algorithm: A Case Report</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ryoichi Miyamoto, Masahiro Shiihara, Mitsugi Shimoda, Shuji Suzuki
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2024, Cureus, 16(3), e55907.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.7759/cureus.55907</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1007/s00595-016-1377-6" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Three-dimensional simulation of pancreatic surgery showing the size and location of the main pancreatic duct</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ryoichi Miyamoto, Yukio Oshiro, Ken Nakayama, Keisuke Kohno, Shinji Hashimoto, Kiyoshi Fukunaga, Tatsuya Oda & Nobuhiro Ohkohchi
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2016, Surgery Today, 46(11), 1273–1280.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1007/s00595-016-1377-6</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1016/j.amsu.2018.09.043" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon02.png"><span>Pancreas</span>
                                </div>
                                <div class="use-name">Three-dimensional surgical simulation of the bile duct and vascular arrangement in pancreatoduodenectomy: A retrospective cohort study</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ryoichi Miyamoto, Yukio Oshiro, Naoki Sano, Satoshi Inagawa, Nobuhiro Ohkohchi
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2018, Annals of Medicine and Surgery, 36, 17–22.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1016/j.amsu.2018.09.043</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1016/j.athoracsur.2013.08.026" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">High-Speed 3-Dimensional Imaging in Robot-Assisted Thoracic Surgical Procedures</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Naohiro Kajiwara, MD, Soichi Akata, MD, Masaru Hagiwara, MD, Koichi Yoshida, MD, Yasufumi Kato, MD, Masatoshi Kakihana, MD, Tatsuo Ohira, MD, Norihiko Kawate, MD, and Norihiko Ikeda, MD<br>
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2014, Annals of Thoracic Surgery, 97(6), 2182–2184.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1016/j.athoracsur.2013.08.026</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1186/s40792-020-01097-0" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">Left superior segmentectomy for a patient with displaced anomalous apicoposterior branches of the pulmonary vein and bronchus: a case report</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Hiroki Matsumoto, Hidemi Suzuki, Takahide Toyoda, Terunaga Inage, Kazuhisa Tanaka, Yuichi Sakairi, Fumihiro Ishibashi, Takahiro Nakajima & Ichiro Yoshino
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2021, Surgical Case Reports, 7, 8.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1186/s40792-020-01097-0</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.5761/atcs.nm.13-00322" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">Simulation of the Fissureless Technique for Thoracoscopic Segmentectomy Using Rapid Prototyping</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Tadashi Akiba, MD, PhD, FACS, Takeo Nakada, MD, and Takuya Inagaki, MD, PhD
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2015, Annals of Thoracic and Cardiovascular Surgery, 21(1), 84-86.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.5761/atcs.nm.13-00322</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1016/j.healun.2015.11.001" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">Stenosis of the segmental bronchus is a characteristic airway complication in living-donor lobar lung transplantation</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Ei Miyamoto, MD ∙ Toyofumi F. Chen-Yoshikawa, MD, PhD ∙ Hirokazu Higuchi, MS ∙ Akihiro Aoyama, MD, PhD ∙ Hiroshi Date, MD, PhD
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2016, Journal of Heart and Lung Transplantation, 35(3), 393–397.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1016/j.healun.2015.11.001</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box p-4 p-lg-4 shadow-sm">
                            <a href="https://doi.org/10.1093/icvts/ivt120" target="_blank">
                                <div class="use-title">
                                    <img src="assets/images/use-icon01.png"><span>Lung</span>
                                </div>
                                <div class="use-name">Virtual segmentectomy based on high-quality three-dimensional lung modelling from computed tomography images.</div>
                                <div class="use-sub">
                                    <div>
                                        <div class="fw-bold text-dark">Authors</div>
                                        Hisashi Saji, Tatsuya Inoue, Yasufumi Kato, Yoshihisa Shimada, Masaru Hagiwara, Yujin Kudo, Soichi Akata, Norihiko Ikeda
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Journal</div>
                                        2013, Interactive CardioVascular and Thoracic Surgery, 17(2), 227–232.
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark">Website</div>
                                        <div>https://doi.org/10.1093/icvts/ivt120</div>
                                    </div>
                                </div>
                                <div class="use-link align-items-center d-flex gap-2 justify-content-end">
                                    <div style="padding-right: 3px;"><img src="assets/images/use-arrow.png"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="use-swiperBtn position-absolute">
                <div class="swiper-button-next2"><img class="" src="assets/images/arrow-left2.png" width="20"></div>
                <div class="swiper-button-prev2"><img class="" src="assets/images/arrow-right2.png" width="20"></div>
            </div>
        </div>
    </section>
</div>

<!-- 타입소개 모달1 -->
<div class="modal fade type-modal" id="type-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl  modal-dialog-centered">
        <div class="modal-content rounded-5">
            <div class="modal-header">
                <h1 class="modal-title fs-5 mt-0" id="exampleModalLabel">Server/Client Type</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body align-items-center d-flex flex-column gap-2 bg-body-secondary p-5 rounded-bottom-5">
                <div class="d-flex justify-content-between w-100">
                    <div class="d-flex flex-column gap-3">
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow">
                            <img src="assets/images/type_img01.png" width="">
                            <div>PACS</div>
                        </div>
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow">
                            <div class="d-flex flex-wrap gap-1 justify-content-center">
                                <div class="circle-box">CT</div>
                                <div class="circle-box">MR</div>
                                <div class="circle-box">PET</div>
                            </div>
                            <div class="d-flex flex-wrap gap-1 justify-content-center">
                                <div class="circle-box">NM</div>
                                <div class="circle-box">XA</div>
                            </div>
                            <div>Imaging Device</div>
                        </div>
                    </div>
                    <div class="align-items-center d-flex flex-column text-secondary mt-5"><i class="bi bi-arrow-right fs-2"></i>
                        <div>DICOM data</div>
                    </div>
                    <div class="align-items-center d-flex flex-column">
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow" style="width: 414px;">
                            <div class="align-items-center d-flex gap-4">
                                <div><img src="assets/images/type_img02.png" width=""></div>
                                <div class="fs-2"><i class="bi bi-plus-lg"></i></div>
                                <div>
                                    <div>Hardware Key</div>
                                    <div><img src="assets/images/type_img03.png" width="80"></div>
                                </div>
                            </div>
                            <div><img src="assets/images/logo_B.png" height="30"></div>
                        </div>
                        <div class="fs-2 text-secondary"><i class="bi bi-arrow-down-up"></i></div>
                        <div class="d-flex align-items-center flex-column border p-3 rounded-4 bg-white shadow">
                            <div><img src="assets/images/type_img05.png" width="380"></div>
                            <div>Client computer</div>
                        </div>
                    </div>
                    <div class="align-items-center d-flex flex-column text-secondary mt-5"><i class="bi bi-arrow-right fs-2"></i>
                        <div>3D simulation data</div>
                    </div>
                    <div class="border p-3 rounded-4 bg-white text-center shadow h-100">
                        <img src="assets/images/type_img04.png" width="">
                        <div>PACS / Printer</div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

<!-- 타입소개 모달2 -->
<div class="modal fade type-modal" id="type-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl  modal-dialog-centered">
        <div class="modal-content rounded-5">
            <div class="modal-header">
                <h1 class="modal-title fs-5 mt-0" id="exampleModalLabel">Stand-alone Type</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body align-items-center d-flex flex-column gap-2 bg-body-secondary p-5 rounded-bottom-5">
                <div class="d-flex align-items-center justify-content-between w-100">
                    <div class="d-flex flex-column gap-3">
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow">
                            <img src="assets/images/type_img01.png" width="">
                            <div>PACS</div>
                        </div>
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow">
                            <div class="d-flex flex-wrap gap-1 justify-content-center">
                                <div class="circle-box">CT</div>
                                <div class="circle-box">MR</div>
                                <div class="circle-box">PET</div>
                            </div>
                            <div class="d-flex flex-wrap gap-1 justify-content-center">
                                <div class="circle-box">NM</div>
                                <div class="circle-box">XA</div>
                            </div>
                            <div>Imaging Device</div>
                        </div>
                    </div>
                    <div class="align-items-center d-flex flex-column text-secondary"><i class="bi bi-arrow-right fs-2"></i>
                        <div>DICOM data</div>
                    </div>
                    <div class="align-items-center d-flex flex-column">
                        <div class="align-items-center border d-flex flex-column p-3 rounded-4 bg-white shadow">
                            <div class="align-items-center d-flex gap-4">
                                <div><img src="assets/images/type_img02.png" width=""></div>
                                <div class="fs-2"><i class="bi bi-plus-lg"></i></div>
                                <div>
                                    <div>Hardware Key</div>
                                    <div><img src="assets/images/type_img03.png" width="80"></div>
                                </div>
                            </div>
                            <div><img src="assets/images/logo_B.png" height="30"></div>
                        </div>
                    </div>
                    <div class="align-items-center d-flex flex-column text-secondary"><i class="bi bi-arrow-right fs-2"></i>
                        <div>3D simulation data</div>
                    </div>
                    <div class="border p-3 rounded-4 bg-white text-center shadow h-100">
                        <img src="assets/images/type_img04.png" width="">
                        <div>PACS / Printer</div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        effect: "fade",
        fadeEffect: {
            crossFade: true
        },
        spaceBetween: 0,
       /*  autoplay: {
            delay: 10000,
            disableOnInteraction: false,
        }, */
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        speed: 1000,
        loop: true,
    });

</script>

<script>
    var swiper2 = new Swiper(".mySwiper2", {
        slidesPerView: 1,
        /* Default to 1 slide per view on mobile */
        spaceBetween: 10,
        navigation: {
            nextEl: ".swiper-button-next2",
            prevEl: ".swiper-button-prev2",
        },
        breakpoints: {
            768: {
                slidesPerView: 2,
                /* Show 3 slides on screens >= 768px */
                spaceBetween: 10,
            },
            1024: {
                slidesPerView: 3,
                /* Show 3 slides on screens >= 768px */
                spaceBetween: 10,
            },
            1025: {
                slidesPerView: 4,
                /* Show 3 slides on screens >= 768px */
                spaceBetween: 10,
            },
        },
        loop: true,
    });

</script>

<script>
    var swiper3 = new Swiper(".mySwiper3", {
        slidesPerView: 1,
        /* Default to 1 slide per view on mobile */
        spaceBetween: 10,
        pagination: {
            el: ".swiper-pagination2",
            clickable: true,
        },
        breakpoints: {
            768: {
                slidesPerView: 1,
                /* Show 3 slides on screens >= 768px */
                spaceBetween: 25.4,
            },
        },
        loop: true,
    });

</script>

<!-- Application JS -->
<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('#home-tab-pane .carousel-item');
    const dots = document.querySelectorAll('#home-tab-pane .carousel-dot');
    const totalSlides = slides.length;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            dots[i].classList.remove('active');
            if (i === index) {
                slide.classList.add('active');
                dots[i].classList.add('active');
            }
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    function setCarouselSlide(index) {
        currentSlide = index;
        showSlide(currentSlide);
    }

    // Auto-slide every 3 seconds
    //setInterval(nextSlide, 3000);

    // Initial display
    showSlide(currentSlide);

</script>


<!-- 메인 스와이퍼&텍스트 JS -->
<script>
    // 애니메이션 적용 함수
    function applyAnimationToActiveSlide(swiperInstance) {
    console.log('Applying animation, realIndex:', swiperInstance.realIndex);
    // 모든 main-title에서 animate 클래스 제거
    document.querySelectorAll('.swiper-slide .main-title').forEach(title => {
        title.classList.remove('animate');
        console.log('Removed animate class from:', title);
    });

    // 활성 슬라이드 선택
    const activeSlide = swiperInstance.slides[swiperInstance.activeIndex].querySelector('.main-title');
    if (activeSlide) {
        activeSlide.classList.add('animate');
        console.log('Added animate class to:', activeSlide);
    } else {
        console.log('No main-title found for activeIndex:', swiperInstance.activeIndex);
    }
}

    // Swiper 초기화
    try {
        const swiper = new Swiper('.mySwiper', {
            loop: true,
            /* autoplay: {
                delay: 10000,
                disableOnInteraction: false,
            }, */
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            effect: 'fade',
            fadeEffect: {
                crossFade: true,
            },
            on: {
                init: function() {
                    console.log('Swiper initialized, slides:', this.slides.length); // 디버깅: 초기화 완료
                    setTimeout(() => applyAnimationToActiveSlide(this), 100); // 초기화 후 지연
                },
                slideChangeTransitionEnd: function() {
                    console.log('Slide transition ended, realIndex:', this.realIndex); // 디버깅: 전환 완료
                    applyAnimationToActiveSlide(this);
                },
                paginationUpdate: function() {
                    console.log('Pagination updated, realIndex:', this.realIndex); // 디버깅: 페이지네이션 업데이트
                    applyAnimationToActiveSlide(this);
                },
            },
        });

        // 페이지네이션 클릭 이벤트
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('swiper-pagination-bullet')) {
                console.log('Pagination bullet clicked, bullet index:', event.target.getAttribute('aria-label')); // 디버깅: 클릭
                setTimeout(() => applyAnimationToActiveSlide(swiper), 200); // 클릭 후 지연
            }
        });

        // 페이지 로드 시 초기 애니메이션
        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM fully loaded'); // 디버깅: DOM 로드
            if (swiper && swiper.initialized) {
                console.log('Swiper already initialized, applying animation');
                applyAnimationToActiveSlide(swiper);
            } else {
                console.log('Swiper not yet initialized, waiting...');
                setTimeout(() => applyAnimationToActiveSlide(swiper), 300); // Swiper 대기
            }
        });
    } catch (error) {
        console.error('Swiper initialization failed:', error); // 디버깅: 초기화 에러
    }

</script>

<!-- <script>
document.addEventListener('DOMContentLoaded', () => {
	  // 모든 .use-name과 .use-sub > div:first-child 요소 선택
	  const elements = document.querySelectorAll('.use-name, .use-sub > div:first-child');

	  elements.forEach(element => {
	    // 줄 수 기준 설정
	    const maxLines = element.classList.contains('use-name') ? 4 : 5; // .use-name은 4줄, .use-sub > div:first-child는 5줄
	    const clampLines = element.classList.contains('use-name') ? 3 : 4; // .use-name은 3줄, .use-sub > div:first-child는 4줄에서 생략
	    const lineHeight = parseFloat(getComputedStyle(element).lineHeight) || 18; // 줄 높이 가져오기
	    const maxHeight = lineHeight * maxLines;

	    // 임시로 clamp 스타일 적용하여 실제 높이 확인
	    const originalClasses = element.className;
	    element.classList.add('clamp');
	    const actualHeight = element.scrollHeight;
	    const calculatedLines = Math.ceil(actualHeight / lineHeight); // 실제 줄 수 계산
	    element.className = originalClasses; // 원래 클래스 복원

	    // 디버깅 로그 (최종 배포 시 제거 가능)
	    console.log(`Element: ${element.textContent.slice(0, 20)}..., class: ${element.className}, lineHeight: ${lineHeight}, actualHeight: ${actualHeight}, maxHeight: ${maxHeight}, maxLines: ${maxLines}, calculatedLines: ${calculatedLines}`);

	    // 텍스트가 maxLines를 초과하는 경우
	    if (calculatedLines > maxLines) { // 줄 수로 직접 비교
	      // clamp 클래스 추가로 ellipsis 적용
	      element.classList.add('clamp');

	      // 버튼 생성
	      const button = document.createElement('button');
	      button.className = 'toggle-btn';
	      button.innerHTML = '<i class="bi bi-caret-down-fill border p-1 rounded-5"></i>'; // 아래 화살표
	      // 버튼을 대상 요소 바로 다음에 삽입
	      element.parentNode.insertBefore(button, element.nextSibling);

	      // 토글 이벤트 추가
	      button.addEventListener('click', (event) => {
	        event.preventDefault(); // a 태그의 링크 이동 방지
	        event.stopPropagation(); // 이벤트 버블링 방지

	        // 모든 요소의 expanded 클래스 제거 및 버튼 아이콘 초기화
	        elements.forEach(otherElement => {
	          if (otherElement !== element && otherElement.classList.contains('expanded')) {
	            otherElement.classList.remove('expanded');
	            otherElement.classList.add('clamp');
	            const otherButton = otherElement.nextSibling;
	            if (otherButton && otherButton.classList.contains('toggle-btn')) {
	              otherButton.innerHTML = '<i class="bi bi-caret-down-fill border p-1 rounded-5"></i>';
	            }
	          }
	        });

	        // 현재 요소 토글
	        if (element.classList.contains('expanded')) {
	          // 축약 상태로 복귀
	          element.classList.remove('expanded');
	          element.classList.add('clamp');
	          button.innerHTML = '<i class="bi bi-caret-down-fill border p-1 rounded-5"></i>'; // 아래 화살표
	        } else {
	          // 전체 텍스트 표시
	          element.classList.add('expanded');
	          element.classList.remove('clamp');
	          button.innerHTML = '<i class="bi bi-caret-up-fill border p-1 rounded-5"></i>'; // 위 화살표
	        }
	      });
	    }
	  });
	});
  </script> -->
  
  <script>
  document.addEventListener('DOMContentLoaded', () => {
	  // 모든 .use-name과 .use-sub > div:first-child 요소 선택
	  const elements = document.querySelectorAll('.use-name, .use-sub > div:first-child');

	  elements.forEach(element => {
	    // 줄 수 기준 설정
	    const maxLines = element.classList.contains('use-name') ? 4 : 5; // .use-name은 4줄, .use-sub > div:first-child는 5줄
	    const lineHeight = parseFloat(getComputedStyle(element).lineHeight) || 18; // 줄 높이 가져오기
	    const maxHeight = lineHeight * maxLines;

	    // 임시로 clamp 스타일 적용하여 실제 높이 확인
	    const originalClasses = element.className;
	    element.classList.add('clamp');
	    const actualHeight = element.scrollHeight;
	    const calculatedLines = Math.ceil(actualHeight / lineHeight); // 실제 줄 수 계산
	    element.className = originalClasses; // 원래 클래스 복원

	    // 디버깅 로그 (최종 배포 시 제거 가능)
	    console.log(`Element: ${element.textContent.slice(0, 20)}..., class: ${element.className}, lineHeight: ${lineHeight}, actualHeight: ${actualHeight}, maxHeight: ${maxHeight}, maxLines: ${maxLines}, calculatedLines: ${calculatedLines}`);

	    // 텍스트가 maxLines를 초과하는 경우
	    if (calculatedLines > maxLines) { // 줄 수로 직접 비교
	      // clamp 클래스 추가로 ellipsis 적용
	      element.classList.add('clamp');

	      // 클릭 이벤트 추가
	      element.addEventListener('click', (event) => {
	        event.preventDefault(); // a 태그의 링크 이동 방지
	        event.stopPropagation(); // 이벤트 버블링 방지

	        // 모든 요소의 expanded 클래스 제거 및 clamp 복원
	        elements.forEach(otherElement => {
	          if (otherElement !== element && otherElement.classList.contains('expanded')) {
	            otherElement.classList.remove('expanded');
	            otherElement.classList.add('clamp');
	          }
	        });

	        // 현재 요소 토글
	        if (element.classList.contains('expanded')) {
	          // 축약 상태로 복귀
	          element.classList.remove('expanded');
	          element.classList.add('clamp');
	        } else {
	          // 전체 텍스트 표시
	          element.classList.add('expanded');
	          element.classList.remove('clamp');
	        }
	      });
	    }
	  });
	});
  </script>


<jsp:include page="footer.jsp" />
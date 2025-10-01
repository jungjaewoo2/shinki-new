<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:image" content="../assets/images/logo_B.png">
    <title>SHINKISA - Medical-grade 3D Visualization</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <!-- 메인 스와이퍼&텍스트 CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-fluid p-0">
        <!-- Navigation -->
        <nav class="top-nav navbar navbar-expand-lg">
            <div class="nav-container container-fluid">
                <div class="logo" onclick="location.href='./'">
                    <img src="assets/images/logo_W.png" height="30">
                    <!--<span class="fs-4">SYNAPSE 3D</span>-->
                </div>

                <div class="nav-menu">
                    <button class="nav-link" onclick="location.href='./'">HOME</button>
                    <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application'"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Application
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="application">HBP</a></li>
                                    <li><a class="dropdown-item" href="lung">LUNG</a></li>
                                    <li><a class="dropdown-item" href="cardiac">CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="knee">KNEE</a></li>
                                    <li><a class="dropdown-item" href="all-application">All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="location.href='/mypage/request'">Request</button>
                    <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application'"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn" data-bs-toggle="dropdown" aria-expanded="false" onclick="location.href='./mypage/inquiry'">
                                    Q&A
                                </button>
                                <!--<ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">문의하기</a></li>
                                    <li><a class="dropdown-item" href="#">문의내역조회</a></li>
                                </ul>-->
                            </li>
                        </ul>
                    </div>

                </div>
				<div class="d-none d-lg-block w-25">
					<div class="align-items-center d-flex gap-1 justify-content-between">
                	<div class="d-none d-xl-block position-relative" style="right: 15%">
	                    <div class="d-flex align-items-center gap-3">
	                        <!--<div class=""><a href="#" class="pe-auto">LOGOUT</a></div>-->
	                        <!--<div class=""><a href="#" class="pe-auto">MYPAGE</a></div>-->
	                        <!--<div class=""><a href="#" class="pe-auto text-decoration-underline">신기사님</a></div>-->
	                    </div>
                    
                    	<div class="dropdown">
                        <!--<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            신기사님
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item d-flex align-items-center gap-2" href="#">

                                    <div><i class="bi bi-person-circle fs-5"></i></div>
                                    <div>마이페이지</div>
                                </a>
                            </li>
                            <li>
                                <a class="d-flex dropdown-item align-items-center gap-2" href="#">

                                    <div><i class="bi bi-box-arrow-right fs-5"></i></div>
                                    <div>로그아웃</div>
                                </a>
                            </li>
                        </ul>-->
                        <!-- 로그인 상태에 따른 조건부 렌더링 (데스크톱) -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.username}">
                                <!-- 로그인된 경우: 드롭다운 메뉴 -->
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle text-white" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background: none; border: none; color: rgba(255, 255, 255, 0.7) !important;">
                                        <i class="bi bi-person-circle fs-5"></i> ${sessionScope.username}님
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/mypage/profile"><i class="bi bi-person-circle"></i> 마이페이지</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#" onclick="logout()"><i class="bi bi-box-arrow-right"></i> 로그아웃</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- 로그인되지 않은 경우: 로그인 링크 -->
                                <div class="cursor-pointer" style="color: rgba(255, 255, 255, 0.7);" onclick="location.href='/mypage/login'">로그인</div>
                            </c:otherwise>
                        </c:choose>
                        
                    </div>
                    
                    </div>
                    <div class="align-items-baseline d-flex gap-1 mb-2" style=""><img src="/assets/images/logo.png" height="45"><img src="../assets/images/fujifilm-logo.png" alt="후지필름로고" height="30"></div>
                    </div>
				</div>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                    <i class="bi bi-list fs-2 text-white"></i>
                </button>
                <!--<button class="hamburger-btn" onclick="toggleSidebar()">☰</button>-->

            </div>
        </nav>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header bg-black">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><img src="assets/images/logo_W.png"></h5>
                <button type="button" class="btn-close bg-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="">
                    <button class="nav-link" onclick="location.href='./'">HOME</button>
                    <div class="collapse navbar-collapse show" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Application
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="application">- HBP</a></li>
                                    <li><a class="dropdown-item" href="lung">- LUNG</a></li>
                                    <li><a class="dropdown-item" href="cardiac">- CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="knee">- KNEE</a></li>
                                    <li><a class="dropdown-item" href="all-application">- All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="location.href='mypage/request'">Request</button>
                    <div class="collapse navbar-collapse show" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn" data-bs-toggle="dropdown" aria-expanded="false">
                                    Q&A
                                </button>
                                <!-- <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="mypage/inquiry">- 문의하기</a></li>
                                    <li><a class="dropdown-item" href="mypage/inquiry-history">- 문의내역조회</a></li>
                                </ul> -->
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="d-flex flex-column gap-3 position-absolute bottom-0" style="padding: 0.5rem 0.75rem;">
                    <!-- 로그인 상태에 따른 조건부 렌더링 (모바일) -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            <!-- 로그인된 경우: 사용자명과 메뉴 -->
                            <div class=""><a href="#" class="pe-auto"><i class="bi bi-person-circle fs-5"></i> ${sessionScope.username}님</a></div>
                            <div class=""><a href="/mypage/profile" class="pe-auto"><i class="bi bi-person-circle fs-5"></i> 마이페이지</a></div>
                            <div class=""><a href="#" class="pe-auto" onclick="logout()"><i class="bi bi-box-arrow-right fs-5"></i> 로그아웃</a></div>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인되지 않은 경우: 로그인 링크 -->
                            <div class=""><a href="#" class="pe-auto" onclick="location.href='/mypage/login'">로그인</a></div>
                        </c:otherwise>
                    </c:choose>
                    <div class="align-items-baseline d-flex gap-1" style=""><img src="/assets/images/logo_header.png" height="45"><img src="../assets/images/fujifilm-logo.png" alt="후지필름로고" height="30"></div>
                </div>
            </div>
        </div>

<script>
function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        fetch('/mypage/logout', {
            method: 'GET'
        })
        .then(response => {
            if (response.ok) {
                alert('로그아웃 되었습니다');
                window.location.href = '/mypage/login';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('로그아웃 중 오류가 발생했습니다.');
        });
    }
}
</script>

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
	<link rel="icon" href="assets/images/favicon.png">
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
                                    <li><a class="dropdown-item" href="lung">THX</a></li>
                                    <li><a class="dropdown-item" href="cardiac">CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="knee">KNEE</a></li>
                                    <li><a class="dropdown-item" href="all-application">All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="checkLoginAndRedirect()">Request</button>
                    <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application'"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn" data-bs-toggle="dropdown" aria-expanded="false" onclick="checkLoginAndRedirectToInquiry()">
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
				<div class="nav-r w-25 px-3">
					<div class="align-items-center d-flex gap-1 justify-content-between">
                	<div class="position-relative" style="">
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
                    <div class="align-items-baseline d-flex gap-1" style=""><img src="../assets/images/fujifilm-logo-w.png" alt="후지필름로고" height="32"></div>
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
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"  onclick="location.href='./'"><img src="assets/images/logo_W.png"></h5>
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
                                    <li><a class="dropdown-item" href="lung">- THX</a></li>
                                    <li><a class="dropdown-item" href="cardiac">- CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="knee">- KNEE</a></li>
                                    <li><a class="dropdown-item" href="all-application">- All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="checkLoginAndRedirect()">Request</button>
                    <div class="collapse navbar-collapse show" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn" data-bs-toggle="dropdown" aria-expanded="false" onclick="checkLoginAndRedirectToInquiry()">
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
                            <div class=""><a href="#" class="pe-auto" onclick="simpleLogout()"><i class="bi bi-box-arrow-right fs-5"></i> 로그아웃</a></div>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인되지 않은 경우: 로그인 링크 -->
                            <div class=""><a href="#" class="pe-auto" onclick="location.href='/mypage/login'">로그인</a></div>
                        </c:otherwise>
                    </c:choose>
                    <div class="align-items-baseline d-flex gap-1" style=""><img src="../assets/images/fujifilm-logo.png" alt="후지필름로고" height="30"></div>
                </div>
            </div>
        </div>

<script>
function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        // 모바일 브라우저 호환성을 위한 로그아웃 처리
        const logoutPromise = fetch('/mypage/logout', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('Network response was not ok');
            }
        });
        
        // 타임아웃 설정 (5초)
        const timeoutPromise = new Promise((_, reject) => {
            setTimeout(() => reject(new Error('Timeout')), 5000);
        });
        
        Promise.race([logoutPromise, timeoutPromise])
        .then(data => {
            if (data.success) {
                alert(data.message || '로그아웃 되었습니다');
                // 모바일 브라우저 호환성을 위한 강제 페이지 이동
                redirectToLogin();
            } else {
                alert(data.message || '로그아웃 중 오류가 발생했습니다.');
                redirectToLogin();
            }
        })
        .catch(error => {
            console.error('Logout error:', error);
            // 모바일에서 fetch 실패 시 직접 페이지 이동으로 처리
            alert('로그아웃 되었습니다');
            redirectToLogin();
        });
    }
}

// 모바일 브라우저 호환성을 위한 강제 페이지 이동 함수
function redirectToLogin() {
    try {
        // 여러 방법으로 페이지 이동 시도
        if (window.location.replace) {
            window.location.replace('/mypage/login');
        } else if (window.location.href) {
            window.location.href = '/mypage/login';
        } else if (window.location.assign) {
            window.location.assign('/mypage/login');
        } else {
            // 마지막 수단으로 document.location 사용
            document.location = '/mypage/login';
        }
    } catch (error) {
        console.error('Redirect error:', error);
        // 모든 방법이 실패하면 새 창으로 열기
        window.open('/mypage/login', '_self');
    }
}

// 간단한 로그아웃 함수 (모바일 호환성)
function simpleLogout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        // 간단한 방법: 직접 페이지 이동
        window.location.href = '/mypage/logout';
    }
}

// 로그인 확인 후 리다이렉트 함수 (Request용)
function checkLoginAndRedirect() {
    console.log('checkLoginAndRedirect 호출됨');
    fetch('/mypage/check-login')
        .then(response => {
            console.log('API 응답 상태:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('로그인 상태:', data.loggedIn);
            if (data.loggedIn) {
                console.log('로그인 됨 - /mypage/request로 이동');
                location.href = '/mypage/request';
            } else {
                console.log('로그인 안됨 - /mypage/login?redirectUrl=/mypage/request로 이동');
                location.href = '/mypage/login?redirectUrl=/mypage/request';
            }
        })
        .catch(error => {
            console.error('API 호출 오류:', error);
            console.log('오류 발생 - /mypage/login?redirectUrl=/mypage/request로 이동');
            location.href = '/mypage/login?redirectUrl=/mypage/request';
        });
}

// 로그인 확인 후 리다이렉트 함수 (Inquiry용)
function checkLoginAndRedirectToInquiry() {
    console.log('checkLoginAndRedirectToInquiry 호출됨');
    fetch('/mypage/check-login')
        .then(response => {
            console.log('API 응답 상태:', response.status);
            return response.json();
        })
        .then(data => {
            console.log('로그인 상태:', data.loggedIn);
            if (data.loggedIn) {
                console.log('로그인 됨 - /mypage/inquiry로 이동');
                location.href = '/mypage/inquiry';
            } else {
                console.log('로그인 안됨 - /mypage/login?redirectUrl=/mypage/inquiry로 이동');
                location.href = '/mypage/login?redirectUrl=/mypage/inquiry';
            }
        })
        .catch(error => {
            console.error('API 호출 오류:', error);
            console.log('오류 발생 - /mypage/login?redirectUrl=/mypage/inquiry로 이동');
            location.href = '/mypage/login?redirectUrl=/mypage/inquiry';
        });
}
</script>

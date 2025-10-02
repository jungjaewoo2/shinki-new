<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta property="og:image" content="/assets/images/logo_B.png">
    <title>Synapse 3D - 마이페이지</title>

    <link rel="stylesheet" href="/assets_mypage/css/style.css">
	<link rel="icon" href="/assets/images/favicon.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="/assets_mypage/css/mypage.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>

<body>
    <!-- 모바일 헤더 -->
    <div class="mobile-header">
        <div class="mobile-header-content">
            
            <div class="mobile-title"><img src="/assets/images/logo_B.png"></div>
            <button class="hamburger-btn" onclick="toggleSidebar()">☰</button>
        </div>
    </div>

    <!-- 오버레이 -->
    <div class="overlay" onclick="closeSidebar()"></div>

    <div class="container-fluid p-0 flex-column">

        <nav class="top-nav navbar navbar-expand-lg">
            <div class="container-fluid" style="height: 56px;">
                <div class="logo" onclick="location.href='/'">
                    <img src="/assets/images/logo_B.png" height="30">
                    <!--<span class="fs-4 text-white">SYNAPSE 3D</span>-->
                </div>

                <div class="d-none d-lg-block">
                    <div class="nav-menu">
                        <button class="nav-link" onclick="location.href='/'">HOME</button>
                        <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application.jsp'"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Application
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/application">HBP</a></li>
                                        <li><a class="dropdown-item" href="/lung">LUNG</a></li>
                                        <li><a class="dropdown-item" href="/cardiac">CARDIAC</a></li>
                                        <li><a class="dropdown-item" href="/knee">KNEE</a></li>
                                        <li><a class="dropdown-item" href="/all-application">All Application</a></li>
                                     </ul>
                                </li>
                            </ul>
                        </div>
                        <button class="nav-link" onclick="location.href='/mypage/request'">Request</button>
                        <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application.jsp'"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <button class="btn" data-bs-toggle="dropdown" aria-expanded="false">
                                        Q&A
                                    </button>
                                    <!-- <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/mypage/inquiry">문의하기</a></li>
                                        <li><a class="dropdown-item" href="/mypage/inquiry-history">문의내역조회</a></li>
                                    </ul> -->
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
                
                <div class="align-items-center d-flex gap-1 justify-content-between w-25">
                	<div class="d-none d-lg-block">
                    <div class="d-flex align-items-center gap-3">
                    </div>
                    
                    <!-- 로그인 상태에 따른 조건부 렌더링 -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            <!-- 로그인된 경우: 사용자명과 드롭다운 메뉴 -->
                            <div class="dropdown">
                                <button class="dropdown-toggle bg-white border-0" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="height: unset !important">
                                   <i class="bi bi-person-circle fs-5"></i> ${sessionScope.username}님
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center gap-2" href="/mypage/profile">
                                            <div><i class="bi bi-person-circle fs-5"></i></div>
                                            <div>마이페이지</div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="d-flex dropdown-item align-items-center gap-2" href="#" onclick="logout()">
                                            <div><i class="bi bi-box-arrow-right fs-5"></i></div>
                                            <div>로그아웃</div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인되지 않은 경우: 로그인 링크 -->
                            <div><a href="/mypage/login" class="btn">로그인</a></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="align-items-baseline d-flex gap-1" style=""><img src="../assets/images/fujifilm-logo.png" alt="후지필름로고" width="96" height="32"></div>
                </div>
            </div>
        </nav>

        <div class="d-flex">

            <jsp:include page="sidebar.jsp" />

            <!-- 메인 컨텐츠 -->
            <div class="main-content bg-body-secondary">

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

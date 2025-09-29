<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta property="og:image" content="/assets/images/logo_B.png">
    <title>Synapse 3D - 관리자페이지</title>

    <link rel="stylesheet" href="/assets_admin/css/style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="/assets_admin/css/mypage.css">
    <link rel="stylesheet" href="/assets_admin/css/admin.css">

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
            <div class="container-fluid">
                <div class="logo" onclick="location.href='/'">
                    <img src="/assets/images/logo_B.png">
                    <!--<span class="fs-4 text-white">SYNAPSE 3D</span>-->
                </div>

                <div class="d-none d-lg-block">
                    <div class="nav-menu">
                        <button class="nav-link" onclick="location.href='/'">HOME</button>
                        <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application'"><span class="navbar-toggler-icon"></span></button>
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
                        <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='/mypage/application'"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Contact
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/mypage/inquiry">문의하기</a></li>
                                        <li><a class="dropdown-item" href="/mypage/inquiry-history">문의내역조회</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
                <div class="d-none d-lg-block">
                    <div class="d-flex align-items-center gap-3">
                        <c:choose>
                            <c:when test="${sessionScope.isAdminLoggedIn == true}">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        ${sessionScope.adminName}님
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a class="dropdown-item d-flex align-items-center gap-2" href="/admin/dashboard">
                                                <div><i class="bi bi-house fs-5"></i></div>
                                                <div>통계</div>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item d-flex align-items-center gap-2" href="/admin/admin-account">
                                                <div><i class="bi bi-person-circle fs-5"></i></div>
                                                <div>관리자 계정</div>
                                            </a>
                                        </li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <a class="dropdown-item d-flex align-items-center gap-2" href="/admin/logout">
                                                <div><i class="bi bi-box-arrow-right fs-5"></i></div>
                                                <div>로그아웃</div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div><a href="/admin/login">로그인</a></div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>
        </nav>

        <div class="d-flex">

            <jsp:include page="sidebar.jsp" />

            <!-- 메인 컨텐츠 -->
            <div class="main-content bg-body-secondary">

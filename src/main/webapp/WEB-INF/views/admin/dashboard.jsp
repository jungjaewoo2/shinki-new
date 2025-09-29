<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

<!-- 통계 페이지 -->
<div id="" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">통계</div>
        <div class="breadcrumb">관리자페이지 > 통계</div>
    </div>

    <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
        <!-- 의뢰 통계 -->
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">의뢰 통계</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card border-primary">
                            <div class="card-body text-center">
                                <h6 class="card-title text-primary">일일 의뢰 건수</h6>
                                <h3 class="text-primary">${todayRequests}건</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card border-success">
                            <div class="card-body text-center">
                                <h6 class="card-title text-success">일주일 의뢰 건수</h6>
                                <h3 class="text-success">${weeklyRequests}건</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card border-info">
                            <div class="card-body text-center">
                                <h6 class="card-title text-info">한달 의뢰 건수</h6>
                                <h3 class="text-info">${monthlyRequests}건</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 문의 통계 -->
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">문의 통계</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card border-warning">
                            <div class="card-body text-center">
                                <h6 class="card-title text-warning">일일 문의 건수</h6>
                                <h3 class="text-warning">${todayInquiries}건</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card border-danger">
                            <div class="card-body text-center">
                                <h6 class="card-title text-danger">일주일 문의 건수</h6>
                                <h3 class="text-danger">${weeklyInquiries}건</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card border-secondary">
                            <div class="card-body text-center">
                                <h6 class="card-title text-secondary">한달 문의 건수</h6>
                                <h3 class="text-secondary">${monthlyInquiries}건</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

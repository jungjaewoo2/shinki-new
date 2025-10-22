<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 문의내역조회 페이지 -->
 <div id="inquiry-history-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">문의내역조회</div>
         <div class="breadcrumb">마이페이지 > 1:1 문의 > 문의내역조회</div>
     </div>

     <div class="card flex-fill overflow-auto">
         <!-- Flash 메시지 표시 -->
         <c:if test="${not empty message}">
             <div class="alert alert-success alert-dismissible fade show" role="alert">
                 <c:out value="${message}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 <c:out value="${error}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         
         <%-- <div class="card-body">
            <c:if test="${not empty inquiries}">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>No.</th>
                            <th>문의유형</th>
                            <th>문의내용</th>
                            <th>작성일</th>
                            <th>상담상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="inquiry" items="${inquiries}" varStatus="status">
                            <tr style="cursor: pointer;" onclick="location.href='inquiry-history-details?id=${inquiry.id}'">
                                <td><c:out value="${fn:length(inquiries) - status.index}"/></td>
                                <td><c:out value="${inquiry.inquiryType}"/></td>
                                <td class="text-start">
                                    <c:choose>
                                        <c:when test="${fn:length(inquiry.content) > 45}">
                                            <c:out value="${fn:substring(inquiry.content, 0, 80)}..."/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${inquiry.content}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${not empty inquiry.createdAt}">
                                        <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                    </c:if>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${inquiry.status eq '미확인'}">
                                            <span class="badge" style="background-color: #c7a987 !important; color: white !important;">
                                                <c:out value="${inquiry.status}"/>
                                            </span>
                                        </c:when>
                                        <c:when test="${inquiry.status eq '진행중'}">
                                            <span class="badge" style="background-color: #186623 !important; color: white !important;">
                                                <c:out value="${inquiry.status}"/>
                                            </span>
                                        </c:when>
                                        <c:when test="${inquiry.status eq '완료'}">
                                            <span class="badge bg-success">
                                                <c:out value="${inquiry.status}"/>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">
                                                <c:out value="${inquiry.status}"/>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            
            <c:if test="${empty inquiries}">
                <div class="alert alert-info text-center mt-3" role="alert">
                    등록된 문의 내역이 없습니다.
                </div>
            </c:if>
         </div> --%>
         <div class="card-body">
            <c:if test="${not empty inquiries}">
                <div class="d-none d-lg-block">
                	<table class="table table-bordered">
	                    <thead class="table-light">
	                        <tr>
	                            <th>No.</th>
	                            <th>문의유형</th>
	                            <th>문의내용</th>
	                            <th>작성일</th>
	                            <th>상담상태</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="inquiry" items="${inquiries}" varStatus="status">
	                            <tr style="cursor: pointer;" onclick="location.href='inquiry-history-details?id=${inquiry.id}'">
	                                <td><c:out value="${fn:length(inquiries) - status.index}"/></td>
	                                <td><c:out value="${inquiry.inquiryType}"/></td>
	                                <td class="text-start">
	                                    <c:choose>
	                                        <c:when test="${fn:length(inquiry.content) > 45}">
	                                            <c:out value="${fn:substring(inquiry.content, 0, 45)}..."/>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <c:out value="${inquiry.content}"/>
	                                        </c:otherwise>
	                                    </c:choose>
	                                </td>
	                                <td>
	                                    <c:if test="${not empty inquiry.createdAt}">
	                                        <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
	                                    </c:if>
	                                </td>
	                                <td>
	                                    <c:choose>
	                                        <c:when test="${inquiry.status eq '미확인'}">
	                                            <span class="badge" style="background-color: #c7a987 !important; color: white !important;">
	                                                <c:out value="${inquiry.status}"/>
	                                            </span>
	                                        </c:when>
	                                        <c:when test="${inquiry.status eq '답변진행중'}">
	                                            <span class="badge" style="background-color: #186623 !important; color: white !important;">
	                                                <c:out value="${inquiry.status}"/>
	                                            </span>
	                                        </c:when>
	                                        <c:when test="${inquiry.status eq '완료'}">
	                                            <span class="badge bg-success">
	                                                <c:out value="${inquiry.status}"/>
	                                            </span>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <span class="badge bg-secondary">
	                                                <c:out value="${inquiry.status}"/>
	                                            </span>
	                                        </c:otherwise>
	                                    </c:choose>
	                                </td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
                	</table>
                </div>
                <div class="d-block d-lg-none">
                    <c:forEach var="inquiry" items="${inquiries}" varStatus="status">
                        <div class="d-flex flex-column gap-1 border-bottom pb-2 pt-2" style="cursor: pointer;" onclick="location.href='inquiry-history-details?id=${inquiry.id}'">
                            <div class="order-numb align-items-center d-flex gap-1">
                                <div><c:out value="${fn:length(inquiries) - status.index}"/>. <c:out value="${inquiry.inquiryType}"/></div>
                                <div>/</div>
                                <c:choose>
                                    <c:when test="${inquiry.status eq '미확인'}">
                                        <div class="badge" style="background-color: #c7a987 !important; color: white !important;">
                                            <c:out value="${inquiry.status}"/>
                                        </div>
                                    </c:when>
                                    <c:when test="${inquiry.status eq '답변진행중'}">
                                        <div class="badge" style="background-color: #186623 !important; color: white !important;">
                                            <c:out value="${inquiry.status}"/>
                                        </div>
                                    </c:when>
                                    <c:when test="${inquiry.status eq '완료'}">
                                        <div class="badge bg-success">
                                            <c:out value="${inquiry.status}"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="badge bg-secondary">
                                            <c:out value="${inquiry.status}"/>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="order-contents">
                                <c:choose>
                                    <c:when test="${fn:length(inquiry.content) > 45}">
                                        <c:out value="${fn:substring(inquiry.content, 0, 80)}..."/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${inquiry.content}"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="align-items-center d-flex justify-content-end">
                                <div class="order-date">
                                    <c:if test="${not empty inquiry.createdAt}">
                                        <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            
            <c:if test="${empty inquiries}">
                <div class="alert alert-info text-center mt-3" role="alert">
                    등록된 문의 내역이 없습니다.
                </div>
            </c:if>
            
            <!-- 페이징 처리 -->
            <c:if test="${totalPages > 0}">
                <nav aria-label="Page navigation" class="mt-3">
                    <ul class="pagination justify-content-center">
                        <c:choose>
                            <c:when test="${currentPage > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}&size=${size}">이전</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <span class="page-link">이전</span>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
                            <c:choose>
                                <c:when test="${pageNum == currentPage}">
                                    <li class="page-item active">
                                        <span class="page-link">${pageNum + 1}</span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${pageNum}&size=${size}">${pageNum + 1}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:choose>
                            <c:when test="${currentPage < totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}&size=${size}">다음</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <span class="page-link">다음</span>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </c:if>
         </div>
     </div>
 </div>

<jsp:include page="footer.jsp" />
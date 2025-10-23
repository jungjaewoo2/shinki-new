package com.shinki.shinki.service;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.Request;
import com.shinki.shinki.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class RequestService {
    
    @Autowired
    private RequestRepository requestRepository;
    
    // 모든 의뢰 조회 (페이징, ID 내림차순, Member 함께 조회)
    public Page<Request> getAllRequests(Pageable pageable) {
        return requestRepository.findAllWithMemberOrderByIdDesc(pageable);
    }
    
    // ID로 의뢰 조회 (회원 정보 포함)
    @Transactional(readOnly = true)
    public Request getRequestById(Long id) {
        return requestRepository.findByIdWithMember(id).orElse(null);
    }
    
    // 회원별 의뢰 조회
    public List<Request> getRequestsByMemberId(Long memberId) {
        return requestRepository.findByMemberIdOrderByCreatedAtDesc(memberId);
    }
    
    // 회원별 취소된 의뢰 조회 (status = '취소 요청', '취소 진행중', '취소 완료')
    public List<Request> getCancelledRequestsByMemberId(Long memberId) {
        return requestRepository.findByMemberIdAndStatusInOrderByCreatedAtDesc(memberId, List.of("취소 요청", "취소 진행중", "취소 완료"));
    }
    
    // 회원별 날짜별 의뢰 조회
    public List<Request> getRequestsByMemberIdAndDate(Long memberId, String searchDate) {
        try {
            System.out.println("RequestService - 검색 날짜: " + searchDate);
            LocalDate date = LocalDate.parse(searchDate, DateTimeFormatter.ISO_LOCAL_DATE);
            System.out.println("RequestService - 파싱된 날짜: " + date);
            
            // 해당 날짜의 시작 시간과 다음 날 시작 시간으로 범위 설정
            LocalDateTime startDate = date.atStartOfDay();
            LocalDateTime endDate = date.plusDays(1).atStartOfDay();
            
            System.out.println("RequestService - 시작 시간: " + startDate);
            System.out.println("RequestService - 종료 시간: " + endDate);
            
            List<Request> result = requestRepository.findByMemberIdAndCreatedAtDateOrderByCreatedAtDesc(memberId, startDate, endDate);
            System.out.println("RequestService - 검색 결과 수: " + result.size());
            
            return result;
        } catch (Exception e) {
            System.out.println("RequestService - 날짜 파싱 오류: " + e.getMessage());
            // 날짜 파싱 오류 시 빈 리스트 반환
            return List.of();
        }
    }
    
    // 회원별 기간별 의뢰 조회
    public List<Request> getRequestsByMemberIdAndDateRange(Long memberId, String startDateStr, String endDateStr) {
        try {
            System.out.println("RequestService - 기간 검색: " + startDateStr + " ~ " + endDateStr);
            LocalDate startDate = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate endDate = LocalDate.parse(endDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
            System.out.println("RequestService - 파싱된 시작일: " + startDate);
            System.out.println("RequestService - 파싱된 종료일: " + endDate);
            
            // 시작일의 시작 시간과 종료일의 다음 날 시작 시간으로 범위 설정
            LocalDateTime startDateTime = startDate.atStartOfDay();
            LocalDateTime endDateTime = endDate.plusDays(1).atStartOfDay();
            
            System.out.println("RequestService - 시작 시간: " + startDateTime);
            System.out.println("RequestService - 종료 시간: " + endDateTime);
            
            List<Request> result = requestRepository.findByMemberIdAndCreatedAtDateOrderByCreatedAtDesc(memberId, startDateTime, endDateTime);
            System.out.println("RequestService - 기간 검색 결과 수: " + result.size());
            
            return result;
        } catch (Exception e) {
            System.out.println("RequestService - 기간 검색 날짜 파싱 오류: " + e.getMessage());
            // 날짜 파싱 오류 시 빈 리스트 반환
            return List.of();
        }
    }
    
    // 의뢰 생성
    public Request createRequest(@Valid Request request, Long memberId) {
        Member member = new Member();
        member.setId(memberId);
        request.setMember(member);
        return requestRepository.save(request);
    }
    
    
    // 의뢰 수정
    public Request updateRequest(Request request) {
        return requestRepository.save(request);
    }
    
    // 의뢰 업데이트
    public Request updateRequest(@Valid Request request, MultipartFile file, String existingFilePath, boolean shouldRemoveFile) {
        // 파일 삭제 플래그가 true면 파일 경로를 null로 설정
        if (shouldRemoveFile) {
            request.setFilePath(null);
        }
        // 새 파일이 업로드된 경우
        else if (file != null && !file.isEmpty()) {
            // 파일 업로드 처리는 컨트롤러나 별도 로직에서 수행하고
            // 여기서는 filePath만 설정 (실제 파일 저장은 컨트롤러에서 처리해야 함)
            // request.setFilePath는 컨트롤러에서 처리된 후 전달되어야 함
        }
        // 파일이 업로드되지 않았고 삭제하지도 않은 경우 기존 파일 경로 유지
        else if (existingFilePath != null && !existingFilePath.trim().isEmpty()) {
            request.setFilePath(existingFilePath);
        }
        return requestRepository.save(request);
    }
    
    // 의뢰 저장
    public Request saveRequest(Request request) {
        return requestRepository.save(request);
    }
    
    // 의뢰 삭제
    public void deleteRequest(Long id) {
        requestRepository.deleteById(id);
    }
    
    // 여러 의뢰 삭제
    public void deleteRequests(List<Long> requestIds) {
        requestRepository.deleteAllByIdInBatch(requestIds);
    }
    
    // 의뢰 상태 업데이트 (String regCondition)
    public Request updateRequestStatus(Long id, String regCondition) {
        Optional<Request> requestOpt = requestRepository.findById(id);
        if (requestOpt.isPresent()) {
            Request request = requestOpt.get();
            request.setRegCondition(Integer.parseInt(regCondition));
            return requestRepository.save(request);
        }
        throw new RuntimeException("의뢰를 찾을 수 없습니다.");
    }
    
    // 의뢰 상태 업데이트 (Integer regCondition)
    public Request updateRequestStatus(Long id, Integer regCondition) {
        Optional<Request> requestOpt = requestRepository.findById(id);
        if (requestOpt.isPresent()) {
            Request request = requestOpt.get();
            request.setRegCondition(regCondition);
            return requestRepository.save(request);
        }
        throw new RuntimeException("의뢰를 찾을 수 없습니다.");
    }
    
    // 상태 코드를 한글로 변환
    public String getStatusText(Integer regCondition) {
        if (regCondition == null) return "알 수 없음";
        
        switch (regCondition) {
            case 1: return "의뢰 확인중";
            case 2: return "견적중";
            case 3: return "결제진행";
            case 4: return "작업수행";
            case 5: return "완료";
            default: return "알 수 없음";
        }
    }
    
    // 회원별 총 결제금액 계산 (request 테이블의 payment_amount 컬럼 합산)
    @Transactional(readOnly = true)
    public Long getTotalPaymentAmountByMemberId(Long memberId) {
        return requestRepository.sumPaymentAmountByMemberId(memberId);
    }
    
    // 회원별 의뢰건수 계산
    @Transactional(readOnly = true)
    public Long getRequestCountByMemberId(Long memberId) {
        return requestRepository.countByMemberId(memberId);
    }
    
    // 의뢰 검색 (의뢰항목, 병원명, 이름, 제목, 의뢰내용)
    @Transactional(readOnly = true)
    public Page<Request> searchRequests(String searchTerm, Pageable pageable) {
        return requestRepository.findBySearchTerm(searchTerm, pageable);
    }
    
    // 고급 검색 (의뢰항목, 의뢰상태, 주문일, 키워드)
    @Transactional(readOnly = true)
    public Page<Request> advancedSearchRequests(
            String applicationType, 
            String status, 
            String startDateStr, 
            String search, 
            Pageable pageable) {
        
        // 날짜 문자열을 LocalDateTime으로 변환
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        
        if (startDateStr != null && !startDateStr.trim().isEmpty()) {
            try {
                LocalDate date = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
                startDate = date.atStartOfDay();
                endDate = date.plusDays(1).atStartOfDay(); // 해당 날짜의 23:59:59까지 포함
            } catch (Exception e) {
                System.out.println("주문일 파싱 오류: " + e.getMessage());
            }
        }
        
        // 빈 문자열을 null로 변환
        String finalApplicationType = (applicationType != null && !applicationType.trim().isEmpty()) ? applicationType.trim() : null;
        String finalStatus = (status != null && !status.trim().isEmpty()) ? status.trim() : null;
        String finalSearch = (search != null && !search.trim().isEmpty()) ? search.trim() : null;
        
        return requestRepository.findByAdvancedSearch(
            finalApplicationType, 
            finalStatus, 
            startDate, 
            endDate, 
            finalSearch, 
            pageable
        );
    }
    
    // 통계 메서드들
    @Transactional(readOnly = true)
    public Long getTodayRequestCount() {
        return requestRepository.countTodayRequests();
    }
    
    @Transactional(readOnly = true)
    public Long getWeeklyRequestCount() {
        java.time.LocalDateTime now = java.time.LocalDateTime.now();
        java.time.LocalDateTime weekAgo = now.minusWeeks(1);
        return requestRepository.countWeeklyRequests(weekAgo, now);
    }
    
    @Transactional(readOnly = true)
    public Long getMonthlyRequestCount() {
        java.time.LocalDateTime now = java.time.LocalDateTime.now();
        java.time.LocalDateTime monthAgo = now.minusMonths(1);
        return requestRepository.countMonthlyRequests(monthAgo, now);
    }
}
package com.shinki.shinki.service;

import com.shinki.shinki.entity.ConReg;
import com.shinki.shinki.repository.ConRegRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ConRegService {
    
    @Autowired
    private ConRegRepository conRegRepository;
    
    /**
     * 상담 등록 저장
     */
    public ConReg saveConsultation(ConReg conReg) {
        return conRegRepository.save(conReg);
    }
    
    /**
     * 상담 등록 저장 (폼 데이터로부터)
     */
    public ConReg saveConsultation(String name, String hospitalName, String phone,
                                   String consultationDate, String consultationTime,
                                   String consultationContent) {
        ConReg conReg = new ConReg();
        conReg.setName(name);
        conReg.setHospitalName(hospitalName);
        conReg.setPhone(phone);
        conReg.setConsultationDate(LocalDate.parse(consultationDate));
        conReg.setConsultationTime(LocalTime.parse(consultationTime));
        conReg.setConsultationContent(consultationContent);
        conReg.setStatus("대기");
        
        return conRegRepository.save(conReg);
    }
    
    /**
     * 모든 상담 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getAllConsultations() {
        return conRegRepository.findAll();
    }
    
    /**
     * 페이징 처리된 상담 등록 목록 조회
     * @param page 현재 페이지 (0부터 시작)
     * @param size 페이지 당 항목 수
     * @param sortBy 정렬 기준 필드
     * @param sortDir 정렬 방향 (asc/desc)
     * @return 페이징된 ConReg 목록
     */
    @Transactional(readOnly = true)
    public Page<ConReg> getPageConsultations(int page, int size, String sortBy, String sortDir) {
        Sort sort = Sort.by(Sort.Direction.fromString(sortDir), sortBy);
        Pageable pageable = PageRequest.of(page, size, sort);
        return conRegRepository.findAll(pageable);
    }
    
    /**
     * 검색 및 페이징 처리된 상담 등록 목록 조회
     * @param page 현재 페이지 (0부터 시작)
     * @param size 페이지 당 항목 수
     * @param sortBy 정렬 기준 필드
     * @param sortDir 정렬 방향 (asc/desc)
     * @param searchType 검색 유형 (hospitalName, name, phone, consultationContent)
     * @param searchValue 검색 값
     * @return 페이징된 ConReg 목록
     */
    @Transactional(readOnly = true)
    public Page<ConReg> searchAndPageConsultations(int page, int size, String sortBy, String sortDir, String searchType, String searchValue) {
        Sort sort = Sort.by(Sort.Direction.fromString(sortDir), sortBy);
        Pageable pageable = PageRequest.of(page, size, sort);

        // null 값 안전 처리
        if (searchValue == null) {
            searchValue = "";
        }
        if (searchType == null) {
            searchType = "consultationContent";
        }

        if (!searchValue.trim().isEmpty()) {
            String searchPattern = "%" + searchValue.trim() + "%";
            switch (searchType) {
                case "hospitalName":
                    return conRegRepository.findByHospitalNameLike(searchPattern, pageable);
                case "name":
                    return conRegRepository.findByNameLike(searchPattern, pageable);
                case "phone":
                    return conRegRepository.findByPhoneLike(searchPattern, pageable);
                case "consultationContent":
                    return conRegRepository.findByConsultationContentLike(searchPattern, pageable);
                default:
                    // 기본적으로 상담내용으로 검색
                    return conRegRepository.findByConsultationContentLike(searchPattern, pageable);
            }
        } else {
            return conRegRepository.findAll(pageable);
        }
    }

    /**
     * ID로 상담 등록 조회
     */
    @Transactional(readOnly = true)
    public Optional<ConReg> getConsultationById(Long id) {
        return conRegRepository.findById(id);
    }
    
    /**
     * 상태별 상담 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByStatus(String status) {
        return conRegRepository.findByStatusOrderByCreatedAtDesc(status);
    }
    
    /**
     * 병원명으로 상담 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByHospitalName(String hospitalName) {
        return conRegRepository.findByHospitalNameContainingOrderByCreatedAtDesc(hospitalName);
    }
    
    /**
     * 이름으로 상담 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByName(String name) {
        return conRegRepository.findByNameContainingOrderByCreatedAtDesc(name);
    }
    
    /**
     * 전화번호로 상담 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByPhone(String phone) {
        return conRegRepository.findByPhoneContainingOrderByCreatedAtDesc(phone);
    }
    
    /**
     * 상담 날짜 범위로 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByDateRange(LocalDate startDate, LocalDate endDate) {
        return conRegRepository.findByConsultationDateBetweenOrderByConsultationDateAsc(startDate, endDate);
    }
    
    /**
     * 특정 날짜의 상담 등록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getConsultationsByDate(LocalDate consultationDate) {
        return conRegRepository.findByConsultationDateOrderByConsultationTimeAsc(consultationDate);
    }
    
    /**
     * 최근 등록된 상담 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getRecentConsultations() {
        return conRegRepository.findRecentConsultations();
    }
    
    /**
     * 오늘 등록된 상담 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getTodayConsultations() {
        return conRegRepository.findTodayConsultations();
    }
    
    /**
     * 이번 주 등록된 상담 목록 조회
     */
    @Transactional(readOnly = true)
    public List<ConReg> getThisWeekConsultations() {
        LocalDateTime weekStart = LocalDateTime.now().minusDays(7);
        return conRegRepository.findThisWeekConsultations(weekStart);
    }
    
    /**
     * 상담 상태 업데이트
     */
    public ConReg updateConsultationStatus(Long id, String status) {
        Optional<ConReg> optionalConReg = conRegRepository.findById(id);
        if (optionalConReg.isPresent()) {
            ConReg conReg = optionalConReg.get();
            conReg.setStatus(status);
            return conRegRepository.save(conReg);
        }
        return null;
    }
    
    /**
     * 상담 등록 수정
     */
    public ConReg updateConsultation(Long id, ConReg updatedConReg) {
        Optional<ConReg> optionalConReg = conRegRepository.findById(id);
        if (optionalConReg.isPresent()) {
            ConReg conReg = optionalConReg.get();
            conReg.setName(updatedConReg.getName());
            conReg.setHospitalName(updatedConReg.getHospitalName());
            conReg.setPhone(updatedConReg.getPhone());
            conReg.setConsultationDate(updatedConReg.getConsultationDate());
            conReg.setConsultationTime(updatedConReg.getConsultationTime());
            conReg.setConsultationContent(updatedConReg.getConsultationContent());
            conReg.setStatus(updatedConReg.getStatus());
            return conRegRepository.save(conReg);
        }
        return null;
    }
    
    /**
     * 상담 등록 삭제
     */
    public boolean deleteConsultation(Long id) {
        if (conRegRepository.existsById(id)) {
            conRegRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    /**
     * 특정 기간 내 등록된 상담 수 조회
     */
    @Transactional(readOnly = true)
    public Long getConsultationCountByDateRange(LocalDateTime startDate, LocalDateTime endDate) {
        return conRegRepository.countByCreatedAtBetween(startDate, endDate);
    }
    
    /**
     * 상태별 상담 수 조회
     */
    @Transactional(readOnly = true)
    public Long getConsultationCountByStatus(String status) {
        return conRegRepository.countByStatus(status);
    }
    
    /**
     * 병원명과 이름으로 검색
     */
    @Transactional(readOnly = true)
    public List<ConReg> searchConsultations(String hospitalName, String name) {
        return conRegRepository.findByHospitalNameAndName(hospitalName, name);
    }
    
    /**
     * 전체 상담 등록 수 조회
     */
    @Transactional(readOnly = true)
    public long getTotalConsultationCount() {
        return conRegRepository.count();
    }
    
    /**
     * 대기 중인 상담 수 조회
     */
    @Transactional(readOnly = true)
    public long getPendingConsultationCount() {
        return conRegRepository.countByStatus("대기");
    }
    
    /**
     * 완료된 상담 수 조회
     */
    @Transactional(readOnly = true)
    public long getCompletedConsultationCount() {
        return conRegRepository.countByStatus("완료");
    }
}

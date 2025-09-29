package com.shinki.shinki.repository;

import com.shinki.shinki.entity.ConReg;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ConRegRepository extends JpaRepository<ConReg, Long> {
    
    /**
     * 상태별 상담 등록 목록 조회
     */
    List<ConReg> findByStatusOrderByCreatedAtDesc(String status);
    
    /**
     * 병원명으로 상담 등록 목록 조회
     */
    List<ConReg> findByHospitalNameContainingOrderByCreatedAtDesc(String hospitalName);

    /**
     * 병원명으로 검색 (페이징 포함)
     */
    Page<ConReg> findByHospitalNameLike(String hospitalName, Pageable pageable);
    
    /**
     * 이름으로 상담 등록 목록 조회
     */
    List<ConReg> findByNameContainingOrderByCreatedAtDesc(String name);

    /**
     * 이름으로 검색 (페이징 포함)
     */
    Page<ConReg> findByNameLike(String name, Pageable pageable);
    
    /**
     * 전화번호로 상담 등록 목록 조회
     */
    List<ConReg> findByPhoneContainingOrderByCreatedAtDesc(String phone);

    /**
     * 전화번호로 검색 (페이징 포함)
     */
    Page<ConReg> findByPhoneLike(String phone, Pageable pageable);

    /**
     * 상담내용으로 검색 (페이징 포함)
     */
    Page<ConReg> findByConsultationContentLike(String consultationContent, Pageable pageable);
    
    /**
     * 상담 날짜 범위로 조회
     */
    List<ConReg> findByConsultationDateBetweenOrderByConsultationDateAsc(LocalDate startDate, LocalDate endDate);
    
    /**
     * 특정 날짜의 상담 등록 조회
     */
    List<ConReg> findByConsultationDateOrderByConsultationTimeAsc(LocalDate consultationDate);
    
    /**
     * 최근 등록된 상담 목록 조회 (기본 10개)
     */
    @Query("SELECT c FROM ConReg c ORDER BY c.createdAt DESC")
    List<ConReg> findRecentConsultations();
    
    /**
     * 특정 기간 내 등록된 상담 수 조회
     */
    @Query("SELECT COUNT(c) FROM ConReg c WHERE c.createdAt BETWEEN :startDate AND :endDate")
    Long countByCreatedAtBetween(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
    
    /**
     * 상태별 상담 수 조회
     */
    Long countByStatus(String status);
    
    /**
     * 병원명과 이름으로 검색
     */
    @Query("SELECT c FROM ConReg c WHERE c.hospitalName LIKE %:hospitalName% AND c.name LIKE %:name% ORDER BY c.createdAt DESC")
    List<ConReg> findByHospitalNameAndName(@Param("hospitalName") String hospitalName, @Param("name") String name);
    
    /**
     * 오늘 등록된 상담 목록 조회
     */
    @Query("SELECT c FROM ConReg c WHERE DATE(c.createdAt) = CURRENT_DATE ORDER BY c.createdAt DESC")
    List<ConReg> findTodayConsultations();
    
    /**
     * 이번 주 등록된 상담 목록 조회
     */
    @Query("SELECT c FROM ConReg c WHERE c.createdAt >= :weekStart ORDER BY c.createdAt DESC")
    List<ConReg> findThisWeekConsultations(@Param("weekStart") LocalDateTime weekStart);
}

package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Request;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    List<Request> findByMemberIdOrderByCreatedAtDesc(Long memberId);
    List<Request> findAllByOrderByCreatedAtDesc();
    List<Request> findByMemberIdAndStatusOrderByCreatedAtDesc(Long memberId, String status);
    List<Request> findByMemberIdAndStatusInOrderByCreatedAtDesc(Long memberId, List<String> statuses);
    List<Request> findByMemberIdAndStatusCancelOrderByCreatedAtDesc(Long memberId, String statusCancel);
    List<Request> findByMemberIdAndStatusCancelInOrderByCreatedAtDesc(Long memberId, List<String> statusCancelList);
    void deleteByMemberId(Long memberId);
    
    @Query("SELECT r FROM Request r WHERE r.member.id = :memberId AND r.createdAt >= :startDate AND r.createdAt < :endDate ORDER BY r.createdAt DESC")
    List<Request> findByMemberIdAndCreatedAtDateOrderByCreatedAtDesc(@Param("memberId") Long memberId, @Param("startDate") java.time.LocalDateTime startDate, @Param("endDate") java.time.LocalDateTime endDate);
    
    // 페이징을 위한 findAll 오버라이드 (ID 내림차순)
    Page<Request> findAllByOrderByIdDesc(Pageable pageable);
    
    // Member를 함께 조회하는 페이징 메서드
    @Query("SELECT r FROM Request r LEFT JOIN FETCH r.member ORDER BY r.id DESC")
    Page<Request> findAllWithMemberOrderByIdDesc(Pageable pageable);
    
    // ID로 의뢰 조회 (회원 정보 포함)
    @Query("SELECT r FROM Request r LEFT JOIN FETCH r.member WHERE r.id = :id")
    Optional<Request> findByIdWithMember(@Param("id") Long id);
    
    // 회원별 money 컬럼 합산
    @Query("SELECT COALESCE(SUM(r.money), 0) FROM Request r WHERE r.member.id = :memberId")
    Long sumMoneyByMemberId(@Param("memberId") Long memberId);
    
    // 회원별 payment_amount 컬럼 합산
    @Query("SELECT COALESCE(SUM(r.paymentAmount), 0) FROM Request r WHERE r.member.id = :memberId")
    Long sumPaymentAmountByMemberId(@Param("memberId") Long memberId);
    
    // 회원별 의뢰건수 계산
    Long countByMemberId(Long memberId);
    
    // 의뢰 검색 (의뢰항목, 병원명, 이름, 제목, 의뢰내용)
    @Query("SELECT r FROM Request r LEFT JOIN FETCH r.member WHERE " +
           "(LOWER(r.applicationType) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(r.member.hospitalName) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(r.member.name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(r.title) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(r.content) LIKE LOWER(CONCAT('%', :searchTerm, '%'))) " +
           "ORDER BY r.id DESC")
    Page<Request> findBySearchTerm(@Param("searchTerm") String searchTerm, Pageable pageable);
    
    // 일일 의뢰 건수
    @Query("SELECT COUNT(r) FROM Request r WHERE DATE(r.createdAt) = CURRENT_DATE")
    Long countTodayRequests();
    
    // 일주일 의뢰 건수
    @Query("SELECT COUNT(r) FROM Request r WHERE r.createdAt >= :startDate AND r.createdAt < :endDate")
    Long countWeeklyRequests(@Param("startDate") java.time.LocalDateTime startDate, @Param("endDate") java.time.LocalDateTime endDate);
    
    // 한달 의뢰 건수
    @Query("SELECT COUNT(r) FROM Request r WHERE r.createdAt >= :startDate AND r.createdAt < :endDate")
    Long countMonthlyRequests(@Param("startDate") java.time.LocalDateTime startDate, @Param("endDate") java.time.LocalDateTime endDate);
}

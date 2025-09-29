package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Inquiry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface InquiryRepository extends JpaRepository<Inquiry, Long> {
    List<Inquiry> findByMemberIdOrderByCreatedAtDesc(Long memberId);
    List<Inquiry> findAllByOrderByCreatedAtDesc();
    void deleteByMemberId(Long memberId);
    
    // 페이징을 위한 메서드 - Member 정보와 함께 조회
    @Query("SELECT i FROM Inquiry i LEFT JOIN FETCH i.member ORDER BY i.id DESC")
    Page<Inquiry> findAllWithMemberOrderByIdDesc(Pageable pageable);
    
    // 검색 기능을 위한 메서드 - content 필드에서 검색
    @Query("SELECT i FROM Inquiry i LEFT JOIN FETCH i.member WHERE i.content LIKE %:keyword% ORDER BY i.id DESC")
    Page<Inquiry> findByContentContainingWithMember(@Param("keyword") String keyword, Pageable pageable);
    
    // 일일 문의 건수
    @Query("SELECT COUNT(i) FROM Inquiry i WHERE DATE(i.createdAt) = CURRENT_DATE")
    Long countTodayInquiries();
    
    // 일주일 문의 건수
    @Query("SELECT COUNT(i) FROM Inquiry i WHERE i.createdAt >= :startDate AND i.createdAt < :endDate")
    Long countWeeklyInquiries(@Param("startDate") java.time.LocalDateTime startDate, @Param("endDate") java.time.LocalDateTime endDate);
    
    // 한달 문의 건수
    @Query("SELECT COUNT(i) FROM Inquiry i WHERE i.createdAt >= :startDate AND i.createdAt < :endDate")
    Long countMonthlyInquiries(@Param("startDate") java.time.LocalDateTime startDate, @Param("endDate") java.time.LocalDateTime endDate);
}

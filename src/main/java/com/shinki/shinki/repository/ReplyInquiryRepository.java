package com.shinki.shinki.repository;

import com.shinki.shinki.entity.ReplyInquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyInquiryRepository extends JpaRepository<ReplyInquiry, Long> {
    
    /**
     * 특정 문의의 모든 댓글을 조회 (생성일시 오름차순)
     */
    @Query("SELECT r FROM ReplyInquiry r LEFT JOIN FETCH r.member LEFT JOIN FETCH r.admin WHERE r.inquiryId = :inquiryId ORDER BY r.createdAt ASC")
    List<ReplyInquiry> findByInquiryIdOrderByCreatedAtAsc(@Param("inquiryId") Long inquiryId);
    
    /**
     * 특정 문의의 모든 댓글을 조회 (생성일시 내림차순)
     */
    @Query("SELECT r FROM ReplyInquiry r LEFT JOIN FETCH r.member LEFT JOIN FETCH r.admin WHERE r.inquiryId = :inquiryId ORDER BY r.createdAt DESC")
    List<ReplyInquiry> findByInquiryIdOrderByCreatedAtDesc(@Param("inquiryId") Long inquiryId);
    
    /**
     * 특정 문의의 댓글 개수 조회
     */
    long countByInquiryId(Long inquiryId);
    
    /**
     * 특정 회원의 댓글 조회
     */
    @Query("SELECT r FROM ReplyInquiry r LEFT JOIN FETCH r.inquiry WHERE r.memberId = :memberId ORDER BY r.createdAt DESC")
    List<ReplyInquiry> findByMemberIdOrderByCreatedAtDesc(@Param("memberId") Long memberId);
    
    /**
     * 특정 관리자의 답변 조회
     */
    @Query("SELECT r FROM ReplyInquiry r LEFT JOIN FETCH r.inquiry WHERE r.adminNo = :adminNo ORDER BY r.adminCreatedAt DESC")
    List<ReplyInquiry> findByAdminNoOrderByAdminCreatedAtDesc(@Param("adminNo") Long adminNo);
}

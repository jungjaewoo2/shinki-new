package com.shinki.shinki.repository;

import com.shinki.shinki.entity.ReplyRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyRequestRepository extends JpaRepository<ReplyRequest, Long> {
    
    // 의뢰 ID로 답변 목록 조회 (생성일 내림차순)
    List<ReplyRequest> findByRequestIdOrderByCreatedAtDesc(Long requestId);
    
    // 관리자 답변이 있는 답변만 조회
    List<ReplyRequest> findByRequestIdAndAdminContentIsNotNullOrderByCreatedAtDesc(Long requestId);
    
    // 사용자 답변이 있는 답변만 조회
    List<ReplyRequest> findByRequestIdAndUserContentIsNotNullOrderByCreatedAtDesc(Long requestId);
    
    // 특정 댓글의 답글 목록 조회 (생성일 오름차순)
    List<ReplyRequest> findByParentIdOrderByCreatedAtAsc(Long parentId);
    
    // 사용자 댓글만 조회 (답글이 아닌 원본 댓글)
    List<ReplyRequest> findByRequestIdAndParentIdIsNullOrderByCreatedAtDesc(Long requestId);
}
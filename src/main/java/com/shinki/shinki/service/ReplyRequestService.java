package com.shinki.shinki.service;

import com.shinki.shinki.entity.ReplyRequest;
import com.shinki.shinki.repository.ReplyRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ReplyRequestService {

    @Autowired
    private ReplyRequestRepository replyRequestRepository;

    // 의뢰 ID로 답변 목록 조회
    @Transactional(readOnly = true)
    public List<ReplyRequest> getRepliesByRequestId(Long requestId) {
        return replyRequestRepository.findByRequestIdOrderByCreatedAtDesc(requestId);
    }

    // 관리자 답변 생성
    public ReplyRequest createAdminReply(Long requestId, Long adminId, String adminContent) {
        ReplyRequest reply = new ReplyRequest();
        reply.setRequestId(requestId);
        // adminId가 null이면 adminNo를 null로 설정 (외래키 제약 조건 회피)
        reply.setAdminNo(adminId);
        reply.setAdminContent(adminContent);
        reply.setAdminCreatedAt(new Date());
        reply.setCreatedAt(new Date());
        reply.setUpdatedAt(new Date());
        
        return replyRequestRepository.save(reply);
    }
    
    // 사용자 댓글에 대한 관리자 답글 생성
    public ReplyRequest createAdminReplyToUserComment(Long requestId, Long parentId, String adminContent) {
        ReplyRequest reply = new ReplyRequest();
        reply.setRequestId(requestId);
        reply.setParentId(parentId); // 부모 댓글 ID 설정
        reply.setAdminContent(adminContent);
        reply.setAdminCreatedAt(new Date());
        reply.setCreatedAt(new Date());
        reply.setUpdatedAt(new Date());
        
        return replyRequestRepository.save(reply);
    }

    // 사용자 답변 생성
    public ReplyRequest createUserReply(Long requestId, Long memberId, String userContent) {
        ReplyRequest reply = new ReplyRequest();
        reply.setRequestId(requestId);
        reply.setMemberId(memberId);
        reply.setUserContent(userContent);
        reply.setUserCreatedAt(new Date());
        reply.setCreatedAt(new Date());
        reply.setUpdatedAt(new Date());
        
        return replyRequestRepository.save(reply);
    }

    // 답변 ID로 조회
    @Transactional(readOnly = true)
    public Optional<ReplyRequest> getReplyById(Long id) {
        return replyRequestRepository.findById(id);
    }

    // 답변 수정
    public ReplyRequest updateReply(Long id, String adminContent) {
        Optional<ReplyRequest> replyOpt = replyRequestRepository.findById(id);
        if (replyOpt.isPresent()) {
            ReplyRequest reply = replyOpt.get();
            reply.setAdminContent(adminContent);
            reply.setUpdatedAt(new Date());
            return replyRequestRepository.save(reply);
        }
        return null;
    }

    // 답변 삭제
    public void deleteReply(Long id) {
        replyRequestRepository.deleteById(id);
    }
    
    // 특정 댓글의 답글 목록 조회
    @Transactional(readOnly = true)
    public List<ReplyRequest> getRepliesByParentId(Long parentId) {
        return replyRequestRepository.findByParentIdOrderByCreatedAtAsc(parentId);
    }
    
    // 사용자 댓글 목록 조회 (답글이 아닌 원본 댓글만)
    @Transactional(readOnly = true)
    public List<ReplyRequest> getUserCommentsByRequestId(Long requestId) {
        return replyRequestRepository.findByRequestIdAndParentIdIsNullOrderByCreatedAtDesc(requestId);
    }
}
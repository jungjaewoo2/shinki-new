package com.shinki.shinki.service;

import com.shinki.shinki.entity.ReplyInquiry;
import com.shinki.shinki.repository.ReplyInquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ReplyInquiryService {
    
    @Autowired
    private ReplyInquiryRepository replyInquiryRepository;
    
    /**
     * 특정 문의의 모든 댓글 조회
     */
    @Transactional(readOnly = true)
    public List<ReplyInquiry> getRepliesByInquiryId(Long inquiryId) {
        return replyInquiryRepository.findByInquiryIdOrderByCreatedAtDesc(inquiryId);
    }
    
    /**
     * 사용자 댓글 작성
     */
    public ReplyInquiry createUserReply(Long inquiryId, Long memberId, String content) {
        ReplyInquiry reply = new ReplyInquiry();
        reply.setInquiryId(inquiryId);
        reply.setMemberId(memberId);
        reply.setUserContent(content);
        reply.setUserCreatedAt(new Date());
        
        return replyInquiryRepository.save(reply);
    }
    
    /**
     * 관리자 답변 작성
     */
    public ReplyInquiry createAdminReply(Long replyId, Long adminNo, String content) {
        ReplyInquiry reply = replyInquiryRepository.findById(replyId)
                .orElseThrow(() -> new RuntimeException("댓글을 찾을 수 없습니다."));
        
        reply.setAdminNo(adminNo);
        reply.setAdminContent(content);
        reply.setAdminCreatedAt(new Date());
        
        return replyInquiryRepository.save(reply);
    }
    
    /**
     * 댓글 수정 (사용자)
     */
    public ReplyInquiry updateUserReply(Long replyId, String content) {
        ReplyInquiry reply = replyInquiryRepository.findById(replyId)
                .orElseThrow(() -> new RuntimeException("댓글을 찾을 수 없습니다."));
        
        reply.setUserContent(content);
        
        return replyInquiryRepository.save(reply);
    }
    
    /**
     * 댓글 수정 (관리자)
     */
    public ReplyInquiry updateAdminReply(Long replyId, String content) {
        ReplyInquiry reply = replyInquiryRepository.findById(replyId)
                .orElseThrow(() -> new RuntimeException("댓글을 찾을 수 없습니다."));
        
        reply.setAdminContent(content);
        
        return replyInquiryRepository.save(reply);
    }
    
    /**
     * 댓글 삭제
     */
    public void deleteReply(Long replyId) {
        replyInquiryRepository.deleteById(replyId);
    }
    
    /**
     * 특정 문의의 댓글 개수 조회
     */
    @Transactional(readOnly = true)
    public long getReplyCountByInquiryId(Long inquiryId) {
        return replyInquiryRepository.countByInquiryId(inquiryId);
    }
    
    /**
     * 특정 회원의 댓글 조회
     */
    @Transactional(readOnly = true)
    public List<ReplyInquiry> getRepliesByMemberId(Long memberId) {
        return replyInquiryRepository.findByMemberIdOrderByCreatedAtDesc(memberId);
    }
    
    /**
     * 특정 관리자의 답변 조회
     */
    @Transactional(readOnly = true)
    public List<ReplyInquiry> getRepliesByAdminNo(Long adminNo) {
        return replyInquiryRepository.findByAdminNoOrderByAdminCreatedAtDesc(adminNo);
    }
    
    /**
     * 특정 관리자의 답변 삭제 (관리자 삭제 시 사용)
     * 관리자가 작성한 답변 내용만 삭제하고, 사용자 댓글은 유지
     */
    public void deleteAdminRepliesByAdminNo(Long adminNo) {
        List<ReplyInquiry> replies = replyInquiryRepository.findByAdminNoOrderByAdminCreatedAtDesc(adminNo);
        
        for (ReplyInquiry reply : replies) {
            // 관리자 답변 내용만 삭제 (null로 설정)
            reply.setAdminNo(null);
            reply.setAdminContent(null);
            reply.setAdminCreatedAt(null);
            replyInquiryRepository.save(reply);
        }
    }
    
    /**
     * ID로 댓글 조회
     */
    @Transactional(readOnly = true)
    public ReplyInquiry getReplyById(Long replyId) {
        return replyInquiryRepository.findById(replyId).orElse(null);
    }
    
    /**
     * 댓글 수정 (객체로)
     */
    public ReplyInquiry updateReply(ReplyInquiry reply) {
        return replyInquiryRepository.save(reply);
    }
    
    /**
     * 댓글과 관련된 모든 답글 삭제 (댓글 삭제 시 사용)
     */
    public void deleteCommentWithReplies(Long commentId) {
        replyInquiryRepository.deleteById(commentId);
    }
    
    /**
     * 관리자 답글만 삭제 (사용자 댓글은 유지)
     */
    public void deleteAdminReplyOnly(Long replyId) {
        ReplyInquiry reply = replyInquiryRepository.findById(replyId)
                .orElseThrow(() -> new RuntimeException("댓글을 찾을 수 없습니다."));
        
        // 관리자 답글 내용만 삭제 (null로 설정)
        reply.setAdminNo(null);
        reply.setAdminContent(null);
        reply.setAdminCreatedAt(null);
        
        replyInquiryRepository.save(reply);
    }
}

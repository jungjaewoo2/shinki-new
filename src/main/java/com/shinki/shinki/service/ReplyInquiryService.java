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
}

package com.shinki.shinki.service;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.repository.MemberRepository;
import com.shinki.shinki.repository.RequestRepository;
import com.shinki.shinki.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class MemberService {
    
    @Autowired
    private MemberRepository memberRepository;
    
    @Autowired
    private RequestRepository requestRepository;
    
    @Autowired
    private InquiryRepository inquiryRepository;
    
    public Member registerMember(Member member) {
        if (memberRepository.existsByUsername(member.getUsername())) {
            throw new RuntimeException("이미 존재하는 아이디입니다.");
        }
        return memberRepository.save(member);
    }
    
    public Member updateMember(Member member) {
        return memberRepository.save(member);
    }
    
    public void deleteMember(Long memberId) {
        // 회원의 의뢰내역 삭제
        requestRepository.deleteByMemberId(memberId);
        
        // 회원의 문의사항 삭제
        inquiryRepository.deleteByMemberId(memberId);
        
        // 회원 삭제
        memberRepository.deleteById(memberId);
    }
    
    public Member findByUsername(String username) {
        return memberRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
    }
    
    public Member findByNameAndEmail(String name, String email) {
        return memberRepository.findByNameAndEmail(name, email)
                .orElse(null);
    }
    
    public boolean existsByUsername(String username) {
        return memberRepository.existsByUsername(username);
    }
    
    public Long getFirstMemberId() {
        return memberRepository.findAll().stream()
                .mapToLong(Member::getId)
                .min()
                .orElse(0L);
    }
    
    // 모든 회원 조회 (ID 내림차순, 페이징)
    public Page<Member> getAllMembers(Pageable pageable) {
        return memberRepository.findAllByOrderByIdDesc(pageable);
    }
    
    // 활성 회원만 조회 (status = 'Y', ID 내림차순, 페이징)
    public Page<Member> getActiveMembers(Pageable pageable) {
        return memberRepository.findByStatusOrderByIdDesc("Y", pageable);
    }
    
    // 회원 ID로 조회
    public Member getMemberById(Long id) {
        return memberRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
    }
    
    // 여러 회원의 상태를 탈퇴(N)로 변경
    public void updateMembersStatusToInactive(List<Long> memberIds) {
        memberRepository.updateStatusByIds("N", memberIds);
    }
    
    // 여러 회원 삭제
    public void deleteMembers(List<Long> memberIds) {
        memberRepository.deleteByIdIn(memberIds);
    }
    
    // 모든 회원 조회 (디버깅용)
    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }
    
    // 탈퇴 회원만 조회 (status = 'N', ID 내림차순, 페이징)
    public Page<Member> getWithdrawnMembers(Pageable pageable) {
        return memberRepository.findByStatusOrderByIdDesc("N", pageable);
    }
    
    // 여러 회원의 상태를 활성(Y)으로 변경
    public void updateMembersStatusToActive(List<Long> memberIds) {
        memberRepository.updateStatusByIds("Y", memberIds);
    }
    
    // 모든 활성 회원 조회 (페이징 없이)
    public List<Member> getAllActiveMembers() {
        return memberRepository.findByStatus("Y");
    }
    
    // 모든 탈퇴 회원 조회 (페이징 없이)
    public List<Member> getAllWithdrawnMembers() {
        return memberRepository.findByStatus("N");
    }
    
    // 활성 회원 검색 (병원명, 이름, 아이디, 이메일, 연락처)
    public Page<Member> searchActiveMembers(String searchTerm, Pageable pageable) {
        return memberRepository.findActiveMembersBySearchTerm(searchTerm, pageable);
    }
    
    // 탈퇴 회원 검색 (병원명, 이름, 아이디, 이메일, 연락처)
    public Page<Member> searchWithdrawnMembers(String searchTerm, Pageable pageable) {
        return memberRepository.findWithdrawnMembersBySearchTerm(searchTerm, pageable);
    }
}
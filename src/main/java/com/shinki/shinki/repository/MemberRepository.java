package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByUsername(String username);
    Optional<Member> findByNameAndEmail(String name, String email);
    boolean existsByUsername(String username);
    
    // ID 내림차순으로 모든 회원 조회 (페이징)
    Page<Member> findAllByOrderByIdDesc(Pageable pageable);
    
    // 활성 회원만 조회 (status = 'Y')
    Page<Member> findByStatusOrderByIdDesc(String status, Pageable pageable);
    
    // 상태별 회원 조회 (페이징 없이)
    List<Member> findByStatus(String status);
    
    // 여러 회원의 status 업데이트
    @org.springframework.data.jpa.repository.Modifying
    @Query("UPDATE Member m SET m.status = :status WHERE m.id IN :ids")
    void updateStatusByIds(@Param("status") String status, 
                          @Param("ids") List<Long> ids);
    
    // 여러 회원 삭제
    void deleteByIdIn(List<Long> ids);
    
    // 활성 회원 검색 (병원명, 이름, 아이디, 이메일, 연락처)
    @Query("SELECT m FROM Member m WHERE m.status = 'Y' AND " +
           "(LOWER(m.hospitalName) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.username) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.email) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.phone) LIKE LOWER(CONCAT('%', :searchTerm, '%'))) " +
           "ORDER BY m.id DESC")
    Page<Member> findActiveMembersBySearchTerm(@Param("searchTerm") String searchTerm, Pageable pageable);
    
    // 탈퇴 회원 검색 (병원명, 이름, 아이디, 이메일, 연락처)
    @Query("SELECT m FROM Member m WHERE m.status = 'N' AND " +
           "(LOWER(m.hospitalName) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.username) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.email) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
           "LOWER(m.phone) LIKE LOWER(CONCAT('%', :searchTerm, '%'))) " +
           "ORDER BY m.id DESC")
    Page<Member> findWithdrawnMembersBySearchTerm(@Param("searchTerm") String searchTerm, Pageable pageable);
}

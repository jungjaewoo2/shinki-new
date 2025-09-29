package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
    
    // 관리자 ID로 관리자 찾기
    Optional<Admin> findByAdminId(String adminId);
    
    // 관리자 ID와 비밀번호로 관리자 찾기 (로그인용)
    Optional<Admin> findByAdminIdAndPassword(String adminId, String password);
    
    // 부서별 관리자 조회
    List<Admin> findByDepartment(String department);
    
    // 권한별 관리자 조회
    List<Admin> findByAuthority(String authority);
    
    // 모든 관리자 조회 (ID 내림차순)
    List<Admin> findAllByOrderByAdminNoDesc();
    
    // 관리자 ID 중복 확인
    boolean existsByAdminId(String adminId);
    
    // 이름으로 관리자 검색
    @Query("SELECT a FROM Admin a WHERE a.name LIKE %:name%")
    List<Admin> findByNameContaining(@Param("name") String name);
    
    // 부서와 권한으로 관리자 조회
    @Query("SELECT a FROM Admin a WHERE a.department = :department AND a.authority = :authority")
    List<Admin> findByDepartmentAndAuthority(@Param("department") String department, @Param("authority") String authority);
}

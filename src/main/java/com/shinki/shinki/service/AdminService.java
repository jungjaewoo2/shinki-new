package com.shinki.shinki.service;

import com.shinki.shinki.entity.Admin;
import com.shinki.shinki.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AdminService {
    
    @Autowired
    private AdminRepository adminRepository;
    
    // 모든 관리자 조회 (ID 내림차순) - 페이징
    public Page<Admin> getAllAdmins(Pageable pageable) {
        return adminRepository.findAll(pageable);
    }
    
    // 모든 관리자 조회 (ID 내림차순) - 리스트
    public List<Admin> getAllAdmins() {
        return adminRepository.findAllByOrderByAdminNoDesc();
    }
    
    // 관리자 ID로 조회
    public Optional<Admin> getAdminById(String adminId) {
        return adminRepository.findByAdminId(adminId);
    }
    
    // 관리자 번호로 조회
    public Optional<Admin> getAdminByNo(Long adminNo) {
        return adminRepository.findById(adminNo);
    }
    
    // 로그인 인증
    public Optional<Admin> authenticate(String adminId, String password) {
        return adminRepository.findByAdminIdAndPassword(adminId, password);
    }
    
    // 관리자 등록
    public Admin createAdmin(Admin admin) {
        // 관리자 ID 중복 확인
        if (adminRepository.existsByAdminId(admin.getAdminId())) {
            throw new RuntimeException("이미 존재하는 관리자 ID입니다.");
        }
        return adminRepository.save(admin);
    }
    
    // 관리자 정보 수정
    public Admin updateAdmin(Long adminNo, Admin adminDetails) {
        Admin admin = adminRepository.findById(adminNo)
                .orElseThrow(() -> new RuntimeException("관리자를 찾을 수 없습니다. ID: " + adminNo));
        
        // 다른 관리자와 ID 중복 확인 (자신 제외)
        if (!admin.getAdminId().equals(adminDetails.getAdminId()) && 
            adminRepository.existsByAdminId(adminDetails.getAdminId())) {
            throw new RuntimeException("이미 존재하는 관리자 ID입니다.");
        }
        
        admin.setName(adminDetails.getName());
        admin.setAdminId(adminDetails.getAdminId());
        admin.setPassword(adminDetails.getPassword());
        admin.setDepartment(adminDetails.getDepartment());
        admin.setPosition(adminDetails.getPosition());
        admin.setRank(adminDetails.getRank());
        admin.setAuthority(adminDetails.getAuthority());
        admin.setPhone(adminDetails.getPhone());
        admin.setEmail(adminDetails.getEmail());
        
        return adminRepository.save(admin);
    }
    
    // 관리자 삭제
    public void deleteAdmin(Long adminNo) {
        Admin admin = adminRepository.findById(adminNo)
                .orElseThrow(() -> new RuntimeException("관리자를 찾을 수 없습니다. ID: " + adminNo));
        
        adminRepository.delete(admin);
    }
    
    // 부서별 관리자 조회
    public List<Admin> getAdminsByDepartment(String department) {
        return adminRepository.findByDepartment(department);
    }
    
    // 권한별 관리자 조회
    public List<Admin> getAdminsByAuthority(String authority) {
        return adminRepository.findByAuthority(authority);
    }
    
    // 관리자 검색 (이름)
    public List<Admin> searchAdminsByName(String name) {
        return adminRepository.findByNameContaining(name);
    }
    
    // 관리자 ID 중복 확인
    public boolean isAdminIdExists(String adminId) {
        return adminRepository.existsByAdminId(adminId);
    }
    
    // 관리자 수 조회
    public long getAdminCount() {
        return adminRepository.count();
    }
}

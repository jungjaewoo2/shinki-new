package com.shinki.shinki.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Entity
@Table(name = "member")
public class Member {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "병원명은 필수입니다.")
    @Column(name = "hospital_name", nullable = false)
    private String hospitalName;
    
    @NotBlank(message = "진료과는 필수입니다.")
    @Column(name = "department", nullable = false)
    private String department;
    
    @NotBlank(message = "이름은 필수입니다.")
    @Column(name = "name", nullable = false)
    private String name;
    
    @NotBlank(message = "아이디는 필수입니다.")
    @Column(name = "username", nullable = false, unique = true)
    private String username;
    
    @NotBlank(message = "비밀번호는 필수입니다.")
    @Column(name = "password", nullable = false)
    private String password;
    
    @NotBlank(message = "연락처는 필수입니다.")
    @Column(name = "phone", nullable = false)
    private String phone;
    
    @Email(message = "올바른 이메일 형식이 아닙니다.")
    @Column(name = "email")
    private String email;
    
    @Column(name = "recommended_employee")
    private String recommendedEmployee;
    
    @Column(name = "recommend_code")
    private String recommendCode;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @Column(name = "status", nullable = false, columnDefinition = "VARCHAR(1) DEFAULT 'Y'")
    private String status;
    
    @Column(name = "visit_num", nullable = false)
    private Integer visitNum = 0; // 방문횟수
    
    @Column(name = "memo", columnDefinition = "TEXT")
    private String memo; // 메모
    
    @Column(name = "address")
    private String address; // 주소
    
    @Column(name = "address_etc")
    private String addressEtc; // 상세주소
    
    @Transient
    private Long requestCount; // 의뢰건수 (DB에 저장되지 않음)
    
    @Transient
    private Long totalPaymentAmount; // 총 주문금액 (DB에 저장되지 않음)
    
    // 기본 생성자
    public Member() {}
    
    // 전체 생성자
    public Member(Long id, String hospitalName, String department, String name, String username, 
                  String password, String phone, String email, String recommendedEmployee, 
                  String recommendCode, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.hospitalName = hospitalName;
        this.department = department;
        this.name = name;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.recommendedEmployee = recommendedEmployee;
        this.recommendCode = recommendCode;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    // Getter와 Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getHospitalName() { return hospitalName; }
    public void setHospitalName(String hospitalName) { this.hospitalName = hospitalName; }
    
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getRecommendedEmployee() { return recommendedEmployee; }
    public void setRecommendedEmployee(String recommendedEmployee) { this.recommendedEmployee = recommendedEmployee; }
    
    public String getRecommendCode() { return recommendCode; }
    public void setRecommendCode(String recommendCode) { this.recommendCode = recommendCode; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public Integer getVisitNum() { return visitNum; }
    public void setVisitNum(Integer visitNum) { this.visitNum = visitNum; }
    
    public String getMemo() { return memo; }
    public void setMemo(String memo) { this.memo = memo; }
    
    public Long getRequestCount() { return requestCount; }
    public void setRequestCount(Long requestCount) { this.requestCount = requestCount; }
    
    public Long getTotalPaymentAmount() { return totalPaymentAmount; }
    public void setTotalPaymentAmount(Long totalPaymentAmount) { this.totalPaymentAmount = totalPaymentAmount; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getAddressEtc() { return addressEtc; }
    public void setAddressEtc(String addressEtc) { this.addressEtc = addressEtc; }
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) {
            status = "Y"; // 기본값 설정
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}

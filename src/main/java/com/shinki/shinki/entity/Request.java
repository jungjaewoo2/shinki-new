package com.shinki.shinki.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.LocalDateTime; // LocalDateTime 사용

@Entity
@Table(name = "request")
public class Request {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;
    
    @NotBlank(message = "환자 정보 보호 동의서는 필수입니다.")
    @Column(name = "privacy_agreement", nullable = false, columnDefinition = "TEXT")
    private String privacyAgreement;
    
    @Column(name = "privacy_agreed", nullable = false)
    private Boolean privacyAgreed = false;
    
    @NotBlank(message = "APPLICATION은 필수입니다.")
    @Column(name = "application_type", nullable = false)
    private String applicationType; // HBP, LUNG, CARDIAC, KNEE
    
    @NotBlank(message = "제목은 필수입니다.")
    @Column(name = "title", nullable = false)
    private String title;
    
    @NotBlank(message = "의뢰내용은 필수입니다.")
    @Column(name = "content", nullable = false, columnDefinition = "TEXT")
    private String content;
    
    @Column(name = "file_path")
    private String filePath;
    
    @Column(name = "admin_file_path", columnDefinition = "TEXT")
    private String adminFilePath; // 관리자가 업로드한 파일들 (여러 파일 경로를 구분자로 연결)
    
    @Column(name = "status", nullable = false)
    private String status = "주문 확인중"; // 주문 확인중, 작업중, 완료, 취소요청
    
    @Column(name = "reg_condition", nullable = false)
    private Integer regCondition = 1; // 1: 의뢰 확인중, 2: 견적중, 3: 결제진행, 4: 작업수행, 5: 완료
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @Column(name = "status_cancel")
    private String statusCancel = "N"; // Y: 취소됨, N: 취소안됨
    
    @Column(name = "payment_amount")
    private Long paymentAmount; // 결제금액
    
    @Column(name = "payment_method")
    private String paymentMethod; // 결제수단 (계좌입금, 신용카드, 무통장입금, 기타)
    
    @Column(name = "payment_status")
    private String paymentStatus; // 결제상태 (미결제, 결제완료, 환불완료, 부분환불)
    
    @Column(name = "money")
    private Long money; // 의뢰 금액
    
    // 날짜 문자열 변환용 필드 (DB 컬럼 아님)
    @Transient
    private String createdAtStr;
    
    // 기본 생성자
    public Request() {}
    
    // 전체 생성자
    public Request(Long id, Member member, String privacyAgreement, Boolean privacyAgreed, 
                   String applicationType, String title, String content, String filePath, 
                   String status, Integer regCondition, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.member = member;
        this.privacyAgreement = privacyAgreement;
        this.privacyAgreed = privacyAgreed;
        this.applicationType = applicationType;
        this.title = title;
        this.content = content;
        this.filePath = filePath;
        this.status = status;
        this.regCondition = regCondition;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    // Getter와 Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Member getMember() { return member; }
    public void setMember(Member member) { this.member = member; }
    
    public String getPrivacyAgreement() { return privacyAgreement; }
    public void setPrivacyAgreement(String privacyAgreement) { this.privacyAgreement = privacyAgreement; }
    
    public Boolean getPrivacyAgreed() { return privacyAgreed; }
    public void setPrivacyAgreed(Boolean privacyAgreed) { this.privacyAgreed = privacyAgreed; }
    
    public String getApplicationType() { return applicationType; }
    public void setApplicationType(String applicationType) { this.applicationType = applicationType; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    
    public String getAdminFilePath() { return adminFilePath; }
    public void setAdminFilePath(String adminFilePath) { this.adminFilePath = adminFilePath; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public Integer getRegCondition() { return regCondition; }
    public void setRegCondition(Integer regCondition) { this.regCondition = regCondition; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    
    public String getStatusCancel() { return statusCancel; }
    public void setStatusCancel(String statusCancel) { this.statusCancel = statusCancel; }
    
    public Long getPaymentAmount() { return paymentAmount; }
    public void setPaymentAmount(Long paymentAmount) { this.paymentAmount = paymentAmount; }
    
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    
    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
    
    public Long getMoney() { return money; }
    public void setMoney(Long money) { this.money = money; }
    
    public String getCreatedAtStr() { return createdAtStr; }
    public void setCreatedAtStr(String createdAtStr) { this.createdAtStr = createdAtStr; }
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}

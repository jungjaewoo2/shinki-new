package com.shinki.shinki.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "reply_request")
@EntityListeners(AuditingEntityListener.class)
public class ReplyRequest {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    
    @NotNull
    @Column(name = "request_id", nullable = false)
    private Long requestId;
    
    @Column(name = "member_id")
    private Long memberId;
    
    @Column(name = "admin_no")
    private Long adminNo;
    
    @Column(name = "parent_id")
    private Long parentId; // 답글의 부모 댓글 ID
    
    @Column(name = "user_content", columnDefinition = "TEXT")
    private String userContent;
    
    @Column(name = "admin_content", columnDefinition = "TEXT")
    private String adminContent;
    
    @Column(name = "user_created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date userCreatedAt;
    
    @Column(name = "admin_created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date adminCreatedAt;
    
    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    
    @LastModifiedDate
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    
    // JPA 관계 매핑
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "request_id", insertable = false, updatable = false)
    private Request request;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", insertable = false, updatable = false)
    private Member member;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "admin_no", insertable = false, updatable = false)
    private Admin admin;
    
    // 답글 목록 (JSP에서 사용하기 위한 임시 필드)
    @Transient
    private List<ReplyRequest> replies;
    
    // Constructors
    public ReplyRequest() {}
    
    public ReplyRequest(Long requestId, Long memberId, String userContent) {
        this.requestId = requestId;
        this.memberId = memberId;
        this.userContent = userContent;
        this.userCreatedAt = new Date();
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getRequestId() {
        return requestId;
    }
    
    public void setRequestId(Long requestId) {
        this.requestId = requestId;
    }
    
    public Long getMemberId() {
        return memberId;
    }
    
    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }
    
    public Long getAdminNo() {
        return adminNo;
    }
    
    public void setAdminNo(Long adminNo) {
        this.adminNo = adminNo;
    }
    
    public Long getParentId() {
        return parentId;
    }
    
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
    
    public String getUserContent() {
        return userContent;
    }
    
    public void setUserContent(String userContent) {
        this.userContent = userContent;
    }
    
    public String getAdminContent() {
        return adminContent;
    }
    
    public void setAdminContent(String adminContent) {
        this.adminContent = adminContent;
    }
    
    public Date getUserCreatedAt() {
        return userCreatedAt;
    }
    
    public void setUserCreatedAt(Date userCreatedAt) {
        this.userCreatedAt = userCreatedAt;
    }
    
    public Date getAdminCreatedAt() {
        return adminCreatedAt;
    }
    
    public void setAdminCreatedAt(Date adminCreatedAt) {
        this.adminCreatedAt = adminCreatedAt;
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Request getRequest() {
        return request;
    }
    
    public void setRequest(Request request) {
        this.request = request;
    }
    
    public Member getMember() {
        return member;
    }
    
    public void setMember(Member member) {
        this.member = member;
    }
    
    public Admin getAdmin() {
        return admin;
    }
    
    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
    
    public List<ReplyRequest> getReplies() {
        return replies;
    }
    
    public void setReplies(List<ReplyRequest> replies) {
        this.replies = replies;
    }
}

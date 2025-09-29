package com.shinki.shinki.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "con_reg")
public class ConReg {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    
    @Column(name = "hospital_name", nullable = false, length = 100)
    private String hospitalName;
    
    @Column(name = "phone", nullable = false, length = 20)
    private String phone;
    
    @Column(name = "consultation_date", nullable = false)
    private LocalDate consultationDate;
    
    @Column(name = "consultation_time", nullable = false)
    private LocalTime consultationTime;
    
    @Column(name = "consultation_content", nullable = false, columnDefinition = "TEXT")
    private String consultationContent;
    
    @Column(name = "status", nullable = false, length = 20)
    private String status = "대기";
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
    
    // 기본 생성자
    public ConReg() {}
    
    // 생성자
    public ConReg(String name, String hospitalName, String phone, 
                  LocalDate consultationDate, LocalTime consultationTime, 
                  String consultationContent) {
        this.name = name;
        this.hospitalName = hospitalName;
        this.phone = phone;
        this.consultationDate = consultationDate;
        this.consultationTime = consultationTime;
        this.consultationContent = consultationContent;
    }
    
    // Getter and Setter methods
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getHospitalName() {
        return hospitalName;
    }
    
    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public LocalDate getConsultationDate() {
        return consultationDate;
    }
    
    public void setConsultationDate(LocalDate consultationDate) {
        this.consultationDate = consultationDate;
    }
    
    public LocalTime getConsultationTime() {
        return consultationTime;
    }
    
    public void setConsultationTime(LocalTime consultationTime) {
        this.consultationTime = consultationTime;
    }
    
    public String getConsultationContent() {
        return consultationContent;
    }
    
    public void setConsultationContent(String consultationContent) {
        this.consultationContent = consultationContent;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    @Override
    public String toString() {
        return "ConReg{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", hospitalName='" + hospitalName + '\'' +
                ", phone='" + phone + '\'' +
                ", consultationDate=" + consultationDate +
                ", consultationTime=" + consultationTime +
                ", consultationContent='" + consultationContent + '\'' +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}

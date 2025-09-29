package com.shinki.shinki.controller;

import com.shinki.shinki.entity.ConReg;
import com.shinki.shinki.service.ConRegService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/consultation")
public class ConRegController {
    
    @Autowired
    private ConRegService conRegService;
    
    /**
     * 상담 등록 폼 페이지
     */
    @GetMapping("/form")
    public String consultationForm() {
        return "consultation/form";
    }
    
    /**
     * 상담 등록 처리 (AJAX)
     */
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> registerConsultation(
            @RequestParam String name,
            @RequestParam String hospitalName,
            @RequestParam String phone,
            @RequestParam String consultationDate,
            @RequestParam String consultationTime,
            @RequestParam String consultationContent) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 필수 필드 검증
            if (name == null || name.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "이름을 입력해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (hospitalName == null || hospitalName.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "병원명을 입력해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (phone == null || phone.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "전화번호를 입력해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (consultationDate == null || consultationDate.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "상담날짜를 선택해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (consultationTime == null || consultationTime.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "상담시간을 선택해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            if (consultationContent == null || consultationContent.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "상담내용을 입력해주세요.");
                return ResponseEntity.badRequest().body(response);
            }
            
            // 상담 등록 저장
            ConReg savedConsultation = conRegService.saveConsultation(
                name.trim(), hospitalName.trim(), phone.trim(),
                consultationDate, consultationTime, consultationContent.trim()
            );
            
            response.put("success", true);
            response.put("message", "상담 신청이 완료되었습니다.");
            response.put("consultationId", savedConsultation.getId());
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "상담 신청 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }
    
    /**
     * 관리자 - 상담 등록 목록 조회 및 페이징, 검색
     */
    @GetMapping("/admin/consultation-request")
    public String adminConRegList(Model model,
                                  @RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "10") int size,
                                  @RequestParam(defaultValue = "createdAt") String sortBy,
                                  @RequestParam(defaultValue = "desc") String sortDir,
                                  @RequestParam(required = false) String searchType,
                                  @RequestParam(required = false) String searchValue) {
        
        System.out.println("=== ConRegController.adminConRegList 호출됨 ===");
        System.out.println("page: " + page + ", size: " + size + ", sortBy: " + sortBy + ", sortDir: " + sortDir);
        System.out.println("searchType: " + searchType + ", searchValue: " + searchValue);
        
        Page<ConReg> consultationPage = conRegService.searchAndPageConsultations(page, size, sortBy, sortDir, searchType, searchValue);
        
        System.out.println("consultationPage: " + consultationPage);
        System.out.println("consultationPage.getContent(): " + consultationPage.getContent());
        System.out.println("consultationPage.getTotalElements(): " + consultationPage.getTotalElements());
        
        model.addAttribute("consultations", consultationPage.getContent());
        model.addAttribute("currentPage", consultationPage.getNumber());
        model.addAttribute("totalPages", consultationPage.getTotalPages());
        model.addAttribute("totalElements", consultationPage.getTotalElements());
        model.addAttribute("size", consultationPage.getSize());
        model.addAttribute("searchType", searchType);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDir", sortDir);
        
        System.out.println("=== ConRegController.adminConRegList 완료 ===");
        return "admin/consultation-request";
    }
    
    /**
     * 관리자 - 상담 등록 상세 조회
     */
    @GetMapping("/admin/detail/{id}")
    public String adminConsultationDetail(@PathVariable Long id, Model model) {
        Optional<ConReg> consultation = conRegService.getConsultationById(id);
        
        if (consultation.isPresent()) {
            model.addAttribute("consultation", consultation.get());
            return "admin/consultation-detail";
        } else {
            return "redirect:/consultation/admin/consultation-request?error=notfound";
        }
    }
    
    /**
     * 관리자 - 상담 상태 업데이트 (AJAX)
     */
    @PostMapping("/admin/update-status")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateConsultationStatus(
            @RequestParam Long id,
            @RequestParam String status) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            ConReg updatedConsultation = conRegService.updateConsultationStatus(id, status);
            
            if (updatedConsultation != null) {
                response.put("success", true);
                response.put("message", "상담 상태가 업데이트되었습니다.");
                response.put("newStatus", updatedConsultation.getStatus());
            } else {
                response.put("success", false);
                response.put("message", "상담 정보를 찾을 수 없습니다.");
            }
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "상태 업데이트 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }
    
    /**
     * 관리자 - 상담 등록 삭제 (AJAX)
     */
    @PostMapping("/admin/delete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteConsultation(@RequestParam Long id) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            boolean deleted = conRegService.deleteConsultation(id);
            
            if (deleted) {
                response.put("success", true);
                response.put("message", "상담 등록이 삭제되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "상담 정보를 찾을 수 없습니다.");
            }
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "삭제 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }
    
    /**
     * 관리자 - 대시보드 통계 정보 (AJAX)
     */
    @GetMapping("/admin/statistics")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getStatistics() {
        Map<String, Object> statistics = new HashMap<>();
        
        try {
            statistics.put("totalCount", conRegService.getTotalConsultationCount());
            statistics.put("pendingCount", conRegService.getPendingConsultationCount());
            statistics.put("completedCount", conRegService.getCompletedConsultationCount());
            statistics.put("todayCount", conRegService.getTodayConsultations().size());
            statistics.put("thisWeekCount", conRegService.getThisWeekConsultations().size());
            
            return ResponseEntity.ok(statistics);
            
        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("success", false);
            errorResponse.put("message", "통계 정보 조회 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }
    
    /**
     * 관리자 - 오늘의 상담 목록 (AJAX)
     */
    @GetMapping("/admin/today")
    @ResponseBody
    public ResponseEntity<List<ConReg>> getTodayConsultations() {
        try {
            List<ConReg> todayConsultations = conRegService.getTodayConsultations();
            return ResponseEntity.ok(todayConsultations);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    
    /**
     * 관리자 - 이번 주 상담 목록 (AJAX)
     */
    @GetMapping("/admin/week")
    @ResponseBody
    public ResponseEntity<List<ConReg>> getThisWeekConsultations() {
        try {
            List<ConReg> weekConsultations = conRegService.getThisWeekConsultations();
            return ResponseEntity.ok(weekConsultations);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}

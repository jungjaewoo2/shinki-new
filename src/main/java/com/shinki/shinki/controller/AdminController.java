package com.shinki.shinki.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shinki.shinki.entity.Admin;
import com.shinki.shinki.entity.ConReg;
import com.shinki.shinki.entity.Inquiry;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.ReplyInquiry;
import com.shinki.shinki.entity.ReplyRequest;
import com.shinki.shinki.entity.Request;
import com.shinki.shinki.repository.AdminRepository;
import com.shinki.shinki.service.AdminService;
import com.shinki.shinki.service.ConRegService;
import com.shinki.shinki.service.InquiryService;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.ReplyInquiryService;
import com.shinki.shinki.service.ReplyRequestService;
import com.shinki.shinki.service.RequestService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private AdminRepository adminRepository;
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private RequestService requestService;
    
    @Autowired
    private InquiryService inquiryService;
    
    @Autowired
    private ReplyInquiryService replyInquiryService;
    
    @Autowired
    private ReplyRequestService replyRequestService;
    
    @Autowired
    private ConRegService conRegService;

    @Value("${file.upload.path}")
    private String uploadPath;
    
    // 권한 체크 헬퍼 메서드
    private boolean hasAuthority(HttpSession session, String requiredAuthority) {
        String adminAuthority = (String) session.getAttribute("adminAuthority");
        if (adminAuthority == null) return false;
        
        // 모든권한은 모든 기능 접근 가능
        if ("모든권한".equals(adminAuthority)) return true;
        
        // 수정 권한 체크
        if ("수정".equals(requiredAuthority) && "수정".equals(adminAuthority)) return true;
        
        // 답변쓰기 권한 체크
        if ("답변쓰기".equals(requiredAuthority) && "답변쓰기".equals(adminAuthority)) return true;
        
        return false;
    }
    
    @GetMapping("/login")
    public String login() {
        return "admin/login";
    }
    
    @PostMapping("/login")
    public String loginProcess(@RequestParam String username, @RequestParam String password, 
                              Model model, HttpSession session) {
        // 데이터베이스에서 관리자 인증
        Optional<Admin> admin = adminService.authenticate(username, password);
        if (admin.isPresent()) {
            // 세션에 관리자 정보와 권한 저장
            session.setAttribute("adminId", admin.get().getAdminNo());
            session.setAttribute("adminName", admin.get().getName());
            session.setAttribute("adminAuthority", admin.get().getAuthority());
            session.setAttribute("isAdminLoggedIn", true);
            
            return "redirect:/admin/admin-account";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "admin/login";
        }
    }
    
    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션 무효화
        session.invalidate();
        return "redirect:/admin/login";
    }
    
    @PostMapping("/admin-account")
    public String adminAccountProcess(@RequestParam String username, @RequestParam String password, Model model) {
        // 데이터베이스에서 관리자 인증
        Optional<Admin> admin = adminService.authenticate(username, password);
        if (admin.isPresent()) {
            return "redirect:/admin/admin-account";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "admin/login";
        }
    }
    
    @GetMapping("/")
    public String dashboard() {
        return "admin/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboardPage(Model model) {
        // Request 통계
        Long todayRequests = requestService.getTodayRequestCount();
        Long weeklyRequests = requestService.getWeeklyRequestCount();
        Long monthlyRequests = requestService.getMonthlyRequestCount();
        
        // Inquiry 통계
        Long todayInquiries = inquiryService.getTodayInquiryCount();
        Long weeklyInquiries = inquiryService.getWeeklyInquiryCount();
        Long monthlyInquiries = inquiryService.getMonthlyInquiryCount();
        
        model.addAttribute("todayRequests", todayRequests);
        model.addAttribute("weeklyRequests", weeklyRequests);
        model.addAttribute("monthlyRequests", monthlyRequests);
        model.addAttribute("todayInquiries", todayInquiries);
        model.addAttribute("weeklyInquiries", weeklyInquiries);
        model.addAttribute("monthlyInquiries", monthlyInquiries);
        
        return "admin/dashboard";
    }
    
    @GetMapping("/admin-account")
    public String adminAccount(@RequestParam(defaultValue = "0") int page, 
                               @RequestParam(defaultValue = "10") int size, 
                               Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("adminNo").descending());
        Page<Admin> adminPage = adminService.getAllAdmins(pageable);
        
        model.addAttribute("admins", adminPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", adminPage.getTotalPages());
        model.addAttribute("totalElements", adminPage.getTotalElements());
        model.addAttribute("size", size);
        
        return "admin/admin-account";
    }
    
    // 관리자 추가 처리
    @PostMapping("/admin-account/add")
    public String addAdmin(@ModelAttribute Admin admin, RedirectAttributes redirectAttributes) {
        try {
            adminService.createAdmin(admin);
            redirectAttributes.addFlashAttribute("success", "관리자가 추가되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/admin-account";
    }
    
    // 관리자 수정 처리
    @PostMapping("/admin-account/update/{adminNo}")
    public String updateAdmin(@PathVariable Long adminNo, @ModelAttribute Admin admin, RedirectAttributes redirectAttributes) {
        try {
            adminService.updateAdmin(adminNo, admin);
            redirectAttributes.addFlashAttribute("success", "관리자 정보가 성공적으로 수정되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/admin-account";
    }
    
    // 관리자 삭제 처리 (체크박스 선택)
    @PostMapping("/admin-account/delete")
    public String deleteSelectedAdmins(@RequestParam(value = "selectedAdmins", required = false) String selectedAdmins, 
                                     RedirectAttributes redirectAttributes) {
        if (selectedAdmins == null || selectedAdmins.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "삭제할 관리자를 선택해주세요.");
            return "redirect:/admin/admin-account";
        }
        
        try {
            String[] adminNos = selectedAdmins.split(",");
            for (String adminNoStr : adminNos) {
                Long adminNo = Long.parseLong(adminNoStr.trim());
                adminService.deleteAdmin(adminNo);
            }
            redirectAttributes.addFlashAttribute("success", "삭제가 완료되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/admin-account";
    }
    
    // 관리자 상세 정보 조회
    @GetMapping("/admin-account-details")
    public String adminAccountDetails(@RequestParam("adminNo") Long adminNo, Model model) {
        Optional<Admin> adminOptional = adminService.getAdminByNo(adminNo);
        if (adminOptional.isPresent()) {
            model.addAttribute("admin", adminOptional.get());
        } else {
            // 관리자를 찾을 수 없을 경우 처리
            return "redirect:/admin/admin-account"; 
        }
        return "admin/admin-account-details";
    }

    // 관리자 정보 업데이트 처리
    @PostMapping("/admin-account-details/update")
    public String updateAdminDetails(@ModelAttribute Admin admin, RedirectAttributes redirectAttributes) {
        try {
            // 기존 관리자 정보 조회
            Optional<Admin> existingAdminOptional = adminService.getAdminByNo(admin.getAdminNo());
            if (existingAdminOptional.isPresent()) {
                Admin existingAdmin = existingAdminOptional.get();
                
                // 이름과 아이디는 수정하지 않도록 기존 데이터를 유지
                admin.setName(existingAdmin.getName());
                admin.setAdminId(existingAdmin.getAdminId());
                
                // 비밀번호가 비어있으면 기존 비밀번호 유지
                if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
                    admin.setPassword(existingAdmin.getPassword());
                }
                
                adminService.updateAdmin(admin.getAdminNo(), admin);
                redirectAttributes.addFlashAttribute("success", "관리자 정보가 성공적으로 수정되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "관리자를 찾을 수 없습니다.");
            }
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/admin-account";
    }
    
    @GetMapping("/consultation-request")
    public String consultationRequest(@RequestParam(defaultValue = "0") int page, 
                                     @RequestParam(defaultValue = "10") int size,
                                     @RequestParam(defaultValue = "createdAt") String sortBy,
                                     @RequestParam(defaultValue = "desc") String sortDir,
                                     @RequestParam(required = false) String searchType,
                                     @RequestParam(required = false) String searchValue,
                                     Model model) {
        try {
            // ConRegService를 사용하여 상담 신청 목록 조회
            Page<ConReg> consultationPage = conRegService.searchAndPageConsultations(page, size, sortBy, sortDir, searchType, searchValue);
            
            model.addAttribute("consultations", consultationPage.getContent());
            model.addAttribute("currentPage", consultationPage.getNumber());
            model.addAttribute("totalPages", consultationPage.getTotalPages());
            model.addAttribute("totalElements", consultationPage.getTotalElements());
            model.addAttribute("size", consultationPage.getSize());
            model.addAttribute("searchType", searchType);
            model.addAttribute("searchValue", searchValue);
            model.addAttribute("sortBy", sortBy);
            model.addAttribute("sortDir", sortDir);
            
        } catch (Exception e) {
            System.out.println("consultation-request 오류: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "페이지 로드 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "admin/consultation-request";
    }
    
    @GetMapping("/inquiry-request")
    public String inquiryRequest(@RequestParam(defaultValue = "0") int page, 
                                @RequestParam(defaultValue = "10") int size,
                                @RequestParam(value = "search", required = false) String search,
                                Model model) {
        try {
            Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
            Page<Inquiry> inquiryPage;
            
            if (search != null && !search.trim().isEmpty()) {
                // 검색어가 있으면 검색 수행
                inquiryPage = inquiryService.searchInquiriesByContent(search.trim(), pageable);
                model.addAttribute("search", search.trim());
            } else {
                // 검색어가 없으면 전체 조회
                inquiryPage = inquiryService.getAllInquiriesWithPaging(pageable);
            }
            
            model.addAttribute("inquiries", inquiryPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", inquiryPage.getTotalPages());
            model.addAttribute("totalElements", inquiryPage.getTotalElements());
            model.addAttribute("size", size);
            
        } catch (Exception e) {
            System.out.println("inquiry-request 오류: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "페이지 로드 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "admin/inquiry-request";
    }
    
    @GetMapping("/inquiry-history")
    public String inquiryHistory(@RequestParam(defaultValue = "0") int page, 
                               @RequestParam(defaultValue = "10") int size,
                               @RequestParam(value = "search", required = false) String search,
                               Model model) {
        try {
            Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
            Page<Inquiry> inquiryPage;
            
            if (search != null && !search.trim().isEmpty()) {
                // 검색어가 있으면 검색 수행
                inquiryPage = inquiryService.searchInquiriesByContent(search, pageable);
            } else {
                // 검색어가 없으면 전체 조회
                inquiryPage = inquiryService.getAllInquiriesWithPaging(pageable);
            }
            
            model.addAttribute("inquiries", inquiryPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", inquiryPage.getTotalPages());
            model.addAttribute("totalElements", inquiryPage.getTotalElements());
            model.addAttribute("size", size);
            model.addAttribute("search", search);
            
        } catch (Exception e) {
            logger.error("inquiry-history 오류: {}", e.getMessage(), e);
            model.addAttribute("error", "페이지 로드 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "admin/inquiry-history";
    }
    
    @GetMapping("/inquiry-response-management")
    public String inquiryResponseManagement(@RequestParam(value = "id", required = false) Long inquiryId, Model model, HttpSession session) {
        try {
            if (inquiryId != null) {
                // 특정 문의 조회
                Inquiry inquiry = inquiryService.getInquiryById(inquiryId);
                model.addAttribute("inquiry", inquiry);
                
                // 관리자 목록 조회 (답변직원 선택용)
                List<Admin> admins = adminService.getAllAdmins();
                model.addAttribute("admins", admins);
                
                // 해당 문의의 댓글 목록 조회
                List<ReplyInquiry> replies = replyInquiryService.getRepliesByInquiryId(inquiryId);
                
                // 댓글 내용 디버깅 로그
                for (ReplyInquiry reply : replies) {
                    if (reply.getUserContent() != null) {
                        logger.info("댓글 내용 원본: [{}]", reply.getUserContent());
                        logger.info("댓글 내용 길이: {}", reply.getUserContent().length());
                        logger.info("댓글 내용 첫 문자 ASCII: {}", (int) reply.getUserContent().charAt(0));
                    }
                }
                
                model.addAttribute("replies", replies);
                
                // 권한 정보 추가
                model.addAttribute("canModify", hasAuthority(session, "수정"));
                model.addAttribute("canReply", hasAuthority(session, "답변쓰기"));
                model.addAttribute("adminAuthority", session.getAttribute("adminAuthority"));
            } else {
                model.addAttribute("error", "문의 ID가 필요합니다.");
            }
        } catch (Exception e) {
            model.addAttribute("error", "문의를 찾을 수 없습니다: " + e.getMessage());
        }
        return "admin/inquiry-response-management";
    }
    
    @PostMapping("/inquiry-response-management")
    public String saveInquiryResponse(@RequestParam("inquiryId") Long inquiryId,
                                    @RequestParam("status") String status,
                                    @RequestParam("adminId") Long adminId,
                                    @RequestParam("adminReply") String adminReply,
                                    @RequestParam(value = "replyFile", required = false) MultipartFile replyFile,
                                    RedirectAttributes redirectAttributes) {
        try {
            // 답변 내용 유효성 검사
            if (adminReply == null || adminReply.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "답변 내용을 입력해주세요.");
                return "redirect:/admin/inquiry-response-management?id=" + inquiryId;
            }
            
            Inquiry inquiry = inquiryService.getInquiryById(inquiryId);
            
            // 상태 업데이트
            inquiry.setStatus(status);
            
            // 관리자 답변 설정
            inquiry.setAdminReply(adminReply.trim());
            
            // 답변일시 설정
            inquiry.setReplyDate(new Date());
            
            // 답변직원 설정
            if (adminId != null) {
                Admin admin = adminRepository.findById(adminId).orElse(null);
                if (admin != null) {
                    inquiry.setAdmin(admin);
                    logger.info("답변직원 설정: {} (ID: {})", admin.getName(), adminId);
                }
            }
            
            // 답변 파일 업로드 처리
            if (replyFile != null && !replyFile.isEmpty()) {
                String uploadDir = uploadPath + "/inquiry/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                
                // 날짜시간_아이디_파일명 형식으로 파일명 생성 (YYYYMMDDHHMM 형식)
                java.time.LocalDateTime now = java.time.LocalDateTime.now();
                String timestamp = now.format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
                String adminUsername = "admin"; // 관리자 아이디 (필요시 세션에서 가져올 수 있음)
                String fileName = timestamp + "_" + adminUsername + "_" + replyFile.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                
                try {
                    Files.write(filePath, replyFile.getBytes());
                    // 관리자 답변 첨부파일명 저장 (파일명만)
                    inquiry.setAdminReplyFilePath(fileName);
                    logger.info("관리자 답변 파일 업로드 완료: {}", filePath);
                    logger.info("DB에 저장된 관리자 파일명: {}", fileName);
                } catch (IOException e) {
                    logger.error("관리자 답변 파일 저장 중 오류 발생: {}", e.getMessage(), e);
                    redirectAttributes.addFlashAttribute("error", "답변 파일 저장 중 오류가 발생했습니다.");
                    return "redirect:/admin/inquiry-response-management?id=" + inquiryId;
                }
            }
            
            inquiryService.saveInquiry(inquiry);
            redirectAttributes.addFlashAttribute("success", "답변이 성공적으로 저장되었습니다.");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "답변 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/inquiry-response-management?id=" + inquiryId;
    }
    
    @GetMapping("/download-inquiry-file")
    public ResponseEntity<Resource> downloadInquiryFile(@RequestParam("filePath") String filePath) {
        try {
            logger.info("=== 관리자 페이지 사용자 첨부파일 다운로드 시작 ===");
            logger.info("전달받은 filePath: {}", filePath);
            
            // 파일명만 저장되므로 그대로 사용
            String fileName = filePath;
            logger.info("저장된 파일명: {}", fileName);
            
            // 파일명만 저장되므로 경로 추가
            //Path path = Paths.get("src/main/webapp/uploads/inquiry/" + fileName);
            Path path = Paths.get(uploadPath + "/inquiry/" + fileName);
            logger.info("찾는 파일 경로: {}", path.toString());
            
            Resource resource = new UrlResource(path.toUri());
            
            if (resource.exists() && resource.isReadable()) {
                // 원본 파일명 복원 (타임스탬프 제거)
                String originalFileName = fileName;
                if (fileName.contains("_")) {
                    // 첫 번째 언더스코어 이후의 부분이 원본 파일명
                    originalFileName = fileName.substring(fileName.indexOf("_") + 1);
                }
                
                // 파일명에 특수문자가 있으면 URL 인코딩
                String encodedFileName = java.net.URLEncoder.encode(originalFileName, "UTF-8");
                
                logger.info("원본 파일명: {}", originalFileName);
                logger.info("인코딩된 파일명: {}", encodedFileName);
                logger.info("=== 관리자 페이지 사용자 첨부파일 다운로드 성공 ===");
                
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_OCTET_STREAM)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"")
                        .body(resource);
            } else {
                logger.warn("파일을 찾을 수 없습니다: {}", path.toString());
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            logger.error("파일 다운로드 중 오류 발생: {}", e.getMessage(), e);
            return ResponseEntity.badRequest().build();
        }
    }
    
    @GetMapping("/download-admin-reply-file")
    public ResponseEntity<Resource> downloadAdminReplyFile(@RequestParam("filePath") String filePath) {
        try {
            logger.info("=== 관리자 답변 첨부파일 다운로드 시작 (AdminController) ===");
            logger.info("전달받은 filePath: {}", filePath);
            
            // 파일명만 저장되므로 그대로 사용
            String fileName = filePath;
            
            // uploads/inquiry 폴더에서 파일 찾기
            //Path path = Paths.get("src/main/webapp/uploads/inquiry/" + fileName);
            Path path = Paths.get(uploadPath + "/inquiry/" + fileName);
            logger.info("찾는 파일 경로: {}", path.toString());
            Resource resource = new UrlResource(path.toUri());
            
            if (resource.exists() && resource.isReadable()) {
                // 원본 파일명 복원 (타임스탬프 제거)
                String originalFileName = fileName;
                if (fileName.contains("_")) {
                    // 첫 번째 언더스코어 이후의 부분이 원본 파일명
                    originalFileName = fileName.substring(fileName.indexOf("_") + 1);
                }
                
                // 파일명에 특수문자가 있으면 URL 인코딩
                String encodedFileName = java.net.URLEncoder.encode(originalFileName, "UTF-8");
                
                logger.info("원본 파일명: {}", originalFileName);
                logger.info("인코딩된 파일명: {}", encodedFileName);
                logger.info("=== 관리자 답변 첨부파일 다운로드 성공 (AdminController) ===");
                
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_OCTET_STREAM)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"")
                        .body(resource);
            } else {
                logger.warn("관리자 첨부파일을 찾을 수 없습니다: {}", path.toString());
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            logger.error("관리자 첨부파일 다운로드 중 오류 발생: {}", e.getMessage(), e);
            return ResponseEntity.badRequest().build();
        }
    }
    
    @GetMapping("/download-request-file")
    public ResponseEntity<Resource> downloadRequestFile(@RequestParam("filePath") String filePath) {
        try {
            logger.info("=== 의뢰 첨부파일 다운로드 시작 ===");
            logger.info("전달받은 filePath: {}", filePath);
            
            // 파일명만 저장되므로 그대로 사용
            String fileName = filePath;
            logger.info("저장된 파일명: {}", fileName);
            
            // 파일명만 저장되므로 경로 추가
            //Path path = Paths.get("src/main/webapp/uploads/request/" + fileName);
            Path path = Paths.get(uploadPath + "/request/" + fileName);
            logger.info("찾는 파일 경로: {}", path.toString());
            
            Resource resource = new UrlResource(path.toUri());
            
            if (resource.exists() && resource.isReadable()) {
                // 원본 파일명 복원 (타임스탬프 제거)
                String originalFileName = fileName;
                if (fileName.contains("_")) {
                    // 첫 번째 언더스코어 이후의 부분이 원본 파일명
                    originalFileName = fileName.substring(fileName.indexOf("_") + 1);
                }
                
                // 파일명에 특수문자가 있으면 URL 인코딩
                String encodedFileName = java.net.URLEncoder.encode(originalFileName, "UTF-8");
                
                logger.info("원본 파일명: {}", originalFileName);
                logger.info("인코딩된 파일명: {}", encodedFileName);
                logger.info("=== 의뢰 첨부파일 다운로드 성공 ===");
                
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_OCTET_STREAM)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"")
                        .body(resource);
            } else {
                logger.warn("파일을 찾을 수 없습니다: {}", path.toString());
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            logger.error("파일 다운로드 중 오류 발생: {}", e.getMessage(), e);
            return ResponseEntity.badRequest().build();
        }
    }
    
    @PostMapping("/inquiry-response-management/reply")
    public String addAdminReply(@RequestParam("replyId") Long replyId,
                               @RequestParam("adminContent") String adminContent,
                               @RequestParam("adminId") Long adminId,
                               @RequestParam("inquiryId") Long inquiryId,
                               RedirectAttributes redirectAttributes) {
        try {
            // 관리자 답변 추가
            replyInquiryService.createAdminReply(replyId, adminId, adminContent);
            
            redirectAttributes.addFlashAttribute("success", "댓글 답변이 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "댓글 답변 등록 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/inquiry-response-management?id=" + inquiryId;
    }
    
    @GetMapping("/membership-management")
    public String membershipManagement(@RequestParam(defaultValue = "0") int page, 
                                      @RequestParam(defaultValue = "10") int size,
                                      @RequestParam(value = "search", required = false) String search,
                                      Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Member> memberPage;
        
        if (search != null && !search.trim().isEmpty()) {
            // 검색어가 있는 경우 검색 실행
            memberPage = memberService.searchActiveMembers(search.trim(), pageable);
            model.addAttribute("search", search);
        } else {
            // 검색어가 없는 경우 전체 조회
            memberPage = memberService.getActiveMembers(pageable);
        }
        
        // 각 회원의 의뢰건수와 총 주문금액 계산
        List<Member> members = memberPage.getContent();
        for (Member member : members) {
            // 의뢰건수 계산
            Long requestCount = requestService.getRequestCountByMemberId(member.getId());
            member.setRequestCount(requestCount);
            
            // 총 주문금액 계산 (payment_amount 합산)
            Long totalPaymentAmount = requestService.getTotalPaymentAmountByMemberId(member.getId());
            member.setTotalPaymentAmount(totalPaymentAmount);
        }
        
        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", memberPage.getTotalPages());
        model.addAttribute("totalElements", memberPage.getTotalElements());
        model.addAttribute("size", size);
        
        return "admin/membership-management";
    }
    
    // 회원 탈퇴 처리 (status를 N으로 변경)
    @PostMapping("/membership-management/withdraw")
    public String withdrawMembers(@RequestParam(value = "selectedMembers", required = false) String selectedMembers, 
                                 RedirectAttributes redirectAttributes) {
        if (selectedMembers == null || selectedMembers.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "탈퇴할 회원을 선택해주세요.");
            return "redirect:/admin/membership-management";
        }
        
        try {
            String[] memberIds = selectedMembers.split(",");
            java.util.List<Long> memberIdList = new java.util.ArrayList<>();
            for (String memberIdStr : memberIds) {
                memberIdList.add(Long.parseLong(memberIdStr.trim()));
            }
            memberService.updateMembersStatusToInactive(memberIdList);
            redirectAttributes.addFlashAttribute("success", "선택된 회원이 탈퇴 처리되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/membership-management";
    }
    
    // 회원 삭제 처리
    @PostMapping("/membership-management/delete")
    public String deleteMembers(@RequestParam(value = "selectedMembers", required = false) String selectedMembers, 
                               RedirectAttributes redirectAttributes) {
        if (selectedMembers == null || selectedMembers.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "삭제할 회원을 선택해주세요.");
            return "redirect:/admin/membership-management";
        }
        
        try {
            String[] memberIds = selectedMembers.split(",");
            java.util.List<Long> memberIdList = new java.util.ArrayList<>();
            for (String memberIdStr : memberIds) {
                memberIdList.add(Long.parseLong(memberIdStr.trim()));
            }
            memberService.deleteMembers(memberIdList);
            redirectAttributes.addFlashAttribute("success", "선택된 회원이 삭제되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/membership-management";
    }
    
    // 임시: 모든 회원 조회 (디버깅용)
    @GetMapping("/membership-management/debug-all-members")
    public String debugAllMembers(Model model) {
        List<Member> allMembers = memberService.getAllMembers();
        model.addAttribute("allMembers", allMembers);
        return "admin/membership-management";
    }
    
    // 임시: ID가 2번인 회원 삭제 (문제가 있는 데이터)
    @GetMapping("/membership-management/delete-member-2")
    public String deleteMember2(RedirectAttributes redirectAttributes) {
        try {
            memberService.deleteMember(2L);
            redirectAttributes.addFlashAttribute("success", "ID가 2번인 회원이 삭제되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/membership-management";
    }
    
    @GetMapping("/payment-coupon-management")
    public String paymentCouponManagement() {
        return "admin/payment-coupon-management";
    }
    
    @GetMapping("/request-history")
    public String requestHistory(@RequestParam(defaultValue = "0") int page, 
                                @RequestParam(defaultValue = "10") int size,
                                @RequestParam(value = "search", required = false) String search,
                                Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Request> requestPage;
        
        if (search != null && !search.trim().isEmpty()) {
            requestPage = requestService.searchRequests(search.trim(), pageable);
        } else {
            requestPage = requestService.getAllRequests(pageable);
        }
        
        model.addAttribute("requests", requestPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", requestPage.getTotalPages());
        model.addAttribute("totalElements", requestPage.getTotalElements());
        model.addAttribute("size", size);
        model.addAttribute("search", search);
        
        return "admin/request-history";
    }
    
    @PostMapping("/request-history/delete")
    public String deleteRequests(@RequestParam(value = "selectedRequests", required = false) String selectedRequests,
                                RedirectAttributes redirectAttributes) {
        if (selectedRequests == null || selectedRequests.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "삭제할 의뢰를 선택해주세요.");
            return "redirect:/admin/request-history";
        }

        try {
            String[] requestIds = selectedRequests.split(",");
            java.util.List<Long> requestIdList = new java.util.ArrayList<>();
            for (String requestIdStr : requestIds) {
                requestIdList.add(Long.parseLong(requestIdStr.trim()));
            }
            requestService.deleteRequests(requestIdList);
            redirectAttributes.addFlashAttribute("success", "선택된 의뢰가 삭제되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/request-history";
    }
    
    @GetMapping("/statistics")
    public String statistics() {
        return "admin/statistics";
    }
    
    @GetMapping("/subscription-fee-info")
    public String subscriptionFeeInfo() {
        return "admin/subscription-fee-info";
    }
    
    @GetMapping("/view-member-info")
    public String viewMemberInfo(@RequestParam("memberId") Long memberId, Model model) {
        try {
            Member member = memberService.getMemberById(memberId);
            
            // LocalDateTime을 문자열로 변환하여 추가
            if (member.getCreatedAt() != null) {
                String createdAtStr = member.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                model.addAttribute("memberCreatedAtStr", createdAtStr);
            }
            
            if (member.getUpdatedAt() != null) {
                String updatedAtStr = member.getUpdatedAt().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
                model.addAttribute("memberUpdatedAtStr", updatedAtStr);
            }
            
            model.addAttribute("member", member);
            
            // 해당 회원의 총 결제금액 계산 (request 테이블의 payment_amount 컬럼 합산)
            Long totalPaymentAmount = requestService.getTotalPaymentAmountByMemberId(memberId);
            model.addAttribute("totalPaymentAmount", totalPaymentAmount);
            
            // 해당 회원의 의뢰 목록 조회 (등록날짜 내림차순)
            List<Request> requests = requestService.getRequestsByMemberId(memberId);
            
            // 해당 회원의 결제 내역 조회 (payment_amount > 0인 request만)
            List<Request> paymentHistory = requests.stream()
                .filter(request -> request.getPaymentAmount() != null && request.getPaymentAmount() > 0)
                .collect(java.util.stream.Collectors.toList());
            
            // 결제 내역의 날짜도 문자열로 변환
            for (Request payment : paymentHistory) {
                payment.setCreatedAtStr(formatDateTime(payment.getCreatedAt()));
            }
            
            // 해당 회원의 문의 목록 조회 (등록날짜 내림차순)
            List<Inquiry> inquiries = inquiryService.getInquiriesByMemberId(memberId);
            
            // 활동 내역을 등록날짜 순으로 정렬하여 통합 리스트 생성
            List<ActivityItem> activityList = new ArrayList<>();
            
            // Request 데이터 추가
            for (Request request : requests) {
                ActivityItem item = new ActivityItem();
                item.setId(request.getId());
                item.setType("request");
                item.setCreatedAt(request.getCreatedAt());
                item.setCreatedAtStr(formatDateTime(request.getCreatedAt()));
                item.setContent(request.getTitle());
                item.setApplicationType(request.getApplicationType());
                activityList.add(item);
            }
            
            // Inquiry 데이터 추가
            for (Inquiry inquiry : inquiries) {
                ActivityItem item = new ActivityItem();
                item.setId(inquiry.getId());
                item.setType("inquiry");
                item.setCreatedAt(inquiry.getCreatedAt());
                item.setCreatedAtStr(formatDateTime(inquiry.getCreatedAt()));
                item.setContent(inquiry.getContent());
                item.setInquiryType(inquiry.getInquiryType());
                activityList.add(item);
            }
            
            // 등록날짜 내림차순으로 정렬
            activityList.sort((a, b) -> {
                if (a.getCreatedAt() instanceof java.time.LocalDateTime && b.getCreatedAt() instanceof java.time.LocalDateTime) {
                    return ((java.time.LocalDateTime) b.getCreatedAt()).compareTo((java.time.LocalDateTime) a.getCreatedAt());
                } else if (a.getCreatedAt() instanceof java.util.Date && b.getCreatedAt() instanceof java.util.Date) {
                    return ((java.util.Date) b.getCreatedAt()).compareTo((java.util.Date) a.getCreatedAt());
                }
                return 0;
            });
            
            model.addAttribute("activityList", activityList);
            model.addAttribute("paymentHistory", paymentHistory);
            
        } catch (RuntimeException e) {
            model.addAttribute("error", "회원을 찾을 수 없습니다.");
        }
        return "admin/view-member-info";
    }
    
    // 회원 메모 저장/수정 처리
    @PostMapping("/view-member-info/save-memo")
    public String saveMemberMemo(@RequestParam("memberId") Long memberId,
                                @RequestParam("memo") String memo,
                                RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.getMemberById(memberId);
            if (member != null) {
                member.setMemo(memo);
                memberService.updateMember(member);
                redirectAttributes.addFlashAttribute("success", "메모가 저장되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "회원을 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "메모 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/admin/view-member-info?memberId=" + memberId;
    }
    
    // 활동 내역 아이템을 위한 내부 클래스
    public static class ActivityItem {
        private Long id;
        private String type;
        private Object createdAt;
        private String createdAtStr;
        private String content;
        private String applicationType;
        private String inquiryType;
        
        // Getters and Setters
        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }
        
        public String getType() { return type; }
        public void setType(String type) { this.type = type; }
        
        public Object getCreatedAt() { return createdAt; }
        public void setCreatedAt(Object createdAt) { this.createdAt = createdAt; }
        
        public String getCreatedAtStr() { return createdAtStr; }
        public void setCreatedAtStr(String createdAtStr) { this.createdAtStr = createdAtStr; }
        
        public String getContent() { return content; }
        public void setContent(String content) { this.content = content; }
        
        public String getApplicationType() { return applicationType; }
        public void setApplicationType(String applicationType) { this.applicationType = applicationType; }
        
        public String getInquiryType() { return inquiryType; }
        public void setInquiryType(String inquiryType) { this.inquiryType = inquiryType; }
    }
    
    // 날짜 포맷팅 헬퍼 메서드
    private String formatDateTime(Object dateTime) {
        if (dateTime == null) {
            return "";
        }
        
        if (dateTime instanceof java.time.LocalDateTime) {
            java.time.LocalDateTime ldt = (java.time.LocalDateTime) dateTime;
            return ldt.format(java.time.format.DateTimeFormatter.ofPattern("yyyy.MM.dd"));
        } else if (dateTime instanceof java.util.Date) {
            java.util.Date date = (java.util.Date) dateTime;
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy.MM.dd");
            return sdf.format(date);
        }
        
        return dateTime.toString();
    }
    
    @GetMapping("/view-request-details")
    public String viewRequestDetails(@RequestParam("id") Long requestId, Model model, HttpSession session) {
        try {
            // 의뢰 정보 조회 (회원 정보 포함)
            Request request = requestService.getRequestById(requestId);
            if (request == null) {
                model.addAttribute("error", "의뢰를 찾을 수 없습니다.");
                return "admin/view-request-details";
            }
            
            model.addAttribute("request", request);
            
            // 해당 의뢰의 사용자 댓글 목록 조회 (답글이 아닌 원본 댓글만)
            List<ReplyRequest> userComments = replyRequestService.getUserCommentsByRequestId(requestId);
            
            // 각 사용자 댓글의 답글들을 조회하여 설정
            for (ReplyRequest comment : userComments) {
                List<ReplyRequest> replies = replyRequestService.getRepliesByParentId(comment.getId());
                comment.setReplies(replies);
            }
            
            model.addAttribute("userComments", userComments);
            
            // 관리자 목록 조회 (답변 작성용)
            List<Admin> admins = adminService.getAllAdmins();
            model.addAttribute("admins", admins);
            
            // 권한 정보 추가
            model.addAttribute("canModify", hasAuthority(session, "수정"));
            model.addAttribute("canReply", hasAuthority(session, "답변쓰기"));
            model.addAttribute("adminAuthority", session.getAttribute("adminAuthority"));
            
        } catch (Exception e) {
            model.addAttribute("error", "의뢰 정보를 불러오는 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "admin/view-request-details";
    }
    
    // 답변 작성 처리
    @PostMapping("/view-request-details/reply")
    public String addReply(@RequestParam("requestId") Long requestId,
                          @RequestParam("adminContent") String adminContent,
                          RedirectAttributes redirectAttributes) {
        try {
            replyRequestService.createAdminReply(requestId, null, adminContent);
            redirectAttributes.addFlashAttribute("success", "답변이 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "답변 등록 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/view-request-details?id=" + requestId;
    }
    
    // 결제정보 업데이트 처리
    @PostMapping("/view-request-details/update-payment")
    public String updatePayment(@RequestParam("requestId") Long requestId,
                                @RequestParam(value = "paymentAmount", required = false) Long paymentAmount,
                                @RequestParam(value = "paymentMethod", required = false) String paymentMethod,
                                @RequestParam(value = "paymentStatus", required = false) String paymentStatus,
                                RedirectAttributes redirectAttributes) {
        try {
            Request request = requestService.getRequestById(requestId);
            if (request != null) {
                if (paymentAmount != null) {
                    request.setPaymentAmount(paymentAmount);
                }
                if (paymentMethod != null && !paymentMethod.trim().isEmpty()) {
                    request.setPaymentMethod(paymentMethod);
                }
                if (paymentStatus != null && !paymentStatus.trim().isEmpty()) {
                    request.setPaymentStatus(paymentStatus);
                }
                requestService.updateRequest(request);
                redirectAttributes.addFlashAttribute("success", "결제정보가 업데이트되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "의뢰를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "결제정보 업데이트 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/admin/view-request-details?id=" + requestId;
    }
    
    // 사용자 댓글에 대한 답글 작성 처리
    @PostMapping("/view-request-details/reply-to-comment")
    public String addReplyToComment(@RequestParam("requestId") Long requestId,
                                   @RequestParam("parentId") Long parentId,
                                   @RequestParam("adminContent") String adminContent,
                                   RedirectAttributes redirectAttributes) {
        try {
            replyRequestService.createAdminReplyToUserComment(requestId, parentId, adminContent);
            redirectAttributes.addFlashAttribute("success", "답글이 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "답글 등록 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/view-request-details?id=" + requestId;
    }
    
    // 처리상태 변경 처리
    @PostMapping("/view-request-details/update-status")
    public String updateRequestStatus(@RequestParam("requestId") Long requestId,
                                    @RequestParam("status") String status,
                                    RedirectAttributes redirectAttributes) {
        try {
            Request request = requestService.getRequestById(requestId);
            if (request != null) {
                request.setStatus(status);
                
                // 상태에 따른 regCondition 설정
                Integer regCondition = 1; // 기본값
                switch (status) {
                    case "의뢰 확인중":
                        regCondition = 1;
                        break;
                    case "견적중":
                        regCondition = 2;
                        break;
                    case "결제 진행":
                        regCondition = 3;
                        break;
                    case "작업중":
                        regCondition = 4;
                        break;
                    case "작업 완료":
                        regCondition = 5;
                        break;
                }
                request.setRegCondition(regCondition);
                
                requestService.updateRequest(request);
                redirectAttributes.addFlashAttribute("success", "처리상태가 변경되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "의뢰를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "상태 변경 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/view-request-details?id=" + requestId;
    }
    
    // 취소상태 변경 처리
    @PostMapping("/view-request-details/update-cancel-status")
    public String updateCancelStatus(@RequestParam("requestId") Long requestId,
                                    @RequestParam("statusCancel") String statusCancel,
                                    RedirectAttributes redirectAttributes) {
        try {
            Request request = requestService.getRequestById(requestId);
            if (request != null) {
                request.setStatus(statusCancel); // status 컬럼 변경
                request.setStatusCancel(statusCancel); // status_cancel도 함께 변경
                requestService.updateRequest(request);
                redirectAttributes.addFlashAttribute("success", "상태가 변경되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "의뢰를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "상태 변경 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/admin/view-request-details?id=" + requestId;
    }
    
    @GetMapping("/withdrawal-management")
    public String withdrawalManagement(@RequestParam(defaultValue = "0") int page, 
                                      @RequestParam(defaultValue = "10") int size,
                                      @RequestParam(value = "search", required = false) String search,
                                      Model model) {
        try {
            Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
            Page<Member> memberPage;
            
            if (search != null && !search.trim().isEmpty()) {
                // 검색어가 있는 경우 검색 실행
                memberPage = memberService.searchWithdrawnMembers(search.trim(), pageable);
                model.addAttribute("search", search);
            } else {
                // 검색어가 없는 경우 전체 조회
                memberPage = memberService.getWithdrawnMembers(pageable);
            }
            
            model.addAttribute("members", memberPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", memberPage.getTotalPages());
            model.addAttribute("totalElements", memberPage.getTotalElements());
            model.addAttribute("size", size);
            
            return "admin/withdrawal-management";
        } catch (Exception e) {
            System.out.println("withdrawal-management 오류: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "페이지 로드 중 오류가 발생했습니다: " + e.getMessage());
            return "admin/withdrawal-management";
        }
    }
    
    // 탈퇴 회원 복구 처리 (status를 Y로 변경)
    @PostMapping("/withdrawal-management/restore")
    public String restoreMembers(@RequestParam(value = "selectedMembers", required = false) String selectedMembers, 
                                RedirectAttributes redirectAttributes) {
        if (selectedMembers == null || selectedMembers.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "복구할 회원을 선택해주세요.");
            return "redirect:/admin/withdrawal-management";
        }
        
        try {
            String[] memberIds = selectedMembers.split(",");
            java.util.List<Long> memberIdList = new java.util.ArrayList<>();
            for (String memberIdStr : memberIds) {
                memberIdList.add(Long.parseLong(memberIdStr.trim()));
            }
            memberService.updateMembersStatusToActive(memberIdList);
            redirectAttributes.addFlashAttribute("success", "선택된 회원이 복구되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/withdrawal-management";
    }
    
    // 탈퇴 회원 삭제 처리
    @PostMapping("/withdrawal-management/delete")
    public String deleteWithdrawnMembers(@RequestParam(value = "selectedMembers", required = false) String selectedMembers, 
                                        RedirectAttributes redirectAttributes) {
        if (selectedMembers == null || selectedMembers.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "삭제할 회원을 선택해주세요.");
            return "redirect:/admin/withdrawal-management";
        }
        
        try {
            String[] memberIds = selectedMembers.split(",");
            java.util.List<Long> memberIdList = new java.util.ArrayList<>();
            for (String memberIdStr : memberIds) {
                memberIdList.add(Long.parseLong(memberIdStr.trim()));
            }
            memberService.deleteMembers(memberIdList);
            redirectAttributes.addFlashAttribute("success", "선택된 회원이 삭제되었습니다.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/withdrawal-management";
    }
    
    // 회원목록 엑셀 다운로드
    @GetMapping("/membership-management/excel")
    public ResponseEntity<Resource> downloadMemberExcel() {
        try {
            System.out.println("엑셀 다운로드 시작");
            
            // 모든 활성 회원 조회
            List<Member> allMembers = memberService.getAllActiveMembers();
            System.out.println("조회된 회원 수: " + allMembers.size());
            
            // 각 회원의 의뢰건수와 총 주문금액 계산
            for (Member member : allMembers) {
                Long requestCount = requestService.getRequestCountByMemberId(member.getId());
                member.setRequestCount(requestCount);
                
                Long totalPaymentAmount = requestService.getTotalPaymentAmountByMemberId(member.getId());
                member.setTotalPaymentAmount(totalPaymentAmount);
            }
            
            // 엑셀 파일 생성
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("회원목록");
            
            // 헤더 행 생성
            Row headerRow = sheet.createRow(0);
            String[] headers = {"병원명", "이름", "아이디", "가입일", "이메일", "연락처", "의뢰건수", "총 주문금액", "방문수", "상태"};
            
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }
            
            // 데이터 행 생성
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            for (int i = 0; i < allMembers.size(); i++) {
                Member member = allMembers.get(i);
                Row dataRow = sheet.createRow(i + 1);
                
                dataRow.createCell(0).setCellValue(member.getHospitalName() != null ? member.getHospitalName() : "");
                dataRow.createCell(1).setCellValue(member.getName() != null ? member.getName() : "");
                dataRow.createCell(2).setCellValue(member.getUsername() != null ? member.getUsername() : "");
                dataRow.createCell(3).setCellValue(member.getCreatedAt() != null ? member.getCreatedAt().format(formatter) : "");
                dataRow.createCell(4).setCellValue(member.getEmail() != null ? member.getEmail() : "");
                dataRow.createCell(5).setCellValue(member.getPhone() != null ? member.getPhone() : "");
                dataRow.createCell(6).setCellValue(member.getRequestCount() != null ? member.getRequestCount() : 0);
                dataRow.createCell(7).setCellValue(member.getTotalPaymentAmount() != null ? member.getTotalPaymentAmount() : 0);
                dataRow.createCell(8).setCellValue(member.getVisitNum() != null ? member.getVisitNum() : 0);
                dataRow.createCell(9).setCellValue("Y".equals(member.getStatus()) ? "정상" : "탈퇴");
            }
            
            // 컬럼 너비 자동 조정
            for (int i = 0; i < headers.length; i++) {
                sheet.autoSizeColumn(i);
            }
            
            System.out.println("엑셀 파일 생성 완료");
            
            // 엑셀 파일을 바이트 배열로 변환
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            workbook.close();
            
            byte[] excelBytes = outputStream.toByteArray();
            System.out.println("엑셀 파일 크기: " + excelBytes.length + " bytes");
            
            ByteArrayResource resource = new ByteArrayResource(excelBytes);
            
            // 파일명 생성 (현재 날짜 포함)
            String fileName = "member_list_" + java.time.LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + ".xlsx";
            
            System.out.println("파일명: " + fileName);
            
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .contentLength(excelBytes.length)
                    .body(resource);
                    
        } catch (Exception e) {
            System.err.println("엑셀 다운로드 오류: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }
    
    // 탈퇴회원목록 엑셀 다운로드
    @GetMapping("/withdrawal-management/excel")
    public ResponseEntity<Resource> downloadWithdrawnMemberExcel() {
        try {
            System.out.println("탈퇴회원 엑셀 다운로드 시작");
            
            // 모든 탈퇴 회원 조회
            List<Member> allMembers = memberService.getAllWithdrawnMembers();
            System.out.println("조회된 탈퇴회원 수: " + allMembers.size());
            
            // 각 회원의 의뢰건수와 총 주문금액 계산
            for (Member member : allMembers) {
                Long requestCount = requestService.getRequestCountByMemberId(member.getId());
                member.setRequestCount(requestCount);
                
                Long totalPaymentAmount = requestService.getTotalPaymentAmountByMemberId(member.getId());
                member.setTotalPaymentAmount(totalPaymentAmount);
            }
            
            // 엑셀 파일 생성
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("탈퇴회원목록");
            
            // 헤더 행 생성
            Row headerRow = sheet.createRow(0);
            String[] headers = {"병원명", "이름", "아이디", "가입일", "이메일", "연락처", "의뢰건수", "총 주문금액", "방문수", "상태"};
            
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }
            
            // 데이터 행 생성
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            for (int i = 0; i < allMembers.size(); i++) {
                Member member = allMembers.get(i);
                Row dataRow = sheet.createRow(i + 1);
                
                dataRow.createCell(0).setCellValue(member.getHospitalName() != null ? member.getHospitalName() : "");
                dataRow.createCell(1).setCellValue(member.getName() != null ? member.getName() : "");
                dataRow.createCell(2).setCellValue(member.getUsername() != null ? member.getUsername() : "");
                dataRow.createCell(3).setCellValue(member.getCreatedAt() != null ? member.getCreatedAt().format(formatter) : "");
                dataRow.createCell(4).setCellValue(member.getEmail() != null ? member.getEmail() : "");
                dataRow.createCell(5).setCellValue(member.getPhone() != null ? member.getPhone() : "");
                dataRow.createCell(6).setCellValue(member.getRequestCount() != null ? member.getRequestCount() : 0);
                dataRow.createCell(7).setCellValue(member.getTotalPaymentAmount() != null ? member.getTotalPaymentAmount() : 0);
                dataRow.createCell(8).setCellValue(member.getVisitNum() != null ? member.getVisitNum() : 0);
                dataRow.createCell(9).setCellValue("Y".equals(member.getStatus()) ? "정상" : "탈퇴");
            }
            
            // 컬럼 너비 자동 조정
            for (int i = 0; i < headers.length; i++) {
                sheet.autoSizeColumn(i);
            }
            
            System.out.println("탈퇴회원 엑셀 파일 생성 완료");
            
            // 엑셀 파일을 바이트 배열로 변환
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            workbook.close();
            
            byte[] excelBytes = outputStream.toByteArray();
            System.out.println("탈퇴회원 엑셀 파일 크기: " + excelBytes.length + " bytes");
            
            ByteArrayResource resource = new ByteArrayResource(excelBytes);
            
            // 파일명 생성 (현재 날짜 포함)
            String fileName = "withdrawn_member_list_" + java.time.LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + ".xlsx";
            
            System.out.println("파일명: " + fileName);
            
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .contentLength(excelBytes.length)
                    .body(resource);
                    
        } catch (Exception e) {
            System.err.println("탈퇴회원 엑셀 다운로드 오류: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

    // 관리자 파일 업로드 처리
    @PostMapping("/upload-admin-files")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> uploadAdminFiles(
            @RequestParam("files") MultipartFile[] files,
            @RequestParam("requestId") Long requestId) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            logger.info("관리자 파일 업로드 시작 - requestId: {}, 파일 개수: {}", requestId, files.length);
            
            // 요청 정보 조회
            Request request = requestService.getRequestById(requestId);
            if (request == null) {
                response.put("success", false);
                response.put("message", "요청을 찾을 수 없습니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 업로드 디렉토리 설정 (절대 경로 사용)
            String webappPath = System.getProperty("user.dir") + "/src/main/webapp";
            String uploadDirPath = webappPath + "/uploads/request";
            
            // 디렉토리 생성
            Path uploadPath = Paths.get(uploadDirPath);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                logger.info("업로드 디렉토리 생성: {}", uploadPath);
            }

            List<String> uploadedFilePaths = new ArrayList<>();
            List<String> existingFilePaths = new ArrayList<>();
            
            // 기존 파일 경로가 있다면 리스트로 변환 (수정 가능한 리스트로 생성)
            if (request.getAdminFilePath() != null && !request.getAdminFilePath().trim().isEmpty()) {
                existingFilePaths.addAll(Arrays.asList(request.getAdminFilePath().split("\\|")));
            }

            // 각 파일 처리
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    // 날짜시간_아이디_파일명 형식으로 파일명 생성 (YYYYMMDDHHMM 형식)
                    String originalFileName = file.getOriginalFilename();
                    java.time.LocalDateTime now = java.time.LocalDateTime.now();
                    String timestamp = now.format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
                    String adminUsername = "admin"; // 관리자 아이디 (필요시 세션에서 가져올 수 있음)
                    String fileName = timestamp + "_" + adminUsername + "_" + originalFileName;
                    
                    // 파일 저장
                    Path targetPath = uploadPath.resolve(fileName);
                    Files.write(targetPath, file.getBytes());
                    
                    // 저장된 파일명만 추가 (DB에는 파일명만 저장)
                    uploadedFilePaths.add(fileName);
                    
                    logger.info("관리자 파일 업로드 성공: {} -> {}", originalFileName, targetPath);
                }
            }

            // 기존 파일과 새 파일 합치기
            existingFilePaths.addAll(uploadedFilePaths);
            String combinedFilePaths = String.join("|", existingFilePaths);
            
            // 데이터베이스 업데이트
            request.setAdminFilePath(combinedFilePaths);
            requestService.updateRequest(request);

            response.put("success", true);
            response.put("message", "파일이 성공적으로 업로드되었습니다.");
            response.put("uploadedFiles", uploadedFilePaths);
            
            logger.info("관리자 파일 업로드 완료 - requestId: {}, 업로드된 파일: {}", requestId, uploadedFilePaths);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            logger.error("관리자 파일 업로드 오류 - requestId: {}, 오류: {}", requestId, e.getMessage(), e);
            
            response.put("success", false);
            response.put("message", "파일 업로드 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }

    // 관리자 파일 삭제 처리
    @PostMapping("/delete-admin-file")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteAdminFile(@RequestBody Map<String, Object> requestData) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            Long requestId = Long.valueOf(requestData.get("requestId").toString());
            String fileName = requestData.get("fileName").toString();
            
            logger.info("관리자 파일 삭제 시작 - requestId: {}, fileName: {}", requestId, fileName);
            
            // 요청 정보 조회
            Request request = requestService.getRequestById(requestId);
            if (request == null) {
                response.put("success", false);
                response.put("message", "요청을 찾을 수 없습니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 현재 파일 경로 목록 가져오기
            String adminFilePath = request.getAdminFilePath();
            if (adminFilePath == null || adminFilePath.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "삭제할 파일이 없습니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 파일 목록에서 해당 파일 제거
            List<String> fileList = new ArrayList<>(Arrays.asList(adminFilePath.split("\\|")));
            boolean fileFound = false;
            
            for (int i = fileList.size() - 1; i >= 0; i--) {
                if (fileList.get(i).trim().equals(fileName.trim())) {
                    fileList.remove(i);
                    fileFound = true;
                    break;
                }
            }
            
            if (!fileFound) {
                response.put("success", false);
                response.put("message", "삭제할 파일을 찾을 수 없습니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 물리적 파일 삭제
            String webappPath = System.getProperty("user.dir") + "/src/main/webapp";
            Path filePath = Paths.get(webappPath + "/uploads/request/" + fileName.trim());
            
            try {
                if (Files.exists(filePath)) {
                    Files.delete(filePath);
                    logger.info("물리적 파일 삭제 완료: {}", filePath);
                } else {
                    logger.warn("삭제하려는 파일이 존재하지 않음: {}", filePath);
                }
            } catch (Exception e) {
                logger.error("물리적 파일 삭제 중 오류: {}", e.getMessage(), e);
                // 물리적 파일 삭제 실패해도 DB는 업데이트 진행
            }

            // DB 업데이트 (남은 파일들로 업데이트)
            String updatedFilePath = String.join("|", fileList);
            if (updatedFilePath.trim().isEmpty()) {
                request.setAdminFilePath(null); // 모든 파일이 삭제된 경우
            } else {
                request.setAdminFilePath(updatedFilePath);
            }
            
            requestService.updateRequest(request);

            response.put("success", true);
            response.put("message", "파일이 성공적으로 삭제되었습니다.");
            
            logger.info("관리자 파일 삭제 완료 - requestId: {}, fileName: {}", requestId, fileName);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            logger.error("관리자 파일 삭제 오류: {}", e.getMessage(), e);
            
            response.put("success", false);
            response.put("message", "파일 삭제 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }
}

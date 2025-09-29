package com.shinki.shinki.controller;

import com.shinki.shinki.entity.Inquiry;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.ReplyInquiry;
import com.shinki.shinki.service.InquiryService;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.ReplyInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import jakarta.validation.Valid;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;

@Controller
@RequestMapping("/mypage")
public class InquiryController {
    
    private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
    
    @Autowired
    private InquiryService inquiryService;
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private ReplyInquiryService replyInquiryService;
    
    @Value("${file.upload.path}")
    private String uploadPath;
    
    @GetMapping("/inquiry")
    public String inquiryPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("memberId", member.getId());
        } catch (Exception e) {
            logger.error("사용자 정보 조회 실패", e);
            return "redirect:/mypage/login";
        }
        return "mypage/inquiry";
    }
    
    @PostMapping("/inquiry")
    public String createInquiry(@Valid @ModelAttribute Inquiry inquiry,
                               @RequestParam(required = false) MultipartFile file,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        logger.info("=== 문의 등록 시작 ===");
        
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            Long memberId = member.getId();
            
            logger.info("inquiryType: {}", inquiry.getInquiryType());
            logger.info("content: {}", inquiry.getContent());
            logger.info("memberId: {}", memberId);
            logger.info("file: {}", file != null ? file.getOriginalFilename() : "null");
            logger.info("file size: {}", file != null ? file.getSize() : 0);
            
            // 파일 업로드 처리
            if (file != null && !file.isEmpty()) {
                logger.info("파일 업로드 조건 만족: 파일 존재 및 비어있지 않음");
                logger.info("파일 업로드 시작: {}", file.getOriginalFilename());
                //String uploadDir = "src/main/webapp/uploads/inquiry/";
                String uploadDir = uploadPath + "/inquiry/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                    logger.info("업로드 디렉토리 생성: {}", uploadDir);
                }
                
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                
                try {
                    Files.write(filePath, file.getBytes());
                    inquiry.setFilePath(fileName); // 파일명만 저장
                    logger.info("파일 업로드 완료: {}", filePath);
                    logger.info("DB에 저장된 파일명: {}", fileName);
                } catch (IOException ioException) {
                    logger.error("파일 저장 중 IOException 발생: {}", ioException.getMessage(), ioException);
                    redirectAttributes.addFlashAttribute("error", "파일 저장 중 오류가 발생했습니다: " + ioException.getMessage());
                    return "redirect:/mypage/inquiry";
                }
            } else {
                logger.info("파일 업로드 조건 불만족: 파일이 없거나 비어있음");
            }
            
            // 문의 상태를 "미확인"으로 설정
            inquiry.setStatus("미확인");
            logger.info("문의 상태 설정: {}", inquiry.getStatus());
            
            logger.info("InquiryService.createInquiry 호출 시작");
            Inquiry savedInquiry = inquiryService.createInquiry(inquiry, memberId);
            logger.info("문의 등록 성공 - ID: {}", savedInquiry.getId());
            
            redirectAttributes.addFlashAttribute("message", "문의가 성공적으로 등록되었습니다.");
            logger.info("리다이렉트: /mypage/inquiry-history");
            return "redirect:/mypage/inquiry-history";
        } catch (Exception e) {
            logger.error("문의 등록 실패", e);
            logger.error("예외 메시지: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            logger.info("리다이렉트: /mypage/inquiry");
            return "redirect:/mypage/inquiry";
        }
    }
    
    @GetMapping("/inquiry-history")
    public String inquiryHistoryPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            List<Inquiry> inquiries = inquiryService.getInquiriesByMemberId(member.getId());
            
            model.addAttribute("inquiries", inquiries != null ? inquiries : new java.util.ArrayList<>());
            
            logger.info("문의 내역 조회 성공 - 사용자: {}, 문의 수: {}", 
                       username, inquiries != null ? inquiries.size() : 0);
            
            if (inquiries != null) {
                for (Inquiry inquiry : inquiries) {
                    logger.info("Inquiry ID: {}, Type: {}, Content: {}, CreatedAt: {}, Status: {}",
                                inquiry.getId(), inquiry.getInquiryType(), inquiry.getContent(),
                                inquiry.getCreatedAt(), inquiry.getStatus());
                }
            }

        } catch (Exception e) {
            logger.error("inquiryHistoryPage - 오류 발생", e);
            model.addAttribute("inquiries", new java.util.ArrayList<>());
            model.addAttribute("error", "문의 내역을 불러오는 중 오류가 발생했습니다.");
        }
        return "mypage/inquiry-history";
    }
    
    @GetMapping("/inquiry-history-details")
    public String inquiryHistoryDetails(@RequestParam("id") Long inquiryId, 
                                       HttpSession session, 
                                       Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            Inquiry inquiry = inquiryService.getInquiryById(inquiryId);
            
            // 본인이 작성한 문의인지 확인
            if (inquiry.getMember() == null || !inquiry.getMember().getId().equals(member.getId())) {
                model.addAttribute("error", "접근 권한이 없습니다.");
                return "mypage/inquiry-history-details";
            }
            
            // 해당 문의의 댓글 목록 조회
            List<ReplyInquiry> replies = replyInquiryService.getRepliesByInquiryId(inquiryId);
            
            model.addAttribute("inquiry", inquiry);
            model.addAttribute("replies", replies);
            model.addAttribute("memberId", member.getId());
            
            logger.info("문의 상세 조회 성공 - Inquiry ID: {}, Replies Count: {}", 
                       inquiryId, replies.size());
            
        } catch (Exception e) {
            logger.error("문의 상세 조회 실패", e);
            model.addAttribute("error", "문의 정보를 불러오는 중 오류가 발생했습니다.");
        }
        
        return "mypage/inquiry-history-details";
    }
    
    @PostMapping("/inquiry-history-details/reply")
    public String addReply(@RequestParam("inquiryId") Long inquiryId,
                          @RequestParam("content") String content,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            
            // 댓글 생성
            replyInquiryService.createUserReply(inquiryId, member.getId(), content);
            
            redirectAttributes.addFlashAttribute("message", "댓글이 등록되었습니다.");
            logger.info("댓글 등록 성공 - Inquiry ID: {}, Member ID: {}", inquiryId, member.getId());
            
        } catch (Exception e) {
            logger.error("댓글 등록 실패", e);
            redirectAttributes.addFlashAttribute("error", "댓글 등록 중 오류가 발생했습니다.");
        }
        
        return "redirect:/mypage/inquiry-history-details?id=" + inquiryId;
    }
    
    @GetMapping("/download-inquiry-file")
    public ResponseEntity<Resource> downloadInquiryFile(@RequestParam("filePath") String filePath) {
        try {
            logger.info("=== 사용자 첨부파일 다운로드 시작 ===");
            logger.info("전달받은 filePath: {}", filePath);
            
            // 파일명만 저장되므로 그대로 사용
            String fileName = filePath;
            logger.info("저장된 파일명: {}", fileName);
            
            // 파일명만 저장되므로 경로 추가
            Path path = Paths.get("src/main/webapp/uploads/inquiry/" + fileName);
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
                logger.info("=== 사용자 첨부파일 다운로드 성공 ===");
                
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
            logger.info("=== 관리자 답변 첨부파일 다운로드 시작 ===");
            logger.info("전달받은 filePath: {}", filePath);
            
            // 파일명만 저장되므로 그대로 사용
            String fileName = filePath;
            
            // uploads/inquiry 폴더에서 파일 찾기
            Path path = Paths.get("src/main/webapp/uploads/inquiry/" + fileName);
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
                logger.info("=== 관리자 답변 첨부파일 다운로드 성공 ===");
                
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
    
    @PostMapping("/inquiry-history-details/delete")
    public String deleteInquiry(@RequestParam("inquiryId") Long inquiryId,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            Inquiry inquiry = inquiryService.getInquiryById(inquiryId);
            
            // 본인이 작성한 문의인지 확인
            if (inquiry.getMember() == null || !inquiry.getMember().getId().equals(member.getId())) {
                redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
                return "redirect:/mypage/inquiry-history";
            }
            
            // 관련 댓글들 먼저 삭제
            List<ReplyInquiry> replies = replyInquiryService.getRepliesByInquiryId(inquiryId);
            for (ReplyInquiry reply : replies) {
                replyInquiryService.deleteReply(reply.getId());
            }
            
            // 문의 삭제
            inquiryService.deleteInquiry(inquiryId);
            
            redirectAttributes.addFlashAttribute("message", "문의가 성공적으로 삭제되었습니다.");
            logger.info("문의 삭제 성공 - Inquiry ID: {}, Member ID: {}", inquiryId, member.getId());
            
        } catch (Exception e) {
            logger.error("문의 삭제 실패", e);
            redirectAttributes.addFlashAttribute("error", "문의 삭제 중 오류가 발생했습니다.");
        }
        
        return "redirect:/mypage/inquiry-history";
    }
}

@Controller
@RequestMapping("/admin")
class AdminInquiryController {
    
    @Autowired
    private InquiryService inquiryService;
    
    @GetMapping("/inquiries")
    public String adminInquiryList(Model model) {
        List<Inquiry> inquiries = inquiryService.getAllInquiries();
        model.addAttribute("inquiries", inquiries);
        return "admin/inquiry-list";
    }
    
    @PostMapping("/inquiry/{id}/reply")
    public String replyToInquiry(@PathVariable Long id,
                                @RequestParam String adminReply,
                                RedirectAttributes redirectAttributes) {
        try {
            inquiryService.replyToInquiry(id, adminReply);
            redirectAttributes.addFlashAttribute("message", "답변이 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/inquiries";
    }
}

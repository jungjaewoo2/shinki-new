package com.shinki.shinki.controller;

import com.shinki.shinki.entity.Request;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.ReplyRequest;
import com.shinki.shinki.service.RequestService;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.ReplyRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import java.util.List;
import java.util.Optional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Value;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.Request;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.RequestService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/mypage")
public class RequestController {
    
    @Autowired
    private RequestService requestService;
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private ReplyRequestService replyRequestService;
    
    @Value("${file.upload.path}")
    private String uploadPath;
    
    @GetMapping("/request")
    public String requestPage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("memberId", member.getId());
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
        return "mypage/request";
    }
    
    @PostMapping("/request")
    public String createRequest(@Valid @ModelAttribute Request request,
                               @RequestParam Long memberId,
                               @RequestParam(required = false) MultipartFile file,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        try {
            // 세션 확인
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            // 환자 정보 보호 동의서 동의 확인
            if (request.getPrivacyAgreed() == null || !request.getPrivacyAgreed()) {
                redirectAttributes.addFlashAttribute("error", "환자 정보 보호 동의서에 동의해주세요.");
                return "redirect:/mypage/request";
            }
            
            // 파일 확장자 검증 (ZIP 파일만 허용)
            if (file != null && !file.isEmpty()) {
                String originalFilename = file.getOriginalFilename();
                if (originalFilename == null || !originalFilename.toLowerCase().endsWith(".zip")) {
                    redirectAttributes.addFlashAttribute("error", "ZIP 파일만 업로드 가능합니다.");
                    return "redirect:/mypage/request";
                }
                
                // 파일 업로드 처리 - 절대경로 사용
                //String webappPath = System.getProperty("user.dir") + "/src/main/webapp";
                //String uploadDir = webappPath + "/uploads/request/";
                String uploadDir = uploadPath + "/request/";
                
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                
                System.out.println("=== 파일 업로드 디버깅 ===");
                System.out.println("업로드 디렉토리: " + uploadDir);
                System.out.println("디렉토리 존재 여부: " + dir.exists());
                
                // 날짜시간_아이디_파일명 형식으로 파일명 생성 (YYYYMMDDHHMM 형식)
                java.time.LocalDateTime now = java.time.LocalDateTime.now();
                String timestamp = now.format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
                String fileName = timestamp + "_" + username + "_" + originalFilename;
                Path filePath = Paths.get(uploadDir + fileName);
                Files.write(filePath, file.getBytes());
                
                request.setFilePath(fileName);
            }
            
            request.setStatus("의뢰 확인중"); // 요청된 status 값으로 설정
            requestService.createRequest(request, memberId);
            redirectAttributes.addFlashAttribute("message", "의뢰내용이 정상 등록되었습니다");
            return "redirect:/mypage/request";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/mypage/request";
        }
    }
    
    @GetMapping("/orders")
    public String ordersPage(@RequestParam(required = false) String startDate,
                           @RequestParam(required = false) String endDate,
                           HttpSession session, 
                           Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            List<Request> requests;
            
            // 기간 검색이 있는 경우 필터링
            if (startDate != null && !startDate.trim().isEmpty() && 
                endDate != null && !endDate.trim().isEmpty()) {
                System.out.println("=== 기간 검색 디버깅 ===");
                System.out.println("시작일: " + startDate + ", 종료일: " + endDate);
                System.out.println("회원 ID: " + member.getId());
                
                requests = requestService.getRequestsByMemberIdAndDateRange(member.getId(), startDate, endDate);
                System.out.println("기간 검색 결과 수: " + requests.size());
                System.out.println("========================");
            } else {
                requests = requestService.getRequestsByMemberId(member.getId());
            }
            
            // '취소' 관련 상태의 의뢰를 제외합니다.
            requests = requests.stream()
                .filter(r -> !"취소 요청".equals(r.getStatus()) && 
                           !"취소 진행중".equals(r.getStatus()) && 
                           !"취소 완료".equals(r.getStatus()))
                .collect(Collectors.toList());

            model.addAttribute("requests", requests);
            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);

            // '진행중' 및 '완료' 상태의 요청 개수 계산 (orders.jsp와 동일한 로직)
            long inProgressCount = requests.stream()
                .filter(r -> !"작업 완료".equals(r.getStatus()) && 
                           !"취소 진행중".equals(r.getStatus()) && 
                           !"취소 완료".equals(r.getStatus()))
                .count();
            long completedCount = requests.stream()
                .filter(r -> "작업 완료".equals(r.getStatus()))
                .count();
            
            model.addAttribute("inProgressCount", inProgressCount);
            model.addAttribute("completedCount", completedCount);
        } catch (Exception e) {
            model.addAttribute("requests", List.of());
            model.addAttribute("inProgressCount", 0L);
            model.addAttribute("completedCount", 0L);
        }
        return "mypage/orders";
    }
    
    @GetMapping("/order-detail/{id}")
    public String orderDetail(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        Request request = requestService.getRequestById(id);
        if (request == null) {
            // 요청이 없을 경우 에러 메시지와 함께 목록 페이지로 리다이렉트
            redirectAttributes.addFlashAttribute("error", "해당 주문 내역을 찾을 수 없습니다.");
            return "redirect:/mypage/orders";
        }
        
        // 해당 의뢰의 사용자 댓글 목록 조회 (답글이 아닌 원본 댓글만)
        List<ReplyRequest> userComments = replyRequestService.getUserCommentsByRequestId(id);
        
        // 각 사용자 댓글의 답글들을 조회하여 설정
        for (ReplyRequest comment : userComments) {
            List<ReplyRequest> replies = replyRequestService.getRepliesByParentId(comment.getId());
            comment.setReplies(replies);
        }
        
        model.addAttribute("request", request);
        model.addAttribute("userComments", userComments);
        return "mypage/order-detail";
    }

    @GetMapping("/edit-request/{id}")
    public String editRequestPage(@PathVariable Long id, HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            Request request = requestService.getRequestById(id);
            if (request == null) {
                return "redirect:/mypage/orders";
            }
            if (!request.getMember().getId().equals(member.getId())) {
                return "redirect:/mypage/orders"; // 다른 사용자의 의뢰 수정 방지
            }
            model.addAttribute("memberId", member.getId());
            model.addAttribute("request", request);
            return "mypage/edit-request";
        } catch (Exception e) {
            return "redirect:/mypage/orders";
        }
    }

    @PostMapping("/update-request")
    public String updateRequest(@Valid @ModelAttribute Request request,
                               @RequestParam(required = false) MultipartFile file,
                               @RequestParam(required = false) String existingFilePath,
                               @RequestParam(required = false) String removeExistingFileFlag,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            // 기존 파일 삭제 플래그 확인
            boolean shouldRemoveExistingFile = "true".equals(removeExistingFileFlag);
            
            // 파일 업로드 서비스 호출
            requestService.updateRequest(request, file, existingFilePath, shouldRemoveExistingFile);
            
            redirectAttributes.addFlashAttribute("message", "의뢰가 성공적으로 수정되었습니다.");
            return "redirect:/mypage/order-detail/" + request.getId();
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "의뢰 수정 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/mypage/edit-request/" + request.getId();
        }
    }

    @GetMapping("/cancel-request/{id}")
    public String cancelRequestPage(@PathVariable Long id, HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Request request = requestService.getRequestById(id);
            if (request == null) {
                return "redirect:/mypage/orders";
            }
            
            // 현재 사용자의 의뢰인지 확인
            Member member = memberService.findByUsername(username);
            if (!request.getMember().getId().equals(member.getId())) {
                return "redirect:/mypage/orders";
            }
            
            model.addAttribute("request", request);
            return "mypage/cancel-request";
        } catch (Exception e) {
            return "redirect:/mypage/orders";
        }
    }

    @PostMapping("/cancel-request/{id}")
    public String cancelRequest(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Request request = requestService.getRequestById(id);
            if (request == null) {
                redirectAttributes.addFlashAttribute("error", "해당 의뢰를 찾을 수 없습니다.");
                return "redirect:/mypage/orders";
            }
            
            if ("작업 완료".equals(request.getStatus()) || "취소 요청".equals(request.getStatus()) || "취소 진행중".equals(request.getStatus()) || "취소 완료".equals(request.getStatus())) {
                redirectAttributes.addFlashAttribute("error", "완료되거나 이미 취소된 의뢰는 취소할 수 없습니다.");
            } else {
                request.setStatus("취소 요청");
                request.setStatusCancel("취소 요청"); // status_cancel도 함께 설정
                requestService.saveRequest(request);
                redirectAttributes.addFlashAttribute("message", "의뢰가 성공적으로 취소 요청되었습니다.");
            }
            return "redirect:/mypage/order-detail/" + id;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "의뢰 취소 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/mypage/order-detail/" + id;
        }
    }

         @PostMapping("/download-single-file")
     public void downloadSingleFile(@RequestParam Long requestId,
                                   @RequestParam String fileName,
                                   HttpSession session,
                                   HttpServletResponse response) throws IOException {
         // 세션에서 로그인된 사용자 정보 가져오기
         String username = (String) session.getAttribute("username");
         if (username == null) {
             response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
             return;
         }
         
        try {
            Member member = memberService.findByUsername(username);
            Request request = requestService.getRequestById(requestId);
            if (request == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청을 찾을 수 없습니다.");
                return;
            }
             
             // 권한 확인 및 파일 존재 확인
             if (!request.getMember().getId().equals(member.getId()) || 
                 !"작업 완료".equals(request.getStatus()) || 
                 !fileName.equals(request.getAdminFilePath())) {
                 response.sendError(HttpServletResponse.SC_FORBIDDEN, "파일 다운로드 권한이 없습니다.");
                 return;
             }
             
             // 파일 존재 확인
             //File file = new File("src/main/webapp/uploads/request/" + fileName);
             File file = new File(uploadPath + "/request/" + fileName);
             if (!file.exists()) {
                 response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
                 return;
             }
             
             // 파일 다운로드 설정
             response.setContentType("application/octet-stream");
             response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
             response.setContentLength((int) file.length());
             
             // 파일 스트림으로 응답 전송
             try (FileInputStream fileIn = new FileInputStream(file);
                  java.io.OutputStream out = response.getOutputStream()) {
                 byte[] buffer = new byte[1024];
                 int length;
                 while ((length = fileIn.read(buffer)) > 0) {
                     out.write(buffer, 0, length);
                 }
             }
         } catch (Exception e) {
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "파일 다운로드 중 오류가 발생했습니다.");
         }
     }

     @PostMapping("/download-files")
    public void downloadFiles(@RequestParam List<Long> requestIds, 
                              HttpSession session, 
                              HttpServletResponse response) throws IOException {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
            return;
        }
        
        try {
            Member member = memberService.findByUsername(username);
            
            // 선택된 의뢰들의 관리자 파일 경로 가져오기
            List<String> filePaths = new ArrayList<>();
            for (Long requestId : requestIds) {
                Request request = requestService.getRequestById(requestId);
                if (request != null) {
                    if (request.getMember().getId().equals(member.getId()) && 
                    "작업 완료".equals(request.getStatus()) && request.getAdminFilePath() != null) {
                        // adminFilePath는 여러 파일 경로를 구분자로 연결된 형태일 수 있음
                        String adminFilePath = request.getAdminFilePath();
                        if (adminFilePath.contains(",")) {
                            // 여러 파일이 있는 경우 쉼표로 분리
                            String[] files = adminFilePath.split(",");
                            for (String file : files) {
                                if (file.trim().length() > 0) {
                                    filePaths.add(file.trim());
                                }
                            }
                        } else {
                            filePaths.add(adminFilePath);
                        }
                    }
                }
            }
            
            if (filePaths.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "다운로드할 관리자 파일이 없습니다. 작업이 완료되지 않았거나 관리자가 파일을 업로드하지 않았습니다.");
                return;
            }
            
            // ZIP 파일 생성
            String zipFileName = "download_" + System.currentTimeMillis() + ".zip";
            response.setContentType("application/zip");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + zipFileName + "\"");
            
            try (ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream())) {
                for (String filePath : filePaths) {
                    //File file = new File("src/main/webapp/uploads/request/" + filePath);
                	File file = new File(uploadPath + "/request/" + filePath);
                    if (file.exists()) {
                        ZipEntry zipEntry = new ZipEntry(filePath);
                        zipOut.putNextEntry(zipEntry);
                        
                        try (FileInputStream fileIn = new FileInputStream(file)) {
                            byte[] buffer = new byte[1024];
                            int length;
                            while ((length = fileIn.read(buffer)) > 0) {
                                zipOut.write(buffer, 0, length);
                            }
                        }
                        zipOut.closeEntry();
                    }
                }
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "파일 다운로드 중 오류가 발생했습니다.");
        }
    }
    
    /**
     * 의뢰에 댓글 작성
     */
    @PostMapping("/order-detail/{requestId}/reply")
    public String addReply(@PathVariable Long requestId, 
                          @RequestParam String content,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            if (member == null) {
                redirectAttributes.addFlashAttribute("error", "회원 정보를 찾을 수 없습니다.");
                return "redirect:/mypage/order-detail/" + requestId;
            }
            
            replyRequestService.createUserReply(requestId, member.getId(), content);
            redirectAttributes.addFlashAttribute("message", "댓글이 성공적으로 등록되었습니다.");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "댓글 등록 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/mypage/order-detail/" + requestId;
    }
    
    /**
     * 의뢰 댓글 삭제
     */
    @PostMapping("/order-detail/{requestId}/reply/{replyId}/delete")
    public String deleteReply(@PathVariable Long requestId,
                             @PathVariable Long replyId,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            // 댓글 작성자인지 확인
            ReplyRequest reply = replyRequestService.getRepliesByRequestId(requestId).stream()
                    .filter(r -> r.getId().equals(replyId))
                    .findFirst()
                    .orElse(null);
            
            if (reply == null) {
                redirectAttributes.addFlashAttribute("error", "댓글을 찾을 수 없습니다.");
                return "redirect:/mypage/order-detail/" + requestId;
            }
            
            Member member = memberService.findByUsername(username);
            if (member == null || !reply.getMemberId().equals(member.getId())) {
                redirectAttributes.addFlashAttribute("error", "댓글을 삭제할 권한이 없습니다.");
                return "redirect:/mypage/order-detail/" + requestId;
            }
            
            replyRequestService.deleteReply(replyId);
            redirectAttributes.addFlashAttribute("message", "댓글이 성공적으로 삭제되었습니다.");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "댓글 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/mypage/order-detail/" + requestId;
    }
}

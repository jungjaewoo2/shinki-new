package com.shinki.shinki.controller;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.ReplyRequest;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.RequestService;
import com.shinki.shinki.service.ReplyRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import com.shinki.shinki.entity.Request;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mypage")
public class MemberController {
    
    @Autowired
    private MemberService memberService;

    @Autowired
    private RequestService requestService;

    @Autowired
    private ReplyRequestService replyRequestService;
    
    @GetMapping("/profile")
    public String profilePage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("member", member);
            return "mypage/profile";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/register")
    public String registerMember(@Valid @ModelAttribute Member member, 
                                @RequestParam String confirmPassword,
                                RedirectAttributes redirectAttributes) {
        try {
            // 비밀번호 확인
            if (!member.getPassword().equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/join";
            }
            
            memberService.registerMember(member);
            redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다.");
            return "redirect:/mypage/login";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/mypage/join";
        }
    }
    
    @PostMapping("/find-id")
    public String findId(@RequestParam String name,
                        @RequestParam String email,
                        RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByNameAndEmail(name, email);
            if (member != null) {
                // 탈퇴회원(status = 'N')인 경우 정보 없음 처리
                if ("N".equals(member.getStatus())) {
                    redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
                } else {
                    redirectAttributes.addFlashAttribute("message", "아이디는 " + member.getUsername() + " 입니다.");
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
            }
            return "redirect:/mypage/find-id";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "아이디 찾기 중 오류가 발생했습니다.");
            return "redirect:/mypage/find-id";
        }
    }
    
    @PostMapping("/find-psw")
    public String findPassword(@RequestParam String username,
                              @RequestParam String name,
                              @RequestParam String email,
                              RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByUsername(username);
            if (member != null && member.getName().equals(name) && member.getEmail().equals(email)) {
                // 탈퇴회원(status = 'N')인 경우 정보 없음 처리
                if ("N".equals(member.getStatus())) {
                    redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
                } else {
                    redirectAttributes.addFlashAttribute("message", "비밀번호는 " + member.getPassword() + " 입니다.");
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
            }   
            return "redirect:/mypage/find-psw";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "비밀번호 찾기 중 오류가 발생했습니다.");
            return "redirect:/mypage/find-psw";
        }
    }
    
    @GetMapping("/login")
    public String loginPage() {
        return "mypage/login";
    }
    
    @GetMapping("/find-id")
    public String findIdPage() {
        return "mypage/find-id";
    }
    
    @GetMapping("/find-psw")
    public String findPasswordPage() {
        return "mypage/find-psw";
    }
    
    @GetMapping("/join")
    public String joinPage() {
        return "mypage/join";
    }
    
    @PostMapping("/login")
    public String login(@RequestParam String username, 
                       @RequestParam String password,
                       HttpSession session,
                       RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByUsername(username);
            if (member != null && member.getPassword().equals(password)) {
                // 탈퇴회원(status = 'N')인 경우 로그인 차단
                if ("N".equals(member.getStatus())) {
                    redirectAttributes.addFlashAttribute("error", "탈퇴된 회원입니다. 관리자에게 문의하세요.");
                    return "redirect:/mypage/login";
                }
                
                // 방문횟수 증가
                member.setVisitNum(member.getVisitNum() + 1);
                memberService.updateMember(member);
                
                // 세션에 로그인 정보 저장
                session.setAttribute("username", username);
                session.setAttribute("memberId", member.getId());
                redirectAttributes.addFlashAttribute("message", "로그인되었습니다.");
                return "redirect:/mypage/profile";
            } else {
                redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/update")
    public String updateMember(@ModelAttribute Member member,
                              @RequestParam(required = false) String newPassword,
                              @RequestParam(required = false) String confirmPassword,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            Member existingMember = memberService.findByUsername(username);
            
            // 비밀번호 변경 처리
            if (newPassword != null && !newPassword.isEmpty()) {
                if (!newPassword.equals(confirmPassword)) {
                    redirectAttributes.addFlashAttribute("error", "새 비밀번호가 일치하지 않습니다.");
                    return "redirect:/mypage/profile";
                }
                existingMember.setPassword(newPassword);
            }
            
            // 다른 필드들 업데이트
            existingMember.setHospitalName(member.getHospitalName());
            existingMember.setDepartment(member.getDepartment());
            existingMember.setName(member.getName());
            existingMember.setPhone(member.getPhone());
            existingMember.setEmail(member.getEmail());
            existingMember.setRecommendedEmployee(member.getRecommendedEmployee());
            existingMember.setRecommendCode(member.getRecommendCode());
            
            memberService.updateMember(existingMember);
            redirectAttributes.addFlashAttribute("message", "정보가 성공적으로 수정되었습니다.");
            return "redirect:/mypage/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "정보 수정 중 오류가 발생했습니다.");
            return "redirect:/mypage/profile";
        }
    }
    
    @GetMapping("/withdrawal")
    public String withdrawalPage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("member", member);
            return "mypage/withdrawal";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/check-password")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> checkPassword(@RequestParam String password,
                                                            HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return ResponseEntity.ok(response);
            }
            
            Member member = memberService.findByUsername(username);
            if (member.getPassword().equals(password)) {
                response.put("success", true);
                response.put("message", "비밀번호가 일치합니다.");
            } else {
                response.put("success", false);
                response.put("message", "비밀번호가 일치하지 않습니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "오류가 발생했습니다.");
        }
        
        return ResponseEntity.ok(response);
    }
    
    @PostMapping("/withdrawal")
    public String withdrawal(@RequestParam String password,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            Member member = memberService.findByUsername(username);
            if (member.getPassword().equals(password)) {
                // 회원 탈퇴 처리 (status를 'N'으로 변경)
                member.setStatus("N");
                memberService.updateMember(member);
                session.invalidate();
                redirectAttributes.addFlashAttribute("message", "회원탈퇴가 정상적으로 이루어졌습니다.");
                return "redirect:/mypage/login";
            } else {
                redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/withdrawal";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "탈퇴 처리 중 오류가 발생했습니다.");
            return "redirect:/mypage/withdrawal";
        }
    }
    
    @GetMapping("/logout")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> logout(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            session.invalidate();
            response.put("success", true);
            response.put("message", "로그아웃 되었습니다");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "로그아웃 중 오류가 발생했습니다");
            return ResponseEntity.ok(response);
        }
    }
    
    @GetMapping("/downloads")
    public String downloadsPage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            List<Request> completedRequests = requestService.getRequestsByMemberId(member.getId());
            // '작업 완료' 상태의 의뢰만 필터링
            completedRequests = completedRequests.stream()
                .filter(r -> "작업 완료".equals(r.getStatus()))
                .collect(Collectors.toList());
            
            // 날짜별, application_type별로 그룹화
            Map<String, List<Request>> groupedRequests = completedRequests.stream()
                .collect(Collectors.groupingBy(request -> {
                    String date = request.getCreatedAt().getYear() + "." + 
                                String.format("%02d", request.getCreatedAt().getMonthValue()) + "." + 
                                String.format("%02d", request.getCreatedAt().getDayOfMonth());
                    return date + "_" + request.getApplicationType();
                }));
            
            model.addAttribute("member", member);
            model.addAttribute("groupedRequests", groupedRequests);
            return "mypage/downloads";
        } catch (Exception e) {
            model.addAttribute("groupedRequests", new HashMap<>());
            return "mypage/downloads";
        }
    }

    @GetMapping("/download-file/{requestId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable Long requestId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        try {
            // 요청 정보 조회
            Request request = requestService.getRequestById(requestId);
            if (request == null || !request.getMember().getUsername().equals(username)) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일 경로 확인
            String filePath = request.getFilePath();
            if (filePath == null || filePath.trim().isEmpty()) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일 경로 구성 - uploads/request 폴더 기준
            String fullPath;
            if (filePath.startsWith("uploads/request/")) {
                // 이미 전체 경로가 포함된 경우
                fullPath = "src/main/webapp/" + filePath;
            } else {
                // 파일명만 있는 경우
                fullPath = "src/main/webapp/uploads/request/" + filePath;
            }

            // 파일 존재 확인
            java.io.File file = new java.io.File(fullPath);
            if (!file.exists() || !file.isFile()) {
                System.out.println("파일을 찾을 수 없습니다: " + fullPath);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일 리소스 생성
            Resource resource = new org.springframework.core.io.FileSystemResource(file);
            
            // 파일명 추출 (경로에서 마지막 부분)
            String fileName = file.getName();
            
            // Content-Disposition 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"");
            headers.add(HttpHeaders.CONTENT_TYPE, "application/octet-stream");
            
            System.out.println("파일 다운로드 성공: " + fullPath);
            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .body(resource);
                    
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/download-admin-file/{requestId}")
    public ResponseEntity<Resource> downloadAdminFile(@PathVariable Long requestId, 
                                                     @RequestParam String fileName, 
                                                     HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        try {
            // 요청 정보 조회 및 권한 확인
            Request request = requestService.getRequestById(requestId);
            if (request == null || !request.getMember().getUsername().equals(username)) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 작업 완료 상태인지 확인
            if (!"작업 완료".equals(request.getStatus())) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
            }

            // admin_file_path에 해당 파일이 있는지 확인
            String adminFilePath = request.getAdminFilePath();
            if (adminFilePath == null || adminFilePath.trim().isEmpty()) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일명이 admin_file_path에 포함되어 있는지 확인
            String[] adminFiles = adminFilePath.split("\\|");
            boolean fileExists = false;
            for (String adminFile : adminFiles) {
                if (adminFile.trim().equals(fileName.trim())) {
                    fileExists = true;
                    break;
                }
            }

            if (!fileExists) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일 경로 구성 - uploads/request 폴더 기준
            String webappPath = System.getProperty("user.dir") + "/src/main/webapp";
            java.nio.file.Path filePath = java.nio.file.Paths.get(webappPath + "/uploads/request/" + fileName.trim());

            // 파일 존재 확인
            if (!java.nio.file.Files.exists(filePath)) {
                System.out.println("파일을 찾을 수 없습니다: " + filePath.toString());
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            // 파일 리소스 생성
            Resource resource = new org.springframework.core.io.UrlResource(filePath.toUri());
            
            if (resource.exists() && resource.isReadable()) {
                // 원본 파일명 복원 (타임스탬프 제거)
                String originalFileName = fileName;
                if (fileName.contains("_")) {
                    originalFileName = fileName.substring(fileName.indexOf("_") + 1);
                }
                
                // 파일명에 특수문자가 있으면 URL 인코딩
                String encodedFileName = java.net.URLEncoder.encode(originalFileName, "UTF-8");
                
                System.out.println("사용자 관리자 파일 다운로드 성공: " + filePath.toString());
                
                return ResponseEntity.ok()
                        .contentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/cancelled-orders")
    public String cancelledOrdersPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            List<Request> cancelledRequests = requestService.getCancelledRequestsByMemberId(member.getId());
            model.addAttribute("member", member);
            model.addAttribute("cancelledRequests", cancelledRequests);
            return "mypage/cancelled-orders";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }

    @GetMapping("/cancelled-detail/{requestId}")
    public String cancelledDetailPage(@PathVariable Long requestId, HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            Request request = requestService.getRequestById(requestId);
            
            // 요청이 존재하고, 해당 사용자의 요청이며, 취소된 상태인지 확인
            if (request == null || !request.getMember().getId().equals(member.getId()) || 
                (!"취소 진행중".equals(request.getStatus()) && !"취소 완료".equals(request.getStatus()))) {
                return "redirect:/mypage/cancelled-orders";
            }
            
            // 댓글/답글 정보 가져오기 (기존 order-detail과 동일한 로직)
            List<ReplyRequest> userComments = replyRequestService.getUserCommentsByRequestId(requestId);
            
            // 각 사용자 댓글의 답글들을 조회하여 설정
            for (ReplyRequest comment : userComments) {
                List<ReplyRequest> replies = replyRequestService.getRepliesByParentId(comment.getId());
                comment.setReplies(replies);
            }
            
            model.addAttribute("member", member);
            model.addAttribute("request", request);
            model.addAttribute("userComments", userComments);
            return "mypage/cancelled-detail";
        } catch (Exception e) {
            return "redirect:/mypage/cancelled-orders";
        }
    }
}

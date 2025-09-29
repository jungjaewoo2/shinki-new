package com.shinki.shinki.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        
        // 세션에서 관리자 로그인 상태 확인
        Boolean isAdminLoggedIn = (Boolean) session.getAttribute("isAdminLoggedIn");
        
        if (isAdminLoggedIn == null || !isAdminLoggedIn) {
            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("/admin/login");
            return false;
        }
        
        return true;
    }
}

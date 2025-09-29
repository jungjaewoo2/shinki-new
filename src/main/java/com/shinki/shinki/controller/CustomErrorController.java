package com.shinki.shinki.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {
    
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                model.addAttribute("status", "404");
                model.addAttribute("timestamp", java.time.LocalDateTime.now());
                return "error";
            } else if (statusCode == HttpStatus.METHOD_NOT_ALLOWED.value()) {
                model.addAttribute("status", "405");
                model.addAttribute("timestamp", java.time.LocalDateTime.now());
                return "error";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                model.addAttribute("status", "500");
                model.addAttribute("timestamp", java.time.LocalDateTime.now());
                return "error";
            }
        }
        
        model.addAttribute("status", "Unknown");
        model.addAttribute("timestamp", java.time.LocalDateTime.now());
        return "error";
    }
}

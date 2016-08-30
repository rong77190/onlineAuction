//package com.auction.interceptor;
//
//import com.auction.model.User;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * Created by xiechur
// */
//public class LoginInterceptor implements HandlerInterceptor {
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
////        String requestUri = request.getRequestURI();
////        String contextPath = request.getContextPath();
////        String url = requestUri.substring(contextPath.length());
////        if ("/login/login".equals(url)) {
////            return true;
////        } else {
////            User user = (User) request.getSession().getAttribute("user");
////            if (user == null) {
////                request.getRequestDispatcher("/index.jsp").forward(request, response);
////                return false;
////            } else
////                return true;
////        }
//
//        HttpSession session = request.getSession();
//        User user = (User)session.getAttribute("user");
//        if (user == null){
//            response.sendRedirect("/login.jsp");
//        }
//        return true;
//    }
//
//
//    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//
//    }
//
//    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
//
//    }
//}

package com.bolo.interceptors;

import com.alibaba.fastjson.JSONObject;
import com.bolo.entitys.JSONResponse;
import com.bolo.utils.JWTUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * token拦截器
 */
public class TokenInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("TokenInterceptor...");
        String headerToken = request.getHeader("token");
        String url = request.getRequestURI();
        System.out.println("url:" + url );
        if (url.contains("admin")){
            System.out.println("是admin页面。。。。");
            if (headerToken != null && JWTUtil.verify(headerToken)==1){
                return true;
            }
            responseMessage(response,response.getWriter());
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    //请求不通过，返回错误信息给客户端
    private void responseMessage(HttpServletResponse response, PrintWriter out) {

        response.setContentType("application/json; charset=utf-8");
        String json = JSONObject.toJSONString(JSONResponse.error(-1,"token验证失败"));
        out.print(json);
        out.flush();
        out.close();
    }
}

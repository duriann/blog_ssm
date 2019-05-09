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
        System.out.println("TokenInterceptor..." + request.getRequestURI());
        String headerToken = request.getHeader("token");
        String url = request.getRequestURI();
        System.out.println("url:" + url);
        int code = JWTUtil.verify(headerToken);
        if (headerToken != null && code == 1) {
            return true;
        }
        responseMessage(response, code, response.getWriter());
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    //请求不通过，返回错误信息给客户端
    private void responseMessage(HttpServletResponse response, int code, PrintWriter out) {
        String errMsg = "token验证失败QAQ";
        if(code == 2){
            errMsg = "token过期,请重新登录QAQ";
        }
        response.setContentType("application/json; charset=utf-8");
        String json = JSONObject.toJSONString(JSONResponse.error(code, errMsg));
        out.print(json);
        out.flush();
        out.close();
    }
}

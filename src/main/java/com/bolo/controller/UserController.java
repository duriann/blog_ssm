package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.UserService;
import com.bolo.utils.Constants;
import com.bolo.utils.RSAUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 获取所有user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/listAll",method = RequestMethod.GET )
    public JSONResponse listAll(){
        List<User> users = userService.listAll();
        System.out.println(users);
        return JSONResponse.success(users);
    }

    /**
     * 分页获取user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/listByPage",method = RequestMethod.GET )
    public JSONResponse listByPage(String keyword, int currPage, int pageSize){
        Page<User> users = userService.listByPage(keyword,currPage,pageSize);
        return JSONResponse.success(users);
    }

    /**
     * 登录
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public JSONResponse login(HttpServletRequest request, @RequestBody String param){
        Map umap = (Map) JSON.parse(param);
        String username = (String)umap.get("username");
        String rsaPwd = (String) umap.get("password");
        String realPwd = RSAUtils.decryptBase64(rsaPwd);
        String md5Pwd = DigestUtils.md5Hex(realPwd+ Constants.MD5_SALT);
        System.out.println("md5pwd: "+md5Pwd);

        User user = userService.login(username, md5Pwd);
        if (user !=null){
            System.out.println(user);
            request.getSession().setAttribute(user.getUid(),user);
            return JSONResponse.success(user,"登录成功");
        }
        return JSONResponse.error("用户名或者密码错误!");
    }

    /**
     * 获取rsa公钥
     * @return
     */
    @RequestMapping(value = "/getPublicKey", method = RequestMethod.GET)
    @ResponseBody
    public String getKey(){
        String publicKey = RSAUtils.generateBase64PublicKey();
        return publicKey;
    }

    /**
     * 退出
     * @return json
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public JSONResponse logout(HttpServletRequest request, String uid){
        System.out.println("uid:" + uid);
        User user = (User) request.getSession().getAttribute(uid);
        if (user!=null){
            request.getSession().removeAttribute(uid);
            return JSONResponse.success(null,"退出成功");
        }
        return JSONResponse.error("推出失败");
    }
}

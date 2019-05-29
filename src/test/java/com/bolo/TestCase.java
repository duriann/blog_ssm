package com.bolo;


import com.bolo.utils.Constants;
import com.bolo.utils.JWTUtil;
import com.bolo.utils.RSAUtils;
import com.bolo.utils.Utils;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 测试
 *
 * @author pineapple
 **/
public class TestCase {

    @Test
    public void testDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String time = sdf.format(System.currentTimeMillis());
        System.out.println(time);
    }

    @Test
    public void testMd5() {
        String md5Name = DigestUtils.md5Hex("test");
        //123456是盐
        String md5Pwd = DigestUtils.md5Hex("test" + Constants.MD5_SALT);
        System.out.println("md5Name = " + md5Name);
        System.out.println("md5Pwd = " + md5Pwd);
    }

    @Test
    public void testRsa() throws Exception {
        String publicKey = RSAUtils.generateBase64PublicKey();
        System.out.println(publicKey);
    }

    @Test
    public void testUid(){
        System.out.println(Utils.getUid());
    }

    @Test
    public void testJWT(){
//        System.out.println(JWTUtil.generToken("123","bl","test"));
        System.out.println(JWTUtil.verify("eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMjMiLCJpYXQiOjE1NTcxMjY2NjIsInN1YiI6InRlc3QiLCJpc3MiOiJibCIsImV4cCI6MTU1NzEyODQ2Mn0.oLhVgJXRTGPBLFfjW6qUb1XI6JSXa-nvg8cTp0WoOc8")
        );
    }
}

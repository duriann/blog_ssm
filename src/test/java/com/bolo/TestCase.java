package com.bolo;


import com.bolo.utils.Constants;
import com.bolo.utils.RSAUtils;
import com.bolo.utils.Utils;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;


/**
 * 测试
 *
 * @author pineapple
 **/
public class TestCase {
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
}

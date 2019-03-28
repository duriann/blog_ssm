package com.bolo;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;


/**
 * 测试
 *
 * @author pineapple
 **/
public class TestCase {
    @Test
    public void testMd5(){
        String md5Name = DigestUtils.md5Hex("admin");
        //123456是盐
        String md5Pwd = DigestUtils.md5Hex("bolo"+"admin");
        System.out.println("md5Name = " + md5Name);
        System.out.println("md5Pwd = " + md5Pwd);
    }
}

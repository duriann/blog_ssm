package com.bolo.utils;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils {


    /**
     * 获取用户uid
     * @return uid
     */
    public static String getUid(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    /**
     * 根据html的src 属性提取出url
     * @param htmlStr
     * @return
     */
    public static List<String> getImgSrc(String htmlStr) {

        if( htmlStr == null ){

            return null;
        }

        String img = "";

        List<String> pics = new ArrayList<>();

        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
        Pattern p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        Matcher m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            img = img + "," + m_image.group();
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);

            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;
    }

	public static void main(String[] args) {

//		String str = "<p><img src=\"http://localhost:8080//statics/images/WX20190320-125533@2x.png\" style=\"\" width=\"569\"></p><p>dadsadas</p>";
//
//		System.out.println( getImgSrc(str).get(0) );
        System.out.println(getUid().replaceAll("-",""));
	}


}

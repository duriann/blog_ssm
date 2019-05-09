package com.bolo.entitys;

public class JSONResponse {
    private int code;//0 成功 1失败 -1 没有权限 -2 token验证失败
    private String msg;
    private Object data;


    public static JSONResponse success(Object data) {
        JSONResponse response = new JSONResponse();
        response.setCode(0);
        response.setData(data);
        response.setMsg("success!");
        return response;
    }
    public static JSONResponse success(Object data,String msg) {
        JSONResponse response = new JSONResponse();
        response.setCode(0);
        response.setData(data);
        response.setMsg(msg);
        return response;
    }
    public static JSONResponse error(String msg) {
        JSONResponse response = new JSONResponse();
        response.setCode(1);
        response.setMsg(msg);
        return response;
    }
    public static JSONResponse error(int code,String msg) {
        JSONResponse response = new JSONResponse();
        response.setCode(code);
        response.setMsg(msg);
        return response;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }



}

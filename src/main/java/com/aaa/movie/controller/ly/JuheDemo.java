package com.aaa.movie.controller.ly;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
 



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
/**
*影讯API合集调用示例代码 － 聚合数据
*在线接口文档：http://www.juhe.cn/docs/42
**/
 @Controller
 @RequestMapping("testmovie")
public class JuheDemo {
    public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 30000;
    public static final int DEF_READ_TIMEOUT = 30000;
    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
 
    //配置您申请的KEY
    public static final String APPKEY ="b5e1e4d47bef337ec99e021bc491a59c";
 
    //1.按关键字检索影片信息
  @RequestMapping("test")
  @ResponseBody()
    public Object getRequest1() throws Exception{
        String result =null;
        String url ="http://v.juhe.cn/movie/index";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("title","红海行动");//需要检索的影片标题,utf8编码的urlencode
            params.put("smode","");//<font color=red>是否精确查找，精确:1 模糊:0  默认1</font>
            params.put("pagesize","");//<font color=red>每次返回条数，默认20,最大50</font>
            params.put("offset","");//<font color=red>偏移量，默认0,最大760</font>
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        	
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                return object.get("result");
            }else{
            	//return object.get("error_code")+":"+object.get("reason");
            	return null;
            }
       
    }
 
    //2.检索周边影院
    public static void getRequest2(){
        String result =null;
        String url ="http://v.juhe.cn/movie/cinemas.local";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("lat","");//纬度，百度地图坐标系
            params.put("lon","");//经度，百度地图坐标系
            params.put("radius","");//检索半径(米)，最大3000
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //3.关键字影院检索
    public static void getRequest3(){
        String result =null;
        String url ="http://v.juhe.cn/movie/cinemas.search";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("cityid","");//城市ID
            params.put("keyword","");//关键字，urlencode utf8
            params.put("page","");//页数，默认1
            params.put("pagesize","");//每页返回条数，默认20
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //4.影院上映影片信息
    public static void getRequest4(){
        String result =null;
        String url ="http://v.juhe.cn/movie/cinemas.movies";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("cinemaid","");//影院ID
            params.put("movieid","");//指定电影ID，默认全部电影
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //5.今日放映影片
    public static void getRequest5(){
        String result =null;
        String url ="http://v.juhe.cn/movie/movies.today";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("cityid","");//城市ID
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //6.支持城市列表
    public static void getRequest6(){
        String result =null;
        String url ="http://v.juhe.cn/movie/citys";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //7.影片上映影院查询
    public static void getRequest7(){
        String result =null;
        String url ="http://v.juhe.cn/movie/movies.cinemas";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("cityid","");//城市ID
            params.put("movieid","");//影片ID
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //8.按影片ID检索影片信息
    public static void getRequest8(){
        String result =null;
        String url ="http://v.juhe.cn/movie/query";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("movieid","");//需要检索的影片id
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","");//返回数据的格式,xml/json，默认json
  
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
 
 
    public static void main(String[] args) {
 
    }
 
    /**
     *
     * @param strUrl 请求地址
     * @param params 请求参数
     * @param method 请求方法
     * @return  网络请求字符串
     * @throws Exception
     */
    public static String net(String strUrl, Map params,String method) throws Exception {
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        String rs = null;
        try {
            StringBuffer sb = new StringBuffer();
            if(method==null || method.equals("GET")){
                strUrl = strUrl+"?"+urlencode(params);
            }
            URL url = new URL(strUrl);
            conn = (HttpURLConnection) url.openConnection();
            if(method==null || method.equals("GET")){
                conn.setRequestMethod("GET");
            }else{
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
            }
            conn.setRequestProperty("User-agent", userAgent);
            conn.setUseCaches(false);
            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
            conn.setReadTimeout(DEF_READ_TIMEOUT);
            conn.setInstanceFollowRedirects(false);
            conn.connect();
            if (params!= null && method.equals("POST")) {
                try {
                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                        out.writeBytes(urlencode(params));
                } catch (Exception e) {
                    // TODO: handle exception
                }
            }
            InputStream is = conn.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sb.append(strRead);
            }
            rs = sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
            if (conn != null) {
                conn.disconnect();
            }
        }
        return rs;
    }
 
    //将map型转为请求参数型
    public static String urlencode(Map<String,Object>data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}

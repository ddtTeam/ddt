/*
 * @(#)BroadcastTool.java 2014-7-24
 *
 * Copyright 2014 ddt, Inc. All rights reserved.
 */
package com.ddt.core.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import com.ddt.core.utils.EncryptUtils;
import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;

/**
 * BroadcastTool.java
 *
 * @author     <A HREF="mailto:ruan635@163.com">Roy</A>
 * @version    1.0 2014-7-24
 * @since      1.0
 */
@Component
public class BroadcastTool {
	
	private static boolean isLogin;
	
	private static String token;
	
	private static String cookiestr;
	
	@SuppressWarnings("unchecked")
	public static void login() {
		HttpClient httpClient = new DefaultHttpClient();
		
		List<NameValuePair> parameters = new ArrayList<>();
		NameValuePair username = new BasicNameValuePair("username", "tangy@cjlu.edu.cn");
		NameValuePair password = new BasicNameValuePair("pwd", EncryptUtils.encrypt("quantang", "MD5"));
		NameValuePair imgcode = new BasicNameValuePair("imgcode", "");
		NameValuePair format = new BasicNameValuePair("f", "json");
		parameters.add(username);
		parameters.add(password);
		parameters.add(imgcode);
		parameters.add(format);
		
	    HttpPost post = new HttpPost("https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN");  
	    
	    try {  
	    	post.setEntity(new UrlEncodedFormEntity(parameters));
		    post.addHeader("Host", "mp.weixin.qq.com");  
		    post.addHeader("Referer", "https://mp.weixin.qq.com/"); 
		    
	        HttpResponse response = httpClient.execute(post);
	        StatusLine sl = response.getStatusLine();
	        if (HttpStatus.SC_OK == sl.getStatusCode()) {  
	            String res = EntityUtils.toString(response.getEntity());
	            Gson gson = new Gson();
	            Map<String, Object> returnJson = gson.fromJson(res, Map.class);
	            String msg = (String) returnJson.get("redirect_url");  
	            double errCode = (Double) ((LinkedTreeMap) returnJson.get("base_resp")).get("ret");  
	            if (0 == errCode) {  
	                isLogin = true; 
	                token = StringUtils.substringAfter(msg, "token=");  
	                if (StringUtils.isBlank(token)) {  
	                    token = StringUtils.substringBetween(msg, "token=", "&");  
	                }
	                StringBuffer cookie = new StringBuffer();  
	                for (Header c : response.getAllHeaders()) {
	                	if ("Set-Cookie".equalsIgnoreCase(c.getName())) {
	                		cookie.append(c.getName()).append("=").append(c.getValue()).append(";");
	                	}
	                }  
	                cookiestr = cookie.toString();  
	            }  
	        }  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }  
	}
	
	public static void main(String[] args) {
		login();
		System.out.println(token);
		System.out.println(cookiestr);
	}
}

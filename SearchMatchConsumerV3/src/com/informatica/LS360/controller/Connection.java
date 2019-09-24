package com.informatica.LS360.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;

public class Connection {
	static HttpEntity e;
	static HttpResponse response;
	static String str="";
	public String getConnection() {
		
		HttpClient httpClient=HttpClientBuilder.create().build();
		HttpPost httpPost=new HttpPost("http://sa-dbimdmhuv01.zsservices.local:5050/e360/com.informatica.tools.mdm.web.auth/login");
		JSONObject json = new JSONObject();
		json.put("user", "admin");
		json.put("password", "@dm!n");
		try {
			e = new StringEntity(json.toString());
		} catch (UnsupportedEncodingException e1) {
			
			e1.printStackTrace();
		}
		httpPost.setEntity(e);
		
		try {
			response = httpClient.execute(httpPost);
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
		if (response.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + response.getStatusLine().getStatusCode());
		}
		Header[] headers= response.getHeaders("Set-Cookie");
		for (int i = 0; i < headers.length; i++) {
	        System.out.println(headers[i]);
	        str=new String(headers[i].getValue());
	    }
		return str;
	}
	
}

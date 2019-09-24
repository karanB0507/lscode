package com.informatica.LS360.controller;

import javax.ws.rs.core.HttpHeaders;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

public class AddRecord {
	public String sendRequest(String body)  {
		try {
		String cookieStr=null;
		Connection con=new Connection();
		cookieStr=con.getConnection();
		HttpClient client=HttpClientBuilder.create().build();
		String url="http://sa-dbimdmhuv01.zsservices.local:8080/cmx/cs/oradev-CMX_DEV/CustomerPerson?systemName=Adhoc%20Source";
		System.out.println(url);
		HttpPost post =new HttpPost(url);
		System.out.println(body);
		
		
		HttpEntity e = new StringEntity(body);
		post.setEntity(e);
		post.setHeader(HttpHeaders.CONTENT_TYPE,"application/json");
		post.setHeader(HttpHeaders.ACCEPT,"application/json");
		post.setHeader("Cookie", cookieStr);
		System.out.println(e.toString());
		HttpResponse response=null;
		response = client.execute(post);
		HttpEntity entity= response.getEntity();
		return EntityUtils.toString(entity);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

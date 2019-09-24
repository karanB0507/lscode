package com.informatica.LS360.restClient;

import java.net.URI;

import javax.ws.rs.core.HttpHeaders;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import com.informatica.LS360.controller.Connection;


public class RequestHandler {
	
	public String sendRequest(String frstNm,String mdlNm,String lstNm,String matchRuleSetName)  {
		String cookieStr=null;
		Connection con=new Connection();
	cookieStr=con.getConnection();
		System.out.println(cookieStr);
		HttpClient client=HttpClientBuilder.create().build();
		if(matchRuleSetName.contains(" ")) {
			matchRuleSetName=matchRuleSetName.replace(" ", "%20");
			System.out.println(matchRuleSetName);
		}
		System.out.println(matchRuleSetName);
		String url="http://sa-dbimdmhuv01.zsservices.local:5050/cmx/cs/oradev-CMX_C360/CustomerPerson?action=match&fuzzyFilter=fullNm="+frstNm+"%20"+mdlNm+"%20"+lstNm+"%2CfrstNm="+frstNm+"%2ClstNm="+lstNm+"&matchRuleSet="+matchRuleSetName+"&depth=8";
		if(mdlNm.isEmpty()) {
			url="http://sa-dbimdmhuv01.zsservices.local:5050/cmx/cs/oradev-CMX_C360/CustomerPerson?action=match&fuzzyFilter=fullNm="+frstNm+"%20"+lstNm+"%2CfrstNm="+frstNm+"%2ClstNm="+lstNm+"&matchRuleSet="+matchRuleSetName+"&depth=8";
				
		}
		

		URI uri;
		try {
			uri = new URI(url);
			System.out.println(uri);
			HttpGet post =new HttpGet(uri);
			post.setHeader(HttpHeaders.CONTENT_TYPE,"application/json");
			post.setHeader(HttpHeaders.ACCEPT,"application/json");
			post.setHeader("Cookie", cookieStr);
			HttpResponse response=null;
			response = client.execute(post);
			HttpEntity entity= response.getEntity();
			return EntityUtils.toString(entity);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}

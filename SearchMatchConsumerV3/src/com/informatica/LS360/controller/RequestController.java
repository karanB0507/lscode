package com.informatica.LS360.controller;






import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.informatica.LS360.restClient.RequestHandler;

/**
 * Servlet implementation class RequestController
 */
@WebServlet("/RequestController")
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String frstNm=request.getParameter("frstNm");
		String lstNm=request.getParameter("lstNm");
		String mdlNm=request.getParameter("mdlNm");
		String matchRuleSetName="Adhoc Match HCP";/*request.getParameter("matchRuleSetName")*/ //hard code the match rule set here.
		
		System.err.println(frstNm+lstNm+matchRuleSetName);
		System.out.println(frstNm+lstNm+matchRuleSetName);
		RequestHandler requestHandler =new RequestHandler();
		response.getWriter().append(requestHandler.sendRequest(frstNm,mdlNm,lstNm,matchRuleSetName));
	}

}

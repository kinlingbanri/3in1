package com.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet(name = "MemServlet", urlPatterns = {"/MemServlet"})
public class MemServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//resp.setContentType("text/html;charset=UTF-8");
		//resp.setContentType("text/plain");
		resp.setContentType("application/json");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String DID = req.getParameter("DID");
		
		System.out.println("username : " + username);
		System.out.println("password : " + password );
		System.out.println("DID : " + DID );

		PrintWriter out = resp.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("state", "1");
		out.write(jsonObject.toString());
		out.flush();
		out.close();
	}

	
}

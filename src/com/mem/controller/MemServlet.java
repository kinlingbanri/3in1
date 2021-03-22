package com.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String DID = req.getParameter("DID");
		
		System.out.println("username : " + username);
		System.out.println("password : " + password );
		System.out.println("DID : " + DID );
		
		PrintWriter out = resp.getWriter();
		out.print("OK");
		out.flush();
		out.close();
		//out.close();
		//req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	
}

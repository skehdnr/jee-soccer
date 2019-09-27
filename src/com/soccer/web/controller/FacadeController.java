package com.soccer.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soccer.web.pool.Constants;

@WebServlet("/facade.do")
public class FacadeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	enum Resources{
		CTX , CSS , JS , IMG
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("퍼사드로들어옴");
	for(Resources r : Resources.values()) {
		System.out.println("퍼사드 컨트롤러"+r.toString().toLowerCase());
	request.getSession().setAttribute(r.toString().toLowerCase(),
			request.getContextPath()+((r.toString().toLowerCase().equals("ctx"))
					?"":
				"/resources/"+r.toString().toLowerCase()));
	}
	request.getRequestDispatcher(
			String.format(Constants.DOUBLE_PATH,
					request.getServletPath().substring(1,request.getServletPath().indexOf(".")),
					"login"))
	.forward(request, response);
	
	}
}


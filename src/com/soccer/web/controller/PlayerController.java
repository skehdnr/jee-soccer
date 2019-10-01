package com.soccer.web.controller;

import com.soccer.web.enums.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.soccer.web.command.Receiver;
import com.soccer.web.command.Sender;


@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("★★★ 1. 서블릿 들어옴 ★★★ ");
		System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
				request.getParameter("playerId"), 
				request.getParameter("solar"),
				request.getParameter("action"),
				request.getParameter("page")));
		
		Receiver.init(request);
		switch (Action.valueOf(request.getParameter("action").toUpperCase())){
		case CREATE : request.setAttribute("page","login");
			break;

		default:
			break;
		}
		Sender.forward(request, response);
	}
}
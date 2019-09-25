package com.soccer.web.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soccer.web.command.Command;
import com.soccer.web.command.Commander;
import com.soccer.web.command.Receiver;
import com.soccer.web.command.Sender;
import com.soccer.web.domain.PlayerBean;
import com.soccer.web.serviceimpl.PlayerServiceImpl;


@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Receiver.init(request);
		Receiver.cmd.execute();
		Sender.forward(request, response);
	}
}
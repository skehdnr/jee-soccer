package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

public class MoveCommand extends Command{
public MoveCommand(HttpServletRequest request) throws Exception {
	setRequest(request);
	setAction(request.getParameter("action")==null?
			"move":request.getParameter("action"));
	System.out.println("무브커맨드 1");
	execute();
}
@Override
	public void execute() {
		super.execute();
		request.setAttribute("page", request.getParameter("page"));
		System.out.println("무브커맨드 2");
	}
}

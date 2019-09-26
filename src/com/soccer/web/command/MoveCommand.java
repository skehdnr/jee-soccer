package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

public class MoveCommand extends Command{
public MoveCommand(HttpServletRequest request) throws Exception {
	super.setRequest(request);
	
	System.out.println("무브커맨드");
	System.out.println(String.format("request 값 출력 : %s,%s,%s,%s",request.getParameter("playerId"),request.getParameter("solar")
			,request.getParameter("action"),request.getParameter("page")));
	
	setDomain(request.getServletPath().substring(1,request.getServletPath().indexOf(".")));

	setAction(request.getParameter("action"));
	System.out.println("무브커맨드 1");
	execute();
}
@Override
	public void execute() {
		setPage(request.getParameter("page"));
		super.execute();
		System.out.println("무브커맨드 2");
	}
}

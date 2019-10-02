package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

public class SearchCommand extends Command{
public SearchCommand(HttpServletRequest request) {
	setRequest(request);
	setAction(action);
	setDomain(domain);
	super.execute();
	this.execute();
}
@Override
	public void execute() {
	setPage(request.getParameter("page"));
	System.out.println("서치커맨드");
	super.execute();
	}
}

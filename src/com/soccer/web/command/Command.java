package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.pool.Constants;

import lombok.Data;

@Data
public class Command implements Order{
	protected HttpServletRequest request;
	protected String action,domain,page,view;
	
	
	@Override
	public void execute() {
		setPage();
		this.view = String.format(Constants.PATH,page, action);
	}
	private void setPage() {
		page = request.getParameter("page");
	}
}

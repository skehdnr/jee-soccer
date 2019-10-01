package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.domain.PlayerBean;
import com.soccer.web.serviceimpl.PlayerServiceImpl;

public class CreateCommand extends Command{
public CreateCommand(HttpServletRequest request) {
	setRequest(request);
	setAction(action);
	setDomain(domain);
	super.execute();
	this.execute();
}
@Override
	public void execute() {
	PlayerBean param = new PlayerBean();
	param.setPlayerId(request.getParameter("playerId"));
	param.setSolar(request.getParameter("solar"));
	if(PlayerServiceImpl.getInstance().join(param)) {
		System.out.println("회원가입성공 !! ");
	}else {
		System.out.println("회원가입 실패 @@ ");
	}
	}
}

package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;
import com.soccer.web.enums.Action;;

public class Commander {
	public static Command direct(HttpServletRequest request) {
		System.out.println("★★★ 3. Commander.direct() 들어옴 ★★★ ");
		System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
				request.getParameter("playerId"), 
				request.getParameter("solar"),
				request.getParameter("action"),
				request.getParameter("page")));
		
		Command command = null;
		try {
		switch(Action.valueOf(request.getParameter("action").toUpperCase())) {
		case MOVE : 
				command = new MoveCommand(request);
				System.out.println("커맨더 무브");
		break;
		case LOGIN : 
			command = new LoginCommand(request); 
		break;
		case CREATE : command= new CreateCommand(request);
		break;
		case SEARCH :
		break;
		case UPDATE :
		break;
		case DELETE :
		break;
			
		default:
		break;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return command;
	}
}

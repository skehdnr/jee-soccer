package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;
import com.soccer.web.enums.Action;;

public class Commander {
	public static Command direct(HttpServletRequest request) {
		Command command = null;
		String action = request.getParameter("action").toUpperCase();
		try {
		switch(Action.valueOf(action)) {
		case MOVE : 
				command = new MoveCommand(request);
				System.out.println("커맨덜 무브");
		break;
		case SEARCH : 
			command = new SearchCommand(); 
		break;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return command;
		
	}
}

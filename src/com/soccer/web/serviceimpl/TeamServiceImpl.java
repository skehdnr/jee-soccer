package com.soccer.web.serviceimpl;

import com.soccer.web.service.TeamService;

public class TeamServiceImpl implements TeamService{
	private static TeamServiceImpl instance = new TeamServiceImpl();

	public static TeamServiceImpl getInstance() {
		return instance;
	}
	private TeamServiceImpl () {
		
	}
		
}

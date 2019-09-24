package com.soccer.web.daoimpl;

import com.soccer.web.dao.TeamDao;

public class TeamDaoImpl implements TeamDao{
	private static TeamDaoImpl instance = new TeamDaoImpl();

	public static TeamDaoImpl getInstance() {
		return instance;
	}
	
	private TeamDaoImpl () {
		
	}
	
}

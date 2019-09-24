package com.soccer.web.daoimpl;

import com.soccer.web.dao.StadiumDao;

public class StadiumDaoImpl implements StadiumDao{
	private static StadiumDaoImpl instance = new StadiumDaoImpl();

	public StadiumDaoImpl getInstance() {
		return instance;
	}
	private StadiumDaoImpl () {
		
	}
		
}

package com.soccer.web.daoimpl;

import com.soccer.web.dao.ScheduleDao;

public class ScheduleDaoImpl implements ScheduleDao{
	private static ScheduleDaoImpl instance =new ScheduleDaoImpl();

	public static ScheduleDaoImpl getInstance() {
		return instance;
	}
	private ScheduleDaoImpl() {
	}

}

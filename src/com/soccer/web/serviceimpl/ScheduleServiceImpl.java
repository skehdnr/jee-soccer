package com.soccer.web.serviceimpl;

import com.soccer.web.service.ScheduleService;

public class ScheduleServiceImpl implements ScheduleService{
	private ScheduleServiceImpl instance = new ScheduleServiceImpl();

	public ScheduleServiceImpl getInstance() {
		return instance;
	}
	private ScheduleServiceImpl () {
		
	}
		

}

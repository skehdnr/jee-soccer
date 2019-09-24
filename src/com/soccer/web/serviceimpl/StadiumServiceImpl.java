package com.soccer.web.serviceimpl;

import com.soccer.web.service.StadiumService;

public class StadiumServiceImpl implements StadiumService {
		
	private static StadiumServiceImpl instance = new StadiumServiceImpl();
	
	private StadiumServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public static StadiumServiceImpl getInstance() {
		return instance;
	}
	
	
}

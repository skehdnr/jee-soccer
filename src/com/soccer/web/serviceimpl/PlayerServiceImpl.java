package com.soccer.web.serviceimpl;

import java.util.List;

import com.soccer.web.dao.PlayerDao;
import com.soccer.web.daoimpl.PlayerDaoImpl;
import com.soccer.web.domain.PlayerBean;
import com.soccer.web.service.PlayerService;

import sun.security.jca.GetInstance;

public class PlayerServiceImpl implements PlayerService {
	private static PlayerServiceImpl instance = new PlayerServiceImpl();

	@Override
	public List<String> findPositions() {
		return PlayerDaoImpl.getInstance().selectPositions();
	}

	@Override
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlayerBean> findByTeamIdHeightName(PlayerBean param) {
		// TODO Auto-generated method stub
		return null;
	}

	public static PlayerServiceImpl getInstance() {
		return instance;
	}
	private PlayerServiceImpl () {
		
	}
}

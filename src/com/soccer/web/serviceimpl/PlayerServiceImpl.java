package com.soccer.web.serviceimpl;

import java.util.List;

import com.soccer.web.daoimpl.PlayerDaoImpl;
import com.soccer.web.domain.PlayerBean;
import com.soccer.web.service.PlayerService;


public class PlayerServiceImpl implements PlayerService {
	private static PlayerServiceImpl instance = new PlayerServiceImpl();

	@Override
	public boolean join(PlayerBean param) {
		return PlayerDaoImpl.getInstance().insertPlayer(param);
	}
	
	@Override
	public List<String> findPositions() {
		return PlayerDaoImpl.getInstance().selectPositions();
	}

	@Override
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param) {
		return PlayerDaoImpl.getInstance().selectByTeamIdPosition(param);
	}

	@Override
	public List<PlayerBean> findByTeamIdHeightName(PlayerBean param) {
		return null;
	}

	public static PlayerServiceImpl getInstance() {
		return instance;
	}
	@Override
	public PlayerBean login(PlayerBean param) {
		System.out.println("★★★ 6. PlayerServiceImpl 의 login() 으로 이동 ★★★ ");
		System.out.println(String.format("param 값 출력 : %s, %s ",
				param.getPlayerId(), 
				param.getSolar()));
		return PlayerDaoImpl.getInstance().selectByPlayerIdSolar(param);
	}

}

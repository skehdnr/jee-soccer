package com.soccer.web.dao;

import java.util.List;

import com.soccer.web.domain.PlayerBean;

public interface PlayerDao {
	/**SQL_TEST_002
    포지션 종류(중복제거,없으면 빈공간*/
	public List<String> selectPositions();
	public List<PlayerBean> selectByTeamIdPosition(PlayerBean param);
	public List<PlayerBean> selectByTeamIdHeightName(PlayerBean param);
	public PlayerBean selectByPlayerIdSolar(PlayerBean param); 
	//test
	public List<PlayerBean> selectByMany(PlayerBean param);
	
}

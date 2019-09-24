package com.soccer.web.service;

import java.util.List;

import com.soccer.web.domain.PlayerBean;

public interface PlayerService {
	
/**SQL_TEST_002
       포지션 종류(중복제거,없으면 빈공간*/
	public List<String> findPositions();
	//4.수원팀(ID: K02)골키퍼
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param);
	//5.팀아이디,키,선수이름
	public List<PlayerBean> findByTeamIdHeightName(PlayerBean param);
}

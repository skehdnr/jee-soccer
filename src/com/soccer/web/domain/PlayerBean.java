package com.soccer.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class PlayerBean  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String playername,playerId,teamId,ePlayerName,nickname,joinYYYY
				,position,backNo,nation,birthDate,solar,height,weghit;

	public void setAttribute(String string, PlayerBean player) {
		// TODO Auto-generated method stub
		
	}
	
}

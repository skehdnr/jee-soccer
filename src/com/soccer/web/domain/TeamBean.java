package com.soccer.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class TeamBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String teamId,stadiumId,regionName,teamName,eTeamName,
					origYYYY,stadiumID,zipCode1,zipCode2,address,ddd
					,tel,fax,homepage,owner;
}

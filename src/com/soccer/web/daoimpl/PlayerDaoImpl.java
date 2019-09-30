package com.soccer.web.daoimpl;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.Position;

import com.soccer.web.dao.PlayerDao;
import com.soccer.web.domain.PlayerBean;
import com.soccer.web.factory.DatabaseFactory;
import com.soccer.web.pool.Constants;

public class PlayerDaoImpl implements PlayerDao{
	private static PlayerDaoImpl instance = new PlayerDaoImpl();
	public static PlayerDaoImpl getInstance() {
		return instance;
	}
	@Override
	public PlayerBean selectByPlayerIdSolar(PlayerBean param) {
		PlayerBean player = null;
		String sql = "SELECT *\n" + 
				"FROM PLAYER \n" + 
				"WHERE PLAYER_ID LIKE ? \n" + 
				"AND SOLAR LIKE ?";
		try {
			System.out.println(Constants.VENDOR+"다오임플 밴더");
			PreparedStatement stmt = DatabaseFactory
					.createDatabase(Constants.VENDOR)
					.getConnection().prepareStatement(sql);
			stmt.setString(1, param.getPlayerId());
			stmt.setString(2, param.getSolar());
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				player = new PlayerBean();
				player.setBackNo(rs.getString("BACK_NO"));
				player.setBirthDate(rs.getString("BIRTH_DATE"));
				player.setEPlayerName(rs.getString("E_PLAYER_NAME"));
				player.setHeight(rs.getString("HEIGHT"));
				player.setJoinYYYY(rs.getString("JOIN_YYYY"));
				player.setNation(rs.getString("NATION"));
				player.setNickname(rs.getString("NICKNAME"));
				player.setPlayerId(rs.getString("PLAYER_ID"));
				player.setPlayername(rs.getString("PLAYER_NAME"));
				player.setPosition(rs.getString("POSITION"));
				player.setSolar(rs.getString("SOLAR"));
				player.setTeamId(rs.getString("TEAM_ID"));
				player.setWeight(rs.getString("WEIGHT"));
			
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return player ;
	}
	
	@Override
	public List<String> selectPositions() {
		List<String> positions = new ArrayList<>();
		try {
			String sql = "SELECT DISTINCT POSITION position \n"+"FROM PLAYER";
			ResultSet rs = DatabaseFactory.createDatabase(Constants.VENDOR).getConnection().
					prepareStatement(sql).executeQuery();
			while(rs.next()) {
				positions.add(rs.getString("position"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return positions;
	}

	@Override
	public List<PlayerBean> selectByTeamIdPosition(PlayerBean param) {
		List<PlayerBean> list = new ArrayList<PlayerBean>();
		return list;
	}

	@Override
	public List<PlayerBean> selectByTeamIdHeightName(PlayerBean param) {
		List<PlayerBean> list = new ArrayList<PlayerBean>();
		return list;
	}
	
	@Override
	public List<PlayerBean> selectByMany(PlayerBean param) {
		List<PlayerBean> list = new ArrayList<>();
		String sql = "? ? ? ";
		try {
			PreparedStatement stmt = DatabaseFactory.createDatabase(Constants.VENDOR).getConnection().prepareStatement(sql);
			stmt.setString(1, param.getPlayerId());
			stmt.setString(2, param.getBackNo());
			stmt.setString(3, param.getEPlayerName());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

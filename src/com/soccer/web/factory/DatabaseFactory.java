package com.soccer.web.factory;

import com.soccer.web.pool.Constants;

public class DatabaseFactory {

	public static Database createDatabase(String vendor) {
		Database db = null;
		switch (vendor) {
		case "oracle":
			db = new Oracle();
			break;
		case "mariadb":
			db = new Mariadb();
			break;
		case "h2":
			break;
		case "db2":
			break;
			
		default:
			break;
		}
		return db;
	}
}

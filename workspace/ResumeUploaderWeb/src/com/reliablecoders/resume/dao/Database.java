package com.reliablecoders.resume.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author nam phan
 * @company Reliable{coders}
 */
public class Database {

	public Connection Get_Connection() throws Exception {
		// load a properties file
		Properties prop = new Properties();
		prop.load(Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("config.properties"));
		try {

			// begin connecting
			String connectionURL = prop.getProperty("database");
			String user = prop.getProperty("dbuser");
			String password = prop.getProperty("dbpassword");
			// System.out.println(connectionURL + "\n" + user + "\n" +password);
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, user,
					password);
			return connection;
		}

		catch (SQLException e) {
			throw e;
		} catch (Exception e) {
			throw e;
		}

	}

}
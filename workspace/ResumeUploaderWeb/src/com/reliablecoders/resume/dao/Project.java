package com.reliablecoders.resume.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
import com.reliablecoders.resume.dto.ResumeObject;
/**
 * @author nam phan
 * @company Reliable{coders}
 */
public class Project {

	/**
	 * 
	 * @param connection
	 * @return
	 * @throws Exception
	 */
	public ArrayList<ResumeObject> GetAllResumes(Connection connection)
			throws Exception {
		String query = "SELECT ID, First_Name, Last_Name, "
				+ "Email, Phone, Skills, Description, Resume_Directory FROM resume ORDER BY id";
		return doQueryGetResume(connection, query);

	}
	
	public ArrayList<ResumeObject> SearchResumes(Connection connection,
			String value) throws Exception {
		String query = "SELECT ID, First_Name, Last_Name, "
				+ "Email, Phone, Skills, Description, Resume_Directory FROM resume "
				+ "WHERE First_Name LIKE '%" + value +"%' "
				+ "OR Last_Name LIKE '%" + value +"%' "
				+ "OR Email LIKE '%" + value +"%' "
				+ "OR Phone LIKE '%" + value +"%' "
				+ "OR Skills LIKE '%" + value +"%' "
				+ "OR Description LIKE '%" + value +"%' "
				+ "OR Resume_Directory LIKE '%" + value +"%' "
				+ "ORDER BY id";
		//System.out.println(query);
		return doQueryGetResume(connection, query);
	}
	/**
	 * 
	 * @param connection
	 * @param query
	 * @return
	 * @throws Exception
	 */
	private ArrayList<ResumeObject> doQueryGetResume(Connection connection,
			String query) throws Exception {
		try {
			PreparedStatement ps = connection
					.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			return parseResumeObj(rs);// parse object
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private ArrayList<ResumeObject> parseResumeObj(ResultSet rs)
			throws SQLException {
		ArrayList<ResumeObject> resumeData = new ArrayList<ResumeObject>();
		while (rs.next()) {
			ResumeObject resumeObject = new ResumeObject();
			resumeObject.setRes_id(rs.getString("ID"));
			resumeObject.setFirstName(rs.getString("First_Name"));
			resumeObject.setLastName(rs.getString("Last_Name"));
			resumeObject.setEmail(rs.getString("Email"));
			resumeObject.setPhone(rs.getString("Phone"));
			resumeObject.setSkills(rs.getString("Skills"));
			resumeObject.setDescription(rs.getString("Description"));
			resumeObject.setRes_URL(rs.getString("Resume_Directory"));
			
			resumeData.add(resumeObject);
		}
		return resumeData;
	}

	/**
	 * 
	 * @param resumeObject
	 * @param connection
	 * @return 
	 * @throws Exception
	 */
	public ResumeObject AddResume(ResumeObject resumeObject, Connection connection)
			throws Exception {
		String query = "INSERT INTO resume"
				+ "(First_Name, Last_Name, Email, Phone, Skills, Description, Resume_Directory) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = null;
		try {
			ps = connection
					.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, resumeObject.getFirstName());
			ps.setString(2, resumeObject.getLastName());
			ps.setString(3, resumeObject.getEmail());
			ps.setString(4, resumeObject.getPhone());
			ps.setString(5, resumeObject.getSkills());
			ps.setString(6, resumeObject.getDescription());
			String resURL = resumeObject.getRes_URL();
			resURL = resURL.substring(resURL.lastIndexOf("\\")+1, resURL.length());
			resURL = resumeObject.getEmail()+"_"+resURL;
			ps.setString(7, resURL);

			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()){
			    resumeObject.setRes_id(rs.getInt(1)+"");
			}
			
//			String url = resumeObject.getRes_URL();
//			url = url.substring(url.lastIndexOf("\\")+1, url.length());
//			System.out.println(url);
//			resumeObject.setRes_URL(resumeObject.getRes_id() + "\\" +url);
//			UpdateResume(resumeObject, connection);

		} catch (Exception e) {
			throw e;
		}
		finally {
			connection.close();
		}
		return resumeObject;
	}
/**
 * 
 * @param resumeObject
 * @param connection
 * @return
 * @throws Exception 
 */
	public ResumeObject UpdateResume(ResumeObject resumeObject,
			Connection connection) throws Exception {
		String query = "UPDATE resume SET "
				+ "First_Name = ?"
				+ ", Last_Name = ?"
				+ ", Email = ?"
				+ ", Phone = ?"
				+ ", Skills = ?"
				+ ", Description = ?"
				+ ", Resume_Directory = ?"
				+ " WHERE ID = ?";
		PreparedStatement ps = null;
		try {
			ps = connection
					.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, resumeObject.getFirstName());
			ps.setString(2, resumeObject.getLastName());
			ps.setString(3, resumeObject.getEmail());
			ps.setString(4, resumeObject.getPhone());
			ps.setString(5, resumeObject.getSkills());
			ps.setString(6, resumeObject.getDescription());
			ps.setString(7, resumeObject.getRes_URL());
			ps.setString(8, resumeObject.getRes_id());

			ps.executeUpdate();

		} catch (Exception e) {
			throw e;
		}
		finally {
			connection.close();
		}
		return resumeObject;
	}
/**
 * 
 * @param connection
 * @return
 * @throws Exception 
 */
public int getLastInsertedID(Connection connection) throws Exception {
	String query = "SELECT MAX(ID) as ID from resume;";
	try {
		PreparedStatement ps = connection.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getInt("ID");
	} catch (Exception e) {
		throw e;
	}
}
/**
 * 
 * @param connection
 * @param lastID
 * @return
 * @throws Exception 
 */
public ResumeObject SearchResumeByID(Connection connection,
		int lastID) throws Exception {
	String query = "SELECT * FROM resume WHERE ID = " + lastID;
	return doQueryGetResume(connection, query).get(0);
}

}

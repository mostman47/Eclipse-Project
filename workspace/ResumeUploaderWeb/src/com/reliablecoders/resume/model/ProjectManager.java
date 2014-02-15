package com.reliablecoders.resume.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.reliablecoders.resume.dao.Database;
import com.reliablecoders.resume.dao.Project;
import com.reliablecoders.resume.dto.ResumeObject;
/**
 * @author nam phan
 * @company Reliable{coders}
 */
public class ProjectManager {

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public ArrayList<ResumeObject> GetResumes() throws Exception {
		ArrayList<ResumeObject> resumes = null;
		try {
			Database database = new Database();
			Connection connection = database.Get_Connection();
			Project project = new Project();
			resumes = project.GetAllResumes(connection);

		} catch (Exception e) {
			throw e;
		}
		return resumes;
	}

	/**
	 * 
	 * @param resumeObject
	 * @throws Exception
	 */
	public ResumeObject AddResume(ResumeObject resumeObject) throws Exception {
		try {
			Database database = new Database();
			Connection connection = database.Get_Connection();
			Project project = new Project();
			return project.AddResume(resumeObject, connection);
		} catch (Exception e) {
			throw e;
		}

	}
	/**
	 * 
	 * @param value
	 * @return
	 * @throws Exception 
	 */
	public ArrayList<ResumeObject> SearchResumes(String value) throws Exception {
		ArrayList<ResumeObject> resumes = null;
		try {
			Database database = new Database();
			Connection connection = database.Get_Connection();
			Project project = new Project();
			resumes = project.SearchResumes(connection, value);

		} catch (Exception e) {
			throw e;
		}
		return resumes;
	}
	/**
	 * 
	 * @param resumeObject
	 * @return
	 * @throws Exception 
	 */
	public ResumeObject updateResume(ResumeObject resumeObject) throws Exception {
		try {
			Database database = new Database();
			Connection connection = database.Get_Connection();
			Project project = new Project();
			return project.UpdateResume(resumeObject, connection);
		} catch (Exception e) {
			throw e;
		}
		
	}
	/**
	 * 
	 * @return
	 * @throws Exception 
	 */
	public int getLastInsertedID() throws Exception {
		Database database = new Database();
		Connection connection = database.Get_Connection();
		Project project = new Project();
		return project.getLastInsertedID(connection);
		
	}
	/**
	 * 
	 * @param lastID
	 * @return
	 * @throws Exception 
	 */
	public ResumeObject SearchResumesByID(int lastID) throws Exception {
		Database database = new Database();
		Connection connection = database.Get_Connection();
		Project project = new Project();
		return project.SearchResumeByID(connection, lastID);	}
	/**
	 * 
	 * @param resumes
	 * @return
	 * @throws Exception
	 */
	public List<ResumeObject> deleteResumes(List<ResumeObject> resumes) throws Exception {
		
		ArrayList<ResumeObject> array = new ArrayList<ResumeObject>();
		for(ResumeObject resume : resumes)
		{
			array.add(this.deleteResume(resume));
		}
		return array;
		
	}
	/**
	 * 
	 * @param resume
	 * @return
	 * @throws Exception
	 */
	private ResumeObject deleteResume(ResumeObject resume) throws Exception {
		Database database = new Database();
		Connection connection = database.Get_Connection();
		Project project = new Project();
		return project.DeleteResumeByID(connection, resume);
	}
	/**
	 * 
	 * @param value
	 * @return
	 * @throws Exception 
	 * @throws NumberFormatException 
	 */
	public ResumeObject SearchByID(String id) throws NumberFormatException, Exception {
		Database database = new Database();
		Connection connection = database.Get_Connection();
		Project project = new Project();
		return project.SearchResumeByID(connection, Integer.parseInt(id));
	}

}

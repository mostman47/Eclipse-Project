package com.reliablecoders.resume.test;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.reliablecoders.resume.dao.Database;
import com.reliablecoders.resume.dto.ResumeObject;
import com.reliablecoders.resume.model.ProjectManager;
/**
 * @author nam phan
 * @company Reliable{coders}
 */
public class Test {
	private static HttpServletRequest servletRequest;
	public static void main(String[] args) throws Exception {
		//getResume();
		//addResume();
		//searchResume();
		//addSimple();
		//updateResume();
		//getLastInsertedID();
		//searchResumeByID();
		//testConnection();
		//testCreateDirectory();
		//testDelete();
		System.out.println(servletRequest.getSession().getServletContext().getRealPath("/"));
		System.out.println(System.getProperty("user.dir"));
		
	}
	private static void testDelete() throws Exception {
		ResumeObject rs = new ResumeObject();
		rs.setRes_id("170");
		ArrayList<ResumeObject> arr = new ArrayList<ResumeObject>();
		arr.add(rs);
		ProjectManager projectManager= new ProjectManager();
		projectManager.deleteResumes(arr);
		
	}
	private static void testCreateDirectory() throws IOException {
		Properties prop = new Properties();
		prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));

		String root = prop.getProperty("rootDirectory");
		System.out.println(root);
//		String root = "/tmp/";
//		File file = new File(root);
//		System.out.println(file.mkdirs());
		
		
	}
	private static void searchResumeByID() throws Exception {
		ProjectManager projectManager= new ProjectManager();
		int lastID = projectManager.getLastInsertedID();
		
		ResumeObject resumeObject = projectManager.SearchResumesByID(lastID);
		System.out.println(resumeObject.getRes_URL());
	}
	private static void getLastInsertedID() throws Exception {
		ProjectManager projectManager= new ProjectManager();
		System.out.println(projectManager.getLastInsertedID());
		
	}
	private static void updateResume() throws Exception {
		
		ArrayList<ResumeObject> resumeData = null;
		ProjectManager projectManager= new ProjectManager();
		resumeData = projectManager.SearchResumes("fff");
		ResumeObject resumeObject = resumeData.get(0);
		System.out.println(resumeObject.getRes_id());
		resumeObject.setFirstName("aaaaa");
		projectManager= new ProjectManager();
		projectManager.updateResume(resumeObject);
	}
	private static void testConnection() throws Exception {
		Database database = new Database();
		Connection connection = database.Get_Connection();
		
	}

	private static void addSimple() throws Exception {
		
		ResumeObject resumeObject = new ResumeObject();
		ProjectManager projectManager= new ProjectManager();
		resumeObject.setFirstName("sad");
		resumeObject.setLastName("lb");
		resumeObject.setRes_URL("fdf");
		projectManager.AddResume(resumeObject);
	}

	private static void searchResume() {
		// TODO Auto-generated method stub
		String resumes  = null;
		try 
		{
			ArrayList<ResumeObject> resumeData = null;
			ProjectManager projectManager= new ProjectManager();
			resumeData = projectManager.SearchResumes("fff");
			Gson gson = new Gson();
			//System.out.println(gson.toJson(resumeData));
			resumes = gson.toJson(resumeData);

		} catch (Exception e)
		{
			System.out.println("error");
		}
		System.out.println(resumes);
	}

	private static void addResume() throws Exception {
		// TODO Auto-generated method stub
		ResumeObject resumeObject = new ResumeObject();
		ProjectManager projectManager= new ProjectManager();
		resumeObject = projectManager.GetResumes().get(0);
		projectManager.AddResume(resumeObject);
		
	}

	private static void getResume() {
		String resumes  = null;
		try 
		{
			ArrayList<ResumeObject> resumeData = null;
			ProjectManager projectManager= new ProjectManager();
			resumeData = projectManager.GetResumes();
			Gson gson = new Gson();
			resumes = gson.toJson(resumeData);
			//System.out.println(Arrays.toString(resumeData.toArray()));

		} catch (Exception e)
		{
			System.out.println("error");
		}
		System.out.println(resumes);
		
	}
	
}

package com.reliablecoders.resume.webService;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.reliablecoders.resume.dto.ResumeObject;
import com.reliablecoders.resume.model.ProjectManager;
/**
 * @author nam phan
 * @company Reliable{coders}
 */
@Path("/Web")
public class ResumeService {
	private ProjectManager projectManager = new ProjectManager();

	@POST
	@Path("/addResume")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public ResumeObject create(ResumeObject rs) {
		ResumeObject resumeObject = null;
		// System.out.println("creating resume");
		try {
			resumeObject = projectManager.AddResume(rs);
		} catch (Exception e) {
			System.out.println("error" + e);
		}
		return resumeObject;
	}

	@GET
	@Path("/GetAllResumes")
	@Produces("application/json")
	public String getResume() {
		String resumes = null;
		ArrayList<ResumeObject> resumeData = null;
		try {

			resumeData = projectManager.GetResumes();
			Gson gson = new Gson();
			resumes = gson.toJson(resumeData);

		} catch (Exception e) {
			System.out.println("error" + e);
		}
		return resumes;
	}

	@GET
	@Path("/Search:{value}")
	@Produces("application/json")
	public String getOrder(@PathParam("value") String value) {
		String resumes = null;
		try {
			ArrayList<ResumeObject> resumeData = null;
			resumeData = projectManager.SearchResumes(value);
			Gson gson = new Gson();
			//System.out.println(gson.toJson(resumeData));
			resumes = gson.toJson(resumeData);

		} catch (Exception e) {
			System.out.println("error" + e);
		}
		return resumes;
	}
}

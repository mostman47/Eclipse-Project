package com.reliablecoders.resume.webService;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.codehaus.jettison.json.JSONException;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.reliablecoders.resume.dto.ResumeObject;
import com.reliablecoders.resume.model.ProjectManager;

/**
 * @author nam phan
 * @company Reliable{coders}
 */
@Path("/Web")
public class ResumeService {
	private ProjectManager projectManager = new ProjectManager();
	private Date date = new java.util.Date();

	@GET
	@Path("/getResumeURL:{value},{type}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getFile(@PathParam("value") String value,
			@PathParam("type") String type) {
		Properties prop = new Properties();
		try {
			System.out.println(new Timestamp(date.getTime())
					+ " : Getting ResumeURL" + ",value:  " + value + ",type:  "
					+ type);
			prop.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("config.properties"));
		} catch (IOException e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
			e.printStackTrace();
		}
		//
		ResumeObject resumeData = null;
		try {
			resumeData = projectManager.SearchByID(value);
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		//
		String root = prop.getProperty("rootDirectory");

		File file = new File(root + resumeData.getRes_URL());
		if (file.exists())
			System.out.println(file.getName() + " exist");
		ResponseBuilder response = Response.ok((Object) file);
		String extension = file.getName().substring(
				file.getName().lastIndexOf("."), file.getName().length());
		switch (extension) {
		case ".pdf":
			response.type("application/pdf");
			break;
		case ".doc":
		case ".dot":
			response.type("application/msword");
			break;
		case ".docx":
			response.type("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			break;
		case ".css":
			response.type("text/css");
			break;
		default:
			response.type("text/plain");
			break;
		}
		;
		if (type.equals("download")) {
			response.header("Content-Disposition",
					"attachment; filename=\"resume.pdf\"");// for download
		}
		return response.build();
	}

	/**
	 * 
	 * @param rs
	 * @return
	 */
	@POST
	@Path("/addResume")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public ResumeObject create(ResumeObject rs) {
		ResumeObject resumeObject = null;
		System.out.println("creating resume: " + rs.getLastName());
		try {
			resumeObject = projectManager.AddResume(rs);
			System.out.println(new Timestamp(date.getTime())
					+ " : Add new resume sucessfully");
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return resumeObject;
	}

	/**
	 * 
	 * @param resumeObject
	 * @return
	 */
	@POST
	@Path("/deleteResume")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public ResumeObject deleteResume(ResumeObject resumeObject) {
		System.out.println(resumeObject.getRes_id());
		return resumeObject;
	}

	/**
	 * 
	 * @param value
	 * @return
	 */
	@POST
	@Path("/UpdateResume")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String updateResume(ResumeObject resumeObject) {
		String result = null;
		try {
			ResumeObject resumeData = projectManager.updateResume(resumeObject);
			Gson gson = new Gson();
			result = gson.toJson(resumeData);
			System.out.println(new Timestamp(date.getTime())
					+ " : Update resume sucessfully");
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return result;
	}

	/**
	 * 
	 * @param array
	 * @return
	 * @throws JSONException
	 */
	@POST
	@Path("/deleteResumes")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String deleteResumes(String array) throws JSONException {
		TypeToken<List<ResumeObject>> token = new TypeToken<List<ResumeObject>>() {
		};
		Gson gson = new Gson();
		List<ResumeObject> list = gson.fromJson(array, token.getType());
		try {
			list = projectManager.deleteResumes(list);
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return gson.toJson(list);
	}

	/**
	 * 
	 * @return
	 */
	@GET
	@Path("/GetAllResumes")
	@Produces("application/json")
	public String getResume() {
		String result = null;
		ArrayList<ResumeObject> resumeData = null;
		try {
			resumeData = projectManager.GetResumes();
			Gson gson = new Gson();
			result = gson.toJson(resumeData);
			System.out.println(new Timestamp(date.getTime())
					+ " : Get All resume sucessfully");
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return result;
	}

	/**
	 * 
	 * @param value
	 * @return
	 */
	@GET
	@Path("/Search:{value}")
	@Produces("application/json")
	public String getResume(@PathParam("value") String value) {
		String result = null;
		try {
			ArrayList<ResumeObject> resumeData = null;
			resumeData = projectManager.SearchResumes(value);
			Gson gson = new Gson();
			result = gson.toJson(resumeData);
			System.out.println(new Timestamp(date.getTime())
					+ " : Search Resume sucessfully");
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return result;
	}

	/**
	 * 
	 * @param value
	 * @return
	 */
	@GET
	@Path("/SearchByID:{value}")
	@Produces("application/json")
	public String getResumeByID(@PathParam("value") String value) {
		String result = null;
		try {
			ResumeObject resumeData = null;
			resumeData = projectManager.SearchByID(value);
			Gson gson = new Gson();
			// System.out.println(gson.toJson(resumeData));
			result = gson.toJson(resumeData);
			System.out.println(new Timestamp(date.getTime())
					+ " : Search Resume by ID sucessfully");
		} catch (Exception e) {
			System.out.println(new Timestamp(date.getTime()) + " : "
					+ e.toString());
		}
		return result;
	}
}

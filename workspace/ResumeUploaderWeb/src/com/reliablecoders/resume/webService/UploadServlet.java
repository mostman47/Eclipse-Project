package com.reliablecoders.resume.webService;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/uploadFile")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// get file
		Part filePart = request.getPart("file"); // Retrieves <input type="file"
		Part filePartName = request.getPart("fileName");			// name="file">
		InputStream inputStream = filePart.getInputStream();
		// get root directory
		Properties prop = new Properties();
		prop.load(Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("config.properties"));
		String root = prop.getProperty("rootDirectory");
		// write to file
		String savefileName = root + getStringFromInputStream(filePartName.getInputStream());
		System.out.println(new java.io.File("").getAbsolutePath());
			System.out.println("save file to: " + savefileName);
		OutputStream outputStream = new FileOutputStream(new File(savefileName));
		try {
			int read = 0;
			byte[] bytes = new byte[request.getContentLength()];
			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		outputStream.close();
		System.out.println("Write File Done!");
	}

	private static String getStringFromInputStream(InputStream is) {

		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}
	// private static String getFilename(Part part) {
	// for (String cd : part.getHeader("content-disposition").split(";")) {
	// if (cd.trim().startsWith("filename")) {
	// String filename = cd.substring(cd.indexOf('=') + 1).trim()
	// .replace("\"", "");
	// return filename.substring(filename.lastIndexOf('/') + 1)
	// .substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
	// }
	// }
	// return null;
	// }
}
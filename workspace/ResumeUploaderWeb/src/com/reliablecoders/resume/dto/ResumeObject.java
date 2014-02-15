package com.reliablecoders.resume.dto;
/**
 * @author nam phan
 * @company Reliable{coders}
 */
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class ResumeObject {

	private String res_id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String skills;
	private String description;
	private String res_URL;
	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRes_URL() {
		return res_URL;
	}

	public void setRes_URL(String res_URL) {
		this.res_URL = res_URL;
	}

}

package com.tech.blog.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;



@Entity
@Table(name="USER_INFO", uniqueConstraints = {
		@UniqueConstraint(columnNames="USERID") , 
		@UniqueConstraint(columnNames = "EMAIL") })
public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USERID" , unique = true ,nullable = false)
	private int userid;
	
	@Column(name = "USERNAME" , unique = false , nullable = false , length = 100)
	private String username;
	
	@Column(name = "EMAIL", unique = true , nullable = false, length = 100)
	private String email;
	
	@Column(name = "PASSWORD", unique = false , nullable = false, length = 100)
	private String password;
	
	@Temporal(value= TemporalType.DATE)
	@Column(name = "DATEOFBIRTH" )
	private Date dateofbirth;
	
	@Column(name = "GENDER" , unique = false , nullable = false, length = 10)
	private String gender;
	
	@Column(name = "PROFILE_PICTURE" , unique = false , length = 1500)
	private String profilepicture;
	@OneToMany(mappedBy ="userid")
	private List<Post> post = new ArrayList<Post>();
 
	

	public User( String username, String email, String password, Date dateofbirth, String gender,
			String profilepicture, List<Post> post) {
		super();
		
		this.username = username;
		this.email = email;
		this.password = password;
		this.dateofbirth = dateofbirth;
		this.gender = gender;
		this.profilepicture = profilepicture;
		this.post = post;
	}

	public User() {
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfilepicture() {
		return profilepicture;
	}

	public void setProfilepicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
	}
	

}

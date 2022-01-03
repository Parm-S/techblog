package com.tech.blog.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="POST")
public class Post implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PId",unique=true,nullable=false)
	private int pid;
	@Column(name="PTITLE", length=100)
	private String  pTittle;
	@Lob
    @Column(name = "PCONTENT")
	private String pContent;
	@Lob
    @Column(name = "PCODE")
	private String pCode;
	@CreationTimestamp
	@Temporal(value=TemporalType.TIMESTAMP)
	@Column(name = "PDATE")
	private Date pDate;
	
	@Column(name = "PICTURE" , unique = false , length = 1500)
	private String picture;
	
//	@OneToOne(cascade = CascadeType.ALL)s
	@Column(name = "PCATEGORY")
	private int pcategory;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PUSERId")
	private User userid;
	
	public Post() {
		
	}

	public Post(String pTittle, String pContent, String pCode, Date pDate, String picture,int pcategory,
			User userid) {
		super();
		this.pTittle = pTittle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pDate = pDate;
		this.picture = picture;
		this.pcategory = pcategory;
		this.userid = userid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTittle() {
		return pTittle;
	}

	public void setpTittle(String pTittle) {
		this.pTittle = pTittle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getPcategory() {
		return pcategory;
	}

	public void setPcategory(int pcategory) {
		this.pcategory = pcategory;
	}

	public User getUserid() {
		return userid;
	}

	public void setUserid(User userid) {
		this.userid = userid;
	}

	
	

}

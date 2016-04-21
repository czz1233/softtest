package com.huayun.ssh.story.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huayun.ssh.common.entity.BaseEntity;
import com.huayun.ssh.system.model.Account;
/**
 *书签
 */
@Entity
@Table(name="STY_BOOKTAG")
@SuppressWarnings("all")
public class BookTag extends BaseEntity{
	
	private static final long serialVersionUID = -3797489003145790973L;
	
	private String id;//ID标识
	
	private Account account;
	private Section section;
	
	private String sname;//章节名字
	private Long sreadNum;//章节阅读量
	private Long swordNum;//章节总字数
	private String sectionStr;//章节内容
	private Date supdate;//章节更新时间
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	
	private String storyStr;
	
	

	public BookTag() {
		
	}
	
	
	
	public BookTag(String id) {
		this.id = id;
	}



	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "BookTag", strategy = "uuid")
	@GeneratedValue(generator = "BookTag")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@Cascade(value={CascadeType.PERSIST})
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@Cascade(value={CascadeType.PERSIST})
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}
	@Transient
	public String getSname() {
		return this.getSection() == null ? "" :this.getSection().getSname();
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	@Transient
	public Long getSreadNum() {
		return this.getSection() == null ? null :this.getSection().getSreadNum();
	}
	public void setSreadNum(Long sreadNum) {
		this.sreadNum = sreadNum;
	}
	@Transient
	public Long getSwordNum() {
		return this.getSection() == null ? null :this.getSection().getSwordNum();
	}
	public void setSwordNum(Long swordNum) {
		this.swordNum = swordNum;
	}
	@Transient
	public String getSectionStr() {
		return this.getSection() == null ? "" :this.getSection().getSection();
	}
	public void setSectionStr(String sectionStr) {
		this.sectionStr = sectionStr;
	}
	@Transient
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getSupdate() {
		return this.getSection() == null ? null :this.getSection().getSupdate();
	}
	public void setSupdate(Date supdate) {
		this.supdate = supdate;
	}
	@Transient
	public Integer getStatus() {
		return this.getSection() == null ? null :this.getSection().getStatus();
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Transient
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getCreateTime() {
		return this.getSection() == null ? null :this.getSection().getCreateTime();
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Transient
	public String getCreator() {
		return this.getSection() == null ? null :this.getSection().getCreator();
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	@Transient
	public String getStoryStr() {
		return this.getSection() == null ? null :this.getSection().getStoryStr();
	}
	public void setStoryStr(String storyStr) {
		this.storyStr = storyStr;
	}


}

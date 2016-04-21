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

/**
 *小说章节
 */
@Entity
@Table(name="STY_SECTION")
public class Section extends BaseEntity{

	private static final long serialVersionUID = -2987409819789095827L;
	
	private String id;
	private String sname;//章节名字
	private Long sreadNum;//章节阅读量
	private Long swordNum;//章节总字数
	private String section;//章节内容
	private Date supdate;//章节更新时间
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	//关联字段
	private Story story;//关联小说
	
	private List<BookTag> bookTagList = new ArrayList<BookTag>();
	
	//非数据库字段
	private String storyStr;

	public Section() {
		
	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Section", strategy = "uuid")
	@GeneratedValue(generator = "Section")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Long getSreadNum() {
		return sreadNum;
	}

	public void setSreadNum(Long sreadNum) {
		this.sreadNum = sreadNum;
	}

	public Long getSwordNum() {
		return swordNum;
	}

	public void setSwordNum(Long swordNum) {
		this.swordNum = swordNum;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getSupdate() {
		return supdate;
	}

	public void setSupdate(Date supdate) {
		this.supdate = supdate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}
	@ManyToOne
	@Cascade(value={CascadeType.PERSIST})
	@JsonIgnore
	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}
	@Transient
	public String getStoryStr() {
		return this.getStory() == null ? "" : this.getStory().getName();
	}
	public void setStoryStr(String storyStr) {
		this.storyStr = storyStr;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="section",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<BookTag> getBookTagList() {
		return bookTagList;
	}
	public void setBookTagList(List<BookTag> bookTagList) {
		this.bookTagList = bookTagList;
	}
	

}

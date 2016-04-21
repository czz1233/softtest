package com.huayun.ssh.story.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huayun.ssh.common.entity.BaseEntity;
/**
 *小说类型
 */
@Entity
@Table(name="STY_STORYTYPE")
public class StoryType extends BaseEntity{

	private static final long serialVersionUID = -8152698046243932276L;
	
	private String id;
	private String name;
	private String describle;
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	
	private List<Story> storyList = new ArrayList<Story>();

	public StoryType() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "StoryType", strategy = "uuid")
	@GeneratedValue(generator = "StoryType")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
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
	@OneToMany(fetch=FetchType.LAZY,mappedBy="storyType",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<Story> getStoryList() {
		return storyList;
	}

	public void setStoryList(List<Story> storyList) {
		this.storyList = storyList;
	}
	

}

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
 *小说书架
 */
@Entity
@Table(name="STY_BOOKRACK")
public class BookRack extends BaseEntity{

	private static final long serialVersionUID = -6829395935236885578L;
	
	private String id;//id
	private Account account;
	private Story story;
	
	//非数据库字段
	private String name;//名字
	private String describle;//描述
	private Date updateTime;//更新时间
	private Long readCount;//阅读次数
	private Long wordCount;//小说总字数
	private Integer collectNum;//销售收藏数量
	private String imageUrl;//小说图片路径
	
	
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	private String authorStr;
	private String storyTypeStr;
	
	public BookRack() {
		
	}
	
	public BookRack(String id) {
		this.id = id;
	}

	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "BookRack", strategy = "uuid")
	@GeneratedValue(generator = "BookRack")
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
	public Story getStory() {
		return story;
	}
	public void setStory(Story story) {
		this.story = story;
	}
	@Transient
	public String getName() {
		return this.getStory() == null ? "" : this.getStory().getName();
	}
	public void setName(String name) {
		this.name = name;
	}
	@Transient
	public String getDescrible() {
		return this.getStory() == null ? "" : this.getStory().getDescrible();
	}
	public void setDescrible(String describle) {
		this.describle = describle;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	@Transient
	public Date getUpdateTime() {
		return this.getStory() == null ? null : this.getStory().getUpdateTime();
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@Transient
	public Long getReadCount() {
		return this.getStory() == null ? 0l : this.getStory().getReadCount();
	}
	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}
	@Transient
	public Long getWordCount() {
		return this.getStory() == null ? 0l : this.getStory().getWordCount();
	}
	public void setWordCount(Long wordCount) {
		this.wordCount = wordCount;
	}
	@Transient
	public Integer getCollectNum() {
		return this.getStory() == null ? 0 : this.getStory().getCollectNum();
	}
	public void setCollectNum(Integer collectNum) {
		this.collectNum = collectNum;
	}
	@Transient
	public String getImageUrl() {
		return this.getStory() == null ? "" : this.getStory().getImageUrl();
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Transient
	public Integer getStatus() {
		return this.getStory() == null ? 1 : this.getStory().getStatus();
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	@Transient
	public Date getCreateTime() {
		return this.getStory() == null ? null : this.getStory().getCreateTime();
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Transient
	public String getCreator() {
		return this.getStory() == null ? "" : this.getStory().getCreator();
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	@Transient
	public String getAuthorStr() {
		return this.getStory() == null ? "" : this.getStory().getAuthorStr();
	}
	public void setAuthorStr(String authorStr) {
		this.authorStr = authorStr;
	}
	@Transient
	public String getStoryTypeStr() {
		return this.getStory() == null ? "" : this.getStory().getStoryTypeStr();
	}
	public void setStoryTypeStr(String storyTypeStr) {
		this.storyTypeStr = storyTypeStr;
	}
	
	
	


}

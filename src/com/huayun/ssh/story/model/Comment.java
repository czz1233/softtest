package com.huayun.ssh.story.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huayun.ssh.common.entity.BaseEntity;
/**
 * 评论
 */
@Entity
@Table(name="STY_COMMENT")
public class Comment extends BaseEntity{

	private static final long serialVersionUID = 1709078808035431131L;
	
	private String id;//ID标识
	private String content;//评论内容
	private Integer state;//状态：0=普通，1=精华
	private String replyContent;//恢复内容
	private Date replayTime;//恢复时间
	private String replayUser;//恢复者
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	
	//关联字段
	private Story story;//评论的小说
	//非数据库字段
	private String storyName;//小说名字

	public Comment() {
		
	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Comment", strategy = "uuid")
	@GeneratedValue(generator = "Comment")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getReplayTime() {
		return replayTime;
	}

	public void setReplayTime(Date replayTime) {
		this.replayTime = replayTime;
	}

	public String getReplayUser() {
		return replayUser;
	}

	public void setReplayUser(String replayUser) {
		this.replayUser = replayUser;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

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
	public String getStoryName() {
		return this.getStory() == null ? "" : this.getStory().getName();
	}
	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}
	
	

}

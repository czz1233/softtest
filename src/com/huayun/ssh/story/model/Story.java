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
 *小说
 */
@Entity
@Table(name="STY_STORY")
public class Story extends BaseEntity{

	private static final long serialVersionUID = 7977855249978967531L;
	
	private String id;//ID标识
	private String name;//名字
	private String describle;//描述
	private Date updateTime;//更新时间
	private Long readCount;//阅读次数
	private Long wordCount;//小说总字数
	private Integer state;//小说更新状态,1=已更新，0=未更新
	private Integer collectNum;//销售收藏数量
	private String imageUrl;//小说图片路径
	
	
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	//关联字段
	private Account author;//作者
	private StoryType storyType;//小说类型
	private List<Section> sectionList = new ArrayList<Section>();//小说章节
	private List<Comment> commentList = new ArrayList<Comment>();//评论
	
	private List<BookRack> bookRackList = new ArrayList<BookRack>();//小说书架
	
	private String authorStr;
	private String storyTypeStr;

	public Story() {

	}

	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Story", strategy = "uuid")
	@GeneratedValue(generator = "Story")
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

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Long getReadCount() {
		return readCount;
	}


	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}


	public Long getWordCount() {
		return wordCount;
	}


	public void setWordCount(Long wordCount) {
		this.wordCount = wordCount;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public Integer getCollectNum() {
		return collectNum;
	}


	public void setCollectNum(Integer collectNum) {
		this.collectNum = collectNum;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
	public Account getAuthor() {
		return author;
	}

	public void setAuthor(Account author) {
		this.author = author;
	}
	@ManyToOne
	@Cascade(value={CascadeType.PERSIST})
	@JsonIgnore
	public StoryType getStoryType() {
		return storyType;
	}

	public void setStoryType(StoryType storyType) {
		this.storyType = storyType;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="story",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<Section> getSectionList() {
		return sectionList;
	}

	public void setSectionList(List<Section> sectionList) {
		this.sectionList = sectionList;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="story",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	@Transient
	public String getAuthorStr() {
		return this.getAuthor() == null ? "" : this.getAuthor().getNickName();
	}

	public void setAuthorStr(String authorStr) {
		this.authorStr = authorStr;
	}
	@Transient
	public String getStoryTypeStr() {
		return this.getStoryType() == null ? "" : this.getStoryType().getName();
	}

	public void setStoryTypeStr(String storyTypeStr) {
		this.storyTypeStr = storyTypeStr;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="story",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<BookRack> getBookRackList() {
		return bookRackList;
	}

	public void setBookRackList(List<BookRack> bookRackList) {
		this.bookRackList = bookRackList;
	}
	
	

}

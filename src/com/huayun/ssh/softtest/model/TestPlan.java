package com.huayun.ssh.softtest.model;

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
 *测试计划
 */
@Entity
@Table(name="SFT_TESTPLAN")
public class TestPlan extends BaseEntity{

	private static final long serialVersionUID = 3167801813761962750L;
	
	private String id;
	private String title;
	private String type;
	private Integer state;//0=待审核，1=审核通过，-1=审核不通过
	private Date beginTime;//开始时间
	private Date endTime;//结束时间
	
	private String remark;//软件描述
	
	// 维护字段
	private Integer status;// 状态 -1 = 已作废 1=正常
	private Date createTime;// 创建时间
	private String creator;// 创建者	
	
	private List<TestExample> testExampleList = new ArrayList<TestExample>();
	

	public TestPlan() {
		
	}

	@Id
	@Column(name = "ID", length = 50)
	@GenericGenerator(name = "TestPlan", strategy = "uuid")
	@GeneratedValue(generator = "TestPlan")
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="testPlan",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<TestExample> getTestExampleList() {
		return testExampleList;
	}

	public void setTestExampleList(List<TestExample> testExampleList) {
		this.testExampleList = testExampleList;
	}
	
	

}

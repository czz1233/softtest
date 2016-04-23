package com.huayun.ssh.softtest.model;

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
import com.huayun.ssh.common.entity.BaseEntity;

/**
 * 测试类型
 */
@Entity
@Table(name = "SFT_TESTEXAMPLE")
public class TestExample extends BaseEntity{

	private static final long serialVersionUID = -8671936647502060578L;
	
	private String id;
	private String title;
	private String testEnvironment;//测试环境
	private String content;//用例内容
	private String remark;//备注说明
	
	// 维护字段
	private Integer status;// 状态 -1 = 已作废 1=正常
	private Date createTime;// 创建时间
	private String creator;// 创建者
	//关联字段
	private TestPlan testPlan;
	
	//非数据库字段
	private String testPlanStr;
	
	@Id
	@Column(name = "ID", length = 50)
	@GenericGenerator(name = "TestExample", strategy = "uuid")
	@GeneratedValue(generator = "TestExample")
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
	public String getTestEnvironment() {
		return testEnvironment;
	}
	public void setTestEnvironment(String testEnvironment) {
		this.testEnvironment = testEnvironment;
	}
	@Column(length = 16777216)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
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
	public TestPlan getTestPlan() {
		return testPlan;
	}
	public void setTestPlan(TestPlan testPlan) {
		this.testPlan = testPlan;
	}
	@Transient
	public String getTestPlanStr() {
		return this.getTestPlan() == null ? "" : this.getTestPlan().getTitle();
	}
	public void setTestPlanStr(String testPlanStr) {
		this.testPlanStr = testPlanStr;
	}
	
	

}

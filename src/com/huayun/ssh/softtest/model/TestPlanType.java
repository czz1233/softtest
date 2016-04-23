package com.huayun.ssh.softtest.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huayun.ssh.common.entity.BaseEntity;

/**
 * 测试类型
 */
@Entity
@Table(name = "SFT_TESTPLANTYPE")
public class TestPlanType extends BaseEntity {

	private static final long serialVersionUID = 2774652387437117204L;

	private String id;
	private String name;
	private String remark;

	// 维护字段
	private Integer status;// 状态 -1 = 已作废 1=正常
	private Date createTime;// 创建时间
	private String creator;// 创建者
	
	
	
	public TestPlanType() {
		
	}

	@Id
	@Column(name = "ID", length = 50)
	@GenericGenerator(name = "TestPlanType", strategy = "uuid")
	@GeneratedValue(generator = "TestPlanType")
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

}

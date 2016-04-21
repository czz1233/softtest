package com.huayun.ssh.system.model;

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
 *角色
 */
@Entity
@Table(name="SYS_ROLE")
public class Role extends BaseEntity{

	private static final long serialVersionUID = 5395841369787114833L;
	
	private String id;//id	
	private String name;//名称
	private Boolean enable;//状态,是否可用
	private String describle;//描述
	
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	
	//级联字段
	private List<AccountRole> roleAccountList = new ArrayList<AccountRole>();//账号角色信息
	private List<RoleRight> roleRightList = new ArrayList<RoleRight>();//角色权限信息
	
	
	/**
	 * 构造方法
	 */
	public Role() {
		
	}

	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Role", strategy = "uuid")
	@GeneratedValue(generator = "Role")
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	@Column(name="NAME" ,length = 120)
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	@Column(name="ENABLE")
	public Boolean getEnable() {
		return enable;
	}


	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	@Column(name="DESCRIBLE" ,length = 255)
	public String getDescrible() {
		return describle;
	}


	public void setDescrible(String describle) {
		this.describle = describle;
	}

	@Column(name="STATUS")
	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	@Column(name="CREATETIME")
	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name="CREATOR",length = 120)
	public String getCreator() {
		return creator;
	}


	public void setCreator(String creator) {
		this.creator = creator;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="role",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<AccountRole> getRoleAccountList() {
		return roleAccountList;
	}

	public void setRoleAccountList(List<AccountRole> roleAccountList) {
		this.roleAccountList = roleAccountList;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="role",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<RoleRight> getRoleRightList() {
		return roleRightList;
	}

	public void setRoleRightList(List<RoleRight> roleRightList) {
		this.roleRightList = roleRightList;
	}
	
	
	

}

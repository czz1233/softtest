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
 * 权限
 */
@Entity
@Table(name = "SYS_RIGHT")
public class Right extends BaseEntity {

	private static final long serialVersionUID = 8419278561994016277L;

	private String id; // id
	private String parentId;// 父权限id
	private String name;// 权限名称
	private String code;// 权限标识
	private Integer type;// 权限类型
	private String url;// 菜单url
	private String icon;// 菜单树图片名称
	private String iconCls;// 菜单图片样式
	private String imgUrl;// 菜单图片路径
	private Integer sortBy;// 菜单排序级别，值越小，排在越上面
	private String describle;// 权限描述

	// 维护字段
	private Integer status;// 状态 -1 = 已作废 1=正常
	private Date createTime;// 创建时间
	private String creator;// 创建者

	// 级联字段
	private List<RoleRight> rightRoleList = new ArrayList<RoleRight>();// 权限角色
	private List<AccountRight> ringhtAccountList = new ArrayList<AccountRight>();// 权限账号

	/**
	 * 构造方法
	 */
	public Right() {

	}

	public Right(String id, String parentId, String name, String code, Integer type, String url, String icon, String iconCls, String imgUrl, Integer sortBy, String describle, Integer status, Date createTime, String creator) {
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.code = code;
		this.type = type;
		this.url = url;
		this.icon = icon;
		this.iconCls = iconCls;
		this.imgUrl = imgUrl;
		this.sortBy = sortBy;
		this.describle = describle;
		this.status = status;
		this.createTime = createTime;
		this.creator = creator;
	}

	@Id
	@Column(name = "ID", length = 50)
	@GenericGenerator(name = "Right", strategy = "uuid")
	@GeneratedValue(generator = "Right")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "PARENT_ID", length = 50)
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "NAME", length = 120)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "CODE", length = 120, unique = true, nullable = false)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "TYPE")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "URL", length = 120)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "ICON", length = 120)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "ICONCLS", length = 120)
	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	@Column(name = "IMG_URL", length = 120)
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Column(name = "SORT_BY")
	public Integer getSortBy() {
		return sortBy;
	}

	public void setSortBy(Integer sortBy) {
		this.sortBy = sortBy;
	}

	@Column(name = "DESCRIBLE", length = 255)
	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "CREATETIME")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "CREATOR", length = 120)
	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "right", orphanRemoval = true)
	@Cascade(value = { CascadeType.SAVE_UPDATE })
	@BatchSize(size = 20)
	@JsonIgnore
	public List<RoleRight> getRightRoleList() {
		return rightRoleList;
	}

	public void setRightRoleList(List<RoleRight> rightRoleList) {
		this.rightRoleList = rightRoleList;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "right", orphanRemoval = true)
	@Cascade(value = { CascadeType.SAVE_UPDATE })
	@BatchSize(size = 20)
	@JsonIgnore
	public List<AccountRight> getRinghtAccountList() {
		return ringhtAccountList;
	}

	public void setRinghtAccountList(List<AccountRight> ringhtAccountList) {
		this.ringhtAccountList = ringhtAccountList;
	}

}

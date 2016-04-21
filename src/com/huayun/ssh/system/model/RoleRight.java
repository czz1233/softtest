package com.huayun.ssh.system.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

import com.huayun.ssh.common.entity.BaseEntity;

/**
 *角色权限
 */
@Entity
@Table(name="SYS_ROLE_RIGHT")
public class RoleRight extends BaseEntity{

	private static final long serialVersionUID = -756367104563967715L;
	
	private String id;
	private Role role;
	private Right right;
	
	/**
	 * 构造方法
	 */
	public RoleRight() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "RoleRight", strategy = "uuid")
	@GeneratedValue(generator = "RoleRight")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@ManyToOne
	@Cascade(value={CascadeType.PERSIST})
	@JoinColumn(name="ROLE_ID")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	@ManyToOne
	@Cascade(value={CascadeType.PERSIST})
	@JoinColumn(name="RIGHT_ID")
	public Right getRight() {
		return right;
	}

	public void setRight(Right right) {
		this.right = right;
	}
	

}

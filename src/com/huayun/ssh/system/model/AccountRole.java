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
 *账号角色中间对象
 */
@Entity
@Table(name="SYS_ACCOUNT_ROLE")
public class AccountRole extends BaseEntity{

	private static final long serialVersionUID = 2490273364430579676L;
	
	private String id;//ID
	private Account account;//账号
	private Role role;//角色
	/**
	 * 构造方法
	 */
	public AccountRole() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "AccountRole", strategy = "uuid")
	@GeneratedValue(generator = "AccountRole")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@ManyToOne
	@Cascade(value={CascadeType.PERSIST})
	@JoinColumn(name="ACCOUNT_ID")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
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
	

}

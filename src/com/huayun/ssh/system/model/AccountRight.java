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
 *账户权限
 */
@Entity
@Table(name="SYS_ACCOUNT_RIGHT")
public class AccountRight extends BaseEntity{

	private static final long serialVersionUID = 2904399841634220773L;
	
	private String id;
	private Account account;
	private Right right;

	/**
	 * 构造方法
	 */
	public AccountRight() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "AccountRight", strategy = "uuid")
	@GeneratedValue(generator = "AccountRight")
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
	@JoinColumn(name="RIGHT_ID")
	public Right getRight() {
		return right;
	}

	public void setRight(Right right) {
		this.right = right;
	}
	

}

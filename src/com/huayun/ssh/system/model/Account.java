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
import javax.persistence.Transient;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huayun.ssh.common.entity.BaseEntity;
import com.huayun.ssh.common.init.DictionaryUtil;
import com.huayun.ssh.story.model.BookRack;
import com.huayun.ssh.story.model.BookTag;
import com.huayun.ssh.story.model.Story;

/**
 *账号
 */
@Entity
@Table(name="SYS_ACCOUNT")
@SuppressWarnings("all")
public class Account extends BaseEntity{

	private static final long serialVersionUID = -7019329363030264858L;

	private String id;	//ID
	private String account;//名称
	private String password;//密码
	private String nickName;//账号昵称
	private String phtoto;//头像
	private String sex;//性别，来源于字典  SEX
	private Boolean enable;//是否可用
	private String type;//账号类型:0=普通会员，1=作者
	private String tyepeId;//账号类型ID
	private String remark;//备注
	
	private String email;//会员邮箱
	private String emailCheckTag;//邮箱验证标志
	private String emailCheckCode;//邮箱验证码
	private String level;//会员等级
	
	private String tel;//电话
	private String address;//地址
	private String describle;//简介
	private String qq;//QQ号码
	
	//维护字段
	private Integer status;//状态 -1 = 已作废  1=正常
	private Date createTime;//创建时间
	private String creator;//创建者
	
	//级联关系
	private List<AccountRole> accountRoleList = new ArrayList<AccountRole>();//账号角色
	private List<AccountRight> accountRightList = new ArrayList<AccountRight>();//账号权限
	
	private List<Story> storieList = new ArrayList<Story>();//小说信息 --作者写的书
	
	private List<BookRack> bookRackList = new ArrayList<BookRack>();//小说书架，收藏的书在这
	
	private List<BookTag> bookTagList = new ArrayList<BookTag>();//小说书签，收藏的章节房这里
	
	
	//非数据库字段，用于显示
	private String sexStr;//性别，从字典表中取：PERSION_SEX
	private String roleStr;//角色信息
	
		
	/**
	 * 构造方法
	 */
	public Account() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Account", strategy = "uuid")
	@GeneratedValue(generator = "Account")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="ACCOUNT" ,length = 120,unique=true,nullable=false)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Column(name="PASSWORD" ,length = 60)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="NICK_NAME" ,length = 120)
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Column(name="PHTOTO" ,length = 16777216)
	public String getPhtoto() {
		return phtoto;
	}
	public void setPhtoto(String phtoto) {
		this.phtoto = phtoto;
	}
	@Column(name="SEX" ,length = 20)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name="ENABLE")
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	@Column(name="TYPE",length = 20)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name="TYEPE_ID",length = 50)
	public String getTyepeId() {
		return tyepeId;
	}
	public void setTyepeId(String tyepeId) {
		this.tyepeId = tyepeId;
	}
	@Column(name="REMARK",length = 255)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	@OneToMany(fetch=FetchType.LAZY,mappedBy="account",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<AccountRole> getAccountRoleList() {
		return accountRoleList;
	}
	public void setAccountRoleList(List<AccountRole> accountRoleList) {
		this.accountRoleList = accountRoleList;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="account",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<AccountRight> getAccountRightList() {
		return accountRightList;
	}
	public void setAccountRightList(List<AccountRight> accountRightList) {
		this.accountRightList = accountRightList;
	}
	@Transient
	public String getSexStr() {
		return this.getSex() == null ? "" : DictionaryUtil.getDictName("PERSION_SEX", this.getSex());
	}
	public void setSexStr(String sexStr) {
		this.sexStr = sexStr;
	}
	@Transient
	public String getRoleStr() {
		String value = "";
		try {
			List<AccountRole> arList = this.getAccountRoleList();
			if(arList != null && 0 < arList.size()){
				for (AccountRole accountRole : arList) {
					value = value + "【" + accountRole.getRole().getName() + "】";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	public void setRoleStr(String roleStr) {
		this.roleStr = roleStr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailCheckTag() {
		return emailCheckTag;
	}
	public void setEmailCheckTag(String emailCheckTag) {
		this.emailCheckTag = emailCheckTag;
	}
	public String getEmailCheckCode() {
		return emailCheckCode;
	}
	public void setEmailCheckCode(String emailCheckCode) {
		this.emailCheckCode = emailCheckCode;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescrible() {
		return describle;
	}
	public void setDescrible(String describle) {
		this.describle = describle;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="author",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<Story> getStorieList() {
		return storieList;
	}
	public void setStorieList(List<Story> storieList) {
		this.storieList = storieList;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="account",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<BookRack> getBookRackList() {
		return bookRackList;
	}
	public void setBookRackList(List<BookRack> bookRackList) {
		this.bookRackList = bookRackList;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="account",orphanRemoval=true)
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@BatchSize(size=20)
	@JsonIgnore
	public List<BookTag> getBookTagList() {
		return bookTagList;
	}
	public void setBookTagList(List<BookTag> bookTagList) {
		this.bookTagList = bookTagList;
	}
	
	
	
}

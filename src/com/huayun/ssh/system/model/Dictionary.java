package com.huayun.ssh.system.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.huayun.ssh.common.entity.BaseEntity;
@Entity
@Table(name="SYS_DICTIONARY")
public class Dictionary extends BaseEntity{

	private static final long serialVersionUID = 3472971449633876216L;
	
	private String id;
	private String dictType;
	private String dictName;
	private String dictValue;
	private String ext01;
	private String ext02;
	private String ext03;
	private String ext04;
	private String ext05;
	private String remark;
	/**
	 * 构造方法
	 */
	public Dictionary() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "Dictionary", strategy = "uuid")
	@GeneratedValue(generator = "Dictionary")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="DICT_TYPE" ,length = 120,nullable=false)
	public String getDictType() {
		return dictType;
	}
	public void setDictType(String dictType) {
		this.dictType = dictType;
	}
	@Column(name="DICT_NAME" ,length = 120,nullable=false)
	public String getDictName() {
		return dictName;
	}
	public void setDictName(String dictName) {
		this.dictName = dictName;
	}
	@Column(name="DICT_VALUE" ,length = 120,nullable=false)
	public String getDictValue() {
		return dictValue;
	}
	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}
	@Column(name="EXT01")
	public String getExt01() {
		return ext01;
	}
	public void setExt01(String ext01) {
		this.ext01 = ext01;
	}
	@Column(name="EXT02")
	public String getExt02() {
		return ext02;
	}
	public void setExt02(String ext02) {
		this.ext02 = ext02;
	}
	@Column(name="EXT03")
	public String getExt03() {
		return ext03;
	}
	public void setExt03(String ext03) {
		this.ext03 = ext03;
	}
	@Column(name="EXT04")
	public String getExt04() {
		return ext04;
	}
	public void setExt04(String ext04) {
		this.ext04 = ext04;
	}
	@Column(name="EXT05")
	public String getExt05() {
		return ext05;
	}
	public void setExt05(String ext05) {
		this.ext05 = ext05;
	}
	@Column(name="REMARK")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}

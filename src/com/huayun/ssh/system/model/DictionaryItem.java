package com.huayun.ssh.system.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.huayun.ssh.common.entity.BaseEntity;

/**
 *字典条目
 */
@Entity
@Table(name="SYS_DICTIONARY_ITEM")
public class DictionaryItem extends BaseEntity{

	private static final long serialVersionUID = -8071714346956154586L;
	
	private String id;
	private String dictType;
	private String dictName;
	private Boolean isEdit;
	/**
	 * 构造方法
	 */
	public DictionaryItem() {

	}
	@Id
	@Column(name="ID" ,length = 50)
	@GenericGenerator(name = "DictionaryItem", strategy = "uuid")
	@GeneratedValue(generator = "DictionaryItem")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="DICT_TYPE" ,length = 120,unique=true,nullable=false)
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
	@Column(name="ISEDIT")
	public Boolean getIsEdit() {
		return isEdit;
	}
	public void setIsEdit(Boolean isEdit) {
		this.isEdit = isEdit;
	}

}

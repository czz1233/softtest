package com.huayun.ssh.common.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.model.Dictionary;
import com.huayun.ssh.system.model.DictionaryItem;
import com.huayun.ssh.system.service.IDictionaryItemService;
import com.huayun.ssh.system.service.IDictionaryService;

@Service
public class DictionaryUtil implements InitializingBean, DisposableBean{
	
	private static final LogUtil LOGGER = LogUtil.getInstances(DictionaryUtil.class);
	public static final Map<String, List<Dictionary>> dictMap = new HashMap<String, List<Dictionary>>();
	public static final Map<String,DictionaryItem> dictItemMap = new HashMap<String,DictionaryItem>();
	
	private static IDictionaryService dictionaryService;
	
	@Autowired
	public static void setDictionaryService(IDictionaryService dictionaryService) {
		DictionaryUtil.dictionaryService = dictionaryService;
	}
	@Autowired
	private IDictionaryItemService dictionaryItemService;
	
	@Override
	public void destroy() throws Exception {
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		LOGGER.info("-----------------------------系统字典正在加载--------------------------------");
		List<DictionaryItem> dictionaryItemList = dictionaryItemService.getAll();
		if(null != dictionaryItemList && 0 < dictionaryItemList.size()){
			for (DictionaryItem dictionaryItem : dictionaryItemList) {
				String dictType = dictionaryItem.getDictType();
				dictItemMap.put(dictType, dictionaryItem);
				dictMap.put(dictType, dictionaryService.getByType(dictType));
			}
		}
		LOGGER.info("-----------------------------系统字典加载结束--------------------------------");
	}
	public static List<Dictionary> getDictionariesByType(final String dictType) {
		if (StringUtils.isEmpty(dictType)) {
			return null;
		}
		return dictMap.get(dictType);
	}
	
	/**
	 * 
	 *  @Description    : 根据字典类型和值获取名称
	 *  @Method_Name    : getNameByTypeAndValue
	 *  @param type     : 字典类型
	 *  @param value    ： 字典指
	 *  @return
	 *  @return         : String
	 *  @Creation Date  : 2014年9月12日 上午10:50:19 
	 *  @Author         :  <a href="mailto:baiwei@dhcc.com">白伟</a>
	 */
	public static String getNameByTypeAndValue(final String type,final String value) {
		String result = "";
		if (StringUtils.isBlank(type) || StringUtils.isBlank(value)) {
			return result;
		}
		List<Dictionary> dicts = dictMap.get(type);
		if (null != dicts) {
			for (Dictionary d:dicts) {
				if (value.equalsIgnoreCase(d.getDictValue())) {
					result = d.getDictName(); 
					break;
				}
			}
		}
		return result;
	} 
	
	/**
	 * 
	 *  @Description    : 根据字类型和名称获取值
	 *  @Method_Name    : getValueByTypeAndName
	 *  @param type     : 字典类型
	 *  @param name     : 字名称
	 *  @return
	 *  @return         : String
	 *  @Creation Date  : 2014年9月12日 上午10:50:56 
	 *  @Author         :  <a href="mailto:baiwei@dhcc.com">白伟</a>
	 */
	public static String getValueByTypeAndName(final String type,final String name) {
		String result = "";
		if (StringUtils.isBlank(type) || StringUtils.isBlank(name)) {
			return result;
		}
		List<Dictionary> dicts = dictMap.get(type);
		if (null != dicts) {
			for (Dictionary d:dicts) {
				if (name.equalsIgnoreCase(d.getDictName())) {
					result = d.getDictValue(); 
					break;
				}
			}
		}
		return result;
	} 
	
	/**
	 * 
	 *  @Description    : 根据字典类型和字典名称获取字典值
	 *  @Method_Name    : getDictValueByTypeAndKey
	 *  @param dictType : 字典类型
	 *  @param dictKey  : 字典名称
	 *  @return         : String 字典值
	 *  @Creation Date  : 2014-7-18 下午3:14:12 
	 *  @Author         :  <a href="mailto:baiwei@dhcc.com">白伟</a>
	 */
	public static String getDictValueByTypeAndKey(final String dictType,final String dictKey) {
		if (StringUtils.isEmpty(dictType)) {
			return null;
		}
		
		if (StringUtils.isEmpty(dictKey)) {
			return null;
		}
		List<Dictionary> dicts = dictMap.get(dictType);
		if (null != dicts) {
			for (Dictionary dict : dicts) {
				if (dictKey.equals(dict.getDictName())) {
					return dict.getDictValue();
				}
			}
		}
		return null;
	}
	
	public static String getDictNameByTypeAndValue(final String dictType,final String dictValue) {
		if (StringUtils.isEmpty(dictType)) {
			return null;
		}
		
		if (StringUtils.isEmpty(dictValue)) {
			return null;
		}
		List<Dictionary> dicts = dictMap.get(dictType);
		if (null != dicts) {
			for (Dictionary dict : dicts) {
				if (dictValue.equals(dict.getDictValue())) {
					return dict.getDictName();
				}
			}
		}
		return null;
	}
	
	/**
	 * 
	 *  @Description    : 获取字典类型下拉选项，默认选择第一项
	 *  @Method_Name    : getDictTypeOption
	 *  @param          : selectValue 选择值
	 *  @return         ：String
	 *  @Creation Date  : 2014-7-19 上午11:30:15 
	 *  @Author         :  <a href="mailto:baiwei@dhcc.com">白伟</a>
	 */
	public synchronized static String getDictTypeOption(final String selectValue){
		StringBuilder sb = new StringBuilder(20);
		Set<Entry<String, DictionaryItem>> entrySet = dictItemMap.entrySet();
		if (StringUtils.isNotBlank(selectValue)) {
			for (Entry<String, DictionaryItem> entry : entrySet) {
				if (!"yes".equals(entry.getValue().getIsEdit())) {
					continue;
				}
				if (selectValue.equals(entry.getKey())) {
					sb.append("<option selected=\"selected\" value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				} else {
					sb.append("<option value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName()  + "</option>");
				}
			}
			
		} else {
			int index = 1;
			for (Entry<String, DictionaryItem> entry : entrySet) {
				if (!"yes".equals(entry.getValue().getIsEdit())) {
					continue;
				}
				if (1 == index) {
					sb.append("<option selected=\"selected\" value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				} else {
					sb.append("<option value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				}
				index = 2;
			}
		}
		
		return sb.toString();
	}
	
	public synchronized static String getAddDictTypeOption(final String selectValue){
		StringBuilder sb = new StringBuilder(20);
		Set<Entry<String, DictionaryItem>> entrySet = dictItemMap.entrySet();
		if (StringUtils.isNotBlank(selectValue)) {
			for (Entry<String, DictionaryItem> entry : entrySet) {
				if (!"yes".equals(entry.getValue().getIsEdit())) {
					continue;
				}
				if (selectValue.equals(entry.getKey())) {
					sb.append("<option selected=\"selected\" value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				} else {
					sb.append("<option value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				}
			}
			
		} else {
			int index = 1;
			for (Entry<String, DictionaryItem> entry : entrySet) {
				if (!"yes".equals(entry.getValue().getIsEdit())) {
					continue;
				}
				if (1 == index) {
					sb.append("<option selected=\"selected\" value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				} else {
					sb.append("<option value=\"" + entry.getKey() + "\"");
					sb.append(">  " + entry.getValue().getDictName() + "</option>");
				}
				index = 2;
			}
		}
		
		return sb.toString();
	}
	
	public static Dictionary getDictByTypeAndValue(final String dictType,final String dictValue){
		//获取字典信息失败，原因，字典类型不能为空
		Assert.isNotEmpty(dictType, "\u83B7\u53D6\u5B57\u5178\u4FE1\u606F\u5931\u8D25\uFF0C\u539F\u56E0\uFF0C\u5B57\u5178\u7C7B\u578B\u4E0D\u80FD\u4E3A\u7A7A");
		//获取字典信息失败，原因，字典值不能为空
		Assert.isNotEmpty(dictValue, "\u83B7\u53D6\u5B57\u5178\u4FE1\u606F\u5931\u8D25\uFF0C\u539F\u56E0\uFF0C\u5B57\u5178\u503C\u4E0D\u80FD\u4E3A\u7A7A");
		List<Dictionary> dicts = dictMap.get(dictType);
		//没有获取到该类型的字典信息：字典类型：
		Assert.isNotNull(dicts, "\u6CA1\u6709\u83B7\u53D6\u5230\u8BE5\u7C7B\u578B\u7684\u5B57\u5178\u4FE1\u606F\uFF1A\u5B57\u5178\u7C7B\u578B\uFF1A" + dictType);
		if (null != dicts) {
			for (Dictionary dict : dicts) {
				if (dictValue.equals(dict.getDictValue())) {
					return dict;
				}
			}
		}
		return null;
	}
	public static String getDictName(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		if(dict == null){
			return "";
		}
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getDictName();
	}

	public static String getEXT01(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getExt01();
	}
	public static Dictionary getDictByTypeValue(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict;
	}
	public static String getEXT02(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getExt02();
	}
	public static String getEXT03(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getExt03();
	}
	
	public static String getEXT04(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getExt04();
	}
	public static String getEXT05(final String dictType,final String dictValue){
		Dictionary dict = getDictByTypeAndValue(dictType, dictValue);
		//获取字典记录失败
		Assert.isNotNull(dict, "\u83B7\u53D6\u5B57\u5178\u8BB0\u5F55\u5931\u8D25");
		return dict.getExt05();
	}
	public static String getOptionByType(final String dictType,final String selectValue){
		//获取字典信息失败，原因，字典类型不能为空
		Assert.isNotEmpty(dictType, "\u83B7\u53D6\u5B57\u5178\u4FE1\u606F\u5931\u8D25\uFF0C\u539F\u56E0\uFF0C\u5B57\u5178\u7C7B\u578B\u4E0D\u80FD\u4E3A\u7A7A");
		List<Dictionary> dictList = getDictionariesByType(dictType);
		StringBuffer sb = new StringBuffer();
		sb.append("");
		if(!"".equals(selectValue)){
			for (Dictionary dict : dictList) {
				String name = dict.getDictName();
				String value = dict.getDictValue();
				if (value.equals(selectValue)) {
					sb.append("<option value='" + value + "' selected='true' ");
					sb.append(">" + name + "</option>");
				} else {
					sb.append("<option value='" + value + "'");
					sb.append(">" + name + "</option>");
				}
				
			}
		}else{
			sb.append("<option value=''");
			sb.append(">" + "--\u8BF7\u9009\u62E9--" + "</option>");
			for (Dictionary dict : dictList) {
				String name = dict.getDictName();
				String value = dict.getDictValue();
				sb.append("<option value='" + value + "'");
				sb.append(">" + name + "</option>");
				
			}
		}
		return sb.toString();
				
	}
	
	public static String getDictDesc(final String dictType){
		if(null == dictType || "".equals(dictType)){
			return null;
		}
		return dictItemMap.get(dictType).getDictName();
	}

}

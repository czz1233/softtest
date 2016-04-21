package com.huayun.ssh.system.tld;


import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.huayun.ssh.common.init.DictionaryUtil;

public class DictOptionTag extends TagSupport {

	private static final long serialVersionUID = 3913241592826161110L;

	/**
	 * 构造方法
	 */
	public DictOptionTag() {

	}

	private Object dictType;

	private Object selectValue;

	public Object getDictType() {
		return dictType;
	}

	public void setDictType(final Object dictType) throws JspException {
		this.dictType = ExpressionEvaluatorManager.evaluate("dictType", String.valueOf(dictType), Object.class, this, pageContext);
	}

	public Object getSelectValue() {
		return selectValue;
	}

	public void setSelectValue(final Object selectValue) throws JspException {
		this.selectValue = ExpressionEvaluatorManager.evaluate("selectValue", String.valueOf(selectValue), Object.class, this, pageContext);
	}
	  @Override
	    public int doStartTag() throws JspException {
	        JspWriter out = null;
	        String value = "";
	        try {
	            out = pageContext.getOut();
	            value = DictionaryUtil.getOptionByType(String.valueOf(dictType),selectValue == null?null:String.valueOf(selectValue));
	            out.print( value );
	        } catch ( IOException e ) {
	            e.printStackTrace();
	        } finally {/*
	                    * if(null != out){
	                    * try {
	                    * out.flush();
	                    * out.close();
	                    * } catch (Exception e2) {
	                    * }
	                    * }
	                    */
	        }
	        // doStartTag() 方法返回 SKIP_BODY 。当然其原因是我们的简单日期标记没有正文。  
	        return Tag.SKIP_BODY;
	    }

}

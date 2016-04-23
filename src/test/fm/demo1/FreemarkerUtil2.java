package test.fm.demo1;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huayun.ssh.softtest.model.SoftWare;
import com.huayun.ssh.softtest.model.SoftWareType;
import com.huayun.ssh.softtest.model.TestExample;
import com.huayun.ssh.softtest.model.TestPlan;
import com.huayun.ssh.softtest.model.TestPlanType;
import com.huayun.ssh.system.model.Role;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil2 {
	
	public Template getTemplate(final String name) {
        try {
            // 通过Freemaker的Configuration读取相应的ftl
            Configuration cfg = new Configuration();
            // 设定去哪里读取相应的ftl模板文件
            //cfg.setClassForTemplateLoading(fku.getClass(), "ftl");
            //cfg.setDirectoryForTemplateLoading(new File("D:/workplace/huayun/code/huayun-root/huayun-ssh/src/test/java/com/huayun/ssh/fm/demo1/flt")); 
           // cfg.setDirectoryForTemplateLoading(new File("F:/workplace/huayun/code/huayun-root/huayun-ssh/src/test/java/com/huayun/ssh/fm/demo1/flt")); 
            cfg.setDirectoryForTemplateLoading(new File("F:/workplace/egit/story/src/test/fm/demo1/flt")); 
            // 在模板文件目录中找到名称为name的文件
            Template temp = cfg.getTemplate(name);
            return temp;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	/**
	 * 
	 * @param name
	 * @param param
	 */
    public void print(final String name, final Map<String, Object> param) {
        try {
            // 通过Template可以将模板文件输出到相应的流
            Template temp = this.getTemplate(name);
            temp.process(param, new PrintWriter(System.out));
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * @param name
     * @param param
     * @param path
     * @param outFile
     */
    public void fprint(final String name, final Map<String, Object> param, final String path ,final String outFile) {
    	String rootpath = System.getProperty("user.dir")+path+"/";
        FileWriter out = null;
        try {
            // 通过一个文件输出流，就可以写到相应的文件中，此处用的是绝对路径
	    	File file=new File(rootpath);
	        if (!file.exists()) {//判断文件目录的存在
	        	 file.mkdirs();
	        }
	        System.out.println("生成文件:"+rootpath + outFile);
            out = new FileWriter(new File(rootpath + outFile));
            Template temp = this.getTemplate(name);
            temp.process(param, out);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
					out.close();
				}
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) {
    	
    	Field   fields[] = TestExample.class.getDeclaredFields(); 
    	String className = TestExample.class.getName();
    	
    	
    	Map<String, Object> param = new HashMap<String, Object>();
		List<String> fieldNames = new ArrayList<String>();
		for (int i = 0; i < fields.length; i++) {
			if("serialVersionUID".equals(fields[i].getName())){
				continue;
			}
			if(fields[i].getType().equals(List.class)){
				continue;
			}
			fieldNames.add(fields[i].getName());
		}
		String[] names = className.toString().split("\\.");
		String model = names[names.length-1];
		String pck = names[3];
	//	String pck = "rfid";
    	param.put("model", model);
    	param.put("modelUpperCase", model.toUpperCase());
    	param.put("modelLowerCase", model.toLowerCase());
    	param.put("pkage", pck);
    	param.put("pkageUpperCase", pck.toUpperCase());
    	param.put("pkageLowerCase", pck.toLowerCase());
    	
    	param.put("parentMenuName", "测试管理");
    	param.put("modelName", "软件");
    	param.put("fieldNames", fieldNames);
    	
		FreemarkerUtil2 fku =  new FreemarkerUtil2();
		
		/***=============================权限菜单sql生成开始===========================***/
		param.put("order", 2);
		fku.print("right.sql.flt", param);
		/***=============================权限菜单sql生成结束===========================***/
		
		/***=============================java文件生成开始=============================***/
		fku.fprint("Dao.java.flt", param, "/src/com/huayun/ssh/"+param.get("pkage")+"/dao/impl", param.get("model") +"Dao.java");
		fku.fprint("IDao.java.flt", param, "/src/com/huayun/ssh/"+param.get("pkage")+"/dao", "I" + param.get("model") +"Dao.java");
		
		fku.fprint("Service.java.flt", param, "/src/com/huayun/ssh/"+param.get("pkage")+"/service/impl", param.get("model") +"Service.java");
		fku.fprint("IService.java.flt", param, "/src/com/huayun/ssh/"+param.get("pkage")+"/service", "I" + param.get("model") +"Service.java");
		
		fku.fprint("Controller.java.flt", param, "/src/com/huayun/ssh/"+param.get("pkage")+"/controller", param.get("model") +"Controller.java");
		/***=============================java文件生成结束=============================***/
		
		/***=============================jsp文件生成开始=============================***/
		fku.fprint("list.jsp.flt", param, "/WebRoot/bootstrap/jsp/"+param.get("pkage"), param.get("modelLowerCase") +"_list.jsp");
		fku.fprint("add.jsp.flt", param, "/WebRoot/bootstrap/jsp/"+param.get("pkage"), param.get("modelLowerCase") +"_add.jsp");
		fku.fprint("edit.jsp.flt", param, "/WebRoot/bootstrap/jsp/"+param.get("pkage"), param.get("modelLowerCase") +"_edit.jsp");
		/***=============================jsp文件生成结束=============================***/
		
//		/***=============================js文件生成开始=============================***/
		fku.fprint("list.js.flt", param, "/WebRoot/bootstrap/js/app/"+param.get("pkage"), param.get("modelLowerCase") +"_list.js");
		fku.fprint("add.js.flt", param, "/WebRoot/bootstrap/js/app/"+param.get("pkage"), param.get("modelLowerCase") +"_add.js");
		fku.fprint("edit.js.flt", param, "/WebRoot/bootstrap/js/app/"+param.get("pkage"), param.get("modelLowerCase") +"_edit.js");
		/***=============================jsp文件生成结束=============================***/
		
		
	}

}

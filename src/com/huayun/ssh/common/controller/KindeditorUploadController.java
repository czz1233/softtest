package com.huayun.ssh.common.controller;


import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping(value = "/keupload/*")
public class KindeditorUploadController {

	private final static Logger LOG = LoggerFactory.getLogger(KindeditorUploadController.class);
	
	@RequestMapping(value="/uploadJson")
	public void uploadJson(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = null;
		try{
			out = response.getWriter();
			
			//文件保存目录路径
			String savePath = request.getSession().getServletContext().getRealPath("upload")+"/";

			//文件保存目录URL
			String saveUrl  = request.getContextPath() + "/upload/";
			//String saveUrl  = "http://www.xxxxxx.com/upload/";
			
			//定义允许上传的文件扩展名
			HashMap<String, String> extMap = new HashMap<String, String>();
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
			extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

			//最大文件大小
			long maxSize = 2000000000;

			if(!ServletFileUpload.isMultipartContent(request)){
				out.println(getError("请选择文件。"));
				return;
			}
			//检查目录<如果不存在就创建该目录>
			File uploadDir = new File(savePath);
	        if (!uploadDir.exists() && !uploadDir.isDirectory()){       
	        	uploadDir.mkdir(); 
	        } 
	         
			//检查目录写权限
			if(!uploadDir.canWrite()){
				out.println(getError("上传目录没有写权限。"));
				return;
			}

			String dirName = request.getParameter("dir");
			if (dirName == null) {
				dirName = "image";
			}
			if(!extMap.containsKey(dirName)){
				out.println(getError("目录名不正确。"));
				return;
			}
			//创建文件夹
			savePath += dirName + "/";
			saveUrl += dirName + "/";
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			saveUrl += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> fileList = multipartRequest.getFiles("file");  
			if(!(fileList!=null && fileList.size()!=0)){
				fileList = multipartRequest.getFiles("imgFile"); 
			}
			
			if(fileList!=null && fileList.size()!=0){
				for (MultipartFile myfile : fileList) {
					if(!myfile.isEmpty()){
						String fileName = myfile.getOriginalFilename();
						
						//检查文件大小
						if(myfile.getSize() > maxSize){
							out.println(getError("上传文件大小超过限制。"));
							return;
						}
						//检查扩展名
						String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
						if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
							out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
							return;
						}

						
						SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
						String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
						try{
							File uploadedFile = new File(savePath, newFileName);
							FileUtils.copyInputStreamToFile(myfile.getInputStream(), uploadedFile);
						}catch(Exception e){
							out.println(getError("上传文件失败。"));
							return;
						}
						
						JSONObject obj = new JSONObject();
						obj.put("error", 0);
						obj.put("url", saveUrl + newFileName);
						
						out.println(obj.toJSONString());					
					}
				}  
			}
		}catch(Exception e){
			e.printStackTrace();
			LOG.warn("上传报错"+e.getMessage());
		}
		finally{
			if(out!=null){
				out.flush();
				out.close();				
			}
		}
	}
	
	@RequestMapping(value="/fileManagerJson")
	public void fileManagerJson(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = null;
		try{
			out = response.getWriter();
			//根目录路径，可以指定绝对路径，比如 /var/www/upload/
			String rootPath = request.getSession().getServletContext().getRealPath("upload")+"/";
			//根目录URL，可以指定绝对路径，比如 http://www.xxxxx.com/attached/
			String rootUrl  = request.getContextPath() + "/upload/";
			//String rootUrl  = "http://www.yoursite.com/attached/";
			//图片扩展名
			String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

			String dirName = request.getParameter("dir");
			if (dirName != null) {
				if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
					out.println("Invalid Directory name.");
					return;
				}
				rootPath += dirName + "/";
				rootUrl += dirName + "/";
				File saveDirFile = new File(rootPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			}
			//根据path参数，设置各路径和URL
			String path = request.getParameter("path") != null ? request.getParameter("path") : "";
			String currentPath = rootPath + path;
			String currentUrl = rootUrl + path;
			String currentDirPath = path;
			String moveupDirPath = "";
			if (!"".equals(path)) {
				String str = currentDirPath.substring(0, currentDirPath.length() - 1);
				moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
			}

			//排序形式，name or size or type
			String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

			//不允许使用..移动到上一级目录
			if (path.indexOf("..") >= 0) {
				out.println("Access is not allowed.");
				return;
			}
			//最后一个字符不是/
			if (!"".equals(path) && !path.endsWith("/")) {
				out.println("Parameter is not valid.");
				return;
			}
			//目录不存在或不是目录
			File currentPathFile = new File(currentPath);
			if(!currentPathFile.isDirectory()){
				out.println("Directory does not exist.");
				return;
			}

			//遍历目录取的文件信息
			List<Hashtable> fileList = new ArrayList<Hashtable>();
			if(currentPathFile.listFiles() != null) {
				for (File file : currentPathFile.listFiles()) {
					Hashtable<String, Object> hash = new Hashtable<String, Object>();
					String fileName = file.getName();
					if(file.isDirectory()) {
						hash.put("is_dir", true);
						hash.put("has_file", (file.listFiles() != null));
						hash.put("filesize", 0L);
						hash.put("is_photo", false);
						hash.put("filetype", "");
					} else if(file.isFile()){
						String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
						hash.put("is_dir", false);
						hash.put("has_file", false);
						hash.put("filesize", file.length());
						hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
						hash.put("filetype", fileExt);
					}
					hash.put("filename", fileName);
					hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
					fileList.add(hash);
				}
			}

			if ("size".equals(order)) {
				Collections.sort(fileList, new SizeComparator());
			} else if ("type".equals(order)) {
				Collections.sort(fileList, new TypeComparator());
			} else {
				Collections.sort(fileList, new NameComparator());
			}
			JSONObject result = new JSONObject();
			result.put("moveup_dir_path", moveupDirPath);
			result.put("current_dir_path", currentDirPath);
			result.put("current_url", currentUrl);
			result.put("total_count", fileList.size());
			result.put("file_list", fileList);

			
			out.println(result.toJSONString());				
		}catch(Exception e){
			LOG.warn("上传报错"+e.getMessage());
		}finally{
			if(out!=null){
				out.flush();
				out.close();				
			}
		}
	}
	
	public class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
			}
		}
	}
	
	public class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
					return 1;
				} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}
	
	public class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
			}
		}
	}

	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}
}

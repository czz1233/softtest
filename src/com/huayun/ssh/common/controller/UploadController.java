package com.huayun.ssh.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.util.ArrayUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.DateUtil;

@Controller
@RequestMapping("file")
public class UploadController extends BaseController{

	/**
	 * 构造方法
	 */
	public UploadController() {
		
		
	}
	
	private final static String imagePath = "upload" + File.separator +"images";
	private final static String[] imageFileType = {"png","jpg"};
	/**
	 * 
	 * @param file
	 * @param fileType image
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public @ResponseBody JSONObject uploadFile(@RequestParam final MultipartFile file,String fileType,HttpServletRequest request) throws IOException{
		JSONObject json = new JSONObject();
		Assert.isNotNull(file, "请选择要上传的文件");
		long fileSize = file.getSize();
		Assert.isTrue(fileSize < 1024 * 1024 * 1024, "文件内容太大，允许文件大小为1GB");
		String fileName = file.getOriginalFilename();
		String fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1).trim();
		String[] fileSuffixArr = null;
		String realPath = null;
		if("image".equals(fileType)){
			fileSuffixArr = imageFileType;
			realPath = 	imagePath;
			Assert.isTrue(ArrayUtil.isArrayContains(fileSuffixArr, fileSuffix), "请选择正确的文件类型，允许的文件类型为：" + ArrayUtil.arrayToString(fileSuffixArr));
		}
		if(realPath == null){
			realPath = "other";
		}
		realPath = realPath + File.separator + DateUtil.formatDate(new Date(), "yyyyMMdd") + File.separator;
		String phyPath = request.getSession().getServletContext().getRealPath(realPath);
		
		 File f1 =new File(realPath);
         //如果文件夹不存在则创建    
         if (!f1.exists() && !f1.isDirectory())      
         {       
             f1.mkdir(); 
         } 
        String realFileName = UUID.randomUUID() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(phyPath,realFileName)); 
        String path = realPath + realFileName;
        json.put("ok", true);
        json.put("path", path);
		return json;
	}

}

package com.zs.pms.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Administrator
 *  普通文件上传
 *  
 */
@Controller
public class UploadController {
@RequestMapping("/upload/common.do")
@ResponseBody
	public String uploadFile(MultipartFile file,HttpServletRequest req){
	//获得upload文件上传的物理路径
	String path=req.getRealPath("/upload");
	//创建新文件名  目标文件
	//利用UUID算法生成32 位 码
	/**
	 * uuid算法
	 * 根据网卡、时间、IP地址等信息
	 * 自动生成绝对不重复的32位码
	 */
	UUID uuid=UUID.randomUUID();
	//目标文件名  32位码+文件后缀（源文件的原声文件名）
	String destfilename=uuid.toString()+file.getOriginalFilename();
	//创建新文件   物理路径+新文件名
	//url:upload/新文件名
	File destFile=new File(path+File.separator+destfilename);
	try {
		//将原始文件拷贝到新文件
		file.transferTo(destFile);
		return destfilename;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return "ERROR";
	}
	
	}
}

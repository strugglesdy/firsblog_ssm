package com.blog.controller.upload;

import com.blog.util.ReturnUtil;
import com.blog.util.qiniu.QiniuUploadManager;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @ClassName: UploadController
 * @Description: TODO(后台上传图片 layedit)
 * @author yuf
 * @date 2017年9月28日 上午10:12:14
 *
 */

@Controller("uploadController")
@RequestMapping("/upload")
public class UploadController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());


	// 默认文件格式
	private final String DEFAULT_IMAGE_FORT = "png";

/**
	 *
	 * @Title: uploadImage
	 * @Description: TODO(普通上传文件)
	 * @param request
	 * @return ModelMap
	 */

	@RequestMapping("/uploadImage")
	@ResponseBody
	public ModelMap uploadImage(HttpServletRequest request) {
		// 上传文件的解析器
		CommonsMultipartResolver mutiparRe = new CommonsMultipartResolver();
		// 如果是文件类型的请求
		if (!mutiparRe.isMultipart(request)) {
			return ReturnUtil.Error("文件类型错误");
		}
		MultipartHttpServletRequest mhr = (MultipartHttpServletRequest) request;
		// 迭代文件所有的文件名称
		Iterator<String> fileNamesIterator = mhr.getFileNames();
		ArrayList<String> urlList = new ArrayList<String>();
		while (fileNamesIterator.hasNext()) {
			// 获取文件
			MultipartFile file = mhr.getFile(fileNamesIterator.next());
			// 获取文件后缀名
			String suffix = getFileSuffix(file.getOriginalFilename());
			try {
				String url = QiniuUploadManager.getInstance().uploadImage(file.getBytes(), suffix);
				logger.info("url=" + url);
				urlList.add(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ReturnUtil.Success("上传成功", urlList, null);
	}

/**
	 *
	 * @Title: uploadImageForEdit
	 * @Description: TODO(单文件上传图片 给layerEdit)
	 * @param request
	 * @return ModelMap
	 */

	@RequestMapping("/uploadImageForEdit")
	@ResponseBody
	public String uploadImageForEdit(HttpServletRequest request) {
		// 上传文件的解析器
		CommonsMultipartResolver mutiparRe = new CommonsMultipartResolver();
		// 如果是文件类型的请求
		if (!mutiparRe.isMultipart(request)) {
			return returnJson(1, "上传成功", null, "");
		}
		MultipartHttpServletRequest mhr = (MultipartHttpServletRequest) request;
		// 迭代文件所有的文件名称
		Iterator<String> fileNamesIterator = mhr.getFileNames();
		ArrayList<String> urlList = new ArrayList<String>();
		while (fileNamesIterator.hasNext()) {
			// 获取文件
			MultipartFile file = mhr.getFile(fileNamesIterator.next());
			// 获取文件后缀名
			String suffix = getFileSuffix(file.getOriginalFilename());
			try {
				String url = QiniuUploadManager.getInstance().uploadImage(file.getBytes(), suffix);
				logger.info("url=" + url);
				urlList.add(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return returnJson(0, "上传成功", urlList, "");
	}

/**
	 * 获取文件后缀名
	 *
	 * @param fileName
	 * @return
	 */

	private String getFileSuffix(String fileName) {
		if (StringUtils.isBlank(fileName)) {
			return DEFAULT_IMAGE_FORT;
		}
		if (fileName.endsWith(".png") || fileName.endsWith(".jpeg") || fileName.endsWith(".jpg")) {
			return DEFAULT_IMAGE_FORT;
		}
		return DEFAULT_IMAGE_FORT;
	}

/**
	 *
	 * @Title: returnJson
	 * @Description: TODO(回显的json数据,与layedit配套使用)
	 * @param code
	 *            0成功 其他失败
	 * @param msg
	 * @param urlList
	 * @param title
	 * @return String
	 */

	private String returnJson(Integer code, String msg, ArrayList<String> urlList, String title) {
		// 默认获取第一个路径
		String src = urlList != null && urlList.size() > 0 ? urlList.get(0) : "";

		StringBuilder sb = new StringBuilder();
		sb.append("{").append("\"code\":").append(code).append(",");
		sb.append("\"msg\":\"").append(msg).append("\",");
		sb.append("\"data\":{");
		sb.append("\"src\":\"").append(src).append("\",");
		sb.append("\"title\":\"").append(title);
		sb.append("\"}}");
		return sb.toString();
	}
}

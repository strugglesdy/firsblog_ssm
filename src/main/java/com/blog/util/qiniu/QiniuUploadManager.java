package com.blog.util.qiniu;

import ch.qos.logback.classic.Level;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.UUID;

/**
 * 七牛云图片上传管理类
 * @author sunjichang  
 * @date 2017年8月1日下午9:06:07
 * @version 1.0
 * @upate 
 */
public class QiniuUploadManager {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//七牛云accessKey
	private final String ACCESS_KEY = "tsrnQTiKhEPOVwgUFiIHrW6OYlxs62BFEVq-rieI";
	//七牛云SecretKey
	private final String SECRET_KEY = "4Y7_bStRSCb7lGyI-6ySFFMAxaZz4Y89jfKvbOzC";
	//仓库名称
	private final String BUCKET_NAME = "strugglesdyy";
	//访问域名地址
	private final String URL = "http://ozsu4skhk.bkt.clouddn.com/";
	private static QiniuUploadManager mInstance;
	//上传管理对象
	private UploadManager uploadManager;
	private static class InstanceHolder{
		private static QiniuUploadManager INSTANCE = new QiniuUploadManager();
	} 
	
	/**
	 * 获取实例对象
	 * @return
	 */
	public static QiniuUploadManager getInstance(){
		if(null == mInstance){
			mInstance = InstanceHolder.INSTANCE;
		}
		return mInstance;
	}
	
	/**
	 * 私有构造函数
	 */
	private QiniuUploadManager(){
		//构造一个带指定Zone对象的配置类
		//Zone.zone0() 华东机房
		//Zone.zone1() 华北机房
		//Zone.zone2() 华南机房
		//Zone.zoneNa0() 北美机房
		Configuration cfg = new Configuration(Zone.zone2());
		uploadManager = new UploadManager(cfg);
	} 
	
	/**
	 * 上传图片到七牛云
	 * @param datas 数据流
	 * @param suffix 图片后缀名
	 */
	public String uploadImage(byte[] datas,String suffix){
	    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	    String upToken = auth.uploadToken(BUCKET_NAME); 
	    String fileName = obtainFileKey(suffix);
	    try {
	        Response response = uploadManager.put(datas, fileName, upToken);
	        //解析上传成功的结果
	        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
	        logger.info(String.valueOf(Level.DEBUG), "resultKey="+putRet.key+",hash="+putRet.hash);
	        return URL+fileName;
	    } catch (QiniuException ex) {
	        Response r = ex.response;
	        logger.error(r.toString());
	        try {
	        	logger.info(String.valueOf(Level.DEBUG), r.bodyString());
	        } catch (QiniuException ex2) {
	            //ignore
	        }
	    }
	    return null;
	}
	
	/**
	 * 获取文件名
	 * @param format
	 * @return
	 */
	private String obtainFileKey(String format){
		String key = obtainKey();
		return key+"."+format;
	}
	
	/**
	 * 生成32的uuid key
	 * @return
	 */
	private String obtainKey(){
		UUID uuid = UUID.randomUUID(); 
		return uuid.toString().replace("-", ""); 
	}
}

package com.blog.util;


import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.ModelMap;

/**
 *
* @ClassName: ReturnUtil
* @Description: TODO(后台返回格式)
* @author yuf
* @date 2017年9月22日 上午9:03:04
*
 */
public class ReturnUtil {

	/**
	 *
	* @Title: Success
	* @Description: TODO(成功)
	* @param msg 消息
	* @param obj 返回结果
	* @param referer 刷新
	* @return
	* ModelMap
	 */
	public static ModelMap Success(String msg, Object obj, String referer) {
		msg = StringUtils.isEmpty(msg) || StringUtils.isBlank(msg) ? "操作成功" : msg;

		ModelMap mp = new ModelMap();
		mp.put("status", 1);
		mp.put("state", "success");
		mp.put("msg", msg);
		mp.put("referer", referer);
		mp.put("result", obj);
		return mp;
	}

	/**
	 *
	* @Title: Error
	* @Description: TODO(失败)
	* @param msg 消息
	* @param obj 返回结果
	* @param referer 刷新
	* @return
	* ModelMap
	 */
	public static ModelMap Error(String msg, Object obj, String referer) {
		msg = StringUtils.isEmpty(msg) || StringUtils.isBlank(msg) ? "操作失败" : msg;
		ModelMap mp = new ModelMap();
		mp.put("status", 0);
		mp.put("state", "error");
		mp.put("msg", msg);
		mp.put("referer", referer);
		mp.put("result", obj);
		return mp;
	}

	/**
	 *
	* @Title: Success
	* @Description: TODO(成功只返回消息)
	* @param msg
	* @return
	* ModelMap
	 */
	public static ModelMap Success(String msg) {
		return Success(msg, null, null);
	}

	/**
	 *
	* @Title: Error
	* @Description: TODO(失败只返回消息)
	* @param msg
	* @return
	* ModelMap
	 */
	public static ModelMap Error(String msg) {
		return Error(msg, null, null);
	}
}

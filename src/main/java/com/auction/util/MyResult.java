package com.auction.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyResult {


	// 定义json对象
	private static final ObjectMapper MAPPER = new ObjectMapper();

	/**
	 * 格式化返回数据
	 * @return
	 */

	public static Object getResult(int status,String error,Object data){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("error", error);
		map.put("data", data);
		return map;
	}
	/**返回成功的结果
	 * @return
	 */
	public static Object getResult(){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("status", 1);
		map.put("error", "");
		map.put("data", "");
		return map;
	}
	/**成功，并有返回值
	 * @param data
	 * @return
	 */
	public static Object getResult(Object data){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("status", 1);
		map.put("error", "");
		map.put("data", data);
		return map;
	}
	public static Object getResultParmNull(){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("status", 0);
		map.put("error", "参数为空！");
		map.put("data", "");
		return map;
	}
//@xiechur
	private Integer status;
	private String error;
	private Object data;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}


	public MyResult(){
		super();
	}
	public MyResult(int status, String error, Object data) {
		this.status=status;
		this.error = error;
		this.data=data;
	}

	public static MyResult build(int status, String error, Object data) {
		return new MyResult(status, error, data);
	}

	/**
	 * 将json结果集转化为Message对象
	 *
	 * @param jsonData json数据
	 * @param clazz Message中的object类型
	 * @return
	 * @xiechur
	 */
	public static MyResult formatToPojo(String jsonData, Class<?> clazz) {
		try {
			if (clazz == null) {
				return MAPPER.readValue(jsonData, MyResult.class);
			}
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (clazz != null) {
				if (data.isObject()) {
					obj = MAPPER.readValue(data.traverse(), clazz);
				} else if (data.isTextual()) {
					obj = MAPPER.readValue(data.asText(), clazz);
				}
			}
			return build(jsonNode.get("status").intValue(), jsonNode.get("error").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 没有object对象的转化
	 *
	 * @param json
	 * @return
	 */
	public static MyResult format(String json) {
		try {
			return MAPPER.readValue(json, MyResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Object是集合转化
	 *
	 * @param jsonData json数据
	 * @param clazz 集合中的类型
	 * @return
	 */
	public static MyResult formatToList(String jsonData, Class<?> clazz) {
		try {
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (data.isArray() && data.size() > 0) {
				obj = MAPPER.readValue(data.traverse(),
						MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
			}
			return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}

}

package com.huayun.ssh.common.util;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;


/**
 * 
 * @Project       : idc-bsm
 * @Program Name  : com.dhcc.idc.common.util.JsonUtil.java
 * @Description   : jackson json util
 * @Author        :  <a href="mailto:baiwei@dhcc.com">白伟</a>
 * @Creation Date : 2014-9-1 上午11:27:17
 */
public class JsonUtil {
	private static final ObjectMapper objectMapper = new ObjectMapper();

	
	
	public static JsonNode getJsonNode(final Object fromValue) {
		return objectMapper.convertValue(fromValue, JsonNode.class);
	}

	public static ObjectNode getObjectNode() {
		return objectMapper.createObjectNode();
	}
	
	public static ObjectNode getErrorObjectNode(final String errorMsg) {
		ObjectNode root =  objectMapper.createObjectNode();
		root.put("ok", false);
		root.put("msg", errorMsg);
		return root;
	}
	
	public static ArrayNode getArrayNode() {
		return objectMapper.createArrayNode();
	}

	public static ObjectNode getObjectNode(final String inpuet) {
		try {
			return objectMapper.readValue(inpuet, ObjectNode.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getObjectNode();
	}

	/**
	 * 统计虚拟机状态
	 * @param json
	 * @return
	 */
	public static ArrayNode getServerStateCout(final String json){
		ArrayNode array = objectMapper.createArrayNode();
		Map<String,Integer> maps = new HashMap<String, Integer>();
		try {
			JsonNode root = objectMapper.readValue(json, JsonNode.class);
			JsonNode servers = root.path("servers");
			if (null != servers && !servers.isNull()){
				for (Iterator<JsonNode> it = servers.iterator(); it.hasNext();){
					JsonNode server = it.next();
					String status = server.path("status").asText();
					if (maps.containsKey(status)) {
						maps.put(status, maps.get(status)+1);
					} else {
						maps.put(status,1);
					}
				}
			}
			Set<Entry<String, Integer>>  set = maps.entrySet();
			for (Entry<String, Integer> entry : set) {
				 ObjectNode data = objectMapper.createObjectNode();
				 data.put("state",entry.getKey());
				 data.put("count",entry.getValue());
				 array.add(data);
			}
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}
	
	
	public static <T> T jsonToBean(final String json, final Class<T> classs) {
		try {
			return objectMapper.readValue(json, classs);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public static HashMap<String, Object> jsonToMap(final String json) {
		try {
			TypeReference<HashMap<String, Object>> typeRef = new TypeReference<HashMap<String, Object>>() {
			};
			return objectMapper.readValue(json, typeRef);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}



}

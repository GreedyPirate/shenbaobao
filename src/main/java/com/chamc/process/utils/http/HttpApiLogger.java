package com.chamc.process.utils.http;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

public class HttpApiLogger {

	private static final Logger LOGGER = LoggerFactory.getLogger("http-api");
	
	public static void beforeInvoke(String apiUrl, String method, String params) {
		LOGGER.info("API["+apiUrl+"]["+method+"] params["+params+"]");
	}
	
	public static void beforeInvoke(String apiUrl, String method, String params, Map<String, String> headers) {
		LOGGER.info("API["+apiUrl+"]["+method+"] params["+params+"] header["+headers+"]");
	}

	public static void beforeInvoke(String apiUrl, String method, Map<String, Object> params, Map<String, String> headers) {
		LOGGER.info("API["+apiUrl+"]["+method+"] params["+params+"] header["+headers+"]");
	}

	public static void afterInvoke(String apiUrl, String result, long time) {
		LOGGER.info("API["+apiUrl+"] response:"+result+" used time:"+time);
	}
	
}
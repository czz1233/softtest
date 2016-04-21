package com.huayun.ssh.common.util;


import java.util.Arrays;
import java.util.List;

public class ArrayUtil {
	
	public static boolean isArrayContains(String[] arr, String targetValue) {
		List<String> list = Arrays.asList(arr);
	    if(list.contains(targetValue)){
	    	return true;
	    }
	    return false;
	}
	
	public static String arrayToString(String[] arr){
		String value = "";
		if(arr != null && 0 < arr.length){
			for (int i = 0; i < arr.length; i++) {
				value = value + arr[i] + " ";
			}
		}
		return value;
	}
	
}

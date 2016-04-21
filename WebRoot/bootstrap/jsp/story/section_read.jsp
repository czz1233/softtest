<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">阅读章节：${section.sname}</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			${section.section}
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_section">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
var getCookie=function(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]); 
    else 
        return null; 
};
var etCookie=function(name,value){
	var Days = 30; 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
};
var loadDiv=function(url,nav1,nav2,aid){
	if(url != null && url != "" && typeof(url) != 'undefined'){
		$("#main-content").load(url);
		setCookie("vurl",url);
	}
	if(nav1 != null && nav1 != "" && typeof(nav1) != 'undefined'){
		setCookie("nav1",nav1);
		$("#nav-level1").html(nav1);
	}
	if(nav2 != null && nav2 != "" && typeof(nav2) != 'undefined'){
		setCookie("nav2",nav2);
		$("#nav-level2").html(nav2);
	}
	if(aid != null && aid != "" && typeof(aid) != 'undefined'){
		setCookie("aid",aid);
		$("#" + aid).parent("li").addClass("active");
		$("#" + aid).parent("li").parent("ul").parent("li").addClass("active");
		$("#" + aid).parent("li").parent("ul").parent("li").addClass("open");
	}
};
var cancelRecord=function(){
	var aid = getCookie("aid");
	if(aid != null && "" != aid && typeof(aid) != 'undefined'){
		var url = $("#" + aid).attr("vurl");
		var vnav1 = $("#" + aid).attr("vnav1");
		var vnav2 = $("#" + aid).attr("vnav2");
		url = basePath + url;
		loadDiv(url,vnav1,vnav2,aid);
	}
};
$(function(){
	$("#btn_cancel_section").click(function(){
		cancelRecord();
	});
});
</script>
/*
 * 公共设置
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	moudle.exports = {
			ajaxErrorHandle:function(xhr, textStatus, errorThrown){
				var result = {};
				try{
					result = jQuery.parseJSON(xhr.responseText);
				}catch(e){console.log(e);}
	            switch (xhr.status) {
	            case 100:break;
	            case 200:break;
	            case 201:break;
	            case 202:break;
	            case 203:break;
	            case 204:break;
	            case 400:
	            	try{
	            		if (result && result.badRequest && result.badRequest.message) {
							util.showMsg("error","错误提示",result.badRequest.message);
						}else if(result && result.moreInfo){
							util.showMsg("error","错误提示",result.moreInfo);
						} else if(result && result.error_message && result.error_message.faultstring){
							util.showMsg("error","错误提示",result.error_message.faultstring);
						} else if(result && result.message){
							result = jQuery.parseJSON(result.message);
							if(result.badRequest.message) {
								module.exports.notifyError(result.badRequest.message);
								util.showMsg("error","错误提示",result.badRequest.message);
							} else {
								util.showMsg("error","错误提示",result);
							}
						} else {
							util.showMsg("error","错误提示","400:请求发生错误,请填写正确的表单数据，校验数据格式");
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}
	            	
	                break;
	            case 401:
	            	if(result && result.moreInfo){
						module.exports.notifyError(result.moreInfo);
						util.showMsg("error","错误提示",result.moreInfo);
					} else {
						util.showMsg("error","错误提示","你访问的地址未授权，请联系管理员授权后访问");
					}
	            	
	                break;
	            case 403:
	            	try{
	            		if (result.msg) {
	            			util.showMsg("error","错误提示",result.msg);
						} else if(result && result.moreInfo){
							util.showMsg("error","错误提示",result.moreInfo);
						} else {
							util.showMsg("error","错误提示",'禁止访问');
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}
	                break;
	            case 404:
	            	if(result && result.moreInfo){
	            		util.showMsg("error","错误提示",result.moreInfo);
					} else if(result && result.error_message && result.error_message.faultstring){
						util.showMsg("error","错误提示",result.error_message.faultstring);
					} else {
						util.showMsg("error","错误提示",'网络连接失败，或访问的地址已经删除');
					}
	            	
	                break;
	            case 405:
	            	util.showMsg("error","错误提示",'访问的方法不允许');
	                break;
	            case 409:
	            	try{
	            		if (result.conflictingRequest && result.conflictingRequest.message) {
	            			util.showMsg("error",result.conflictingRequest.message);
						} else if(result && result.error_message && result.error_message.faultstring){
							util.showMsg("error",result.error_message.faultstring);
						} else {
							util.showMsg("error","错误提示",'请求冲突');
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}
	                break;
	            case 413:
	            	try{
	            		if (result.overLimit && result.overLimit.message) {
	            			util.showMsg("error","错误提示",result.overLimit.message);
						} else {
							util.showMsg("error","错误提示",'资源达上限');
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}
	                break;
	            case 422:
	            	try{
	            		if (result && result.computeFault && result.computeFault.message) {
	            			util.showMsg("error","错误提示",result.computeFault.message);
						} else {
							util.showMsg("error","错误提示",'请求错误,不能解析实体');
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}
	            	
	                break;
	            case 500:
	            	try{
	            		if(result instanceof Array ) {
	            			console.log(result[0].msg);
	            		}
	            		if (result && result.msg) {
	            			util.showMsg("error","错误提示",result.msg);
						} else if (result && result.message && result.moreInfo) {
							util.showMsg("error","错误提示",result.message + ": " + result.moreInfo);
						} else if (result && result.message) {
							util.showMsg("error","错误提示",result.message);
						} else if (result && result.computeFault && result.computeFault.message) {
							util.showMsg("error","错误提示",result.computeFault.message);
						} else if (result && result.errorMsg) {
							util.showMsg("error","错误提示",result.errorMsg);
						} else if(result && result.moreInfo){
							util.showMsg("error","错误提示",result.moreInfo);
						} else {
							util.showMsg("error","错误提示",'系统未知错误');
						}
	            	}
	            	catch(e){
	            		console.error(e);
	            	}

	                break;
	            default:
	            	util.showMsg("error","错误提示",'请求错误');
	            }
	            return false;
	        
			},
			ajaxSetup:function(){
				$.ajaxSetup({
					cache:false,
					error:moudle.exports.ajaxErrorHandle,
					beforeSend:function(XMLHttpRequest) {
						util.disableAllButton();
						util.showLoding();
					},
					complete:function(XMLHttpRequest, textStatus) {
						util.enableAllButton();
						util.hideLoading();
					}
			    });
			},
			checkBoxSet:function(){
				$("body").delegate("table th input:checkbox", "click", function(){
				    var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
				
				$("body").delegate("table:not(.normal) tbody tr", "dblclick", function(){
					var that = this;
					$(this).closest('table').find('th input:checkbox').prop("checked", false);
					
					$(this).find('td:first-child input:checkbox').prop("checked", true);
					$(this).siblings().find('td:first-child input:checkbox').prop("checked", false);
					
				});
				
				
				$("body").delegate("table:not(.normal) td input:checkbox", "click", function(){
					$(this).closest('tr').siblings().find('td:first-child input:checkbox').prop("checked", false);
				});
				
				
				$("body").delegate(".btn-cancel", "click", function(event){
					var opendiv = $(event.currentTarget).parents(".open-div");
					if(opendiv.length > 0){
						opendiv.first().html("");
						opendiv.first().next().fadeIn("slow");
					}
				});
			},
			init:function(){
				moudle.exports.ajaxSetup();
				moudle.exports.checkBoxSet();
			}
	}
});

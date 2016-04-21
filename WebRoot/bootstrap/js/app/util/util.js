/*
 * 工具类
 */
define(function(require, exports, moudle) {
	moudle.exports = {
			/**
			 * @param type 消息类型 error 或者 warning
			 * @param title 消息提示框标题
			 * @param msg 提示信息
			 */
			showMsg:function(type,title,msg){
				var param = {
						"title":title,
						"text":msg,
						"time":3000,
						//"class_name":"gritter-warning gritter-light"
						"class_name":"gritter-primary gritter-light"
				};
				if("success" == type){
					param.class_name = "gritter-success gritter-light";
					param.image = basePath + "bootstrap/image/ok.ico";
				}else if("warning" == type){
					param.class_name = "gritter-warning gritter-light";
					param.image = basePath + "bootstrap/image/warning.ico";
				}else if("error" == type){
					param.class_name = "gritter-error gritter-light";
					param.image = basePath + "bootstrap/image/error.ico";
				}
				$.gritter.add(param);
			},
			/**
			 * @param str 字符串
			 * 将字符串前后空白去除掉
			 */
			trim:function(str){
				return s.replace(/(^\s*)|(\s*$)/g, "");
			},
			/**
			 * @returns 浏览器信息
			 */
			getBrowser:function(){
			    var ua=window.navigator.userAgent,
			        ret="";
			    if(/Firefox/g.test(ua)){
				    ua=ua.split(" ");
				    ret="Firefox|"+ua[ua.length-1].split("/")[1];
			    }else if(/MSIE/g.test(ua)){
				    ua=ua.split(";");
				    ret="IE|"+ua[1].split(" ")[2];
			    }else if(/Opera/g.test(ua)){
			   		ua=ua.split(" ");
			   	    ret="Opera|"+ua[ua.length-1].split("/")[1];
			    }else if(/Chrome/g.test(ua)){
			   		 ua=ua.split(" ");
			    	 ret="Chrome|"+ua[ua.length-2].split("/")[1];
			    }else if(/^apple\s+/i.test(navigator.vendor)){
			    	ua=ua.split(" ");
			    	ret="Safair|"+ua[ua.length-2].split("/")[1];
			    }else{
			        ret="unkonw";
			    }
			    return ret;
			},
			showLoding:function(){
				var height = $(window).height() > $("body").height() ? $(window).height() : $("body").height();
				
				$("<div style='z-index:999' class='datagrid-mask'></div>").css({display:"block",width:"100%",height:height}).appendTo("body"); 
			    $("<div style='z-index:999' class='datagrid-mask-msg'></div>").html("正在处理，请稍候......").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2}); 
			},
			hideLoading:function(){
				$(".datagrid-mask").remove(); 
			    $(".datagrid-mask-msg").remove();  
			},
			disableAllButton:function(){
				$("button").each(function(){
					$(this).attr("disabled", "disabled");
				});
				$("input[type='button']").each(function(){
					$(this).attr("disabled", "disabled");
				});
				$("a").each(function(){
					$(this).attr("disabled", "disabled");
				});
				
			},
			enableAllButton:function(){
				$("button").each(function(){
					$(this).removeAttr("disabled");
				});
				$("input[type='button']").each(function(){
					$(this).removeAttr("disabled");
				});
				$("a").each(function(){
					$(this).removeAttr("disabled");
				});
			},
			slimScrollDiv:function(divId,height){
	    		$('#' + divId).slimScroll({
	    			height: height + 'px'
	    		});
			},
			showOperateDiv:function(div,url,data){
				$("#"+div).slideUp("slow",function(){
					$("#"+div).load(url,data,function(){
						$("#"+div).slideDown("slow",function(){
							
						});
					});			
				});
				
			},
			hiddenOperateDiv:function(div){
				$("#"+div).slideUp("slow",function(){
					$("#"+div).html("");
				});
			},
			init:function(){
				//moudle.exports.listener();
			}
	}
});

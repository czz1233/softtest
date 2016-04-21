/*
 * 页面加载设置
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var cookieUtil = require("util/cookieUtil")
	moudle.exports = {
			loadDiv:function(url,nav1,nav2,aid){
				if(url != null && url != "" && typeof(url) != 'undefined'){
					$("#main-content").load(url);
					cookieUtil.setCookie("vurl",url);
				}
				if(nav1 != null && nav1 != "" && typeof(nav1) != 'undefined'){
					cookieUtil.setCookie("nav1",nav1);
					$("#nav-level1").html(nav1);
				}
				if(nav2 != null && nav2 != "" && typeof(nav2) != 'undefined'){
					cookieUtil.setCookie("nav2",nav2);
					$("#nav-level2").html(nav2);
				}
				if(aid != null && aid != "" && typeof(aid) != 'undefined'){
					cookieUtil.setCookie("aid",aid);
					$("#" + aid).parent("li").addClass("active");
					$("#" + aid).parent("li").parent("ul").parent("li").addClass("active");
					$("#" + aid).parent("li").parent("ul").parent("li").addClass("open");
				}
			},
			load:function(url,data,callback){
				$("#main-content").load(url,data);
			},
			confirm:function(title,content,callBack){
				gDialog.fConfirm(title,content,function(rs){
					if(rs && typeof(callBack) == 'function'){
						callBack();
					}
				});
			}
			
	}
});

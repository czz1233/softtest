/*
 * 公共设置
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var winUtil = require("util/winUtil");
	var cookieUtil = require("util/cookieUtil");
	var loadUtil = require("util/loadUtil");
	var common = require("common/common");
	moudle.exports = {
			menuInit:function(){
				$(".submenu").find("a").click(function(){
					$(".active").removeClass("active");
					$(".open").removeClass("open");
					var aid = $(this).attr("id");
					var url = $(this).attr("vurl");
					var vnav1 = $(this).attr("vnav1");
					var vnav2 = $(this).attr("vnav2");
					url = basePath + url;
					loadUtil.loadDiv(url,vnav1,vnav2,aid);
				});
			},
			loginExit:function(){
				$("#login_exit").click(function(){
					winUtil.confirm("操作提示","您确定退出系统吗？",function(){
						var url = basePath + "common/login/exit";
						$.ajax({
							url:url,
							type:"GET",
							dataType:"JSON",
							success:function(data){
								if(data.ok){
									window.open(basePath,"_self");
								}
							}
						});
					});
				});
			},
			updatePassword:function(){
				$("#password_update").click(function(){
					var url = basePath + "bootstrap/jsp/common/password_update.jsp";
					var param = {
							"title":"密码修改",
							"width":"600",
							"url":url
					}
					winUtil.window(param);
				});
			},
			pageInit:function(){
				var aid = cookieUtil.getCookie("aid");
				var url = cookieUtil.getCookie("vurl");
				var vnav1 = cookieUtil.getCookie("nav1");
				var vnav2 = cookieUtil.getCookie("nav2");
				loadUtil.loadDiv(url,vnav1,vnav2,aid);
			},
			init:function(){
				common.init();
				moudle.exports.menuInit();
				moudle.exports.loginExit();
				moudle.exports.updatePassword();
				moudle.exports.pageInit();
			}
	}
});

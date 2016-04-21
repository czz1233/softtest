/*
 * 公共设置
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var common = require("common/common");
	var formUtil = require("util/formUtil");
	var winUtil = require("util/winUtil");
	moudle.exports = {
			accountId:"#account_input_id",
			passwordId:"#password_input_id",
			login:function(){
				var account = $(moudle.exports.accountId).val();
				var password = $(moudle.exports.passwordId).val();
				if(account == null || "" == account){
					util.showMsg("error","登陆提示","请输入用户名");
					$(moudle.exports.accountId).focus();
					return false;
				}
				if(password == null || "" == password){
					util.showMsg("error","登陆提示","请输入密码");
					$(moudle.exports.passwordId).focus();
					return false;
				}
				var browser = moudle.exports.browser();
				var url = basePath + "common/login";
				$.ajax({
					url: url,
					data: {'account':account,"password":password,"browser":browser},
					dataType: "JSON",
					type: "POST",
					success: function(data){
						if(data.ok){
							window.location.href = basePath + "bootstrap/jsp/common/main.jsp";	
						}
					}
				});
				
			},
			browser:function(){
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
			    return ret.split("|").toString();
			},
			validateLoginForm:function(){
				var rules = {
								account:{required: true},
								password:{required: true}
							};			
				formUtil.validateForm(moudle.exports.loginForm,rules,{});
			},
			showRegist:function(){
				var url = basePath + "bootstrap/jsp/common/regist.jsp";
				var param = {
						"title":"注册账号",
						"width":"800",
						"url":url
				}
				winUtil.window(param);
			},
			listener:function(){
				var items = [
				             {id: '#regist_button',click:moudle.exports.showRegist},
				             {id: '#login_button',click:moudle.exports.login}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
				 document.onkeydown=function(event){
			         var e = event || window.event || arguments.callee.caller.arguments[0];
			          if(e && e.keyCode==13){ 
			        	  moudle.exports.login();
			         }
			     };
			},
			init:function(){
				common.init();
				moudle.exports.listener();
			}
	}
});

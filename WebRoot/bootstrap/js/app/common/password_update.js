define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"password_update_form",
			addRecord:function(){
				moudle.exports.validateAddForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				var oldPwd = $("#oldPwd").val();
				var newPwd1 = $("#newPwd1").val();
				var newPwd2 = $("#newPwd2").val();
				if(newPwd1 != newPwd2){
					util.showMsg("error","操作失败","两次输入的密码不相同");
					return false;
				}
				$.ajax({
					url: basePath + "system/account/updatepwd",
					data:{"oldPwd":oldPwd,"newPwd":newPwd1},
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","修改密码成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateAddForm:function(){
				var rules = {				
									oldPwd:{required: true,maxlength:16},
									newPwd1:{required: true,maxlength:16},
									newPwd2:{required: true,maxlength:16}
								
							};			
				formUtil.validateForm(moudle.exports.formID,rules,{});
			},
			cancelRecord:function(){
				winUtil.close();
			},
			listener:function(){
				var items = [
				             {id: '#button_ok',click:moudle.exports.addRecord},
				             {id: '#button_cancel',click:moudle.exports.cancelRecord}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
			},
			init:function(){
				moudle.exports.listener();
				
			}
	}
});

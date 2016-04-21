define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"account_add_form",
			addRecord:function(){
				moudle.exports.validateAddForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "system/account/regist",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","注册账号成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateAddForm:function(){
				var rules = {
								account:{required: true,minlength:6,maxlength:18,charVal:"#account",nochinese:"#account"},
								nickName:{required: true,maxlength:120,charVal:"#nickName"},
								email:{email:"#email"}
							};			
				formUtil.validateForm(moudle.exports.formID,rules,{});
			},
			cancelRecord:function(){
				winUtil.close();
			},
			listener:function(){
				var items = [
				             {id: '#btn_add_account',click:moudle.exports.addRecord},
				             {id: '#btn_cancel_account',click:moudle.exports.cancelRecord},
				             {id: '#show_file_upload_add',click:moudle.exports.showAddFileUpload}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
			},
			pageInit:function(){
				//加载tooltip
				$('[data-rel=tooltip]').tooltip();
			},
			showAddFileUpload:function(){
				var p = {
						"textId":"account_photo",
						"imageId":"account_photo_img",
						"fileType":"image"
				};
				winUtil.fileWindow(p);
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.pageInit();
			}
	}
});

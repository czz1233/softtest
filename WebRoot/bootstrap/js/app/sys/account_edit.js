define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"account_edit_form",
			editRecord:function(){
				moudle.exports.validateEditForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "system/account/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑账号成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {
								account:{required: true,minlength:6,maxlength:18,charVal:"#account",nochinese:"#account"},
								nickName:{required: true,maxlength:120,charVal:"#nickName"}
							};			
				formUtil.validateForm(moudle.exports.formID,rules,{});
			},
			cancelRecord:function(){
				var aid = cookieUtil.getCookie("aid");
				if(aid != null && "" != aid && typeof(aid) != 'undefined'){
					var url = $("#" + aid).attr("vurl");
					var vnav1 = $("#" + aid).attr("vnav1");
					var vnav2 = $("#" + aid).attr("vnav2");
					url = basePath + url;
					loadUtil.loadDiv(url,vnav1,vnav2,aid);
				}
			},
			listener:function(){
				var items = [
				             {id: '#btn_edit_account',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_account',click:moudle.exports.cancelRecord}
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
			fileUploadInit:function(){
				$("#show_file_upload_add").click(function(){
					var p = {
							"textId":"account_photo_edit",
							"imageId":"account_photo_edit_img",
							"fileType":"image"
					};
					winUtil.fileWindow(p);
				});
			},
			selectRoleCheckbox:function(){
				$.ajax({
					url: basePath + "system/role/getRoleIdByAccountId",
					data:{"accountId":$("#account_id").val()},
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.roleIdList){
							if(null != msg.roleIdList && 0 < msg.roleIdList.length){
								$("input[name=roleId]").each(function(){
									for(var i = 0 ;i < msg.roleIdList.length;i++){
										if($(this).attr("value") == msg.roleIdList[i]){
											$(this).attr("checked","checked");
										}
									}
								})
							}
						}
					}
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.pageInit();
				moudle.exports.fileUploadInit();
				moudle.exports.selectRoleCheckbox();
			}
	}
});

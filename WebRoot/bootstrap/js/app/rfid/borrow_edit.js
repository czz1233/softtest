define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"borrow_edit_form",
			editRecord:function(){
				moudle.exports.validateEditForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "rfid/borrow/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑申请外借成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									id:{required: true,maxlength:120,charVal:"#id"},
									applyUser:{required: true,maxlength:120,charVal:"#applyUser"},
									applyTime:{required: true,maxlength:120,charVal:"#applyTime"},
									applyBeginTime:{required: true,maxlength:120,charVal:"#applyBeginTime"},
									applyEndTime:{required: true,maxlength:120,charVal:"#applyEndTime"},
									applyReason:{required: true,maxlength:120,charVal:"#applyReason"},
									applyIdCard:{required: true,maxlength:120,charVal:"#applyIdCard"},
									applyIdCardImage:{required: true,maxlength:120,charVal:"#applyIdCardImage"},
									state:{required: true,maxlength:120,charVal:"#state"},
									auditUser:{required: true,maxlength:120,charVal:"#auditUser"},
									auditTime:{required: true,maxlength:120,charVal:"#auditTime"},
									auditReason:{required: true,maxlength:120,charVal:"#auditReason"},
									giveToUser:{required: true,maxlength:120,charVal:"#giveToUser"},
									giveToTIme:{required: true,maxlength:120,charVal:"#giveToTIme"},
									giveToRemark:{required: true,maxlength:120,charVal:"#giveToRemark"},
									backUser:{required: true,maxlength:120,charVal:"#backUser"},
									backTime:{required: true,maxlength:120,charVal:"#backTime"},
									backRemark:{required: true,maxlength:120,charVal:"#backRemark"},
									archive:{required: true,maxlength:120,charVal:"#archive"},
								
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
				             {id: '#btn_edit_borrow',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_borrow',click:moudle.exports.cancelRecord}
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
			init:function(){
				moudle.exports.listener();
				moudle.exports.pageInit();
				
			}
	}
});

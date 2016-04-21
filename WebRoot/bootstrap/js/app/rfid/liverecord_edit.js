define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"liverecord_edit_form",
			editRecord:function(){
				moudle.exports.validateEditForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "rfid/liverecord/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑调档记录成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									id:{required: true,maxlength:120,charVal:"#id"},
									liveUser:{required: true,maxlength:120,charVal:"#liveUser"},
									liveReason:{required: true,maxlength:120,charVal:"#liveReason"},
									liveTime:{required: true,maxlength:120,charVal:"#liveTime"},
									liveTo:{required: true,maxlength:120,charVal:"#liveTo"},
									operateUser:{required: true,maxlength:120,charVal:"#operateUser"},
									operateTimme:{required: true,maxlength:120,charVal:"#operateTimme"},
									remark:{required: true,maxlength:120,charVal:"#remark"},
									archive:{required: true,maxlength:120,charVal:"#archive"},
									archiveTitle:{required: true,maxlength:120,charVal:"#archiveTitle"},
									archiveElTag:{required: true,maxlength:120,charVal:"#archiveElTag"},
								
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
				             {id: '#btn_edit_liverecord',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_liverecord',click:moudle.exports.cancelRecord}
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

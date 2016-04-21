define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"talk_edit_form",
			editRecord:function(){
				moudle.exports.validateEditForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "rl/talk/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑发布留言成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									id:{required: true,maxlength:120,charVal:"#id"},
									title:{required: true,maxlength:120,charVal:"#title"},
									content:{required: true,maxlength:120,charVal:"#content"},
									createTime:{required: true,maxlength:120,charVal:"#createTime"},
									reback:{required: true,maxlength:120,charVal:"#reback"},
									rebackTime:{required: true,maxlength:120,charVal:"#rebackTime"},
									status:{required: true,maxlength:120,charVal:"#status"},
									creator:{required: true,maxlength:120,charVal:"#creator"},
									sendUser:{required: true,maxlength:120,charVal:"#sendUser"},
									rebackUser:{required: true,maxlength:120,charVal:"#rebackUser"},
									sendUserStr:{required: true,maxlength:120,charVal:"#sendUserStr"},
									rebackUserStr:{required: true,maxlength:120,charVal:"#rebackUserStr"},
								
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
				             {id: '#btn_edit_talk',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_talk',click:moudle.exports.cancelRecord}
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

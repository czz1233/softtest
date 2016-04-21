define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"bookrack_edit_form",
			editRecord:function(){
				moudle.exports.validateEditForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "story/bookrack/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑我的书架成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									id:{required: true,maxlength:120,charVal:"#id"},
									account:{required: true,maxlength:120,charVal:"#account"},
									story:{required: true,maxlength:120,charVal:"#story"},
									name:{required: true,maxlength:120,charVal:"#name"},
									describle:{required: true,maxlength:120,charVal:"#describle"},
									updateTime:{required: true,maxlength:120,charVal:"#updateTime"},
									readCount:{required: true,maxlength:120,charVal:"#readCount"},
									wordCount:{required: true,maxlength:120,charVal:"#wordCount"},
									state:{required: true,maxlength:120,charVal:"#state"},
									collectNum:{required: true,maxlength:120,charVal:"#collectNum"},
									imageUrl:{required: true,maxlength:120,charVal:"#imageUrl"},
									status:{required: true,maxlength:120,charVal:"#status"},
									createTime:{required: true,maxlength:120,charVal:"#createTime"},
									creator:{required: true,maxlength:120,charVal:"#creator"},
									authorStr:{required: true,maxlength:120,charVal:"#authorStr"},
									storyTypeStr:{required: true,maxlength:120,charVal:"#storyTypeStr"},
								
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
				             {id: '#btn_edit_bookrack',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_bookrack',click:moudle.exports.cancelRecord}
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

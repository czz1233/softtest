define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"bookrack_add_form",
			addRecord:function(){
				moudle.exports.validateAddForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				$.ajax({
					url: basePath + "story/bookrack/save",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","新增我的书架成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateAddForm:function(){
				var rules = {				
									id:{required: true,maxlength:120},
									account:{required: true,maxlength:120},
									story:{required: true,maxlength:120},
									name:{required: true,maxlength:120},
									describle:{required: true,maxlength:120},
									updateTime:{required: true,maxlength:120},
									readCount:{required: true,maxlength:120},
									wordCount:{required: true,maxlength:120},
									state:{required: true,maxlength:120},
									collectNum:{required: true,maxlength:120},
									imageUrl:{required: true,maxlength:120},
									status:{required: true,maxlength:120},
									createTime:{required: true,maxlength:120},
									creator:{required: true,maxlength:120},
									authorStr:{required: true,maxlength:120},
									storyTypeStr:{required: true,maxlength:120},
								
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
				             {id: '#btn_add_bookrack',click:moudle.exports.addRecord},
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

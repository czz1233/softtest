define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"datainfo_add_form",
			addRecord:function(){
				moudle.exports.validateAddForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				var form = $("#datainfo_add_form");
				var options = {
    					url: basePath + "teacher/datainfo/save",
    					type:"post",
    					dataType:"json",
    					success: function(data,statusText) {
    						if (data.ok) {
    							$("#data_url_id").val(data.path);
    							moudle.exports.cancelRecord();
    						}
    			        }
    			    };
	    			form.ajaxSubmit(options);
			},
			validateAddForm:function(){
				var rules = {				
									title:{required: true,maxlength:120},
									describle:{maxlength:255}
								
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
				             {id: '#btn_add_datainfo',click:moudle.exports.addRecord},
				             {id: '#btn_cancel_datainfo',click:moudle.exports.cancelRecord}
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
			inputImgDomInit:function(){
				$('#file').ace_file_input({
					no_file:'',
					btn_choose:'请选择',
					btn_change:'重新选择',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				$(".ace-file-input > .remove").trigger("click");
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.pageInit();
				moudle.exports.inputImgDomInit();
			}
	}
});

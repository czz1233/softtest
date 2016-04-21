define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"archivefile_add_form",
			kindEditor:null,
			kindeditorInit:function(){
				KindEditor.ready(function(K) {
					moudle.exports.kindEditor = K.create('textarea[name="content1"]', {
								cssPath : basePath + 'frame/kindeditor-4.1.9/plugins/code/prettify.css',
								uploadJson : basePath + 'keupload/uploadJson.mvc',
								fileManagerJson : basePath + 'keupload/fileManagerJson.mvc',
								items:['source', 'fullscreen', 'justifyright','justifyfull','insertorderedlist', 'insertunorderedlist', 
								       	    'indent', 'outdent','formatblock', 'fontname', 'fontsize','forecolor', 'hilitecolor', 'bold','italic',
								    		'underline', 'strikethrough', 'lineheight','image','multiimage', 'table', 'hr', 'link', 'unlink'],
								allowFileManager : true
							});
							prettyPrint();
				});
			},
			addRecord:function(){
				moudle.exports.validateAddForm();
				var validateFormResult = $("#" + moudle.exports.formID).valid();
				if(!validateFormResult){
					return false;
				}
				var content = moudle.exports.kindEditor.html();
				$("#content").val(content);
				$.ajax({
					url: basePath + "rfid/archivefile/save",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","新增文档成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateAddForm:function(){
				var rules = {				
									title:{required: true,maxlength:120},
									type:{required: true,maxlength:120}
								
							};			
				formUtil.validateForm(moudle.exports.formID,rules,{});
			},
			cancelRecord:function(){
				window.parent.location.reload();
			},
			listener:function(){
				var items = [
				             {id: '#btn_add_archivefile',click:moudle.exports.addRecord},
				             {id: '#btn_cancel_archivefile',click:moudle.exports.cancelRecord}
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
			timeDivInit:function(){
				$('.form_datetime').datetimepicker({
			        language:  'zh-CN',
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
			        showMeridian: 1
			    });
			},
			init:function(){
				moudle.exports.kindeditorInit();
				moudle.exports.timeDivInit();
				moudle.exports.listener();
				moudle.exports.pageInit();
				
			}
	}
});

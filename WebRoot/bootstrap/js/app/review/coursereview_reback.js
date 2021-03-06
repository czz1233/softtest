define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"coursereview_edit_form",
			kindEditor:null,
			kindeditorInit:function(){
				KindEditor.ready(function(K) {
					moudle.exports.kindEditor = K.create('textarea[name="content_ke"]', {
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
			editRecord:function(){
				var content = moudle.exports.kindEditor.html();
				$("#reback").val(content);
				$.ajax({
					url: basePath + "review/coursereview/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","回复评论成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									title:{required: true,maxlength:120,charVal:"#title"},
									subTitle:{required: true,maxlength:120,charVal:"#subTitle"},
									rebackTime:{required: true,maxlength:120,charVal:"#rebackTime"},
									status:{required: true,maxlength:120,charVal:"#status"},
									createTime:{required: true,maxlength:120,charVal:"#createTime"},
									creator:{required: true,maxlength:120,charVal:"#creator"},
									course:{required: true,maxlength:120,charVal:"#course"},
									account:{required: true,maxlength:120,charVal:"#account"}
								
							};			
				formUtil.validateForm(moudle.exports.formID,rules,{});
			},
			cancelRecord:function(){
				window.parent.cancelDiv();
			},
			listener:function(){
				var items = [
				             {id: '#btn_edit_coursereview',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_coursereview',click:moudle.exports.cancelRecord}
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
				moudle.exports.kindeditorInit();
			}
	}
});

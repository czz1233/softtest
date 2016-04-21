/*
 * 文件上传
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	moudle.exports = {
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
			submitForm:function(){
				var form = $("#uploadFileForm");
				var options = {
    					url: basePath + "file/uploadFile.mvc",
    					type:"post",
    					dataType:"json",
    					success: function(data,statusText) {
    						if (data.ok) {
    							$("#" + $("#textId").val()).val(data.path);
    							$("#" + $("#imageId").val()).attr("src",basePath + data.path);
    							util.showMsg("success","操作提示","文件上传成功");
    							gDialog.fClose("file_upload_win");
    						}
    			        }
    			    };
	    			form.ajaxSubmit(options);
			},
			listener:function(){
				var items = [
				             {id: '#btn_submit',click:moudle.exports.submitForm}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
			},
			init:function(){
				moudle.exports.inputImgDomInit();
				moudle.exports.listener();
			}
	}
});

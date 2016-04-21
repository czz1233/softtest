/*
 * 弹窗工具
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	moudle.exports = {
			confirm:function(title,content,callBack){
				gDialog.fConfirm(title,content,function(rs){
					if(rs && typeof(callBack) == 'function'){
						callBack();
					}
				});
			},
			window:function(param){
				var defaultParam = {
						"modalId":null,
						"title":"请选择文件",
						"width":"600",
						"param":null,
						"url":null,
						"content":null
				}
				var params = $.extend(defaultParam, param); 
				gDialog.fCreate(params).show();
			},
			close:function(){
				gDialog.fClose();
			},
			fileWindow:function(p){
				var url = basePath + "bootstrap/jsp/common/file_upload.jsp";
				var param = {
						"modalId":"file_upload_win",
						"title":"请选择文件",
						"width":"300",
						"param":p,
						"url":url
				};
				moudle.exports.window(param);
			}
	}
});

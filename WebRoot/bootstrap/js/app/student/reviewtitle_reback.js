define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"reviewtitle_edit_form",
			editRecord:function(){
				var titleId = $("#title_id").val();
				var content = $("#reback_content").val();
				if(content == null || content == ""){
					util.showMsg("error","操作失败","请填写回复内容");
					return false;
				}
				$.ajax({
					url: basePath + "student/review/save",
					data:{
						"titleId":titleId,
						"content":content
					},
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","回复成功");
							var url = basePath + "student/reviewtitle/" + titleId +"/rebackRecord";
							$("#main-content").load(url);
						}
					}
				});
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
				             {id: '#btn_edit_reviewtitle',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_reviewtitle',click:moudle.exports.cancelRecord}
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

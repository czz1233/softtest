define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var formUtil = require("util/formUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			formID:"order_edit_form",
			editRecord:function(){
				$.ajax({
					url: basePath + "rl/order/edit",
					data:$("#" + moudle.exports.formID).serialize(),
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作成功","编辑申请订单成功");
							moudle.exports.cancelRecord();
						}
					}
				});
			},
			validateEditForm:function(){
				var rules = {			
									id:{required: true,maxlength:120,charVal:"#id"},
									code:{required: true,maxlength:120,charVal:"#code"},
									goods:{required: true,maxlength:120,charVal:"#goods"},
									location:{required: true,maxlength:120,charVal:"#location"},
									weight:{required: true,maxlength:120,charVal:"#weight"},
									applyTime:{required: true,maxlength:120,charVal:"#applyTime"},
									state:{required: true,maxlength:120,charVal:"#state"},
									auditTime:{required: true,maxlength:120,charVal:"#auditTime"},
									finishTime:{required: true,maxlength:120,charVal:"#finishTime"},
									cancelTime:{required: true,maxlength:120,charVal:"#cancelTime"},
									applyUser:{required: true,maxlength:120,charVal:"#applyUser"},
									auditUser:{required: true,maxlength:120,charVal:"#auditUser"},
									truck:{required: true,maxlength:120,charVal:"#truck"},
									line:{required: true,maxlength:120,charVal:"#line"},
									applyUserStr:{required: true,maxlength:120,charVal:"#applyUserStr"},
									auditUserStr:{required: true,maxlength:120,charVal:"#auditUserStr"},
									truckStr:{required: true,maxlength:120,charVal:"#truckStr"},
									lineStr:{required: true,maxlength:120,charVal:"#lineStr"},
									status:{required: true,maxlength:120,charVal:"#status"},
									createTime:{required: true,maxlength:120,charVal:"#createTime"},
									creator:{required: true,maxlength:120,charVal:"#creator"},
								
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
				             {id: '#btn_edit_order',click:moudle.exports.editRecord},
				             {id: '#btn_cancel_order',click:moudle.exports.cancelRecord}
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

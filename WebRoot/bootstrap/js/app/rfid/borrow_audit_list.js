/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"borrow_table_audit",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "rfid/borrow/getTableData";
				param.columns = [
							{"data":"archiveTitle"},
							{"data":"archivrElcode"},
							{"data":"applyUser"},
							{"data":"applyBeginTime"},
							{"data":"applyEndTime"},
							{"data":"applyReason"},
							{"data":"applyTime"},
							{"data":"state"},
							{"data":"auditReason"},
							{"data":"auditTime"},
							{"data":"auditUser"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	return tableUtil.formatBrowerStatus(data);
				                    },
				                    "targets":7},
				                    {"render":function ( data, type, row) {
				                    	var auditButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-audit btn btn-minier btn-success btn-round'><i class='fa fa-check bigger-110'></i>  审核</button><label>");
				                    	auditButton.children("button").attr({"vid":row.id});
				                    	if(row.state == 0){
				                    		var html = auditButton.html();
				                    	}else{
				                    		return "";
				                    	}
				                    	return html;
				                    },
				                    "targets":11}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "rfid/borrow/addRecordShow";
				$("#main-content").load(url);
			},
			auditRecordShow:function(id){
				var url = basePath + "rfid/borrow/" + id +"/auditRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "rfid/borrow/deleteBorrow",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除申请外借信息");
								tableUtil.tableRefesh(moudle.exports.tableId);
							}
						}
					});
				});
			},
			listener:function(){
				var items = [
				             {id: '#button_add',click:moudle.exports.addRecordShow}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
				$("#" + moudle.exports.tableId).on('click', '.but-row-audit', function (event) {
					moudle.exports.auditRecordShow($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

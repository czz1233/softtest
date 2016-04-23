/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"testplan_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "softtest/testplan/getTableData";
				param.columns = [
							{"data":"title"},
							{"data":"type"},
							{"data":"state"},
							{"data":"beginTime"},
							{"data":"endTime"},
							{"data":"remark"},
							{"data":"createTime"},
							{"data":"creator"},
				                 {"data":"id"}];
				param.columnDefs = [
									{"render":function ( data, type, row) {
										return tableUtil.formatWeiXinPmtStatus(data);
									},
									"targets":2},
				                    {"render":function ( data, type, row) {

				                    	var auditPassButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-success btn-round'><i class='fa fa-pencil bigger-110'></i>  通过</button><label>");
				                    	auditPassButton.children("button").attr({"vid":row.id});
				                    	var auditNoPassButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  不通过</button><label>");
				                    	auditNoPassButton.children("button").attr({"vid":row.id});
				                    	var html = "";
				                    	if(row.state == 0){
				                    		html = auditPassButton.html() + auditNoPassButton.html();
				                    	}
				                    	return html;
				                    },
				                    "targets":8}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "softtest/testplan/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				winUtil.confirm("操作确认","您确认该计划通过吗?",function(){
					$.ajax({
						url:basePath + "softtest/testplan/auditPass",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","审核操作成功");
								tableUtil.tableRefesh(moudle.exports.tableId);
							}
						}
					});
				});
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确认该计划不通过吗?",function(){
					$.ajax({
						url:basePath + "softtest/testplan/auditNoPass",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","审核操作成功");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-update', function (event) {
					moudle.exports.editRecordShow($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
				});
				$("#" + moudle.exports.tableId).on('click', '.but-row-delete', function (event) {
					moudle.exports.deleteRecord($(event.currentTarget).attr("vid"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

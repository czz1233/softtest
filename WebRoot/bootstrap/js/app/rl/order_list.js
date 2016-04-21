/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"order_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "rl/order/getTableData";
				param.columns = [
							{"data":"code"},
							{"data":"state"},
							{"data":"goods"},
							{"data":"location"},
							{"data":"weight"},
							{"data":"applyTime"},
							{"data":"auditTime"},
							{"data":"finishTime"},
							{"data":"cancelTime"},
							{"data":"applyUserStr"},
							{"data":"truckStr"},
							{"data":"lineStr"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function (data, type, row) {
				                    	return tableUtil.formatOrderStatus(data);
				                    },
				                    "targets":1},
				                    {"render":function (data, type, row) {
				                    	var sureButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-sure btn btn-minier btn-warning btn-round'><i class='fa fa-pencil bigger-110'></i>  确认订单</button><label>");
				                    	sureButton.children("button").attr({"vid":row.id});
				                    	
				                    	var deleteButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  取消订单</button><label>");
				                    	deleteButton.children("button").attr({"vid":row.id});
				                    	
				                    	var html = "";
				                    	if(row.state==0){
				                    		html = html + deleteButton.html();
				                    	}
				                    	if(row.state==1){
				                    		html = html + sureButton.html();
				                    	}
				                    	
				                    	return html;
				                    },
				                    "targets":12}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "rl/order/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "rl/order/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			finishRecordShow:function(id){
				winUtil.confirm("操作确认","您确定收到货物了么?",function(){
					$.ajax({
						url:basePath + "rl/order/finishOrder.mvc",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","收货成功");
								tableUtil.tableRefesh(moudle.exports.tableId);
							}
						}
					});
				});
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定取消该订单么?",function(){
					$.ajax({
						url:basePath + "rl/order/cancelOrder.mvc",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","取消成功");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-sure', function (event) {
					moudle.exports.finishRecordShow($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
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

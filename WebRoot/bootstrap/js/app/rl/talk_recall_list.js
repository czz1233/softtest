/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"talk_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "rl/talk/getTableData";
				param.columns = [
							{"data":"title"},
							{"data":"content"},
							{"data":"createTime"},
							{"data":"sendUserStr"},
							{"data":"reback"},
							{"data":"rebackTime"},
							{"data":"rebackUserStr"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	var rebackButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-reback btn btn-minier btn-success btn-round'><i class='fa fa-comments bigger-110'></i>  回复</button><label>");
				                    	rebackButton.children("button").attr({"vid":row.id});
				                    	var html = rebackButton.html();
				                    	return html;
				                    },
				                    "targets":7}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "rl/talk/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "rl/talk/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "rl/talk/deleteTalk",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除发布留言信息");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-reback', function (event) {
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

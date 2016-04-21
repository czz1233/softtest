/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"booktag_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "story/booktag/getTableData";
				param.columns = [ {
					"data" : "sname"
				}, {
					"data" : "storyStr"
				}, {
					"data" : "sreadNum"
				}, {
					"data" : "swordNum"
				}, {
					"data" : "supdate"
				}, {
					"data" : "createTime"
				}, {
					"data" : "creator"
				}, {
					"data" : "id"
				} ];
				param.columnDefs = [ {
					"render" : function(data, type, row) {
						var readButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-success btn-round'><i class='fa fa-sign-out bigger-110'></i>  阅读</button><label>");
						readButton.children("button").attr({
							"vid" : row.id
						});
						var deleteButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  删除</button><label>");
						deleteButton.children("button").attr({
							"vid" : row.id
						});
						var html = readButton.html() + deleteButton.html();
						return html;
					},
					"targets" : 7
				}];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "story/booktag/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "story/booktag/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "story/booktag/deleteBookTag",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除我的书架信息");
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

/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"archivefile_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "rfid/archivefile/getTableData";
				param.columns = [
							{"data":"title"},
							{"data":"type"},
							{"data":"keyWork"},
							{"data":"putInTime"},
							{"data":"archiveName"},
							{"data":"createTime"},
							{"data":"creator"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	var editButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-warning btn-round'><i class='fa fa-pencil bigger-110'></i>  编辑</button><label>");
				                    	editButton.children("button").attr({"vid":row.id});
				                    	var searchButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-search btn btn-minier btn-success btn-round'><i class='fa fa-search bigger-110'></i>  查看</button><label>");
				                    	searchButton.children("button").attr({"vid":row.id});
				                    	var deleteButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  删除</button><label>");
				                    	deleteButton.children("button").attr({"vid":row.id});
				                    	var html = editButton.html() + searchButton.html() + deleteButton.html();
				                    	return html;
				                    },
				                    "targets":7}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "bootstrap/jsp/rfid/archivefile_add_frame.jsp";
				$("#main-content").load(url);
			},
			searchRecord:function(id){
				var url = basePath + "rfid/archivefile/" + id +"/searchRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				//var url = basePath + "rfid/archivefile/" + id +"/editRecordShow";
				var url = basePath + "bootstrap/jsp/rfid/archivefile_edit_frame.jsp?id=" + id;
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "rfid/archivefile/deleteArchiveFile",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除文档信息");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-search', function (event) {
					moudle.exports.searchRecord($(event.currentTarget).attr("vid"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

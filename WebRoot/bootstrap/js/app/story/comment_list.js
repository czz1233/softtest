/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"comment_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "story/comment/getTableData";
				param.columns = [
							{"data":"storyName"},
							{"data":"content"},
							{"data":"state"},
							{"data":"createTime"},
							{"data":"creator"},
							{"data":"replyContent"},
							{"data":"replayTime"},
							{"data":"replayUser"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	return tableUtil.formatWeiXinPmtStatus(data);
				                    },
				                    "targets":2},
									{"render":function ( data, type, row) {
					                	var editButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-success btn-round'><i class='fa fa-sign-out bigger-110'></i>  回复</button><label>");
					                	editButton.children("button").attr({"vid":row.id});
					                	var jinhuaButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-jinhua btn btn-minier btn-warning btn-round'><i class='fa fa-star bigger-110'></i>  精华</button><label>");
					                	jinhuaButton.children("button").attr({"vid":row.id});
					                	var deleteButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  删除</button><label>");
					                	deleteButton.children("button").attr({"vid":row.id});
					                	var html = "";
					                	if(row.state == '1'){
					                		html = html + editButton.html() + deleteButton.html();
					                	}else{
					                		html = editButton.html() + jinhuaButton.html() + deleteButton.html();
					                	}
					                	
					                	return html;
					                },
					                "targets":8}
									               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "story/comment/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "story/comment/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "story/comment/deleteComment",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除小说评论信息");
								tableUtil.tableRefesh(moudle.exports.tableId);
							}
						}
					});
				});
			},
			jinhuaRecord:function(id){
				winUtil.confirm("操作确认","您确定标记为精华评论吗？",function(){
					$.ajax({
						url:basePath + "story/comment/jinhuaRecord",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","标记为精华评论成功");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-jinhua', function (event) {
					moudle.exports.jinhuaRecord($(event.currentTarget).attr("vid"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

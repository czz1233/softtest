/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"news_search_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "rl/news/getTableData";
				param.columns = [
							{"data":"title"},
							{"data":"subTitle"},
							{"data":"createTime"},
							{"data":"creator"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	var searchButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-success btn-round'><i class='fa fa-search bigger-110'></i>  查看</button><label>");
				                    	searchButton.children("button").attr({"vid":row.id});
				                    	var html = searchButton.html();
				                    	return html;
				                    },
				                    "targets":4}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "bootstrap/jsp/rl/news_add_frime.jsp";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "bootstrap/jsp/rl/news_edit_frime.jsp?id=" + id;
				$("#main-content").load(url);
			},
			searchRecordShow:function(id){
				var url = basePath + "rl/news/" + id +"/searchRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "rl/news/deleteNews",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除发布新闻信息");
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
					moudle.exports.searchRecordShow($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
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

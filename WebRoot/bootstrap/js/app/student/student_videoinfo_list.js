/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"videoinfo_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "teacher/videoinfo/getTableData";
				param.columns = [
							{"data":"title"},
							{"data":"courseStr"},
							{"data":"describle"},
							{"data":"createTime"},
							{"data":"creator"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
				                    	var editButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-update btn btn-minier btn-warning btn-round'><i class='fa fa-pencil bigger-110'></i>  编辑</button><label>");
				                    	editButton.children("button").attr({"vid":row.id});
				                    	var deleteButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-delete btn btn-minier btn-danger btn-round'><i class='fa fa-times bigger-110'></i>  删除</button><label>");
				                    	deleteButton.children("button").attr({"vid":row.id});
				                    	
				                    	var filmButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-film btn btn-minier btn-primary btn-round'><i class='fa fa-film bigger-110'></i>  播放</button><label>");
				                    	filmButton.children("button").attr({"dataurl":row.dataUrl});
				                    	
				                    	//var html = editButton.html() + filmButton.html() + deleteButton.html();
				                    	var html = filmButton.html();
				                    	return html;
				                    },
				                    "targets":5}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "teacher/videoinfo/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "teacher/videoinfo/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			deleteRecord:function(id){
				winUtil.confirm("操作确认","您确定删除该条记录吗?",function(){
					$.ajax({
						url:basePath + "teacher/videoinfo/deleteVideoInfo",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功删除视频信息");
								tableUtil.tableRefesh(moudle.exports.tableId);
							}
						}
					});
				});
			},
			showFilm:function(dataurl){
				var url = basePath + "bootstrap/jsp/teacher/videoinfo_film.jsp?dataurl="+dataurl;
				$("#main-content").load(url);
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-film', function (event) {
					moudle.exports.showFilm($(event.currentTarget).attr("dataurl"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

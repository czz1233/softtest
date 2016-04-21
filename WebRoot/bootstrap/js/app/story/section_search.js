/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
		tableId : "section_table",
		tableInit : function() {
			var param = {};
			param.tableId = moudle.exports.tableId;
			param.serverSide = false;
			var url = basePath + "story/section/getTableData";
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

					var bookTagButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-tag btn btn-minier btn-success btn-round'><i class='fa fa-sign-out bigger-110'></i>  书签</button><label>");
					bookTagButton.children("button").attr({
						"vid" : row.id
					});
					
					var readButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-read btn btn-minier btn-warning btn-round'><i class='fa fa-sign-out bigger-110'></i>  阅读</button><label>");
					readButton.children("button").attr({
						"vid" : row.id
					});

					var html = bookTagButton.html() + readButton.html();
					return html;

				},
				"targets" : 7
			}

			];
			param.url = url;
			tableUtil.dataTable(param);
		},
		addRecordShow : function() {
			var url = basePath + "story/section/addRecordShow";
			$("#main-content").load(url);
		},
		editRecordShow : function(id) {
			var url = basePath + "story/section/" + id + "/editRecordShow";
			$("#main-content").load(url);
		},
		commentRecord : function(id) {
			var url = basePath + "story/section/" + id + "/commentRecordShow";
			$("#main-content").load(url);
		},
		readRecord : function(id) {
			var url = basePath + "story/section/" + id + "/readRecord";
			$("#main-content").load(url);
		},
		deleteRecord : function(id) {
			winUtil.confirm("操作确认", "您确定删除该条记录吗?", function() {
				$.ajax({
					url : basePath + "story/section/deleteSection",
					data : {
						"id" : id
					},
					type : "POST",
					dataType : "JSON",
					success : function(msg) {
						if (msg.ok) {
							util.showMsg("success", "操作成功", "您已经成功删除小说信息");
							tableUtil.tableRefesh(moudle.exports.tableId);
						}
					}
				});
			});
		},
		tagRecord : function(id) {
			winUtil.confirm("操作确认", "您确定将该记录加入书签吗?", function() {
				$.ajax({
					url : basePath + "story/section/tagRecord",
					data : {
						"id" : id
					},
					type : "POST",
					dataType : "JSON",
					success : function(msg) {
						if (msg.ok) {
							util.showMsg("success", "操作成功", "您确定将该记录加入书签吗");
						}
					}
				});
			});
		},
		listener : function() {
			var items = [ {
				id : '#button_add',
				click : moudle.exports.addRecordShow
			} ];
			$(items).each(function(index, item) {
				if (this.click) {
					$(this.id).click(this.click);
				} else if (this.change) {
					$(this.id).change(this.change);
				}
			});
			$("#" + moudle.exports.tableId).on('click', '.but-row-update', function(event) {
				moudle.exports.editRecordShow($(event.currentTarget).attr("vid"), $(event.currentTarget).attr("vname"));
			});
			$("#" + moudle.exports.tableId).on('click', '.but-row-delete', function(event) {
				moudle.exports.deleteRecord($(event.currentTarget).attr("vid"));
			});
			$("#" + moudle.exports.tableId).on('click', '.but-row-read', function(event) {
				moudle.exports.readRecord($(event.currentTarget).attr("vid"));
			});
			$("#" + moudle.exports.tableId).on('click', '.but-row-tag', function(event) {
				moudle.exports.tagRecord($(event.currentTarget).attr("vid"));
			});
			$("#" + moudle.exports.tableId).on('click', '.but-row-comment', function(event) {
				moudle.exports.commentRecord($(event.currentTarget).attr("vid"));
			});
		},
		init : function() {
			moudle.exports.listener();
			moudle.exports.tableInit();
		}
	}
});

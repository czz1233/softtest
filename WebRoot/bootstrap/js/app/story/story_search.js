/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	moudle.exports = {
			tableId:"story_table",
			tableInit:function(){
				var param = {};
				param.tableId = moudle.exports.tableId;
				param.serverSide = false;
				var url = basePath + "story/story/getTableData";
				param.columns = [
							{"data":"name"},
							{"data":"imageUrl"},
							{"data":"storyTypeStr"},
							{"data":"describle"},
							{"data":"updateTime"},
							{"data":"readCount"},
							{"data":"wordCount"},
							{"data":"collectNum"},
							{"data":"createTime"},
							{"data":"authorStr"},
				                 {"data":"id"}];
				param.columnDefs = [{"render":function ( data, type, row) {
										var url = basePath + data;
				                    	return "<img style='width:120px;height:120px;'src='" + url + "' />";
				                    	
				                    },
				                    "targets":1},
									{"render":function ( data, type, row) {
					                	var soucangButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-soucang btn btn-minier btn-warning btn-round'><i class='fa fa-sign-out bigger-110'></i>  收藏</button><label>");
					                	soucangButton.children("button").attr({"vid":row.id});
					                	var commentButton = $("<label>&nbsp;&nbsp;<button type='button' class='but-row-comment btn btn-minier btn-primary btn-round'><i class='fa fa-sign-out bigger-110'></i>  评论</button><label>");
										commentButton.children("button").attr({
											"vid" : row.id
										});
					                	var html = soucangButton.html() + commentButton.html();
					                	return html;
					                },
					                "targets":10}
				               
				];
				param.url = url;
				tableUtil.dataTable(param);
			},
			addRecordShow:function(){
				var url = basePath + "story/story/addRecordShow";
				$("#main-content").load(url);
			},
			editRecordShow:function(id){
				var url = basePath + "story/story/" + id +"/editRecordShow";
				$("#main-content").load(url);
			},
			commentRecord:function(id){
				var url = basePath + "story/story/" + id +"/commentRecord";
				$("#main-content").load(url);
			},
			soucang:function(id){
				winUtil.confirm("操作确认","您确定收藏该小说吗?",function(){
					$.ajax({
						url:basePath + "story/story/shoucangStory",
						data:{"id":id},
						type:"POST",
						dataType:"JSON",
						success:function(msg){
							if(msg.ok){
								util.showMsg("success","操作成功","您已经成功收藏该小说");
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
				$("#" + moudle.exports.tableId).on('click', '.but-row-soucang', function (event) {
					moudle.exports.soucang($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
				});
				$("#" + moudle.exports.tableId).on('click', '.but-row-comment', function (event) {
					moudle.exports.commentRecord($(event.currentTarget).attr("vid"),$(event.currentTarget).attr("vname"));
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.tableInit();
			}
	}
});

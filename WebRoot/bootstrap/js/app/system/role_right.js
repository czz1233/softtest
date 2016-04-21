/*
 * 会员类型
 */
define(function(require, exports, moudle) {
	var util = require("util/util");
	var tableUtil = require("util/tableUtil");
	var winUtil = require("util/winUtil");
	var loadUtil = require("util/loadUtil");
	var cookieUtil = require("util/cookieUtil");
	moudle.exports = {
			cancelRecord:function(){
				var aid = cookieUtil.getCookie("aid");
				if(aid != null && "" != aid && typeof(aid) != 'undefined'){
					var url = $("#" + aid).attr("vurl");
					var vnav1 = $("#" + aid).attr("vnav1");
					var vnav2 = $("#" + aid).attr("vnav2");
					url = basePath + url;
					loadUtil.loadDiv(url,vnav1,vnav2,aid);
				}
			},
			addRecord:function(){
				var rightTrees = $.fn.zTree.getZTreeObj("right_tree");
				var checkNodes = rightTrees.getCheckedNodes(true);
				var nodes = new Array();
				if(null != checkNodes && 0 < checkNodes.length){
					for(var i = 0 ; i < checkNodes.length;i++){
						nodes.push(checkNodes[i].id);
					}
				}else{
					util.showMsg("warning","操作警告","请至少选择一个权限信息");
					return false;
				}
				$.ajax({
					url:basePath + "system/role/addRightToRole",
					data:{"rightIds":nodes,"roleId":$("#role_id").val()},
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							util.showMsg("success","操作提示","权限授予成功");
							moudle.exports.cancelRecord();
							
						}
					}
				});
			},
			listener:function(){
				var items = [
				             {id: '#btn_add_role_right',click:moudle.exports.addRecord},
				             {id: '#btn_cancel_role',click:moudle.exports.cancelRecord}
							];
				$(items).each(function(index, item){
					if(this.click){
						$(this.id).click(this.click);
					}else if(this.change){
						$(this.id).change(this.change);
					}
				});
			},
			rightTreeInit:function(){
				var setting = {
						check: {
							enable: true,
							chkStyle: "checkbox"
						},
						data: {
							simpleData: {
								enable: true,
								idKey : "id",
								pIdKey :"parentId",
								rootPId: ""
							}
						},
						callback: {
							onClick: moudle.exports.zTreeOnClick
						}
					};
				var url = basePath + "system/right/getRights";
				$.ajax({
					url:url,
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok){
							$(document).ready(function(){
								if(null != msg.treeNodes && 0 < msg.treeNodes.length){
									for(var i = 0;i < msg.treeNodes.length;i++){
										delete msg.treeNodes[i].url;
										delete msg.treeNodes[i].iconCls;
										delete msg.treeNodes[i].icon;
									}
								}
								$.fn.zTree.init($("#right_tree"), setting, msg.treeNodes);
								moudle.exports.selectTreeNodes("right_tree",$("#role_id").val());
							});
						}
					}
				});
			},
			zTreeOnClick:function(event, treeId, treeNode){
				return false;
			},
			selectTreeNodes:function(treeId,roleId){
				var url = basePath + "system/right/getRightsByRoleId";
				var rightTrees = $.fn.zTree.getZTreeObj("right_tree");
				$.ajax({
					url:url,
					data:{"roleId":roleId},
					type:"POST",
					dataType:"JSON",
					success:function(msg){
						if(msg.ok && msg.rightIds && msg.rightIds.length > 0){
							for(var i = 0 ; i < msg.rightIds.length ; i++){
								var node = rightTrees.getNodesByParam("id", msg.rightIds[i], null);
								rightTrees.expandAll(true);
								rightTrees.checkNode(node[0],true);
							}
						}
					}
				});
			},
			init:function(){
				moudle.exports.listener();
				moudle.exports.rightTreeInit();
				
			}
	}
});

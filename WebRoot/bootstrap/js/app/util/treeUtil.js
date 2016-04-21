/*
 * 工具类
 */
define(function(require, exports, moudle) {
	moudle.exports = {
			getChechedNodes:function(treeId){
				var tree = $.fn.zTree.getZTreeObj(treeId);
				var checkNodes = rightTree.getCheckedNodes(true);
			}
	}
});

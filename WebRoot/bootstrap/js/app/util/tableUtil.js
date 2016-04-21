/*
 * 工具类
 */
define(function(require, exports, moudle) {
	var common = require("common/common");
	var util = require("util/util");
	moudle.exports = {
			dataTable:function(param){
				var serverSide = true;
				var ajaxType = "POST";
				var dataSrc = "data";
				var dom = '<"toolbar">tlp';
				if (undefined != param.serverSide && !param.serverSide) {
					serverSide = false;
					dom='<"toolbar">ftlp';
				}
				if(undefined != param.dom){
					dom= param.dom;
				}
				var aLengthMenu = [ [ 10, 25, 50, 99999 ], [ 10, 25, 50, "全部" ] ];
				if (undefined != param.allRow) {
					dom='<"toolbar">t';
					aLengthMenu = [ [ 99999 ], [ "全部" ] ];
				}
				if (undefined != param.dom) {
					dom = param.dom;
				}
				if (undefined != param.ajaxType) {
					ajaxType = "GET";
				}
				if (undefined != param.dataSrc) {
					dataSrc = param.dataSrc;
				}
				
				if($('#' + param.tableId).find('th input:checkbox').length > 0 ){
					$('#' + param.tableId).find('th').first().attr("width","40px");
					$('#' + param.tableId+':not(.normal)').find('th input:checkbox').attr("disabled",true); 
				}
				
				var oTable  = $('#' + param.tableId).dataTable({
					"processing": true,
			        "serverSide": serverSide,
			        "ordering": false,
			        "dom": dom,
			        "aLengthMenu" : [ [ 10, 25, 50, 99999 ], [ 10, 25, 50, "全部" ] ],
			        "oLanguage" : {
						"sSearch":"搜    索:    ",
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						//"sLengthMenu" : "<button class='btn btn-sm btn-info' onclick='javascript:alert(111);'><i class='icon-ok bigger-110'></i>新增</button>",
						"sZeroRecords" : "没有检索到数据",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "<<",
							"sNext" : ">>",
							"sLast" : "尾页"
						},
						"sZeroRecords" : "没有检索到数据",
						"sProcessing" : "数据正在加载中，请稍后......"
					},
			        "ajax": {
			        	"cache":false,
			            "url":param.url,
			            "dataSrc":dataSrc,
			            "data":param.data,
			            "type": ajaxType,
			            "error":common.ajaxErrorHandle,
			            "dataType":"JSON"
			        },
			        "columns":param.columns,
			        "columnDefs":param.columnDefs,
			        "fnDrawCallback":function(){
			        	if(param.callBack && typeof(param.callBack) == 'function'){
			        		param.callBack();
			        	}
			        }
			   });
				
				$('#' + param.tableId+"_length").addClass("col-xs-6 no-padding-left");
				$('#' + param.tableId+"_paginate").addClass("col-xs-6 no-padding-right");
				
				var div_search = $('#' + param.tableId).siblings(".dataTables_search");
				if(div_search.length > 0){
					$('#' + param.tableId).find(".dataTables_filter").before(div_search);
				}
				
				$('#' + param.tableId).data("oTable",oTable);
				return oTable;
				
			},
			tableRefesh:function(tableId){
				$('#' + tableId).DataTable().ajax.reload();
			},
			tableDataRedesh:function(tableId){
				$("#" + tableId).dataTable().fnDraw(false)
			},
			getSingleCheck:function(tableID){
				var checkNumber = $("#" + tableID + " tbody input[type='checkbox']:checked:visible").length;
				if(checkNumber == 0){ 
					util.showMsg('warning','操作提示','请选择一条记录');
					return false;
				}else if(checkNumber > 1 ){
					util.showMsg('warning','操作提示','请选择一条记录');
					return false;
				}else{
					var check = $("#" + tableID + " tbody input[type='checkbox']:checked:visible").first();
					return check;
				}
				
				return false; 
			},
			formatMembersStatus:function(data){
				var html = '';
				if (data == '1') {
					html = '<span class="badge  badge-success ">已启用</span>';
	            } else if (data == '-1') {
	            	html = '<span class="badge  badge-danger ">已禁用</span>';
	            } else {
	            	html = data;
	            }
				return html;
			},
			formatCouponStatus:function(data){
				var html = '';
				if (data == '1') {
					html = '<span class="badge  badge-success ">已启用</span>';
				} else if (data == '-1') {
					html = '<span class="badge  badge-danger ">已禁用</span>';
				} else {
					html = data;
				}
				return html;
			},
			formatTruckStatus:function(data){
				var html = '';
				if (data == '0') {
					html = '<span class="badge  badge-default ">未出行</span>';
				} else if (data == '1') {
					html = '<span class="badge  badge-warning ">已出行</span>';
				} else {
					html = data;
				}
				return html;
			},
			formatSuccessStatus:function(data){
				var html = '';
				if (data == true) {
					html = '<span class="badge  badge-success ">成功</span>';
				} else if(data == false){
					html = '<span class="badge  badge-danger ">失败</span>';
				} else {
					html = data;
				}
				return html;
			},
			formatAppleStoreOrderStatus:function(data){
				var html = '';
				if (data == "-1") {
					html = '<span class="badge  badge-danger ">申请失败</span>';
				} else if(data == "0"){
					html = '<span class="badge  badge-success">处理中</span>';
				} else if(data == "1"){
					html = '<span class="badge  badge-primary ">申请成功</span>';
				}else{
					html = data;
				}
				return html;
			},
			formatBrowerStatus:function(data){
				var html = '';
				if (data == "0") {
					html = '<span class="badge  badge-info ">新申请</span>';
				} else if(data == "1"){
					html = '<span class="badge  badge-success">同意外借</span>';
				} else if(data == "2"){
					html = '<span class="badge  badge-primary ">已经外借</span>';
				}else if(data == "3"){
					html = '<span class="badge  badge-warning ">已经归还</span>';
				}else if(data == "-2"){
					html = '<span class="badge  badge-danger ">拒绝外借</span>';
				}else{
					html = data;
				}
				return html;
			},
			formatGoodsInfoStatus:function(data){
				var html = '';
				if (data == "-1") {
					html = '<span class="badge  badge-warning ">下架，未审核</span>';
				} else if(data == "0"){
					html = '<span class="badge  badge-warning">下架，审核中</span>';
				} else if(data == "1"){
					html = '<span class="badge  badge-success ">审核通过</span>';
				}else if(data == "-2"){
					html = '<span class="badge  badge-danger ">审核不通过</span>';
				}else if(data == "2"){
					html = '<span class="badge  badge-primary ">上架,审核通过</span>';
				}else if(data == "3"){
					html = '<span class="badge  badge-primary ">下架，审核通过</span>';
				}else{
					html = data;
				}
				return html;
			},
			formatToMemberTypeStatus:function(data){
				var html = '';
				if (data == "1") {
					html = '<span class="badge  badge-warning ">加盟商/批发商会员</span>';
				} else if(data == "2"){
					html = '<span class="badge  badge-success">中间业务会员</span>';
				} else{
					html = data;
				}
				return html;
			},
			formatArchiveStatus:function(data){
				var html = '';
				if (data == "1") {
					html = '<span class="badge  badge-info ">正常</span>';
				}else if(data == "-1") {
					html = '<span class="badge  badge-warning">已外借</span>';
				}else if(data == "-2") {
					html = '<span class="badge  badge-danger">已丢失</span>';
				}else if(data == "-3") {
					html = '<span class="badge  badge-danger">已调走</span>';
				}
				return html;
			},
			formatGoodsTakeStatus:function(data){
				var html = '';
				if (data == 1) {
					html = '<span class="badge  badge-success ">分销中</span>';
				} else if(data == -1) {
					html = '<span class="badge  badge-danger">取消分销</span>';
				}else {
					html = data;
				}
				return html;
			},
			formatGoodsTakeStatus:function(data){
				var html = '';
				if (data == 1) {
					html = '<span class="badge  badge-success ">分销中</span>';
				} else if(data == -1) {
					html = '<span class="badge  badge-danger">取消分销</span>';
				}else {
					html = data;
				}
				return html;
			},
			formatOrderStatus:function(data){
				var html = '';
				if (data == 0) {
					html = '<span class="badge  badge-default ">未处理</span>';
				} else if(data == 1) {
					html = '<span class="badge  badge-success">进行中</span>';
				}else if(data == 2) {
					html = '<span class="badge  badge-primary">已完成</span>';
				}else if(data == 3) {
					html = '<span class="badge  badge-danger">被退回</span>';
				}else {
					html = data;
				}
				return html;
			},
			formatGoodsTakeStatus:function(data){
				var html = '';
				if (data == 1) {
					html = '<span class="badge  badge-success ">分销中</span>';
				} else if(data == -1) {
					html = '<span class="badge  badge-danger">取消分销</span>';
				}else {
					html = data;
				}
				return html;
			},
			formatGoodsInfoCategory:function(data){
				if(data == 1 ){
					return "普通商品类";
				}else if(data == 2 ){
					return "付费服务类";
				}else if(data == 3 ){
					return "计次服务类";
				}else if(data == 4 ){
					return "旅游项目类";
				}else{
					return data;
				}
			},
			formatCouponCategory:function(data){
				if(data == 1 ){
					return "代金卷";
				}else if(data == 2 ){
					return "折扣优惠券";
				}else{
					return data;
				}
			},
			formatCouponValidDate:function(row){
				if(row.validType == -1 ){
					return "永久有效";
				}else if(row.validType == 1 ){
					return row.validBeginDate + "至" + row.validEndDate;
				}else{
					return row.validType;
				}
			},
			formatCouponLogCategory:function(data){
				if(data == -1 ){
					return "消费";
				}else if(data == 1 ){
					return "发放获得";
				}else if(data == 2 ){
					return "转让获得";
				}else{
					return data;
				}
			},
			formatGiftType:function(data){
				if(data == 1 ){
					return "普通类";
				}else if(data == 2 ){
					return "次卡类";
				}else if(data == 3 ){
					return "储值类";
				}else if(data == 4 ){
					return "电子卷类";
				}else{
					return data;
				}
			},
			formatGiftShow:function(data){
				if(data){
					return "显示";
				}else{
					return "隐藏";
				}
			},
			formatGiftStatus:function(data){
				var html = '';
				if (data == "-1") {
					html = '<span class="badge  badge-warning ">下架，未审核</span>';
				} else if(data == "0"){
					html = '<span class="badge  badge-warning">下架，审核中</span>';
				} else if(data == "1"){
					html = '<span class="badge  badge-success ">审核通过</span>';
				}else if(data == "-2"){
					html = '<span class="badge  badge-danger ">审核不通过</span>';
				}else if(data == "2"){
					html = '<span class="badge  badge-primary ">上架,审核通过</span>';
				}else if(data == "3"){
					html = '<span class="badge  badge-primary ">下架，审核通过</span>';
				}else{
					html = data;
				}
				return html;
			},
			formatWeiXinPmtStatus:function(data){
				var html = '';
				if (data == 1) {
					html = '<span class="badge  badge-warning ">精华</span>';
				} else{
					html = '<span class="badge  badge-default ">非精华</span>';
				}
				return html;
			},
			formatWeiXinRedpackagesDistubitTypr:function(data){
				var html = '';
				if (data == 1) {
					html = '等额分配';
				}else if(data == 2){
					html = '随机分配';
				}else{
					html = data;
				}
				return html;
			},
			formatWeiXinRedpackagesEndTime:function(data){
				var html = '';
				if (data == null || data == "") {
					html = '永久有效';
				}else{
					html = data;
				}
				return html;
			},
			formatScoreAddorDelCategory:function(data){
				var html = '';
				if (data == "1") {
					html = '获取';
				}else if(data == "-1"){
					html = "消耗";
				}
				return html;
			},
			formatScoredepositScoreType:function(data){
				var html = '';
				if (data == "1") {
					html = '消费返积分';
				}else if(data == "2"){
					html = "推荐推广获取";
				}else if(data == "3"){
					html = "一级消费获取";
				}else if(data == "4"){
					html = "二级消费获取";
				}else {
					html = '';
				}
				return html;
			},
			formatNumberCardValidDate:function(row){
				if(row.validType == -1 ){
					return "永久有效";
				}else if(row.validType == 1 ){
					return row.validBeginTime + "至" + row.validEndTime;
				}else{
					return row.validType;
				}
			},
	}
});

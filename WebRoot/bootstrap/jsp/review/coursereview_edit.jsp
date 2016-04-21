<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>嵌入式教学网站</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- ztree -->
		<link  rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/js/ztree/themes/css/style.css" />
		<link  rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/js/ztree/themes/blue/core.css" />
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/Font-Awesome-4.4.0/css/font-awesome.min.css" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/chosen.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace-fonts.css" />
       <!-- 消息通知 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/jquery.gritter.css" 
		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!-- inline styles related to this page -->
		
		<!-- kindeditor 编辑器 -->
		<!-- kindeditor begin -->
			 <!-- kindeditor Style -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/frame/kindeditor-4.1.9/themes/default/default.css" />
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/frame/kindeditor-4.1.9/plugins/code/prettify.css" />
	    
	   <!-- kindeditor end -->
	   
	   <!-- 时间选择器 -->
	   <link href="${pageContext.request.contextPath}/frame/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	   
		<!-- ace settings handler -->
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace-extra.js"></script>
		<style type="text/css">
			.datagrid-mask {
			  position: absolute;
			  left: 0;
			  top: 0;
			  width: 100%;
			  height: 100%;
			  opacity: 0.3;
			  filter: alpha(opacity=30);
			  display: none;
			  background: #ccc;
			  
			}
			.datagrid-mask-msg {
			  position: absolute;
			  top: 50%;
			  margin-top: -20px;
			  padding: 10px 5px 10px 30px;
			  width: auto;
			  border-width: 2px;
			  border-style: solid;
			  display: none;
			  background: #ffffff url('${pageContext.request.contextPath}/bootstrap/image/loading.gif') no-repeat scroll 5px center;
			   border-color: #95B8E7;
			}
		</style>
	</head>

	<body style="background-color: #FFF">
<!-- ------------------------------------------------------------------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑作业</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="container-fluid">
			<form id="coursereview_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${coursereview.id}" />
				<input type="hidden" name="content" id="content" />
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">课程名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled" class="width-100" value="${coursereview.courseStr}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${coursereview.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="subTitle" class="col-sm-3 control-label no-padding-right">副标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="subTitle" type="text" name="subTitle" class="width-100" value="${coursereview.subTitle}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="creator" class="col-sm-3 control-label no-padding-right">创建者：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled" class="width-100" value="${coursereview.creator}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">评论详情：</label>
						<div class="col-sm-9">
							<textarea id="content_ke" name="content_ke" class="col-xs-10 col-sm-5" rows="3" cols="" style="width:100%;visibility:hidden;">${coursereview.content} </textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_coursereview">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_coursereview">返回</a> 
		</div>
	</div>
</div>
<!-- ------------------------------------------------------------------------------------ -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/app/sea.js"></script>
		<!-- page specific plugin scripts -->
		<!-- DataTables-1.10.4 -->
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.dataTables.bootstrap.js"></script>
		<!--[if lte IE 8]>
		  <script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery-ui.custom.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.easypiechart.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.sparkline.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/flot/jquery.flot.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/flot/jquery.flot.pie.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/flot/jquery.flot.resize.js"></script>

		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.scroller.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.colorpicker.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.fileinput.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.typeahead.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.spinner.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.treeview.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.wizard.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.aside.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.ajax-content.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.touch-drag.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.sidebar.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.widget-box.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.settings.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.settings-skin.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- 消息通知 -->
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/jquery.gritter.js"></script>
		<!-- 表单验证 -->
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.validate.ext.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace.onpage-help.css" />

		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.onpage-help.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.onpage-help.js"></script>
		<!-- 弹窗 -->
		<script src="${pageContext.request.contextPath}/bootstrap/js/window/modal.manager.plugin1.0.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/window/jshow.utils.js"></script>
		
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/chosen.jquery.js"></script>
		
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.form.js"></script>
		<!-- ztree -->
		<script src="${pageContext.request.contextPath}/bootstrap/js/ztree/jquery.ztree.all-3.5.js"></script>
		
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.slimscroll.min.js"></script>
		<!-- kindeditor在线编辑器 -->
		 <!-- kindeditor JS -->
	    <script charset="utf-8" src="${pageContext.request.contextPath}/frame/kindeditor-4.1.9/kindeditor.js"></script>
	    <script charset="utf-8" src="${pageContext.request.contextPath}/frame/kindeditor-4.1.9/lang/zh_CN.js"></script>
	    <script charset="utf-8" src="${pageContext.request.contextPath}/frame/kindeditor-4.1.9/plugins/code/prettify.js"></script>
	    
	    <!-- 日期时间 -->
		<%--<script type="text/javascript" src="${pageContext.request.contextPath}/frame/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
		--%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/frame/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/frame/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
		
		<!-- hightcharts -->
		<script src="${pageContext.request.contextPath}/frame/Highcharts-4.2.1/js/highcharts.js"></script>
		<script src="${pageContext.request.contextPath}/frame/Highcharts-4.2.1/js/modules/exporting.js"></script>
	</body>
</html>
<script type="text/javascript">
var basePath = "${pageContext.request.contextPath}/";
seajs.use("common/main", function(main) {
	main.init();
});
</script>
<script type="text/javascript">
var basePath = "${pageContext.request.contextPath}/";
seajs.use("review/coursereview_edit", function(coursereview_edit) {
	coursereview_edit.init();
});
</script>
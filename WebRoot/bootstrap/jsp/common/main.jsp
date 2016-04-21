<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>网络小说管理系统</title>

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

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="ace-icon fa fa-recycle"></i>
							网络小说管理系统
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<%--<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 Notifications
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														New Comments
													</span>
													<span class="pull-right badge badge-info">+12</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<i class="btn btn-xs btn-primary fa fa-user"></i>
												Bob just signed up as an editor ...
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														New Orders
													</span>
													<span class="pull-right badge badge-success">+8</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														Followers
													</span>
													<span class="pull-right badge badge-info">+11</span>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See all notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
						--%><!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<%--<img class="nav-user-photo" src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/avatars/user.jpg" alt="Jason's Photo" />
								--%><span class="user-info">
									<small>欢迎,${LOGINER.nickName }<i class="ace-icon fa fa-caret-down"></i></small>
								</span>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<%--<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										设置
									</a>
								</li>
								--%>
								<li>
									<a id="password_update" href="javascript:void(0);">
										<i class="ace-icon fa fa-pencil-square"></i>
										密码修改
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a id="login_exit" href="javascript:void(0);" target="_self">
										<i class="ace-icon fa fa-power-off"></i>
										退出系统
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
<!-- -----------------------菜单开始-------------------------- -->
				<ul class="nav nav-list">
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${menu.type eq 1 }">
							<li>
								<a id="${menu.id }" href="javascript:void(0);" class="dropdown-toggle">
									<i class="menu-icon fa ${menu.icon }"></i>
									<span class="menu-text"> ${menu.name } </span>
		
									<b class="arrow fa fa-angle-down"></b>
								</a>
		
								<b class="arrow"></b>
		
								<ul class="submenu">
									<c:forEach items="${menuList }" var="submenu">
										<c:if test="${submenu.parentId eq  menu.id}">
											<li>
												<a id="${submenu.id }" vurl='${submenu.url }' vnav1='${menu.name}' vnav2='${submenu.name}' href="javascript:void(0);">
													<i class="menu-icon fa fa-caret-right"></i>
													${submenu.name }
												</a>
												<b class="arrow"></b>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>

				</ul><!-- /.nav-list -->
<!-- -----------------------菜单结束-------------------------- -->
				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<span id="nav-level1">首页</span>
							</li>
							<li  id="nav-level2" class="active">概要</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div id="main-content" class="page-content">
					<!-- 正式内容区域 -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">网络小说管理系统</span>
							&copy; 2016
						</span>

					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

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
var getCookie = function(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]); 
    else 
        return null; 
};
var setCookie=function(name,value){
	var Days = 30; 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
};
var loadDiv=function(url,nav1,nav2,aid){
	if(url != null && url != "" && typeof(url) != 'undefined'){
		$("#main-content").load(url);
		setCookie("vurl",url);
	}
	if(nav1 != null && nav1 != "" && typeof(nav1) != 'undefined'){
		setCookie("nav1",nav1);
		$("#nav-level1").html(nav1);
	}
	if(nav2 != null && nav2 != "" && typeof(nav2) != 'undefined'){
		setCookie("nav2",nav2);
		$("#nav-level2").html(nav2);
	}
	if(aid != null && aid != "" && typeof(aid) != 'undefined'){
		setCookie("aid",aid);
		$("#" + aid).parent("li").addClass("active");
		$("#" + aid).parent("li").parent("ul").parent("li").addClass("active");
		$("#" + aid).parent("li").parent("ul").parent("li").addClass("open");
	}
};
var cancelDiv=function(){
	var aid = getCookie("aid");
	if(aid != null && "" != aid && typeof(aid) != 'undefined'){
		var url = $("#" + aid).attr("vurl");
		var vnav1 = $("#" + aid).attr("vnav1");
		var vnav2 = $("#" + aid).attr("vnav2");
		url = basePath + url;
		loadDiv(url,vnav1,vnav2,aid);
	}

};
</script>
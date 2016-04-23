<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title> 软件测试用例管理系统</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/Font-Awesome-4.4.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace-fonts.css" />
       <!-- 消息通知 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/jquery.gritter.css" 
		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!-- inline styles related to this page -->

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

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h2>
									<i class="ace-icon fa fa-recycle green"></i>
									<span class="blue" id="id-text2 grey"> 软件测试用例管理系统</span>
								</h2>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												请输入登陆信息
											</h4>

											<div class="space-6"></div>

										<form id="login_form">
											<fieldset>
												<div class="form-group col-xs-12 no-padding">
													<div class="col-xs-12 input-group">
														<span class="input-group-addon"> <i class="ace-icon fa fa-user"></i> </span> <input id="account_input_id" value="" name="account" id="login_text_account" type="text" class="form-control" placeholder="请输入用户名" />
													</div>
												</div>
												<div class="form-group col-xs-12 no-padding">
													<div class="col-xs-12 input-group">
														<span class="input-group-addon"> <i class="ace-icon fa fa-lock"></i> </span> <input id="password_input_id" value=""  name="password" id="login_text_password" type="password" class="form-control" placeholder="请输入密码" />
													</div>
												</div>
												<div class="space"></div>

												<div class="clearfix">
													<%--<button id="regist_button" type="button" class="btn btn-sm btn-success btn-round">
														<i class="ace-icon fa fa-sign-in"></i> <span class="bigger-110">注册</span>
													</button>
													--%><button id="login_button" type="button" class="pull-right btn btn-sm btn-primary btn-round">
														<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登陆</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

										<div class="social-or-login center">
											</div>

											<div class="space-6"></div>

										</div><!-- /.widget-main -->

										<%--<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													忘记密码
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													注册账号
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									--%></div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												找回密码
											</h4>

											<div class="space-6"></div>
											<p>
												请输入你的注册邮箱
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="电子邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">发送</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												返回登陆
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												注册新用户
											</h4>

											<div class="space-6"></div>
											<p> 请输入以下信息: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="电子邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登陆账号" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="再次输入密码" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<%--<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>

													--%><div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">清空</span>
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">注册</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												返回登陆
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->

						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
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
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.form.js"></script>
		<!-- 表单验证 -->
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/jquery/jquery.validate.ext.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/css/ace.onpage-help.css" />

		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/elements.onpage-help.js"></script>
		<script src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/js/ace/ace.onpage-help.js"></script>
		<!-- 弹窗 -->
		<script src="${pageContext.request.contextPath}/bootstrap/js/window/modal.manager.plugin1.0.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/window/jshow.utils.js"></script>
		

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			 $('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
			});
			
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
		</script>
	</body>
</html>
<script type="text/javascript">
var basePath = "${pageContext.request.contextPath}/";
seajs.use("common/login", function(login) {
	login.init();
});
</script>

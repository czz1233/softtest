<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增账号</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="account_add_form" class="form-horizontal">
				<div class="col-sm-2 center">
					<input name="phtoto" id="account_photo" type="hidden" value="/frame/bootstrap_ace_v1.3.2/assets/avatars/profile-pic.jpg" />
					<div class="col-xs-12 center">
						<img id="account_photo_img" alt="" src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/avatars/profile-pic.jpg" style="width: 200px;height: 220px;" />
					</div>
					<div style="margin-top: 15px;" class="col-xs-12 center">
						<button type="button" id="show_file_upload_add" class="btn btn-white btn-primary btn-round btn-sm">
							<i class="ace-icon fa fa-upload bigger-120 blue"></i> 上传头像
						</button>
					</div>
				</div>
				<div class="col-sm-10">
					<div class="form-group">
						<label for="account" class="col-sm-3 control-label no-padding-right">账号信息：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="account" type="text" name="account" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="nickName" class="col-sm-3 control-label no-padding-right">账号昵称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="nickName" type="text" name="nickName" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label no-padding-right">账号密码：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5"> 
								<input disabled="disabled" value="默认密码123456" id="password" type="text" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sex" class="col-sm-3 control-label no-padding-right">性别信息：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5"> 
								<select id="sex" class="width-100 form-control"  name="sex" >
			    					<hy:dictOption dictType="PERSION_SEX"></hy:dictOption>
			    				</select>
		    				</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sex" class="col-sm-3 control-label no-padding-right">角色信息：</label>
						<div class="col-sm-9 no-padding">
							<c:forEach items="${roleList }" var = "role">
								<div class="checkbox">
									<label>
										<input name="roleId" type="checkbox" class="ace" value="${role.id }">
										<span class="lbl"> ${role.name }</span>
									</label>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
						<div class="col-sm-9">
							<textarea id="remark" name="remark" class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_account">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_account">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("sys/account_add", function(account_add) {
		account_add.init();
	});
</script>
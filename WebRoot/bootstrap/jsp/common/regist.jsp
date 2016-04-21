<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->

<div class="container-fluid">
<form style="margin-top: 15px;" id="account_add_form" class="form-horizontal">
	<div class="col-sm-2 center">
		<input name="phtoto" id="account_photo" type="hidden" value="/frame/bootstrap_ace_v1.3.2/assets/avatars/profile-pic.jpg" />
		<div class="col-xs-12 center">
			<img id="account_photo_img" alt="" src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/avatars/profile-pic.jpg" style="width: 120px;height: 120px;" />
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
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="account" type="text" name="account" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="nickName" class="col-sm-3 control-label no-padding-right">账号昵称：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="nickName" type="text" name="nickName" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-3 control-label no-padding-right">账号密码：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right  col-sm-10 "> 
					<input disabled="disabled" value="默认密码123456" id="password" type="text" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="nickName" class="col-sm-3 control-label no-padding-right">邮箱：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="email" type="text" name="email" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="sex" class="col-sm-3 control-label no-padding-right">性别信息：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right  col-xs-10 "> 
					<select id="sex" class="width-100 form-control"  name="sex" >
    					<hy:dictOption dictType="PERSION_SEX"></hy:dictOption>
    				</select>
   				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="sex" class="col-sm-3 control-label no-padding-right">注册类型：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right  col-xs-10 "> 
					<select id="type" class="width-100 form-control"  name="type" >
    					<option value="0">读者</option>
    					<option value="1">作者</option>
    				</select>
   				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="nickName" class="col-sm-3 control-label no-padding-right">电话：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="tel" type="text" name="tel" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="nickName" class="col-sm-3 control-label no-padding-right">地址：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="address" type="text" name="address" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="nickName" class="col-sm-3 control-label no-padding-right">QQ：</label>
			<div class="col-sm-9 no-padding">
				<span class="block input-icon input-icon-right col-sm-10"> 
					<input id="qq" type="text" name="qq" class="width-100"> 
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
			<div class="col-sm-9">
				<textarea id="remark" name="remark" class="col-xs-10" rows="3" cols=""></textarea>
			</div>
		</div>
	</div>
</form>
</div>
<div class="modal-footer">
	<button id="btn_add_account" role="button" class="btn btn-success JConfirmBtn btn-sm btn-round">确定</button>
	<button id="btn_cancel_account" role="button" class="btn btn-default JCancelBtn btn-sm btn-round">取消</button>
</div>
<script type="text/javascript">
	seajs.use("common/regist", function(regist) {
		regist.init();
	});
</script>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld"%>
<!-- ----------------------------列表区域------------------------ -->

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<form style="margin-top: 15px;" id="password_update_form" class="form-horizontal">
				<div class="form-group">
					<label for="title" class="col-sm-3 control-label no-padding-right">原密码：</label>
					<div class="col-sm-9 no-padding">
						<span class="block input-icon input-icon-right col-sm-8"> 
								<input id="oldPwd" type="password" name="oldPwd" class="width-100"> 
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="subTitle" class="col-sm-3 control-label no-padding-right">新密码：</label>
					<div class="col-sm-9 no-padding">
						<span class="block input-icon input-icon-right col-sm-8"> 
								<input id="newPwd1" type="password" name="newPwd1" class="width-100"> 
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="describle" class="col-sm-3 control-label no-padding-right">确认密码：</label>
					<div class="col-sm-9 no-padding">
						<span class="block input-icon input-icon-right col-sm-8"> 
								<input id="newPwd2" type="password" name="newPwd2" class="width-100"> 
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button id="button_ok" role="button" class="btn btn-success JConfirmBtn btn-sm btn-round">确定</button>
	<button id="button_cancel" role="button" class="btn btn-default JCancelBtn btn-sm btn-round">取消</button>
</div>
<script type="text/javascript">
	seajs.use("common/password_update", function(password_update) {
		password_update.init();
	});
</script>
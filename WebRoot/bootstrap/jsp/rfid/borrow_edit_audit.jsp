<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">审核</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="borrow_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${borrow.id}" />
					<div class="form-group">
						<label for="applyUser" class="col-sm-3 control-label no-padding-right">审核：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<select id="state" name="state" class="col-sm-12">
									<option value="1">同意外借</option>
									<option  value="-2">拒绝外借</option>
								</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">审核意见：</label>
						<div class="col-sm-9">
							<textarea id="auditReason" name="auditReason" class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_borrow">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_borrow">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rfid/borrow_edit_audit", function(borrow_edit_audit) {
		borrow_edit_audit.init();
	});
</script>
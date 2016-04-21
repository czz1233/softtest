<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑申请外借</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="borrow_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${borrow.id}" />

					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100" value="${borrow.id}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyUser" class="col-sm-3 control-label no-padding-right">applyUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyUser" type="text" name="applyUser" class="width-100" value="${borrow.applyUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyTime" class="col-sm-3 control-label no-padding-right">applyTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyTime" type="text" name="applyTime" class="width-100" value="${borrow.applyTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyBeginTime" class="col-sm-3 control-label no-padding-right">applyBeginTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyBeginTime" type="text" name="applyBeginTime" class="width-100" value="${borrow.applyBeginTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyEndTime" class="col-sm-3 control-label no-padding-right">applyEndTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyEndTime" type="text" name="applyEndTime" class="width-100" value="${borrow.applyEndTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyReason" class="col-sm-3 control-label no-padding-right">applyReason：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyReason" type="text" name="applyReason" class="width-100" value="${borrow.applyReason}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyIdCard" class="col-sm-3 control-label no-padding-right">applyIdCard：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyIdCard" type="text" name="applyIdCard" class="width-100" value="${borrow.applyIdCard}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyIdCardImage" class="col-sm-3 control-label no-padding-right">applyIdCardImage：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyIdCardImage" type="text" name="applyIdCardImage" class="width-100" value="${borrow.applyIdCardImage}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-3 control-label no-padding-right">state：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="state" type="text" name="state" class="width-100" value="${borrow.state}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="auditUser" class="col-sm-3 control-label no-padding-right">auditUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="auditUser" type="text" name="auditUser" class="width-100" value="${borrow.auditUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="auditTime" class="col-sm-3 control-label no-padding-right">auditTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="auditTime" type="text" name="auditTime" class="width-100" value="${borrow.auditTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="auditReason" class="col-sm-3 control-label no-padding-right">auditReason：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="auditReason" type="text" name="auditReason" class="width-100" value="${borrow.auditReason}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="giveToUser" class="col-sm-3 control-label no-padding-right">giveToUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="giveToUser" type="text" name="giveToUser" class="width-100" value="${borrow.giveToUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="giveToTIme" class="col-sm-3 control-label no-padding-right">giveToTIme：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="giveToTIme" type="text" name="giveToTIme" class="width-100" value="${borrow.giveToTIme}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="giveToRemark" class="col-sm-3 control-label no-padding-right">giveToRemark：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="giveToRemark" type="text" name="giveToRemark" class="width-100" value="${borrow.giveToRemark}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="backUser" class="col-sm-3 control-label no-padding-right">backUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="backUser" type="text" name="backUser" class="width-100" value="${borrow.backUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="backTime" class="col-sm-3 control-label no-padding-right">backTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="backTime" type="text" name="backTime" class="width-100" value="${borrow.backTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="backRemark" class="col-sm-3 control-label no-padding-right">backRemark：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="backRemark" type="text" name="backRemark" class="width-100" value="${borrow.backRemark}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="archive" class="col-sm-3 control-label no-padding-right">archive：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="archive" type="text" name="archive" class="width-100" value="${borrow.archive}"> 
							</span>
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
	seajs.use("rfid/borrow_edit", function(borrow_edit) {
		borrow_edit.init();
	});
</script>
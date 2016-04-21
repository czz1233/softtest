<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑调档记录</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="liverecord_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${liverecord.id}" />

					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100" value="${liverecord.id}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveUser" class="col-sm-3 control-label no-padding-right">liveUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveUser" type="text" name="liveUser" class="width-100" value="${liverecord.liveUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveReason" class="col-sm-3 control-label no-padding-right">liveReason：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveReason" type="text" name="liveReason" class="width-100" value="${liverecord.liveReason}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveTime" class="col-sm-3 control-label no-padding-right">liveTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveTime" type="text" name="liveTime" class="width-100" value="${liverecord.liveTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveTo" class="col-sm-3 control-label no-padding-right">liveTo：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveTo" type="text" name="liveTo" class="width-100" value="${liverecord.liveTo}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="operateUser" class="col-sm-3 control-label no-padding-right">operateUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="operateUser" type="text" name="operateUser" class="width-100" value="${liverecord.operateUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="operateTimme" class="col-sm-3 control-label no-padding-right">operateTimme：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="operateTimme" type="text" name="operateTimme" class="width-100" value="${liverecord.operateTimme}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">remark：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="remark" type="text" name="remark" class="width-100" value="${liverecord.remark}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="archive" class="col-sm-3 control-label no-padding-right">archive：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="archive" type="text" name="archive" class="width-100" value="${liverecord.archive}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="archiveTitle" class="col-sm-3 control-label no-padding-right">archiveTitle：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="archiveTitle" type="text" name="archiveTitle" class="width-100" value="${liverecord.archiveTitle}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="archiveElTag" class="col-sm-3 control-label no-padding-right">archiveElTag：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="archiveElTag" type="text" name="archiveElTag" class="width-100" value="${liverecord.archiveElTag}"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_liverecord">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_liverecord">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rfid/liverecord_edit", function(liverecord_edit) {
		liverecord_edit.init();
	});
</script>
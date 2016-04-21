<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增申请外借</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="borrow_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="applyUser" class="col-sm-3 control-label no-padding-right">申请人：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyUser" type="text" name="applyUser" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="applyUser" class="col-sm-3 control-label no-padding-right">申请人身份证：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="applyIdCard" type="text" name="applyIdCard" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">所属档案：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
							<select id="archiveId" name="archiveId" class="col-sm-12">
								<c:forEach items="${archiveList }" var="ah">
									<option value="${ah.id }">${ah.title }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">申请解除时间：</label>
						<div class="date form_datetime input-group col-sm-4 no-padding" data-date-format="yyyy-mm-dd hh:ii">
						   <input id="validBeginDate" name="applyBeginTime" readonly="readonly" class="width-100"  type="text"  />
						    <span class="input-group-addon">
								<i class="fa fa-times bigger-110"></i>
							</span>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">申请归还时间：</label>
						<div class="date form_datetime input-group col-sm-4 no-padding" data-date-format="yyyy-mm-dd hh:ii">
						   <input id="validBeginDate" name="applyEndTime" readonly="readonly" class="width-100"  type="text"  />
						    <span class="input-group-addon">
								<i class="fa fa-times bigger-110"></i>
							</span>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">申请原因：</label>
						<div class="col-sm-9">
							<textarea id="applyReason" name="applyReason" class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_borrow">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_borrow">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rfid/borrow_add_apply", function(borrow_add_apply) {
		borrow_add_apply.init();
	});
</script>
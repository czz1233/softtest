<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增调档记录</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="liverecord_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="liveUser" class="col-sm-3 control-label no-padding-right">调档人：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveUser" type="text" name="liveUser" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">所调档案：</label>
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
						<label class="col-sm-3 control-label no-padding-right">调档时间：</label>
						<div class="date form_datetime input-group col-sm-4 no-padding" data-date-format="yyyy-mm-dd hh:ii">
						   <input id="validBeginDate" name="liveTime" readonly="readonly" class="width-100"  type="text"  />
						    <span class="input-group-addon">
								<i class="fa fa-times bigger-110"></i>
							</span>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveReason" class="col-sm-3 control-label no-padding-right">调档原因：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveReason" type="text" name="liveReason" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="liveTo" class="col-sm-3 control-label no-padding-right">调至：</label>
						<div class="col-sm-9 no-padding">
							<span class="input-group block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="liveTo" type="text" name="liveTo" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_liverecord">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_liverecord">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rfid/liverecord_add", function(liverecord_add) {
		liverecord_add.init();
	});
</script>
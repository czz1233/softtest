<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑视频</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="videoinfo_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${videoinfo.id}" />
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">视频标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${videoinfo.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">课程名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input disabled="disabled"  type="text"  class="width-100" value="${videoinfo.courseStr}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="createTime" class="col-sm-3 control-label no-padding-right">创建时间：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input disabled="disabled" type="text"  class="width-100" value="${videoinfo.createTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="creator" class="col-sm-3 control-label no-padding-right">创建者：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input disabled="disabled" type="text" class="width-100" value="${videoinfo.creator}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
						<div class="col-sm-9">
							<textarea id="describle" name="describle" class="col-xs-10 col-sm-5" rows="3" cols="">${videoinfo.describle}</textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_videoinfo">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_videoinfo">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("teacher/videoinfo_edit", function(videoinfo_edit) {
		videoinfo_edit.init();
	});
</script>
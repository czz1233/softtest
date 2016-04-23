<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑软件</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="software_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${software.id}" />

					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="name" type="text" name="name" class="width-100" value="${software.name}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label no-padding-right">类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="type" type="text" disabled="disabled" class="width-100" value="${software.type}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="vision" class="col-sm-3 control-label no-padding-right">版本：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="vision" type="text" name="vision" class="width-100" value="${software.vision}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="environment" class="col-sm-3 control-label no-padding-right">部署环境：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="environment" type="text" name="environment" class="width-100" value="${software.environment}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注信息：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="remark" type="text" name="remark" class="width-100" value="${software.remark}"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_software">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_software">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("softtest/software_edit", function(software_edit) {
		software_edit.init();
	});
</script>
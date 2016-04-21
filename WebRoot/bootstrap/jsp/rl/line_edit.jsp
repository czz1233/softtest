<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑路线</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="line_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${line.id}" />

					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${line.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label no-padding-right">类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="type" type="text" name="type" class="width-100" value="${line.type}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-3 control-label no-padding-right">路线：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="content" type="text" name="content" class="width-100" value="${line.content}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
						<div class="col-sm-9">
							<textarea id="remark" name="remark" class="col-xs-10 col-sm-5" rows="3" cols="">${line.remark}</textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_line">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_line">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rl/line_edit", function(line_edit) {
		line_edit.init();
	});
</script>
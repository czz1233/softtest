<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑章节</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="section_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${section.id}" />

					<div class="form-group">
						<label for="sname" class="col-sm-3 control-label no-padding-right">章节名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sname" type="text" name="sname" class="width-100" value="${section.sname}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">章节内容：</label>
						<div class="col-sm-9">
							<textarea id="section" name="section" class="col-xs-12" rows="120" cols="">${section.section}</textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_section">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_section">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/section_edit", function(section_edit) {
		section_edit.init();
	});
</script>
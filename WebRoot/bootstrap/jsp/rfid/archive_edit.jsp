<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑档案</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="archive_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${archive.id}" />

					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${archive.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="elTag" class="col-sm-3 control-label no-padding-right">电子标签：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="elTag" type="text" name="elTag" class="width-100" value="${archive.elTag}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="keyWord" class="col-sm-3 control-label no-padding-right">关键字：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="keyWord" type="text" name="keyWord" class="width-100" value="${archive.keyWord}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="loacation" class="col-sm-3 control-label no-padding-right">存放位置：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="loacation" type="text" name="loacation" class="width-100" value="${archive.loacation}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
						<div class="col-sm-9">
							<textarea id="remark" name="remark" class="col-xs-10 col-sm-5" rows="3" cols="">${archive.remark}</textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_archive">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_archive">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rfid/archive_edit", function(archive_edit) {
		archive_edit.init();
	});
</script>
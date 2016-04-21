<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑话题</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="reviewtitle_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${reviewtitle.id}" />

					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${reviewtitle.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="subTitle" class="col-sm-3 control-label no-padding-right">副标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="subTitle" type="text" name="subTitle" class="width-100" value="${reviewtitle.subTitle}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="describle" class="col-sm-3 control-label no-padding-right">描述：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="describle" type="text" name="describle" class="width-100" value="${reviewtitle.describle}"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_reviewtitle">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_reviewtitle">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("student/reviewtitle_edit", function(reviewtitle_edit) {
		reviewtitle_edit.init();
	});
</script>
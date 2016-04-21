<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑小说评论</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="comment_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${comment.id}" />
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">回复评论：</label>
						<div class="col-sm-9">
							<textarea id="replyContent" name="replyContent" class="col-xs-10" rows="5" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_comment">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_comment">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/comment_edit", function(comment_edit) {
		comment_edit.init();
	});
</script>
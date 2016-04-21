<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增小说评论</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="comment_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-3 control-label no-padding-right">content：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="content" type="text" name="content" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-3 control-label no-padding-right">state：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="state" type="text" name="state" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="replyContent" class="col-sm-3 control-label no-padding-right">replyContent：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="replyContent" type="text" name="replyContent" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="replayTime" class="col-sm-3 control-label no-padding-right">replayTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="replayTime" type="text" name="replayTime" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="replayUser" class="col-sm-3 control-label no-padding-right">replayUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="replayUser" type="text" name="replayUser" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-sm-3 control-label no-padding-right">status：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="status" type="text" name="status" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="createTime" class="col-sm-3 control-label no-padding-right">createTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="createTime" type="text" name="createTime" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="creator" class="col-sm-3 control-label no-padding-right">creator：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="creator" type="text" name="creator" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="story" class="col-sm-3 control-label no-padding-right">story：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="story" type="text" name="story" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_comment">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_comment">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/comment_add", function(comment_add) {
		comment_add.init();
	});
</script>
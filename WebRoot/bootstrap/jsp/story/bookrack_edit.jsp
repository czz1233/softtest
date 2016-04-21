<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑我的书架</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="bookrack_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${bookrack.id}" />

					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100" value="${bookrack.id}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="account" class="col-sm-3 control-label no-padding-right">account：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="account" type="text" name="account" class="width-100" value="${bookrack.account}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="story" class="col-sm-3 control-label no-padding-right">story：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="story" type="text" name="story" class="width-100" value="${bookrack.story}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">name：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="name" type="text" name="name" class="width-100" value="${bookrack.name}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="describle" class="col-sm-3 control-label no-padding-right">describle：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="describle" type="text" name="describle" class="width-100" value="${bookrack.describle}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="updateTime" class="col-sm-3 control-label no-padding-right">updateTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="updateTime" type="text" name="updateTime" class="width-100" value="${bookrack.updateTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="readCount" class="col-sm-3 control-label no-padding-right">readCount：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="readCount" type="text" name="readCount" class="width-100" value="${bookrack.readCount}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="wordCount" class="col-sm-3 control-label no-padding-right">wordCount：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="wordCount" type="text" name="wordCount" class="width-100" value="${bookrack.wordCount}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-3 control-label no-padding-right">state：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="state" type="text" name="state" class="width-100" value="${bookrack.state}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="collectNum" class="col-sm-3 control-label no-padding-right">collectNum：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="collectNum" type="text" name="collectNum" class="width-100" value="${bookrack.collectNum}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="imageUrl" class="col-sm-3 control-label no-padding-right">imageUrl：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="imageUrl" type="text" name="imageUrl" class="width-100" value="${bookrack.imageUrl}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-sm-3 control-label no-padding-right">status：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="status" type="text" name="status" class="width-100" value="${bookrack.status}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="createTime" class="col-sm-3 control-label no-padding-right">createTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="createTime" type="text" name="createTime" class="width-100" value="${bookrack.createTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="creator" class="col-sm-3 control-label no-padding-right">creator：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="creator" type="text" name="creator" class="width-100" value="${bookrack.creator}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="authorStr" class="col-sm-3 control-label no-padding-right">authorStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="authorStr" type="text" name="authorStr" class="width-100" value="${bookrack.authorStr}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="storyTypeStr" class="col-sm-3 control-label no-padding-right">storyTypeStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="storyTypeStr" type="text" name="storyTypeStr" class="width-100" value="${bookrack.storyTypeStr}"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_bookrack">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_bookrack">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/bookrack_edit", function(bookrack_edit) {
		bookrack_edit.init();
	});
</script>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑发布留言</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="talk_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${talk.id}" />

					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100" value="${talk.id}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">title：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="title" type="text" name="title" class="width-100" value="${talk.title}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-3 control-label no-padding-right">content：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="content" type="text" name="content" class="width-100" value="${talk.content}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="createTime" class="col-sm-3 control-label no-padding-right">createTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="createTime" type="text" name="createTime" class="width-100" value="${talk.createTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="reback" class="col-sm-3 control-label no-padding-right">reback：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="reback" type="text" name="reback" class="width-100" value="${talk.reback}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="rebackTime" class="col-sm-3 control-label no-padding-right">rebackTime：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="rebackTime" type="text" name="rebackTime" class="width-100" value="${talk.rebackTime}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-sm-3 control-label no-padding-right">status：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="status" type="text" name="status" class="width-100" value="${talk.status}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="creator" class="col-sm-3 control-label no-padding-right">creator：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="creator" type="text" name="creator" class="width-100" value="${talk.creator}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sendUser" class="col-sm-3 control-label no-padding-right">sendUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sendUser" type="text" name="sendUser" class="width-100" value="${talk.sendUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="rebackUser" class="col-sm-3 control-label no-padding-right">rebackUser：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="rebackUser" type="text" name="rebackUser" class="width-100" value="${talk.rebackUser}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sendUserStr" class="col-sm-3 control-label no-padding-right">sendUserStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sendUserStr" type="text" name="sendUserStr" class="width-100" value="${talk.sendUserStr}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="rebackUserStr" class="col-sm-3 control-label no-padding-right">rebackUserStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="rebackUserStr" type="text" name="rebackUserStr" class="width-100" value="${talk.rebackUserStr}"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_talk">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_talk">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rl/talk_edit", function(talk_edit) {
		talk_edit.init();
	});
</script>
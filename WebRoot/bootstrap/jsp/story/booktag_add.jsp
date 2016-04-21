<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增我的书架</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="booktag_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label no-padding-right">id：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="id" type="text" name="id" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="account" class="col-sm-3 control-label no-padding-right">account：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="account" type="text" name="account" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="section" class="col-sm-3 control-label no-padding-right">section：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="section" type="text" name="section" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sname" class="col-sm-3 control-label no-padding-right">sname：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sname" type="text" name="sname" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sreadNum" class="col-sm-3 control-label no-padding-right">sreadNum：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sreadNum" type="text" name="sreadNum" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="swordNum" class="col-sm-3 control-label no-padding-right">swordNum：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="swordNum" type="text" name="swordNum" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="sectionStr" class="col-sm-3 control-label no-padding-right">sectionStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sectionStr" type="text" name="sectionStr" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="supdate" class="col-sm-3 control-label no-padding-right">supdate：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="supdate" type="text" name="supdate" class="width-100"> 
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
						<label for="storyStr" class="col-sm-3 control-label no-padding-right">storyStr：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="storyStr" type="text" name="storyStr" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_booktag">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_booktag">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/booktag_add", function(booktag_add) {
		booktag_add.init();
	});
</script>
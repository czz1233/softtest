<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增角色</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="role_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">角色名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="name" type="text" name="name" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="describle" class="col-sm-3 control-label no-padding-right">描述信息：</label>
						<div class="col-sm-9">
							<textarea id="describle" name="describle" class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_role">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_role">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("system/role_add", function(role_add) {
		role_add.init();
	});
</script>
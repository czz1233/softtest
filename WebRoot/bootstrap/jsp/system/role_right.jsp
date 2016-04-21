<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<input id="role_id" type="hidden" value="${role.id }" />
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">角色授权</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
				<div class="col-sm-4">
					<div class="profile-user-info profile-user-info-striped">
						<div class="profile-info-row">
							<div class="profile-info-name">角色名称</div>
							<div class="profile-info-value">
								<span class="editable pull-left" id="title">${role.name }</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name">角色描述</div>
							<div class="profile-info-value">
								<span class="editable pull-left">${role.describle }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<ul id="right_tree" class="ztree"></ul>
				</div>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_role_right">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_role">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("system/role_right", function(role_right) {
		role_right.init();
	});
</script>
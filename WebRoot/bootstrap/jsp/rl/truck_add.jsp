<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增车辆</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="truck_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="code" class="col-sm-3 control-label no-padding-right">车辆编码：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="code" type="text" name="code" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="num" class="col-sm-3 control-label no-padding-right">车牌号：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="num" type="text" name="num" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label no-padding-right">类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="type" type="text" name="type" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="allowWeight" class="col-sm-3 control-label no-padding-right">载重量：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="allowWeight" type="text" name="allowWeight" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="userName" class="col-sm-3 control-label no-padding-right">联系人：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="userName" type="text" name="userName" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="userTel" class="col-sm-3 control-label no-padding-right">联系人电话：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="userTel" type="text" name="userTel" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_truck">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_truck">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rl/truck_add", function(truck_add) {
		truck_add.init();
	});
</script>
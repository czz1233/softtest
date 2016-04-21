<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">申请订单</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="order_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="goods" class="col-sm-3 control-label no-padding-right">货物：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="goods" type="text" name="goods" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="location" class="col-sm-3 control-label no-padding-right">目的地：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="location" type="text" name="location" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="weight" class="col-sm-3 control-label no-padding-right">重量：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="weight" type="text" name="weight" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_order">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_order">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rl/order_add", function(order_add) {
		order_add.init();
	});
</script>
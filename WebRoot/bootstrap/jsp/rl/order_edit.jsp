<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">编辑申请订单</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="order_edit_form" class="form-horizontal">
				<input name="id" type="hidden" value="${order.id}" />

					<div class="form-group">
						<label for="code" class="col-sm-3 control-label no-padding-right">订单号：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled" class="width-100" value="${order.code}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="goods" class="col-sm-3 control-label no-padding-right">货物：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled" class="width-100" value="${order.goods}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="location" class="col-sm-3 control-label no-padding-right">目的地：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled" class="width-100" value="${order.location}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="weight" class="col-sm-3 control-label no-padding-right">重量：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input type="text" disabled="disabled"  class="width-100" value="${order.weight}"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="weight" class="col-sm-3 control-label no-padding-right">车辆：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<select id="truckId" name="truckId" class="col-sm-12">
									<c:forEach items="${trucks }" var="tru">
										<option value="${tru.id }">${tru.code }</option>
									</c:forEach>
								</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="weight" class="col-sm-3 control-label no-padding-right">路线：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<select id="lineId" name="lineId" class="col-sm-12">
									<c:forEach items="${lines }" var="ln">
										<option value="${ln.id }">${ln.content }</option>
									</c:forEach>
								</select>
							</span>
						</div>
					</div>
					
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_order">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_order">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("rl/order_edit", function(order_edit) {
		order_edit.init();
	});
</script>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增计划</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="testplan_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label no-padding-right">计划标题：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5 input-group"> 
								<input id="title" type="text" name="title" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">计划类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5 input-group"> 
							<select id="type" name="type" class="width-100 form-control">
								<c:forEach items="${testPlanTypeList }" var="ty">
									<option value="${ty.name }">${ty.name }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">测试开始：</label>
						<div class="date form_datetime input-group col-sm-4 no-padding" data-date-format="yyyy-mm-dd hh:ii">
						   <input id="beginTime" name="beginTime" readonly="readonly" class="width-100"  type="text"  />
						    <span class="input-group-addon">
								<i class="fa fa-times bigger-110"></i>
							</span>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">测试结束：</label>
						<div class="date form_datetime input-group col-sm-4 no-padding" data-date-format="yyyy-mm-dd hh:ii">
						   <input id="endTime" name="endTime" readonly="readonly" class="width-100"  type="text"  />
						    <span class="input-group-addon">
								<i class="fa fa-times bigger-110"></i>
							</span>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">备注说明：</label>
						<div class="col-sm-9">
							<textarea id="remark" name="remark" class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_testplan">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_testplan">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("softtest/testplan_add", function(testplan_add) {
		testplan_add.init();
	});
</script>
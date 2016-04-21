<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增课程</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="course_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">课程名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="name" type="text" name="name" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="beginTime" class="col-sm-3 control-label no-padding-right">开始时间：</label>
						<div class="col-sm-5">
							<div class="input-append date form_datetime input-group col-sm-9" data-date-format="yyyy-mm-dd hh:ii">
								<input id="beginTime" name="beginTime" readonly="readonly" class="col-xs-12 form-control"  type="text"  />
							    <span class="input-group-addon">
									<i class="fa fa-times bigger-110"></i>
								</span>
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="beginTime" class="col-sm-3 control-label no-padding-right">结束时间：</label>
						<div class="col-sm-5">
							<div class="input-append date form_datetime input-group col-sm-9" data-date-format="yyyy-mm-dd hh:ii">
								<input id="endTime" name="endTime" readonly="readonly" class="col-xs-12 form-control"  type="text"  />
							    <span class="input-group-addon">
									<i class="fa fa-times bigger-110"></i>
								</span>
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="place" class="col-sm-3 control-label no-padding-right">上课地点：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="place" type="text" name="place" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="describle" class="col-sm-3 control-label no-padding-right">课程描述：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="describle" type="text" name="describle" class="width-100"> 
							</span>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_course">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_course">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("teacher/course_add", function(course_add) {
		course_add.init();
	});
</script>
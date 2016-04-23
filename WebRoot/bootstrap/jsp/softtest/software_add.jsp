<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增软件</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="software_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">软件名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="name" type="text" name="name" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">软件类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5"> 
							<select id="type" name="type" class="width-100 form-control">
								<c:forEach items="${softWareTypeList }" var="ty">
									<option value="${ty.name }">${ty.name }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="vision" class="col-sm-3 control-label no-padding-right">软件版本：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="vision" type="text" name="vision" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="environment" class="col-sm-3 control-label no-padding-right">部署环境：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="environment" type="text" name="environment" class="width-100"> 
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
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_software">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_software">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("softtest/software_add", function(software_add) {
		software_add.init();
	});
</script>
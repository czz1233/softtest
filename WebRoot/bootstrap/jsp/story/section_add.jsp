<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">章节更新</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="section_add_form" class="form-horizontal">
					<div class="form-group">
						<label for="sname" class="col-sm-3 control-label no-padding-right">章节名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> 
								<input id="sname" type="text" name="sname" class="width-100"> 
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">所属小说：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5"> 
							<select id="storyId" name="storyId" class="width-100 form-control">
								<c:forEach items="${storyList }" var="sty">
									<option value="${sty.id }">${sty.name }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">章节内容：</label>
						<div class="col-sm-9">
							<textarea id="section" name="section" class="col-xs-12" rows="120" cols=""></textarea>
						</div>
					</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_section">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_section">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/section_add", function(section_add) {
		section_add.init();
	});
</script>
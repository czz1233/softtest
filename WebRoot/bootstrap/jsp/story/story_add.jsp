<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">新增小说</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<form id="story_add_form" class="form-horizontal">
				<div class="col-sm-2 center">
					<input name="imageUrl" id="account_photo" type="hidden" value="/bootstrap/image/uploaddefault.png" />
					<div class="col-xs-12 center">
						<img id="account_photo_img" alt="" src="${pageContext.request.contextPath}/bootstrap/image/uploaddefault.png" style="width: 120px;height: 120px;" />
					</div>
					<div style="margin-top: 15px;" class="col-xs-12 center">
						<button type="button" id="show_file_upload_add" class="btn btn-white btn-primary btn-round btn-sm">
							<i class="ace-icon fa fa-upload bigger-120 blue"></i> 上传图片
						</button>
					</div>
				</div>
				<div class="col-sm-10">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">名称：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right col-xs-10 col-sm-5"> <input id="name" type="text" name="name" class="width-100"> </span>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label no-padding-right">类型：</label>
						<div class="col-sm-9 no-padding">
							<span class="block input-icon input-icon-right  col-xs-10 col-sm-5"> 
							<select id="typeId" name="typeId" class="width-100 form-control">
								<c:forEach items="${storyTypeList }" var="ty">
									<option value="${ty.id }">${ty.name }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="remark" class="col-sm-3 control-label no-padding-right">小说描述：</label>
						<div class="col-sm-9">
							<textarea id="describle" name="describle" class="col-xs-10" rows="3" cols=""></textarea>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_add_story">确定</a> <a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_story">返回</a>
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("story/story_add", function(story_add) {
		story_add.init();
	});
</script>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">回复话题</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
		<input id="title_id" type="hidden" value="${reviewtitle.id }" /> 
			<div class="col-sm-6">
				<div class="profile-user-info profile-user-info-striped">
					<div class="profile-info-row">
						<div class="profile-info-name"> 标题 </div>

						<div class="profile-info-value">
							<span class="editable" id="username">${reviewtitle.title }</span>
						</div>
					</div>
				</div>
				<div class="profile-user-info profile-user-info-striped">
					<div class="profile-info-row">
						<div class="profile-info-name"> 副标题 </div>

						<div class="profile-info-value">
							<span class="editable" id="username">${reviewtitle.subTitle }</span>
						</div>
					</div>
				</div>
				<div class="profile-user-info profile-user-info-striped">
					<div class="profile-info-row">
						<div class="profile-info-name"> 描述 </div>

						<div class="profile-info-value">
							<span class="editable" id="username">${reviewtitle.describle }</span>
						</div>
					</div>
				</div>
				<div class="profile-user-info profile-user-info-striped">
					<div class="profile-info-row">
						<div class="profile-info-name"> 发起时间 </div>

						<div class="profile-info-value">
							<span class="editable" id="username">${reviewtitle.createTimeStr }</span>
						</div>
					</div>
				</div>
				<div class="profile-user-info profile-user-info-striped">
					<div class="profile-info-row">
						<div class="profile-info-name"> 发起人题 </div>

						<div class="profile-info-value">
							<span class="editable" id="username">${reviewtitle.creator }</span>
						</div>
					</div>
				</div>
			</div>
		
			<div  style="margin-top: 20px;" class="col-sm-8">
				<div  class="widget-header widget-header-small">
							<h4 class="widget-title blue smaller">
								<i class="ace-icon fa fa-rss orange"></i>
								回复信息
							</h4>
				</div>
				<c:forEach items="${reviewList }" var="rv">
					<div class="profile-activity clearfix">
						<div>
							<img class="pull-left" alt="Alex Doe's avatar" src="${pageContext.request.contextPath}/frame/bootstrap_ace_v1.3.2/assets/avatars/avatar5.png">
							<a class="user" href="#"> ${rv.creator } </a>
							${rv.content }
	
							<div class="time">
								<i class="ace-icon fa fa-clock-o bigger-110"></i>
								${rv.createTimeStr}
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-8">
			<div class="form-group">
						<label for="remark" class="col-sm-1 control-label no-padding-right">发表评论：</label>
						<div class="col-sm-11">
							<textarea id="reback_content"  class="col-xs-10 col-sm-5" rows="3" cols=""></textarea>
						</div>
					</div>
				</div>
		<div style="margin-top: 20px;" class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-success btn-sm btn-round" id="btn_edit_reviewtitle">确定</a> 
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_reviewtitle">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("student/reviewtitle_reback", function(reviewtitle_reback) {
		reviewtitle_reback.init();
	});
</script>
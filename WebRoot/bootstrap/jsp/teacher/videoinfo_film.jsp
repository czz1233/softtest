<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="hy" uri="/WEB-INF/tld/dictTagLib.tld" %>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">视频播放</h3>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="col-sm-12">
				<video controls="controls" poster="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" width="100%" height="100%">
					<source src="${pageContext.request.contextPath}/${param.dataurl}" type="video/mp4" />
					您的浏览器不支持此种视频格式。 
				</video>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 col-md-12 center">
			<a href="javascript:;" class="btn btn-default btn-sm btn-round" id="btn_cancel_videoinfo">返回</a> 
		</div>
	</div>
</div>

<script type="text/javascript">
	seajs.use("teacher/videoinfo_film", function(videoinfo_film) {
		videoinfo_film.init();
	});
</script>
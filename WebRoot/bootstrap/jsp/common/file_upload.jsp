<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" id="textId" value=${param.textId } />
<input type="hidden" id="imageId" value="${param.imageId }" />
<form action="" id="uploadFileForm" class="form-horizontal">
	<input type="hidden" id="fileType" name="fileType" value="${param.fileType }" />
	<div class="row">
		<div class="col-xs-12 center">
			<br /> <br />
			<div class="col-xs-10 center">
				<input type="file" id="file" name="file" />
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<a href="javascript:;" class="btn btn-primary btn-sm btn-round" id="btn_submit">保存</a> <a href="javascript:;" class="btn  btn-default btn-sm btn-round" data-dismiss="modal" aria-hidden="true">关闭</a>
</div>
<script type="text/javascript">
seajs.use("common/file_upload", function(file_upload) {
	file_upload.init();
});
</script>
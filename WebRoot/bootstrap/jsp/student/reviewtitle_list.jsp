<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">发起话题列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<div class="col-xs-6 no-padding">
	    		<button type="button" id="button_add" class="btn btn-white btn-sm btn-round">
					<i class="ace-icon fa fa-plus bigger-120"></i>
					新增
				</button>
	    	</div>
	    	<table width='100%' id="reviewtitle_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
								标题
						    </th>
						    <th>
								子标题
						    </th>
						    <th>
								描述
						    </th>
						    <th>
								发起时间
						    </th>
						    <th>
								发起者
						    </th>
							<th  style="width: 220px;">
								操作
							</th>
	    			</tr>
	    		</thead>
	    	</table>
	    </div>
  </div>
  </div>
</div>

<script type="text/javascript">
seajs.use("student/reviewtitle_list", function(reviewtitle_list) {
	reviewtitle_list.init();
});
</script>
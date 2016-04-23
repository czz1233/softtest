<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">软件列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<div class="col-xs-6 no-padding">
	    	</div>
	    	<table width='100%' id="testplan_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
								计划标题
						    </th>
						    <th>
								计划类型
						    </th>
						    <th>
								计划状态
						    </th>
						    <th>
								开始时间
						    </th>
						    <th>
								结束时间
						    </th>
						    <th>
								备注
						    </th>
						    <th>
								发布时间
						    </th>
						    <th>
								发布者
						    </th>
						<th  style="width: 180px;">
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
seajs.use("softtest/testplan_audit", function(testplan_audit) {
	testplan_audit.init();
});
</script>
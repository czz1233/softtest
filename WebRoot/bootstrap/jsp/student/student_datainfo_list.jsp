<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">课程资料列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<div class="col-xs-6 no-padding">
	    	</div>
	    	<table width='100%' id="datainfo_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
								课程信息
						    </th>
						    <th>
								资料标题
						    </th>
						    <th>
								描述信息
						    </th>
						    <th>
								创建时间
						    </th>
						    <th>
								创建者
						    </th>
						<th  style="width: 100px;">
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
seajs.use("student/student_datainfo_list", function(student_datainfo_list) {
	student_datainfo_list.init();
});
</script>
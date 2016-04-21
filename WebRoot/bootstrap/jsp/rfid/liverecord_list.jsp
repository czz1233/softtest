<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">调档记录列表</h3>
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
	    	<table width='100%' id="liverecord_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr> 
	    					<th>
							档案标题
						    </th>
						    <th>
							电子标签
						    </th>
						    <th>
							调档人
						    </th>
						    <th>
							调档原因
						    </th>
						    <th>
							调档时间
						    </th>
						    <th>
							调至
						    </th>
						    <th>
							操作员
						    </th>
						    <th>
							操作时间
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
seajs.use("rfid/liverecord_list", function(liverecord_list) {
	liverecord_list.init();
});
</script>
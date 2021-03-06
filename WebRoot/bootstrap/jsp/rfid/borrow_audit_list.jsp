<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">申请外借列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<table width='100%' id="borrow_table_audit" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							档案标题
						    </th>
						    <th>
							电子标签
						    </th>
						    <th>
							申请人
						    </th>
						    <th>
							借出开始
						    </th>
						    <th>
							结束时间
						    </th>
						    <th>
							申请原因
						    </th>
						    <th>
							申请时间
						    </th>
						    <th>
							状态
						    </th>
						    <th>
							审核意见
						    </th>
						     <th>
							审核时间
						    </th>
						     <th>
							审核人
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
seajs.use("rfid/borrow_audit_list", function(borrow_list) {
	borrow_list.init();
});
</script>
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
	    	<div class="col-xs-6 no-padding">
	    		<button type="button" id="button_add" class="btn btn-white btn-sm btn-round">
					<i class="ace-icon fa fa-plus bigger-120"></i>
					新增
				</button>
	    	</div>
	    	<table width='100%' id="borrow_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							id
						    </th>
						    <th>
							applyUser
						    </th>
						    <th>
							applyTime
						    </th>
						    <th>
							applyBeginTime
						    </th>
						    <th>
							applyEndTime
						    </th>
						    <th>
							applyReason
						    </th>
						    <th>
							applyIdCard
						    </th>
						    <th>
							applyIdCardImage
						    </th>
						    <th>
							state
						    </th>
						    <th>
							auditUser
						    </th>
						    <th>
							auditTime
						    </th>
						    <th>
							auditReason
						    </th>
						    <th>
							giveToUser
						    </th>
						    <th>
							giveToTIme
						    </th>
						    <th>
							giveToRemark
						    </th>
						    <th>
							backUser
						    </th>
						    <th>
							backTime
						    </th>
						    <th>
							backRemark
						    </th>
						    <th>
							archive
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
seajs.use("rfid/borrow_list", function(borrow_list) {
	borrow_list.init();
});
</script>
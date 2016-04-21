<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">申请订单</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<div class="col-xs-6 no-padding">
	    		<button type="button" id="button_add" class="btn btn-white btn-sm btn-round">
					<i class="ace-icon fa fa-plus bigger-120"></i>
					申请
				</button>
	    	</div>
	    	<table width='100%' id="order_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							订单号
						    </th>
						     <th>
							状态
						    </th>
						    <th>
							货物
						    </th>
						    <th>
							目的地
						    </th>
						    <th>
							重量
						    </th>
						    <th>
							申请时间
						    </th>
						    <th>
							审核时间
						    </th>
						    <th>
							完成时间
						    </th>
						    <th>
							取消时间
						    </th>
						    <th>
							申请人
						    </th>
						    <th>
							货车
						    </th>
						    <th>
							路线
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
seajs.use("rl/order_list", function(order_list) {
	order_list.init();
});
</script>
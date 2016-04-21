<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">档案列表</h3>
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
	    	<table width='100%' id="archive_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							档案标题
						    </th>
						    <th>
							电子标签
						    </th>
						    <th>
							关键字
						    </th>
						    <th>
							存放位置
						    </th>
						    <th>
							入库者
						    </th>
						    <th>
							入库时间
						    </th>
						    <th>
							入库描述
						    </th>
						    <th>
							状态信息
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
seajs.use("rfid/archive_list", function(archive_list) {
	archive_list.init();
});
</script>
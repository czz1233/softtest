<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">发布留言列表</h3>
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
	    	<table width='100%' id="talk_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							id
						    </th>
						    <th>
							title
						    </th>
						    <th>
							content
						    </th>
						    <th>
							createTime
						    </th>
						    <th>
							reback
						    </th>
						    <th>
							rebackTime
						    </th>
						    <th>
							status
						    </th>
						    <th>
							creator
						    </th>
						    <th>
							sendUser
						    </th>
						    <th>
							rebackUser
						    </th>
						    <th>
							sendUserStr
						    </th>
						    <th>
							rebackUserStr
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
seajs.use("rl/talk_list", function(talk_list) {
	talk_list.init();
});
</script>
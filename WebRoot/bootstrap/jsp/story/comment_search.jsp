<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">小说评论列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<div class="col-xs-6 no-padding">
	    	</div>
	    	<table width='100%' id="comment_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							小说
						    </th>
						    <th>
							评论
						    </th>
						     <th>
							评论时间
						    </th>
						    <th>
							评论者
						    </th>
						    <th>
							回复
						    </th>
						    <th>
							回复时间
						    </th>
						    <th>
							回复者
						    </th>
	    			</tr>
	    		</thead>
	    	</table>
	    </div>
  </div>
  </div>
</div>

<script type="text/javascript">
seajs.use("story/comment_search", function(comment_search) {
	comment_search.init();
});
</script>
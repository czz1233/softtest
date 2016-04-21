<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">发布新闻列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<table width='100%' id="news_search_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							标题
						    </th>
						    <th>
							副标题
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
seajs.use("rl/news_search_list", function(news_search_list) {
	news_search_list.init();
});
</script>
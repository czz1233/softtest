<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ----------------------------列表区域------------------------ -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">小说列表</h3>
  </div>
  <div class="panel-body">
  <div class="container-fluid">
  		<div class="row">
	    	<table width='100%' id="story_table" class="table table-striped table-bordered table-hover">
	    		<thead>
	    			<tr>
						    <th>
							小说名称
						    </th>
						    <th>
							封面
						    </th>
						    <th>
							类型
						    </th>
						    <th>
							小说描述
						    </th>
						    <th>
							更新时间
						    </th>
						    <th>
							阅读量
						    </th>
						    <th>
							字数
						    </th>
						    <th>
							收藏数量
						    </th>
						    <th>
							创建时间
						    </th>
						    <th>
							作者
						    </th>
	    			</tr>
	    		</thead>
	    	</table>
	    </div>
  </div>
  </div>
</div>

<script type="text/javascript">
seajs.use("story/story_neworder", function(story_neworder) {
	story_neworder.init();
});
</script>
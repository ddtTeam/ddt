<!doctype html>
<html lang="en">
<#include "/common/pager.ftl">
<head>
	<meta charset="UTF-8">
	<title>爱点名-杭州雍睦科技</title>
	<link rel="stylesheet" href="/css/home.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/header.css">
	<link rel="stylesheet" type="text/css" href="/css/pager.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function queryList() {
			var qValue = $("#qValue").val();
			window.location.href="/rollbook/list?query=" + qValue;
		}
	</script>
</head>
<body>
	<#include "/common/head.ftl">
	<div class="container">
			<div class="head">
				<div class="newplus">
        			<span></span>
        			<a href="/rollbook/view">新增</a>
        		</div>
			
				<div class="search">
					<input type="text" name="query" id="qValue" class="txt"  placeholder="请输入搜索关键字" value="<#if query??>${query!''}</#if>"/>
					<a href="javascript:queryList();" class="button" type="button">搜索</a>
				</div>
			</div>
			<table class="list">
				<thead>
					<tr>
						<th class="name" width="190px">名称</th>
						<th class="start-time" width="190px">开始时间</th>
						<th class="finish-time" width="190px">结束时间</th>
						<th class="number" width="90px">总人数</th>
						<th class="operation" colspan="4" width="240px">操作</th>
					</tr>
				</thead>
				<tbody>
					<#if rollBooks?? && rollBooks?size &gt; 0>
                    	<#list rollBooks as rollBook>
                    		<tr <#if rollBook_index % 2 == 0>class="two"<#else>class="one"</#if>>
	                            <td>${rollBook.name!''}</td>
	                            <td>${rollBook.validStartTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                            <td>${rollBook.validEndTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                            <td>${rollBook.userCount!'0'}</td>
	                            <td><a href="/rollbook/userlist?rid=${rollBook.id}">名单</a></td>
	                            <td><a href="/rollbook/view?rid=${rollBook.id}" style="font:">查看</a></td>
	                            <#-- <td><a href="/rollbook/roll?rid=${rollBook.id}">点名</a></td> -->
	                            <td><a href="/rollbook/rolllist?rid=${rollBook.id}">点名历史</a></td>
	                            <td><a href="/rollbook/downloadall?rid=${rollBook.id}">下载</a></td>
	                           <#-- <td><a href="/rollbook/del?rid=${rollBook.id}&page=${page}">删除</a></td> -->
                        	</tr>
                    	</#list>
                    </#if>
				</tbody>

				
			</table>
			<@lpager total=totalPage index=page url=pageUrl />
	</div>

<#include "/common/footer.ftl">
</body>
</html>
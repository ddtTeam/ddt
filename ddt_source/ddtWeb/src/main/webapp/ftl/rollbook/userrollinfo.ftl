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
		</div>
		<table class="list">
			<thead>
				<tr>
					<th style="width:25%">用户名</th>
                    <th style="width:25%">手机号</th>
                    <th style="width:25%">点名时间</th>
                    <th style="width:25%">点名状态</th>
				</tr>
			</thead>
			<tbody>
				<#if userRollInfos?? && userRollInfos?size &gt; 0>
                	<#list userRollInfos as user>
                		<tr <#if user_index % 2 == 0>class="two"<#else>class="one"</#if>>
                            <td>${user.username!''}</td>
                            <td>${user.mobile!''}</td>
                            <td><#if user.rollTime??>${user.rollTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td>${user.distance}</td>
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
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
</head>
<body>
	<#include "/common/head.ftl">
	<div class="container">
			<div class="head">
				<div class="newplus">
        			<span></span>
        			<a href="/rollbook/useradd?rid=${rid}">新增</a>
        		</div>
			</div>
			<table class="list">
				<thead>
					<tr>
						<th class="wxname" width="190px">微信号</th>
						<th class="username" width="190px">用户名</th>
						<th class="mobile" width="190px">手机号</th>
						<th class="create-time" width="90px">创建时间</th>
						<th class="operation" width="240px">操作</th>
					</tr>
				</thead>
				<tbody>
					<#if users?? && users?size &gt; 0>
                    	<#list users as user>
                    		<tr <#if user_index % 2 == 0>class="two"<#else>class="one"</#if>>
	                            <td>${user.wxName!''}</td>
	                            <td>${user.userName!''}</td>
	                            <td>${user.mobile!''}</td>
	                            <td>${user.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                            <td><a href="/rollbook/userdel?uid=${user.id}&rid=${rid}&page=${page}">删除</a></td>
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
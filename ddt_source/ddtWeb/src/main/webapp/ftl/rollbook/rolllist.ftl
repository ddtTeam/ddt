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
		</div>
		<table class="list">
			<thead>
				<tr>
                    <th style="width:18%">开始时间</th>
                    <th style="width:18%">结束时间</th>
                    <th style="width:18%">点名开始时间</th>
                    <th style="width:18%">点名结束时间</th>
                    <th style="width:6%">总人数</th>
                    <th style="width:6%">随机码</th>
                    <th style="width:16%" colspan=2>操作</th>
				</tr>
			</thead>
			<tbody>
				<#if rollBooks?? && rollBooks?size &gt; 0>
                	<#list rollBooks as rollBook>
                		<tr <#if rollBook_index % 2 == 0>class="two"<#else>class="one"</#if>>
                            <td><#if rollBook.validStartTime??>${rollBook.validStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td><#if rollBook.validEndTime??>${rollBook.validEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td><#if rollBook.rollStartTime??>${rollBook.rollStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td><#if rollBook.rollEndTime??>${rollBook.rollEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td>${rollBook.userCount!'0'}</td>
                            <td>${rollBook.rollCode!''}</td>
                            <td><a href="/rollbook/userrollinfo?rid=${rollBook.rollInfoId}">点名情况</a></td>
                            <td><a href="/rollbook/downloadinfo?rid=${rollBook.rollInfoId}">下载</a></td>
                            <#--<td><a href="/rollbook/delrollinfo?rid=${rollBook.rollInfoId}&bid=${rollBook.id}">删除</a></td>-->
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
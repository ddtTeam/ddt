<#include "/common/pager.ftl">
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!-- 忽略将数字变为电话号码： -->
	<meta content="telephone=no" name="format-detection">
	<!-- IOS中Safari允许全屏浏览： -->
	<meta content="yes" name="apple-mobile-web-app-capable">
	<!-- IOS中Safari顶端状态条样式： -->
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<link rel="stylesheet" href="/css/situation.css">
	<link rel="stylesheet" href="/css/import.css">
	<link rel="stylesheet" href="/css/icon.css">
	<title>点名情况</title>
</head>
<body>
	<div id="wrap">
		<!-- 头部 -->
		<div class="header">
			<#include "/common/header.ftl">
		</div>
		<!-- 中间内容部分 -->
		<div class="main">
			<table class="list">
				<#if rollBooks?? && rollBooks?size &gt; 0>
					<#list rollBooks as rollBook>
						<tr class="<#if rollBook_index % 4 == 0>green<#elseif rollBook_index % 4 == 1>pink<#elseif rollBook_index % 4 == 2>yellow<#elseif rollBook_index % 4 == 3>blue</#if>">
							<td style="width:20%"><#if rollBook.rollStartTime??>${rollBook.rollStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
							<td style="width:20%"><#if rollBook.rollEndTime??>${rollBook.rollEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
							<td style="width:20%">${rollBook.rollCode!''}</td>
							<td style="width:20%"><a href="/rollbook/userlist?wx=${wx}&rid=${rollBook.rollInfoId}">名单</a></td>
							<td style="width:20%"><#if rollBook.rollEndTime??>已结束<#else><a href="/rollbook/end?wx=${wx}&rid=${rollBook.rollInfoId}">结束点名</a></#if></td>
						</tr>
					</#list>
				</#if>
			</table>
			<@lpager total=totalPage index=page url=pageUrl />
		</div>
		<!-- 尾部菜单 -->
		<div class="footer">
			<#include "/common/footer.ftl">
		</div>  
	</div>
</body>
</html>
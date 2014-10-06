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
	<link rel="stylesheet" href="/css/home.css">
	<link rel="stylesheet" href="/css/import.css">
	<link rel="stylesheet" href="/css/icon.css">
	<link rel="stylesheet" href="/css/pager.css">
	<title>爱点名</title>
</head>
<body>
	<div id="wrap">
		<!-- 头部 -->
		<div class="header">
			<#include "/common/header.ftl">
		</div>
		<!-- 中间 -->
		<div class="main">
			<#if rollBooks?? && rollBooks?size &gt; 0>
				<#list rollBooks as rollBook>
					<table class="list">
						<tr>
							<td style="width:60%" class="className">${rollBook.name!}</td>
							<td style="width:20%" class="record">
								<a href="/rollbook/rolllist?wx=${wx}&rid=${rollBook.id}">点名记录</a>
							</td>
							<td style="width:20%" class="startNamed">
								<a href="/rollbook/start?wx=${wx}&rid=${rollBook.id}">点名</a>
							</td>
						</tr>
					</table>
				</#list>
			</#if>
			<@lpager total=totalPage index=page url=pageUrl />
		</div>
		<!-- 尾部 -->
		<div class="footer">
			<#include "/common/footer.ftl">
		</div> 
	</div>
	
</body>
</html>
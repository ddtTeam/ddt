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
	<title>爱点名</title>
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
	function rolled(infoId, userId) {
		$.get("userRolled", {infoId:infoId, userId:userId, wx:"${wx}"}, function(data){
			alert(data.result);
		}, "json");
	}
	
	function bind(infoId, userId) {
		$.get("bind", {infoId:infoId, userId:userId, wx:"${wx}"}, function(data){
			alert(data.result);
		}, "json");
	}
</script>
</head>

</head>
<body>
<div id="wrap">
	<!-- 头部 -->
	<div class="header">
		<#include "/common/header.ftl">
	</div>
	<div class="main">
		<span class="title">点名列表</span>
		<table class="list">
			<#if info?? && book??>
				<tr>
					<td>${book.name!''}</td>
					<td>
						<#if bind == 1>
						<a href="javascript:bind(${info.id}, ${userId})">绑定并点名</a>
						<#else>
						<a href="javascript:rolled(${info.id}, ${userId})">点名</a>
						</#if>
						
					</td>
				</tr>
			</#if>
		</table>
	</div>
</div>
<div class="footer">
	<#include "/common/footer.ftl">
</div>
</body>
</html>
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
	<link rel="stylesheet" href="/css/startNamed.css">
	<link rel="stylesheet" href="/css/import.css">
	<link rel="stylesheet" href="/css/icon.css">
	<title>开始点名</title>
</head>
<body>
	<div id="wrap">
		<!-- 头部 -->
		<div class="header">
			<#include "/common/header.ftl">
		</div>
		<!-- 中间部分 -->
		<div id="all-content">
			<div class="main">
				<table class="nametable">
					<tr class="image">
						<td  width=100%>
							<img src="/images/image2.jpg" alt="">
						</td>
					</tr>
					<tr class="content">
						<td>
							<p>
								<#if msg?? && msg != "">
									${msg!''}
								<#else>
									<#if flag == 0>
										您与<span class="date">${info.rollStartTime?string('yyyy-MM-dd HH:mm:ss')}</span>开始对<span class="date">${book.name!''}</span>点名，请将随机码<span class="date">${info.rollCode!''}</span>告知被点名人,建议<span class="date">30</span>秒内关闭此次点名。
									<#else>
										您与<span class="date">${info.rollEndTime?string('yyyy-MM-dd HH:mm:ss')}</span>结束对<span class="date">${book.name!''}</span>点名
									</#if>
								</#if>
							</p>
						</td>
					</tr>
				</table>
			</div>
		</div>	

		<div class="footer">
			<#include "/common/footer.ftl">
		</div>  
	</div>
</body>
</html>
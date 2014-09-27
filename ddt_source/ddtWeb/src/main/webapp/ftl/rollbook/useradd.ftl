<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>爱点名-杭州雍睦科技</title>
	<link rel="stylesheet" href="/css/newplus.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/header.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<script src="/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/js/My97DatePicker/calendar.js"></script>
	<script type="text/javascript" src="/js/plupload/js/plupload.full.min.js"></script>
	<script type="text/javascript" src="/js/plupload/js/i18n/zh_CN.js"></script>
	<script type="text/javascript" src="/js/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
	<script type="text/javascript" src="/js/upload.js"></script>
	<script type="text/javascript" src="/js/rb.js"></script>
</head>
<body>
	<#include "/common/head.ftl">
	<div class="container">
		<div class="logo">
			<img src="/images/edit.jpg" alt="">
			<span>新增用户(添加多个请用<font color="red">逗号(英文半角)</font>分割)</span>
		</div>
		<div class="content">
			<input type="hidden" name="rid" id="rid" value="<#if book??>${book.id}</#if>">
			<div class="name">
				<span>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:<#if book??>${book.name}</#if></span>
			</div>
			<div class="pepole">
				<span>用户名单:</span>
				<textarea name="nameList" id="nameList" style="width:258px;height:100px"></textarea>
			</div>
			<div class="submit">
				<button type="button" id="userAdd">保存</button>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl">
</body>
</html>
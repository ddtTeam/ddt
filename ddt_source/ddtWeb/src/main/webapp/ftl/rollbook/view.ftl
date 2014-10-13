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
			<span>编&nbsp;辑</span>
		</div>
		<div class="content">
			<div class="name">
				<span>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</span>
				<input type="text" name="name" id="name" value="<#if rollBook??>${rollBook.name}</#if>">
			</div>
			<div class="pepole">
				<span>总&nbsp;&nbsp;人&nbsp;&nbsp;数:</span>
				<input type="text" name="userCount" id="userCount" value="<#if rollBook??>${rollBook.userCount!'0'}</#if>">
			</div>
			<div class="start-time">
				<span>开&nbsp;始&nbsp;时&nbsp;间:</span>
				<input type="text" name="validStartDate" id="start_datepicker" onClick="WdatePicker()" value="<#if rollBook??>${rollBook.validStartTime?string('yyyy-MM-dd')}</#if>">
			</div>
			<div class="finish-time">
				<span>结&nbsp;束&nbsp;时&nbsp;间:</span>
				<input type="text" name="validEndDate" id="end_datepicker" onClick="WdatePicker()" value="<#if rollBook??>${rollBook.validEndTime?string('yyyy-MM-dd')}</#if>">
			</div>
				<div style="display:<#if rollBook?? && rollBook.id &gt; 0>none<#else>block</#if>"> 
                 <div class="upfile" id="container">
                     <input type='text' name='textfield' id='textfield' class='txt' />  
                     <a id="pickfile" href="javascript:void(0)">选择文件</a>
                 </div>
                </div>
			<div class="submit">
				<button type="button" id="<#if rollBook?? && rollBook.id &gt; 0>save_check<#else>uploadfile</#if>">提交</button>
				<a href='/rollbook/template'>模板</a>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl">
</body>
</html>
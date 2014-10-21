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
	<link rel="stylesheet" href="/css/student.css">
	<link rel="stylesheet" href="/css/import.css">
	<link rel="stylesheet" href="/css/icon.css">
	<link rel="stylesheet" href="/css/pager.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<title>student</title>
	<script type="text/javascript">
	function showDiv(uid) {
		$("#reason_" + uid).css("display", "block");
		$("#remark_" + uid).css("display", "none");
	}
	
	function cancelDiv(uid) {
		$("#reason_" + uid).css("display", "none");
		$("#remark_" + uid).css("display", "block");
	}
	
	function remark(uid, rid) {
		var reasonVal = $("#selectValue_" + uid).val();
		$.get("remark",{uid:uid, rid:rid, reason:reasonVal}, function(data){
			alert(data.result);
		},"json");
	}
</script>
</head>
<body>
	<div id="wrap">
		<!-- 头部 -->
		<div class="header">
			<#include "/common/header.ftl">
		</div>
		<!-- 中间部分 -->
		<div class="main">
			<div class="summary">
				<p>点名册用户列表共<em>${count}</em>人，其中<em>${unrolledCount}</em>人未参与点名
				</p>
			</div>
			<table class="list">
				<#if users?? && users?size &gt; 0>
					<#list users as user>
						<tr>
                            <td class="name">${user.username!''}</td>
                            <td class="num">${user.mobile!''}</td>
                            <td class="time"><#if user.rollTime??>${user.rollTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                            <td>${user.distance}</td>
                            <td class="remark">${user.info!''}</td>
                            <td class="reason">
                            	<div style="display:none" id="reason_${user.userId}">
                            		<select id="selectValue_${user.userId}">
                            			<option value="事假">事假</option>
                            			<option value="病假">病假</option>
                            			<option value="未带手机">未带手机</option>
                            		</select>
                            		<a href="javascript:remark(${user.userId},${user.rollBookInfoId})">确定</a>
                            		<a href="javascript:cancelDiv(${user.userId})">取消</a>
                            	</div>
                            	<div id="remark_${user.userId}">
                            		<a href="javascript:showDiv(${user.userId})">备注</a>
                            	</div>
                            </td>
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
</div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<#include "/common/pager.ftl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/pager.css">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div id="wrapper">
     <#include "/common/head.ftl">
    <div id="out-content">
        <div id="content-box">
            <div class="content">
                <div class="query_res">
                  <input type="hidden" id="cur_page">
                  <input type="hidden" id="show_per_page">
                  <table class="tableData">
                    <tr class="">
                        <th style="width:10%">名称</th>
                        <th style="width:15%">开始时间</th>
                        <th style="width:15%">结束时间</th>
                        <th style="width:15%">点名开始时间</th>
                        <th style="width:15%">点名结束时间</th>
                        <th style="width:8%">总人数</th>
                        <th style="width:8%">随机码</th>
                        <th style="width:20%" colspan=3>操作</th>
                    </tr>
                    <#if rollBooks?? && rollBooks?size &gt; 0>
                    	<#list rollBooks as rollBook>
                    		<tr>
	                            <td>${rollBook.name!''}</td>
	                            <td><#if rollBook.validStartTime??>${rollBook.validStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
	                            <td><#if rollBook.validEndTime??>${rollBook.validEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
	                            <td><#if rollBook.rollStartTime??>${rollBook.rollStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
	                            <td><#if rollBook.rollEndTime??>${rollBook.rollEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
	                            <td>${rollBook.userCount!'0'}</td>
	                            <td>${rollBook.rollCode!''}</td>
	                            <td><a href="/rollbook/userrollinfo?rid=${rollBook.rollInfoId}">点名情况</a></td>
	                            <td><a href="/rollbook/downloadinfo?rid=${rollBook.rollInfoId}">下载</a></td>
	                            <td><a href="/rollbook/delrollinfo?rid=${rollBook.rollInfoId}&bid=${rollBook.id}">删除</a></td>
                        	</tr>
                    	</#list>
                    </#if>
                  </table>
                  <@lpager total=totalPage index=page url=pageUrl />
                </div>

            </div>
    
        </div>
         <#include "/common/sidebar.ftl">
    </div>
</div>
<div id="footer" class="footer">
     <#include "/common/footer.ftl">
</div>
<script type="text/javascript">
    (function(){
        $('.query_value').focus(function(){
            $('#for_query').css('display','none');
        }).blur(function(){
            $('#for_query').css('display','block');            
        });

    })(jQuery);
</script>
</body>
</html>

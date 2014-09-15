<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/fix.css">
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
<div id="wrapper">
    <#include "/common/head.ftl">
    <div id="out-content">
        <div id="content-box">
            <div class="content">
                <div class="form">
                    <form class="fixform" action="" name="roll_book_form">
                    	<input type="hidden" name="rid" id="rid" value="<#if book??>${book.id}</#if>">
                        <fieldset>
                            <legend>新增用户</legend>
                            <p><span>名称：</span><input type="text" value="<#if book??>${book.name}</#if>"></p>
                            <p><span>姓名列表：</span><textarea name="nameList" id="nameList"></textarea></p>
                            <div class="btns">
                                <p class="save"><a href="javascript:void(0)" class="submit" id="userAdd"><span>保存</span></a></p>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <#include "/common/sidebar.ftl">
    </div>
</div>
<div id="footer" class="footer">
    <#include "/common/footer.ftl">
</div>
</body>
</html>

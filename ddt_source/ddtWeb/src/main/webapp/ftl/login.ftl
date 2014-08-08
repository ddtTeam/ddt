<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="css/login.css"  />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/comm.js"></script>
    <script type="text/javascript">
        document.onkeydown = function(e) {
            // 兼容FF和IE和Opera
            var theEvent = e || window.event;
            var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
            if (code == 13) {
                $("#btn-login").focus();
                $("#btn-login").click();
            }
        }
    </script>
</head>
<body>
<div class="wrapper">
    <div class="logo"><img src="/images/logo.jpg" height="100%"></div>
    <div class="bannerwrap">
        <div class="banner"></div>
    </div>
    <div class="main">
        <div class="loginbox">
            <form name="lgnForm" class="lgnForm" id="lgnForm">
                <fieldset>
                    <legend>登录</legend>
                    <div class="error_log" id="error_log"></div>
                    <p><input type="text" name="username" id="uname" class="inputTxt" placeholder="用户名(微信公众平台注册手机号)"></p>
                    <p><input type="password" name="userpass" id="upwd" class="inputTxt" placeholder="密码"></p>
                    <p>
                    	<input type="button" class="inputBtn" value="登录" id="btn-login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="/guide" target="_blank">使用说明</a>
                    </p>
                </fieldset>
            </form>
        </div>
        <div class="main-inner" id="J-slideContainer">
            <a class="theme-bg" id="J-slideTarget" target="_blank" href="http://www.huajiatangyiwen.com"></a>
            <div class="theme-ctrl">
                <a id="J-prevTheme" class="ddt-icon icon-prev" href="javascript:void(0);" title="上一张"></a>
                <a id="J-nextTheme" class="ddt-icon icon-next" href="javascript:void(0);" title="下一张"></a>
            </div>
        </div>
    </div>
    <div id="class" class="footer">
       <#include "/common/footer.ftl">
    </div>
</div>
<script src="js/slide-banner.js"></script>
</body>
</html>
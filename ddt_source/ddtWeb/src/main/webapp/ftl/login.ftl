<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>爱点名-杭州雍睦科技</title>
	<link rel="stylesheet" href="/css/login.css">
	<link rel="stylesheet" href="/css/common.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/js/comm.js"></script>
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
	
	<table class="login">
		<tr>
			<td width="30%" class="login-form-left"></td>
			<td width="785px" height="454px">
				<div class="login-form-bg">
					<form action="" class="login-form">

						<table border="0" width="100%">
							<tbody>
 									<td width="595px"></td>

									<td>
										<table class="login-table" width="100%">
											<tr class="login-table-top" height="250px">
												
											</tr>
											<tr>
												<td class="input-container" align="left" valign="middle" height="45px">
												<span>账号：</span>
												<input type="text" class="login-input" name="username" id="uname">
												</td>
											</tr>
											<tr>
												<td style="height:15px;"></td>
											</tr>
											<tr>
												<td class="input-container" align="left" valign="middle" height="50px">
													<span>密码：</span>
													<input type="password" class="login-passworld" name="userpass" id="upwd">
												</td>
											</tr>
										</table>
										<div class="login-buttons" align="left">
											<table>
												<tr>
													<td height="16px" colspan="2">
													</td>
												</tr>
												<tr>
													<td class="forget">
														<a href="#" style="margin-left:28px;vertical-align: 18px">忘记密码?</a>
													</td>
													<td width="108px">
														<!-- <input class="login-form-bg login-button"type="submit" value=""> -->
														<button type="button" id="btn-login">登&nbsp;录</button>
													</td>
												</tr>
											</table>
										</div>
										<div style="margin-left:30px;margin-top:-20px;height:28px;font-weight:bold;" class="instructions">
											<a href="/guide" target="_blank">使用说明</a>
										</div>
									</td>
								</tr>
							</tbody>
							
						</table>
						<div class="introduction">
						<span>爱点名网站是杭州雍睦科技有限公司旗下项目之一，该系统提供简单、方便、快捷的课堂点名、会议签到、旅游团点名等服务。
						只要：1、微信关注
							2、上传只包含名字的excel表格www.idianming.net
							3、微信端点名即可
							</span>
						</div>
					</form>
					
				</div>
			</td>
			<td width="20%" class="logon-form-right"></td>
		</tr>
		<tr colspan="3" class="login-form-footer">
			
		</tr>
	</table>
	<#include "/common/footer.ftl">
	
</body>
</html>
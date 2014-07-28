<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="css/login.css"  />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/comm.js"></script>
    <style>
    	.title {
    		font-family:黑体;
    		font-weight:bold; 
    		font-size:20px; 
    		margin-top:20px;
    	}
    	
    	.detail {
    		margin:10px 0 30px 0;
    		font-size:14px;
    		line-height:28px
    	}
    	
    	.detail .first{
    		text-indent:50px
    	}
    </style>
</head>
<body>
<div class="wrapper">
    <div class="logo"><img src="/images/logo.jpg" height="100%"></div>
    <div class="bannerwrap">
        <div class="banner"></div>
    </div>
    <div class="main" style="text-align:left;padding-left:200px">
    	<div class="title">第一步：手机端:</div>
			<div class="detail">
				<div class="first">请扫描二维码 或 搜索"idianming" 关注“i点名”，注册</div>
			</div>
			<div class="title">第二步：PC端：</div>
			<div class="detail">
					<div class="first">登陆->新增点名册->下载点名册模板->上传点名册</div>
			</div>
			<div class="title">第三步(第一次点名开始前)：</div>
		    <div class="detail">
				<div class="first">(1)手机端("点名人"):  我爱点名-> 点击进入我的点名册列表->口头告知"被点 名人"点名册编码->等待“被点名人”绑定，查看绑定
		        </div>
		    </div>
			<div class="detail">
				<div class="first">
	        		(2)手机端(“被点名者”):  我被点名->输入点名册编码找到点名册->绑定(选择电 话号码是否可见)
				</div>
			</div>
			<div class="title">第四步(开始点名)：</div>
			<div class="detail">
				<div class="first">
	        		(1) 手机端("点名人"):我爱点名->点击开始点名,返回点名代码, 口头告知"被点名人"点名代码->等待"被点名人"点名->查看点名->标记没带手机、请假等等->点名结束
	        </div>
	    </div>
	    <div class="detail">
			<div class="first">
	        	(2) 手机端("被点名人"):我被点名->点击进入，开始点名-> 输入点名代码->返回点名册->点击点名
	    	</div>
	    </div>
	    <div class="title">点名流程图</div>
	    <div>
	    	<img src="images/guide.jpg"/> 
	    </div>
    </div>
    <div id="class" class="footer" style="position:relative;">
       <#include "/common/footer.ftl">
    </div>
</div>
</body>
</html>
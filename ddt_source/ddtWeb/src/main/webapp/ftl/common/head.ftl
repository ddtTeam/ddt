<div class="header">
	<div class="header-content">
		<div class="logo">
			<img src="/images/i.png" no-repeat alt="">
			<span>爱点名</span>
		</div>
		<div class="tips">
			<div class="user">
				<a href="#"><#if userSession??>${userSession.userName!''}</#if></a>
			</div>
			<div class="quit">
				<a href="/logout">退出</a></div>
		</div>
	</div>
</div>
<div class="menu">
		<ul>
			<li class="menu-li" style="cursor:pointer" onclick="window.location.href='/rollbook/list'">我的点名册</li>
			<li class="menu-li" style="cursor:pointer">我的积分</li>
			<li class="menu-li" style="cursor:pointer">我的</li>
		</ul>
</div>

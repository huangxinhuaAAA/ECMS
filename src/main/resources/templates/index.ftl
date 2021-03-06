<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<#include "/admin/include/title.html"/>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
		<link rel="stylesheet" href="${path}/common/bootstrap/dist/css/bootstrap.min.css" />
		<!--Font Awesome-->
		<link rel="stylesheet" href="${path}/common/font-awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${path}/common/Ionicons/css/ionicons.min.css" />
		<!--Theme style-->
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/AdminLTE.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
		<!--AdminLTE Skins-->
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/skins/skin-blue.min.css" />
		<!-- <link rel="icon" href="${path}/img/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="${path}/img/favicon.ico" type="image/x-icon"/> -->
		<!--[if lt IE 9]>
			<script type="text/javascript" src="${path}/js/html5shiv/3.7.3/html5shiv.min.js}" ></script>
			<script type="text/javascript" src="${path}/js/respond/1.4.2/respond.min.js}" ></script>	
		<![endif]-->
		<link rel="stylesheet" href="${path}/css/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="${path}/plugins/layer-v3.0.3/layer/skin/default/layer.css" />
	</head>

	<body>
		<nav class="navbar navbar-default">
		  <div class="container">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="#"><b>在线考试系统</b></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="#"><i class="fa fa-home"></i>首页 <span class="sr-only">(current)</span></a></li>
			        <li><a href="/practice"><i class="fa fa-edit"></i>试题练习</a></li>
			        <li><a href="/user_question"><i class="fa fa-dashboard"></i>会员管理</a></li>
			        <li><a href="/setting"><i class="fa fa-cogs"></i>个人中心</a></li>
			       
			      </ul>
			      <ul class="nav navbar-nav navbar-right">
			     	<#if login_admin??>
			     	 	<li><div style="margin-top: 8px;"><a href="#" class="btn btn-default">${login_admin.username}</a></div></li>
					<#else>
				        <li><div style="margin-top: 8px;"><a href="${path}/admin/login" class="btn btn-default">登陆</a></div></li>
					</#if>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		  </div>
		</nav>
		<div class="row notice">
			<ul>
				<#if notices?? && notices?size gt 0>
					<#list notices as view>
						<li>${view.content}</li>
					</#list>
				<#else>
					<li>暂无公告</li>
				</#if>
			</ul>
		</div>
		<div class="row">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
				  <img src="/ecms/img/logo.png" alt="...">
			      <div class="carousel-caption">
			      </div>
			    </div>
			    <div class="item">
			      <img src="/ecms/img/ad.jpg" alt="...">
			      <div class="carousel-caption">
			      </div>
			    </div>
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<div class="icon_content_holder center_content text-center" style="margin-top: 100px">
			<div class="container">
				<div class="icon_content_box">
			          <div class="icon_column pull-left">
			              <a href="/practice">
			                  <div class="icon_photo"><img src="/ecms/img/icon4.png" alt=""></div>
			                  <span>随机练习</span>
			              </a>
			          </div>
			          <div class="icon_column pull-left">
			              <a href="/practice">
			                  <div class="icon_photo"><img src="/ecms/img/icon1.png" alt=""></div>
			                  <span>强化练习</span>
			              </a>
			          </div>
			          <div class="icon_column pull-left">
			              <a href="/practice">
			                  <div class="icon_photo"><img src="/ecms/img/icon2.png" alt=""></div>
			                  <span>错题练习</span>
			              </a>
			          </div>
			          <div class="icon_column pull-left">
			              <a href="/practice">
			                  <div class="icon_photo"><img src="/ecms/img/icon3.png" alt=""></div>
			                  <span>模拟考试</span>
			              </a>
			          </div>
			    </div>
			</div>
		</div>
		<footer class="footer bg-gray color-palette">
			<hr>
			<div class="container">
			    <h4>
			    	<strong>Copyright © 2018 <a href="#">Majun's online examination system</a>.</strong> All rights reserved.
				    <div class="pull-right">
				      <b>Version</b> 1.0.0
				    </div>
			    </h4>
			</div>
		</footer>
		<!--jQuery-->
		<script type="text/javascript" src="${path}/common/jquery/dist/jquery.min.js"></script>
		<!--jQuery UI-->
		<script type="text/javascript" src="${path}/common/jquery-ui/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!--Bootstrap-->
		<script type="text/javascript" src="${path}/common/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js" ></script>

		<!--AdminLTE App-->
		<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
		<!--<script type="text/javascript" src="${path}/dist/js/pages/dashboard.js" ></script>-->
		<script type="text/javascript">
			/*
			* 参数说明
			* obj : 动画的节点，本例中是ul
			* top : 动画的高度，本例中是-35px;注意向上滚动是负数
			* time : 动画的速度，即完成动画所用时间，本例中是500毫秒，即marginTop从0到-35px耗时500毫秒
			* function : 回调函数，每次动画完成，marginTop归零，并把此时第一条信息添加到列表最后;
			* 
			*/
			function noticeUp(obj,top,time) {
			 $(obj).animate({
			 marginTop: top
			 }, time, function () {
			 $(this).css({marginTop:"0"}).find(":first").appendTo(this);
			 })
			}
			 $(function () {
				 // 调用 公告滚动函数
				 setInterval("noticeUp('.notice ul','-35px',500)", 2000);
			 });
		</script>
	</body>

</html>
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
		<link rel="stylesheet" type="text/css" href="${path}/css/setting.css" />
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
			        <li><a href="/index"><i class="fa fa-home"></i>首页 <span class="sr-only">(current)</span></a></li>
			        <li><a href="/practice"><i class="fa fa-edit"></i>试题练习</a></li>
			        <li class="active"><a href="#"><i class="fa fa-dashboard"></i>会员管理</a></li>
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
		<div class="container">
			<div class="col-xs-3">
				<ul class="nav default-sidenav">
					<li>
						<a href="/user_question"> <i class="fa fa-bar-chart-o"></i> 统计分析</a>
					</li>
					<li class="active">
						<a> <i class="fa fa-history"></i> 练习历史</a>
					</li>
	
				</ul>
			</div>
			<div class="col-xs-9">
				<div class="page-header">
					<h1><i class="fa fa-history"></i> 练习历史</h1>
				</div>
				<div id="question-list">
					<table class="table-striped table">
						<thead>
							<tr>
								<td>试卷名称</td><td>参加时间</td><td>得分</td><td>操作</td>
							</tr>
						</thead>
						<tbody>
							<#list list as view>
								<tr>
									<td>
										<a href="#" target="_blank" title="预览">${view.page.name}</a>
									</td>
									<td>
										${view.createTime}
									</td>
									<td>
										${view.counts}
									</td>
									<td>
										<a href="#" target="_blank" title="预览">查看报告</a>
									</td>
								</tr>
							</#list>
						</tbody><tfoot></tfoot>
					</table>
				</div>
			</div>
		</div>
		<footer class="footer bg-gray color-palette" style="margin-top: 404px">
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

		<!--AdminLTE App-->
		<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
		<!--<script type="text/javascript" src="${path}/dist/js/pages/dashboard.js" ></script>-->
		<script type="text/javascript">
			
		</script>
	</body>

</html>
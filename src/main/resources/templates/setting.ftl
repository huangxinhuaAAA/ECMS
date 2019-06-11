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
			        <li><a href="/user_question"><i class="fa fa-dashboard"></i>会员管理</a></li>
			        <li class="active"><a href="#"><i class="fa fa-cogs"></i>个人中心</a></li>
			       
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
					<li class="active">
						<a> <i class="fa fa-cogs"></i> 基本资料 </a>
					</li>
					<li>
						<a href="/admin/user/pwd"> <i class="fa fa-wrench"></i> 修改密码 </a>
					</li>
	
				</ul>
			</div>
			<div class="col-xs-9">
				<div class="page-header">
					<h1><i class="fa fa-cogs"></i> 基本资料</h1>
				</div>
				<div class="page-content row">
					<form class="form-horizontal" id="form-change-password" action="setting" style="margin-top:40px;" method="post">
						<input type="hidden" id="id" name="id" value="${user.id}"/>
						
						<div class="form-group form-username">
							<label class="control-label col-md-2" for="username">账号</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="username" name="username" disabled="disabled" value="${user.username}">
								<span class="form-message"></span>
							</div>
						</div>
						
						<div class="form-group form-job-type">
							<label class="control-label col-md-2" for="fieldId">专业</label>
							<div class="col-md-5">
								<select class="form-control" id="fieldId" name="fieldId">
									<option value="-1">--请选择--</option>
									<#list fields as field>
										<#if user.fieldId?? && user.fieldId = field.id>
											<option value="${field.id}" selected="selected">${field.name}</option>
										<#else>
											<option value="${field.id}">${field.name}</option>
										</#if>
									</#list>
								</select>
								<span class="form-message"></span>
							</div>
						</div>
						
						<div class="form-group form-password-confirm">
							<label class="control-label col-md-2" for="phone">手机</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="phone" name="phone" value="${user.phone!}">
								<span class="form-message"></span>
							</div>
						</div>
						
						<div class="form-group form-email">
							<label class="control-label col-md-2" for="email">email</label>
							<div class="col-md-5">
								<input type="email" class="form-control" id="email" name="email" value="${user.email!}">
								<span class="form-message"></span>
							</div>
						</div>

						<div class="form-group">
							<!-- Buttons -->
							<div class="col-md-5 col-md-offset-2">
								<button type="submit" class="btn" id="btn-reg">
									确认修改
								</button>
							</div>
						</div>
					</form>
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
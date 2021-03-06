<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<#include "/admin/include/title.html"/>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!--Bootstrap 3.3.7-->
		<link rel="stylesheet" href="${path}/common/bootstrap/dist/css/bootstrap.min.css" />
		<!--Font Awesome-->
		<link rel="stylesheet" href="${path}/common/font-awesome/css/font-awesome.min.css" />
		<!--Ionicons-->
		<link rel="stylesheet" href="${path}/common/Ionicons/css/ionicons.min.css" />
		<!--Theme style-->
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/AdminLTE.min.css" />
		<!--AdminLTE Skins-->
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/skins/skin-blue.min.css" />

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script type="text/javascript" src="${path}/js/html5shiv/3.7.3/html5shiv.min.js" ></script>
			<script type="text/javascript" src="${path}/js/respond/1.4.2/respond.min.js" ></script>	
		<![endif]-->
		<!--Google Font-->
		<link rel="stylesheet" href="${path}/css/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="${path}/plugins/layer-v3.0.3/layer/skin/default/layer.css" />
	</head>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<#include "/admin/include/header.html"/>
			<!-- /.main-header -->

			<!--Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<section class="sidebar">
			    	<ul class="sidebar-menu" data-widget="tree">
				        <li class="header text-center" style="color: white;font-weight: 500;font-size: 16px;">系统菜单</li>
				        <li>
				        	<a href="${path}/admin/index">
				        		<i class="fa fa-tv"></i> <span>工作台</span>
				        	</a>
				        </li>
				       
				        <li class="active treeview">
					        <a href="#">
						        <i class="fa fa-user"></i> <span>用户管理</span>
						        <span class="pull-right-container">
						        	<i class="fa fa-angle-left pull-right"></i>
						        </span>
					        </a>
				        <ul class="treeview-menu">
							<#if login_admin.typeName?? && (login_admin.typeName="ADMIN") >
								<li class="active"><a href="${path}/admin/user/list.html"><i class="fa fa-user-md"></i> 管理员</a></li>
							</#if>
				         	<li><a href="${path}/admin/user/pwd.html"><i class="fa fa-user-secret"></i>安全设置</a></li>
				        </ul>
				        </li>
				        <#if login_admin.typeName?? && (login_admin.typeName="ADMIN" )>
							<li class="treeview">
								<a href="#">
									<i class="glyphicon glyphicon-th"></i>
									<span>试题管理</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<#if login_admin.typeName?? && (login_admin.typeName="ADMIN" || login_admin.typeName="TEACHER")>
										<li>
											<a href="${path}/admin/question/list-0-0-0.html">
												<i class="glyphicon glyphicon-th-large"></i> 试题列表
											</a>
										</li>
										<li>
											<a href="${path}/admin/question/add">
												<i class="fa fa-plus"></i> 添加试题</a>
										</li>
									</#if>
								</ul>
							</li>
						</#if>
						<#if login_admin.typeName?? && (login_admin.typeName="ADMIN" || login_admin.typeName="TEACHER")>
							<li class="treeview">
								<a href="#">
									<i class="glyphicon glyphicon-book"></i><span>内容管理</span><span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="${path}/admin/field/list.html">
											<i class="glyphicon glyphicon-bookmark"></i> 题库管理
										</a>
									</li>
									<li>
										<a href="${path}/admin/knowledgePoint/list.html">
											<i class="glyphicon glyphicon-map-marker"></i> 知识点管理
										</a>
									</li>
									<li>
										<a href="${path}/admin/page/list.html">
											<i class="fa fa-file-text"></i> 试卷管理
										</a>
									</li>
								</ul>
							</li>
						</#if>
			    	</ul>
				</section>
			</aside>
			<!-- / left side column-->

			<!--Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- content-header -->
				<section class="content-header">
					<h1>
			        <small style="color:#737373;">
			        	<a href="${path}/admin/index"><i class="fa fa-home"></i></a> 
			        	<i class="fa fa-angle-double-right"></i> 用户管理
			        	<i class="fa fa-angle-double-right"></i> 新增用户
			        </small>
				</section>
				<!-- /.content-header -->
				<section class="content">
					<div class="row">
						<form action="${path}/admin/user/add" id="form-user-add" method="POST" class="col-md-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="form-horizontal">
										<h4>
										基础信息
										<#if msg??>
									 		<span style="float: right;color:red;">${msg}</span>
										</#if>
										</h4>
										<hr />
										<div class="row">
											<div class="col-md-12 border-left">
												<div class="form-group">
													<label for="username" class="col-md-3 control-label"><small class="text-red">*</small> 登录名（必填）</label>
													<div class="col-md-8">
														<input type="text" class="form-control" name="username" id="username" required="required" autofocus="autofocus"  value="" placeholder="登录名"/>
													</div>
												</div>
												<div class="form-group">
													<label for="realname" class="col-sm-3 control-label"><small class="text-red">*</small> 真实名（必填）</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="realname" id="realname"  value="" required="required" placeholder="请输入真实姓名"/>
													</div>
												</div>
												<div class="form-group">
													<label for="password" class="col-sm-3 control-label"><small class="text-red">*</small> 密 &nbsp;&nbsp;&nbsp;码（必填）</label>
													<div class="col-sm-8">
														<input type="password" class="form-control" name="password" id="password" maxlength="16"  value="" required="required" placeholder="输入密码"/>
													</div>
												</div>
												<div class="form-group">
													<label for="company" class="col-sm-3 control-label"><small class="text-red">*</small> 公 &nbsp;&nbsp;&nbsp;司（必填）</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="company" id="company" maxlength="16"  value="${(user.company)!}" required="required" placeholder="学生请填写学校"/>
													</div>
												</div>
												<div class="form-group">
													<label for="department" class="col-sm-3 control-label"><small class="text-red">*</small> 部&nbsp;&nbsp;&nbsp;门（必填）</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="department" id="department" maxlength="16"  value="${(user.department)!}" required="required" placeholder="学生请填写学号"/>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-horizontal">
										<h4>联系信息</h4>
										<hr />
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="province" class="col-md-3 control-label">地址</label>
													<div class="col-md-8">
														<input type="text" class="form-control" name="province" id="province" value="${(user.province)!}" placeholder="请输入联系地址" />
													</div>
												</div>
												<div class="form-group">
													<label for="tel" class="col-md-3 control-label">电话</label>
													<div class="col-md-8">
														<input type="text" class="form-control" name="phone" id="phone" value="${(user.phone)!}" placeholder="请输入联系电话" />
													</div>
												</div>
												<div class="form-group">
													<label for="email" class="col-md-3 control-label">邮箱</label>
													<div class="col-md-8">
														<input type="text" class="form-control" name="email" id="email" value="${(user.email)!}" placeholder="请输入联系邮箱" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="status" class="col-md-3 control-label">状态</label>
													<div class="col-md-8">
														<select id="state" class="form-control" name="status">
															<#list status as state>
																<option value="${state.value()}">${state}</option>
															</#list>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="typeId" class="col-md-3 control-label">类型</label>
													<div class="col-md-8">
														<select id="typeId" class="form-control" name="typeId">
															<#list roles as role>
																<option value="${role.parseInt()}">${role}</option>
															</#list>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-horizontal">
										<h4>操作</h4>
										<hr />
										<div class="row margin-bottom">
											<div class="col-md-12">
												<div style="float: left;">
													<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-save"></i> 创建</button>
													<button type="reset" class="btn btn-warning btn-sm"><i class="fa fa-rotate-left"></i> 重置</button>
													<button type="button" onclick="history.back(-1);" class="btn btn-info btn-sm"><i class="fa fa-reply"></i> 返回</button>
												</div>	
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>	
					</div>
					
				</section>
			</div>
			<!-- / content wrapper-->

			<!-- footer -->
			<#include "/admin/include/footer.html"/>
		</div>
		<!-- /.wrapper -->

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
		<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js" ></script>
		<script type="text/javascript">
		</script>
	</body>
</html>
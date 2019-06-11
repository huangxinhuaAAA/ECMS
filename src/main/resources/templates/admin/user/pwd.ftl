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

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<#include "/admin/include/header.html"/>
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
								<li><a href="${path}/admin/user/list.html"><i class="fa fa-user-md"></i> 管理员</a></li>
							</#if>
				         	<li class="active"><a href="${path}/admin/user/pwd.html"><i class="fa fa-user-secret"></i>安全设置</a></li>
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
			<div class="content-wrapper">
				<!-- content-header -->
				<section class="content-header">
					<h1>
			        <small style="color:#737373;">
			        	<a href="${path}/admin/index"><i class="fa fa-home"></i></a> 
			        	<i class="fa fa-angle-double-right"></i> 用户管理 
			        	<i class="fa fa-angle-double-right"></i> 设置密码
			        </small>
			      </h1>
				</section>
				<!-- /.content-header -->
				<section class="content">
					<div class="row">
						<form action="${path}/admin/user/modifypwd" id="form-user-add" method="post" class="col-md-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="form-horizontal">
										<h4>修改密码</h4>
										<hr />
										<div class="row">
											<div class="col-md-8 col-md-push-2">
												<div class="form-group">
													<label for="old-password" class="col-md-4 control-label"><small class="text-red">*</small> original password（required）</label>
													<div class="col-md-7">
														<input type="password" class="form-control" name="oldPwd" id="old-password" required="required" autofocus="autofocus"  value="" placeholder="Enter original passowrd..."/>
													</div>
												</div>
												<div class="form-group">
													<label for="new-password" class="col-sm-4 control-label"><small class="text-red">*</small> new password（required）</label>
													<div class="col-sm-7">
														<input type="password" class="form-control" name="pwd" disabled="disabled" id="new-password"  value="" required="required" placeholder="Enter user’s new password..."/>
													</div>
												</div>
												<div class="form-group">
													<label for="new-password-1" class="col-sm-4 control-label"><small class="text-red">*</small>new password（required）</label>
													<div class="col-sm-7">
														<input type="password" class="form-control" name="pwd2" disabled="disabled" id="new-password-1" maxlength="16"  value="" required="required" placeholder="Enter user’s password agin..."/>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-horizontal">
										<h4 class="text-red">提示：修改密码后将重新登录！</h4>
										<hr />
										<div class="row margin-bottom">
											<div class="col-md-12">
												<div style="float: left;">
													<button type="submit" id="submitBtn" style="display: none;" class="btn btn-sm btn-primary"><i class="fa fa-save"></i> 保存</button>
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
			<#include "/admin/include/footer.html"/>
		</div>
		<script type="text/javascript" src="${path}/common/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/common/jquery-ui/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script type="text/javascript" src="${path}/js/plugs.js"></script>
		<script type="text/javascript" src="${path}/common/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
		<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js" ></script>
		<script type="text/javascript">
			$("input[id=old-password]").focusout(function(){
				var oldPwd = $(this).val();
				if(oldPwd !=null && oldPwd != ""){
					$.ajax({
						type:'get',
						url:'${path}/admin/user/checkpwd',
						async:true,
						data:{pwd:oldPwd},
						success:function(msg){
							var state = $.parseJSON(msg).state;
							if(state=="true"){
								$("input[id=new-password]").attr("disabled",false);
								$("input[id=new-password-1]").attr("disabled",false);
							}
						}
					})
					
				}
			});
			$("input[id=new-password-1]").focusout(function(){
				var pwd2 = $(this).val();
				var pwd = $("input[id=new-password]").val();
				if(pwd2!=null&&pwd!=null&&pwd2!=""&&pwd!=""&&pwd==pwd2){
					$("#submitBtn").css("display","inline");
				}
			})
		</script>
	</body>

</html>
<!DOCTYPE html>
<html>
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
		<link rel="stylesheet" href="${path}/css/question-add.css" />
		<link rel="stylesheet" href="${path}/css/page-add.css" />
		<link rel="stylesheet" href="${path}/plugins/layer-v3.0.3/layer/skin/default/layer.css" />
		<link rel="stylesheet" href="${path}/common/select2/dist/css/select2.min.css" />
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
				       
				        <li class="treeview">
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
							<li class="active treeview">
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
									<li class="active">
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
				<!-- /.content-header -->
				<section class="content">
					<div class="row">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs">
				              <li class="active"><a href="#manual" data-toggle="tab" aria-expanded="true">手动组卷</a></li>
				              <li class=""><a href="#self-motion" data-toggle="tab" aria-expanded="false">自动组卷</a></li>
				            </ul>
				            <div class="tab-content">
				            	<div class="tab-pane active" id="manual">
				            		<form class="form-horizontal" action="/admin/page/add" method="post" onsubmit='return verifyInput();'>
				            			<div class="form-group">
						                    <label for="name" class="col-sm-2 control-label"><small class="text-red">*</small> 试卷名称</label>
						                    <div class="col-sm-5 add-name">
					                       		<input type="text" class="form-control" id="name" name="name" placeholder="Page Name">
					            				<span class="form-message"></span>
				            				</div>
				            			</div>
				            			<div class="form-group">
						                    <label for="pageType" class="col-sm-2 control-label"><small class="text-red">*</small> 试卷类型</label>
						                    <div class="col-sm-5 add-type">
					                       		<select class="form-control select2" name="pageType" id="pageType" style="width: 100%;" required="required">
	                                              <#list pageTypes as type>
	                                                  <option value="${type.id}">${type.name}</option>
	                                              </#list>
	                                            </select>
	                                            <span class="form-message"></span>
				            				</div>
				            			</div>
				            			<div class="form-group">
						                    <label for="duration" class="col-sm-2 control-label"><small class="text-red">*</small> 时长(分钟)</label>
						                    <div class="col-sm-5 add-duration">
					                       		<input type="text" class="form-control" id="duration" name="duration" placeholder="Duration">
				            					<span class="form-message"></span>
				            				</div>
				            			</div>
				            			<div class="form-group">
						            		<div class="col-sm-6">
							            		<button type="submit" class="btn btn-info pull-right"> 下一步</button>
						            		</div>
				            			</div>
				            		</form>
				            	</div>
				            	<div class="tab-pane" id="self-motion">
				            		2
				            	</div>
				            </div>
						</div>
					</div>
				</section>
			</div>
			<#include "/admin/include/footer.html"/>
		</div>
		<script type="text/javascript" src="${path}/common/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/common/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${path}/common/select2/dist/js/select2.full.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script type="text/javascript" src="${path}/js/plugs.js"></script>
		<script type="text/javascript" src="${path}/js/field_point.js"></script>
		<script type="text/javascript" src="${path}/common/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
		<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js" ></script>
		<script type="text/javascript">
			$('.select2').select2();
			/**
			 * 检查输入合法性
			 */
			function verifyInput() {
				var result = true;
				var r_checkName = checkName();
				var r_checkDuration = checkDuration();
				
				result = r_checkName && r_checkDuration;
				console.log(result);
				return result;
			}
			
			function checkName() {
				var name = $("#name").val();
				if (name == "") {
					$(".add-name .form-message").text("请输入试卷名称");
					$("#name").focus();
					$("#name").addClass("has-error");
					return false;
				} else if (name.length > 10) {
					$(".add-name .form-message").text("内容过长，请保持在10个字符以内");
					$("#name").focus();
					$("#name").addClass("has-error");
					return false;
				} else {
					return true;
				}
			}
			function checkDuration() {
				var duration = $("#duration").val();
				if (duration == "") {
					$(".add-duration .form-message").text("请输入考试时长（如：120）");
					$("#duration").addClass("has-error");
					return false;
				} else if (isNaN(duration)) {
					$(".add-duration .form-message").text("请输入数字");
					$("#duration").addClass("has-error");
					return false;
				} else if (!(duration > 30 && duration < 241)) { 
					$(".add-duration .form-message").text("数字范围无效，考试的时长必须设置在30到240的范围内");
					$("#duration").addClass("has-error");
					return false;
				} else {
					return true;
				}
			}
			
		</script>
	</body>
</html>
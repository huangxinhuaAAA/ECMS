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
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/skins/_all-skins.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/plugins/iCheck/all.css" />
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
					<div class="box">
						<h1 style="margin-left: 15px;"><i class="fa fa-file-text"></i> 修改试卷 </h1>
						<hr>
						<div class="box-header with-border">
							<i class="fa fa-send"></i>${page.name}
						</div>
						<div class="box-body">
							
							<a class="btn" id="single" onclick="listQuestion(1)">单选题[${single?size}]</a>
							<a class="btn" id="multiple" onclick="listQuestion(2)">多选题[${multiple?size}]</a>
							<a class="btn" id="judge" onclick="listQuestion(3)">判断题[${judge?size}]</a>
							<a class="btn" id="fill" onclick="listQuestion(4)">填空题[${fill?size}]</a>
							<br>
							<form action="/admin/page/updata" method="post">
								<input type="hidden" id="id" name="id" value="${page.id}"/>
								<h4>&nbsp;&nbsp;&nbsp;试卷总分：${page.totalPoint}&nbsp;&nbsp;&nbsp;
								<a id="add-more" class="btn" onclick="openlayer()">
									<i class="small-icon fa fa-plus-square" title="添加选项"></i>
									<span style="font-size:18px">增加更多题目</span>
								</a></h4>
								<h4>&nbsp;&nbsp;&nbsp;及格分数：<input type="text" value="${page.passPoint}" id="point" name="point"/>&nbsp;&nbsp;&nbsp;</h4>
							
							<div class="form-group" id="single_list" style="display: none;">
								<#list single as single>
									<div class="form-group">
										<div class="bg-gray disabled color-palette">
											<h4>
												【${single.questionType.name}】
												(<span class="question-point" onclick="points(${single.id},${page.id})">${single.points}</span>分)
												<a class="tmp-ques-remove" href="/admin/page/deleteQuestion?qid=${single.id}&pid=${page.id}">删除</a>
											</h4>
											
										</div>
							            <button class="btn-xs btn-info">题目</button>&nbsp;&nbsp;&nbsp;${single.title!}<br><br>
							            <#if single.titleImg?? && single.titleImg!="">
								           <img class="img-responsive pad" src="${path}/${single.titleImg}" alt="Photo">
							            </#if>
							
							            <p><button class="btn-xs btn-warning">内容</button>&nbsp;&nbsp;&nbsp;${single.content}</p>
										<#list single.choiceList?keys as ca>
							                <div class="box-comment">
								                <div class="comment-text">
									                <hr>
									                <label>
												      <input type="radio" value="${ca}" name="r{view.id}" class="flat-red">
									                  <span>&nbsp &nbsp &nbsp${ca}:&nbsp &nbsp &nbsp${single.choiceList[ca]}</span>
									                </label>
								                	<#if single.choiceImgList[ca]?? && single.choiceImgList[ca]!="">
										                <!-- Title image -->
										                <img class="margin" style="height: 100px;width: 150px;" src="${single.choiceImgList[ca]}" alt="Attachment Image">
													</#if>
								                </div>
							                </div>
						                </#list>
									</div>
									<hr>
								</#list>
							</div>
							<div class="form-group" id="multiple_list" style="display: none;">
								<#list multiple as view>
									<div class="form-group">
										<div class="bg-gray disabled color-palette">
											<h4>
												【${view.questionType.name}】
												(<span class="question-point" onclick="points(${view.id},${page.id})">${view.points}</span>分)
												<a class="tmp-ques-remove" href="/admin/page/deleteQuestion?qid=${view.id}&pid=${page.id}">删除</a>
											</h4>
											
										</div>
							            <button class="btn-xs btn-info">题目</button>&nbsp;&nbsp;&nbsp;${view.title!}<br><br>
							            <#if view.titleImg?? && view.titleImg!="">
								           <img class="img-responsive pad" src="${path}/${view.titleImg}" alt="Photo">
							            </#if>
							
							            <p><button class="btn-xs btn-warning">内容</button>&nbsp;&nbsp;&nbsp;${view.content}</p>
										<#list view.choiceList?keys as ca>
							                <div class="box-comment">
								                <div class="comment-text">
								                	<hr>
									                <label>
												      <input type="checkbox" value="${ca}" name="r{view.id}" class="flat-red">
									                  <span>&nbsp &nbsp &nbsp${ca}:&nbsp &nbsp &nbsp${view.choiceList[ca]}</span>
									                </label>
									              	<#if view.choiceImgList[ca]?? && view.choiceImgList[ca]!="">
										                <!-- Title image -->
										                <img class="margin" style="height: 100px;width: 150px;" src="${view.choiceImgList[ca]}" alt="Attachment Image">
													</#if>
								                </div>
							                </div>
						                </#list>
									</div>
								</#list>
							</div>
							<div class="form-group" id="judge_list" style="display: none;">
								<#list judge as view>
									<div class="form-group">
										<div class="bg-gray disabled color-palette">
											<h4>
												【${view.questionType.name}】
												(<span class="question-point" onclick="points(${view.id},${page.id})">${view.points}</span>分)
												<a class="tmp-ques-remove" href="/admin/page/deleteQuestion?qid=${view.id}&pid=${page.id}">删除</a>
											</h4>
											
										</div>
							            <button class="btn-xs btn-info">题目</button>&nbsp;&nbsp;&nbsp;${view.title!}<br><br>
							            <#if view.titleImg?? && view.titleImg!="">
								           <img class="img-responsive pad" src="${path}/${view.titleImg}" alt="Photo">
							            </#if>
							
							            <p><button class="btn-xs btn-warning">内容</button>&nbsp;&nbsp;&nbsp;${view.content}</p>
						                <div class="box-comment">
							                <div class="comment-text">
							                	<hr>
								                <input type="button" value="√" id="btnDa11">&nbsp &nbsp &nbsp 
												<input type="button" value="×" id="btnDa12">
							                </div>
						                </div>
									</div>
									<hr>
								</#list>
							</div>
							<div class="form-group" id="fill_list" style="display: none;">
								<#list fill as view>
									<div class="form-group">
										<div class="bg-gray disabled color-palette">
											<h4>
												【${view.questionType.name}】
												(<span class="question-point" onclick="points(${view.id},${page.id})">${view.points}</span>分)
												<a class="tmp-ques-remove" href="/admin/page/deleteQuestion?qid=${view.id}&pid=${page.id}">删除</a>
											</h4>
											
										</div>
							            <button class="btn-xs btn-info">题目</button>&nbsp;&nbsp;&nbsp;${view.title!}<br><br>
							            <#if view.titleImg?? && view.titleImg!="">
								           <img class="img-responsive pad" src="${path}/${view.titleImg}" alt="Photo">
							            </#if>
							
							            <p><button class="btn-xs btn-warning">内容</button>&nbsp;&nbsp;&nbsp;${view.content}</p>
						                <div class="box-comment">
							                <div class="comment-text">
							                	<hr>
								                <input type="text" class="form-control" placeholder="Enter ...">
								                <hr>
							                </div>
						                </div>
									</div>
									<hr>
								</#list>
							</div>
						</div>
						<div class="box-footer">
							<button class="btn btn-info pull-right" type="submit">保存试卷</button>
						</div>
						</form>
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
		<script type="text/javascript" src="${path}/plugins/iCheck/icheck.min.js"></script>
		<script type="text/javascript">
			var pid = ${page.id};
			function openlayer(){
			    reload = false;
			    layer.open({
			        type:2,
			        title:'添加试题',
			        shadeClose:true,
			        shade:0.85,
			        area:['70%','85%'],
			        content:'/admin/page/addQuestion-'+0+'-'+0+'-'+0+"-"+pid,
			        end:function(){
			        	location.reload();
			        }
			    });
			}
			function listQuestion(num){
				if(num==1){
					$("#single_list").show();
					$("#multiple_list").hide();
					$("#judge_list").hide();
					$("#fill_list").hide();
				}else if(num==2){
					$("#single_list").hide();
					$("#multiple_list").show();
					$("#judge_list").hide();
					$("#fill_list").hide();
				}else if(num==3){
					$("#single_list").hide();
					$("#multiple_list").hide();
					$("#judge_list").show();
					$("#fill_list").hide();
				}else{
					$("#single_list").hide();
					$("#multiple_list").hide();
					$("#judge_list").hide();
					$("#fill_list").show();
				}
			}
			function points(qid,pid){
				layer.open({
			        type:2,
			        title:false,
			        shadeClose:true,
			        scrollbar: false,
			        area:['50%','50%'],
			        content:'/admin/page/editPoints?qid='+qid+"&pid="+pid,
			        end:function(){
			        	location.reload();
			        }
			    });
			}
			
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
			      checkboxClass: 'icheckbox_flat-green',
			      radioClass   : 'iradio_flat-green'
			})
		</script>
	</body>
</html>
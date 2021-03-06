<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<#include "/admin/include/title.html"/>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<link rel="stylesheet"
	href="${path}/common/bootstrap/dist/css/bootstrap.min.css" />
<!--Font Awesome-->
<link rel="stylesheet"
	href="${path}/common/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${path}/common/Ionicons/css/ionicons.min.css" />
<!--Theme style-->
<link rel="stylesheet" type="text/css"
	href="${path}/dist/css/AdminLTE.min.css" />
<!--AdminLTE Skins-->
<link rel="stylesheet" type="text/css"
	href="${path}/dist/css/skins/skin-blue.min.css" />
<!-- <link rel="icon" href="${path}/img/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="${path}/img/favicon.ico" type="image/x-icon"/> -->
<!--[if lt IE 9]>
			<script type="text/javascript" src="${path}/js/html5shiv/3.7.3/html5shiv.min.js}" ></script>
			<script type="text/javascript" src="${path}/js/respond/1.4.2/respond.min.js}" ></script>	
		<![endif]-->
<link rel="stylesheet" href="${path}/css/fonts.googleapis.com.css" />
<link rel="stylesheet"
	href="${path}/plugins/layer-v3.0.3/layer/skin/default/layer.css" />
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
						<li class="active treeview">
							<a href="#">
								<i class="glyphicon glyphicon-th"></i>
								<span>试题管理</span>
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">
								<#if login_admin.typeName?? && (login_admin.typeName="ADMIN" || login_admin.typeName="TEACHER")>
									<li class="active">
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
			<section class="content">
			<div id="question-filter">
				<div class="box box-solid">
					<div class="box-body table-responsive no-padding">
						<!-- content-header -->
						<section class="content-header">
							<dl id="question-filter-field">
								<dt>题库：</dt>
								<dd>
									<#if fieldId = 0>
										<span data-id="0" class="label label-info">全部</span>
									<#else>
										<span data-id="0" class="btn btn-normal" onclick="list(0,${knowledge},${questionType})">全部</span>
									</#if>
									<#list fields as field>
										<#if fieldId = field.id>
											<span class="label label-info" data-id="${field.id}">${field.name}</span>
										<#else>
											<span data-id="${field.id}" class="btn btn-normal" onclick="list(${field.id},${knowledge},${questionType})">${field.name}</span>
										</#if>
									</#list>
								</dd>
							</dl>
							<dl id="question-filter-knowledge">
								<dt>知识分类：</dt>
								<dd>
									<#if knowledge = 0>
										<span data-id="0" class="label label-info" >全部</span>
									<#else>
										<span data-id="0" class="btn btn-normal" onclick="list(${fieldId},0,${questionType})">全部</span>
									</#if>
									<#list knowledgePoints as point>
										<#if point.id = knowledge>
											<span data-id="${point.id}" class="label label-info">${point.name}</span>
										<#else>
											<span data-id="${point.id}" class="btn btn-normal" onclick="list(${fieldId},${point.id},${questionType})">${point.name}</span>
										</#if>
									</#list>
								</dd>
							</dl>
			
							<dl id="question-filter-qt">
								<dt>试题类型：</dt>
								<dd>
									<#if questionType = 0>
										<span data-id="0" class="label label-info">全部</span>
									<#else>
										<span data-id="0" class="btn btn-normal" onclick="list(${fieldId},${knowledge},0)">全部</span>
									</#if>
									<#list questionTypes as type>
										<#if questionType = type.id >
											<span data-id="${type.id}" class="label label-info">${type.name}</span>
										<#else>
											<span data-id="${type.id}" class="btn btn-normal" onclick="list(${fieldId},${knowledge},${type.id})">${type.name}</span>
										</#if>
									</#list>
								</dd>
							</dl>
							<hr>
						</section>
						<!-- /.content-header -->
						<div class="col-md-12">
							<button type="button" class="btn btn-danger btn-sm" onclick="deleteBatch()"><i class="fa fa-trash"></i>&nbsp; 批量删除</button>
							<hr>
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<td width="20"><input id="check-all" type="checkbox"/></td>
										<td>ID</td>
										<td class="question-name-td">试题名称</td>
										<td>试题类型</td>
										<td>专业</td>
										<td>知识类</td>
										<td>关键字</td>
										<td>操作</td>
									</tr>
								</thead>
									<tbody>
										<#if page.getContent()??>
											<#list page.getContent() as items>
												<tr>
													<td><input type="checkbox" value="${items.id }"></td>
													<td>${items.id }</td>
													<td><a href="/admin/question/view.html/${items.id }" target="_blank" title="预览">${(items.title)! }</a></td>
													<td>${(items.questionType.name)! }</td>
													<td>${(items.field.name)! }</td>
													<td>
														<#if items.knowledgePoint??>
															<#list items.knowledgePoint as point>
														 		${point.name};
															</#list>
														</#if>
													</td>
													<td>${(items.keyword)!}</td>
													<td style="width:200px;">
														<a class="text-info" onclick="openlayer(${items.id})"><i class="fa fa-edit"></i> 修改</a>&nbsp;
														<a href="javascript:void(0);" id="delete-point" class="text-red" onclick="delete_point(this,${items.id})"><i class="fa  fa-trash"></i> 删除</a>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
									<tfoot></tfoot>
							</table>
						</div>
					</div>
					<div class="box-footer">
						<div class="row">
							<#assign url="/admin/question/list-${fieldId}-${knowledge}-${questionType}.html">
							<#include "/admin/include/page_inc.html"/>
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
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script type="text/javascript" src="${path}/js/plugs.js"></script>
	<script type="text/javascript" src="${path}/common/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
	<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js"></script>
	<script type="text/javascript">
		function list(fieldId,knowledge,questionType){
			document.location.href = "${path}/admin/question/list-"+fieldId+"-"+knowledge+"-"+questionType+".html";
		}
		function openlayer(id){
		    reload = false;
		    layer.open({
		        type:2,
		        title:'题目详情',
		        shadeClose:true,
		        shade:0.85,
		        area:['60%','50%'],
		        content:'./edit?id=' + id,
		        end:function(){
		        	document.location.href = "${path}/admin/question/list-"+${fieldId}+"-"+${knowledge}+"-"+${questionType}+".html";
		        }
		    });
		}
		function delete_point(obj,id){
			var offset = $(obj).offset();
			layer.open({
				type:5,
				title:false,
				shadeClose:true,
				shade:0,
				skin: 'layui-layer-molv',
				btn:['确认','取消'],
				btnAlign:'c',
				offset:[offset.top-60,offset.left-120],
				yes:function(index){
					$.ajax({
						url:"${path}/admin/question/delete/"+id,
						type:"DELETE",
						contentType:"application/x-www-form-urlencoded",
						encoding:"utf-8",
						cache:false,
						success:function(msg){
							if(msg.result == "success"){
								layer.close(index);
								layer.msg('成功删除数据', {icon: 1,offset: 't', anim: 5});
								document.location.href = "${path}/admin/question/list-"+${fieldId}+"-"+${knowledge}+"-"+${questionType}+".html";
							}
						}
					});
					return false;
				},
				close:function(){
					return false;
				}
			});
		}
		/* 全选按钮 */
		$("#check-all").on("click",function(){
			if(this.checked){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		
		function deleteBatch(){
			var ids = [];
			var doms = $("tbody input[type=checkbox]:checked");
			for(var i=0;i<doms.length;i++){
				if(doms[i].checked){
					ids[i]=doms[i].value;
				}
			}
			if(ids.length<=0){
				top.layer.open({
					title:false,
					icon:5,
					content:'请选择需要删除的数据',
					offset:'15px'
				});
			}else{
				top.layer.open({
					title:false,
					icon:2,
					content:'确认删除？',
					offset:'15px',
					btn:['确认','取消'],
					btnAlign:'c',
					yes:function(index){
						$.ajax({
							url:"${path}/admin/question/deleteBatch",
							type:'POST',
							data:{
								ids:ids.toString()
							},
							contentType:'application/x-www-form-urlencoded',
							encoding:'utf-8',
							cache:false,
							success:function(msg){
								if(msg == "ok"){
									layer.close(index);
									location.reload();
								}
							}
						});
						
					},
					cancel:function(index){
						layer.close(index);
						return false;
					}
				});
			}
		}
	</script>
</body>

</html>
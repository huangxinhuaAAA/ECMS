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
		<link rel="stylesheet" type="text/css" href="${path}/css/list_knowledge.css" />
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
			<div class="modal-content" style="height:500px;">
			    <div class="modal-body">
			    	<ul>
			    		<#list list as tp>
			    			<li>
			    				<div class="knowledge-title">
			    					<span class="knowledge-title-name" onclick="openDetail(${tp.id})">[${(tp.pageType.name)!}]&nbsp;&nbsp;${tp.name }</span>
			   					</div>
			    			</li>
			    		</#list>
			    	</ul>
			    </div>
			</div>
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
			function openDetail(id){
				var str = "/detail_page?id="+id;
				parent.close(str);
			};
		</script>
	</body>

</html>
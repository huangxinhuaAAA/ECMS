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
			<div class="modal-content">
			    <div class="modal-body">
			    	<ul>
			    		<#list list?keys as key>
			    			<li>
			    				<div class="knowledge-title">
			    					<i class="fa fa-chevron-up"> </i><i class="fa fa-chevron-down" style="display:none;"> </i>  <span class="knowledge-title-name">${key}</span>
			   					</div>
			   					<ul class="question-list-knowledge" style="display:none;">
			    					<#list list[key] as tp>
			    						<li>${tp.questionTypeName } [共<span class="question-number">${tp.amount } </span>题]
			    							[已做<span class="question-number-2">${tp.rightTimes + tp.wrongTimes } </span> 题]
			    							<a href="#" class="btn btn-success btn-sm join-practice-btn" onclick="openDetail(${tp.knowledgePointId},${tp.questionTypeId},${tp.rightTimes + tp.wrongTimes})">参加练习</a>
			    						</li>
			    					</#list>
			    				</ul>
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
			function openDetail(kId,tId,num){
				//window.location.href = 
				var str = "/detail_strengthen?knowledgeId="+kId+"&typeId="+tId+"&num="+num;
				//var index = parent.layer.getFrameIndex(window.name);
				//parent.layer.close(index);
				parent.close(str);
			};
			$(function(){
				bindQuestionKnowledage();
				var result = checkBrowser();
				if (!result){
					alert("请至少更新浏览器版本至IE8或以上版本");
				}
			});
			
			function checkBrowser() {
				var browser = navigator.appName;
				var b_version = navigator.appVersion;
				var version = b_version.split(";");
				var trim_Version = version[1].replace(/[ ]/g, "");
				if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
					return false;
				} else if (browser == "Microsoft Internet Explorer"
						&& trim_Version == "MSIE6.0") {
					return false;
				} else
					return true;
			}
			function bindQuestionKnowledage(){
				$(".knowledge-title").click(function(){
					var ul = $(this).parent().find(".question-list-knowledge");
					
					if(ul.is(":visible")){
						$(this).find(".fa-chevron-down").hide();
						$(this).find(".fa-chevron-up").show();
						
						$(".question-list-knowledge").slideUp();
						
					}else{
						$(".fa-chevron-down").hide();
						$(".fa-chevron-up").show();
						
						$(this).find(".fa-chevron-up").hide();
						$(this).find(".fa-chevron-down").show();
						
						$(".question-list-knowledge").slideUp();
						ul.slideDown();
						
					}
					
					
				});
			}
		</script>
	</body>

</html>
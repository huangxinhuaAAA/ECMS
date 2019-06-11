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
		<link rel="stylesheet" type="text/css" href="${path}/css/detail.css" />
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/skins/_all-skins.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/plugins/iCheck/all.css" />
		<!--AdminLTE Skins-->
		<link rel="stylesheet" type="text/css" href="${path}/dist/css/skins/skin-blue.min.css" />
		<!-- <link rel="icon" href="${path}/img/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="${path}/img/favicon.ico" type="image/x-icon"/> -->
		<!--[if lt IE 9]>
			<script type="text/javascript" src="${path}/js/html5shiv/3.7.3/html5shiv.min.js}" ></script>
			<script type="text/javascript" src="${path}/js/respond/1.4.2/respond.min.js}" ></script>	
		<![endif]-->
		<link rel="stylesheet" href="${path}/css/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="${path}/css/page-add.css" />
		<link rel="stylesheet" href="${path}/plugins/layer-v3.0.3/layer/skin/default/layer.css" />
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
			        <li class="active"><a href="/practice"><i class="fa fa-edit"></i>试题练习</a></li>
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
		<div class="container">
			<div class="col-md-4">
				<div class="box box-primary">
		            <div class="box-body box-profile">
		              <ul class="list-group list-group-unbordered">
		                <li class="list-group-item">
		                  <b>知识类型：</b>
		                  <span class="pull-right" style="color:#428bca;">${knowledges.name}</span>
		                </li>
		                <li class="list-group-item">
		                  <b>题型：</b>
		                   <span class="pull-right" style="color:#428bca;">${questionType.name}[ 共 ${size} 题 ]</span>
		                </li>
		                <li class="list-group-item">
		                  <div class="progress-group">
		                    <span class="progress-text">学习进度</span>
		                    <div class="progress lg">
		                      <div class="progress-bar progress-bar-aqua" style="width: ${percentage}%"></div>
		                    </div>
		                  </div>
		                </li>
		              </ul>
		
		              <a href="#" class="btn btn-primary btn-block" id="pattern"><b>显示答案</b></a>
		            </div>
		            <!-- /.box-body -->
		        </div>
			</div>
			<div class="col-md-8">
				<div class="box box-primary">
		            <div class="box-body box-profile">
						<div class="bg-gray disabled color-palette">
							<h4>【${index.questionType.name}】${index.title!}</h4>
						</div>
						<#if index.titleImg?? && index.titleImg!="">
				              <img class="img-responsive pad" src="${path}/${index.titleImg}" alt="Photo">
			            </#if>
						<hr>
						<p><button class="btn-xs btn-warning">内容</button>&nbsp;&nbsp;&nbsp;${index.content}</p>
						<hr>
						<#if index.questionType.id = 1>
				            <div class="form-group">
								<#list index.choiceList?keys as ca>
					                <div class="box-comment">
						              	<#if index.choiceImgList[ca]?? && index.choiceImgList[ca]!="">
							                <!-- Title image -->
							                <img class="attachment-img" src="${index.choiceImgList[ca]}" alt="Attachment Image">
										</#if>
						                <div class="comment-text">
							                <label>
										      <input type="radio" value="${ca}" name="r3" class="flat-red">
							                  <span>&nbsp &nbsp &nbsp${ca}:&nbsp &nbsp &nbsp${index.choiceList[ca]}</span>
							                </label>
						                </div>
					                </div>
				                </#list>
							</div>
						</#if>
						<#if index.questionType.id = 2>
							<div class="form-group">
								<#list index.choiceList?keys as ca>
									<div class="box-comment">
										<#if index.choiceImgList[ca]?? && index.choiceImgList[ca]!="">
							                <!-- Title image -->
							                <img class="attachment-img" src="${index.choiceImgList[ca]}" alt="Attachment Image">
										</#if>
										<div class="comment-text">
							                <label>
							                  <input type="checkbox" value="${ca}" name="r3" class="flat-red" >
							                   <span>&nbsp &nbsp &nbsp${ca}:&nbsp &nbsp &nbsp${index.choiceList[ca]}</span>
							                </label>
						                </div>
					                </div>
				                </#list>
				            </div>
						</#if>
						<#if index.questionType.id = 3>
							<div class="form-group">
								<div class="box-comment">
									<div class="comment-text">
										<input type="radio" value="T" name="r3" class="flat-red">
										<span>&nbsp &nbsp &nbsp正确</span><br><br>
										<input type="radio" value="F" name="r3" class="flat-red">
										<span>&nbsp &nbsp &nbsp错误</span>
									</div>
								</div>
				            </div>
						</#if>
						<#if index.questionType.id = 4>
							<div class="form-group">
								<div class="box-comment">
									<div class="comment-text col-xs-6">
										<br/>
										<input type="text" class="form-control" placeholder="Enter ...">
									</div>
								</div>
				            </div>
						</#if>
						<div id="answer" style="display: none;">
							<hr>
							<h4>正确答案：${index.answer}</h4>
			            	<hr>
			            	<strong><i class="fa fa-paw"></i> 来源</strong>
			            	<p>
			            	&nbsp &nbsp ${index.keyword}
			            	</p>
			            	<hr>
			            	<strong><i class="fa fa-flag"></i> 分析</strong>
			            	<p>
			            	&nbsp &nbsp ${index.analysis}
			            	</p>
			            	<hr>
			            	<strong><i class="fa fa-bookmark"></i> 考点</strong>
			            	<p>
			            	&nbsp &nbsp ${index.field.name} >
			            	<#if index.knowledgePoint??>
				            	<#list index.knowledgePoint as key>
				            		<#if key_index=0>
				            			${key.name}
				            		<#else>
				            			, ${key.name}
				            		</#if>
				            	</#list>
			            	</#if>
			            	</p>
						</div>
			            <hr>
						<div class="form-group">
							<div class="col-md-4">
								<#if pre.id??>
									<a href="/detail_strengthen_order?knowledgeId=${knowledges.id}&typeId=${questionType.id}&num=${num}&qId=${pre.id}" class="btn btn-block btn-success">上一题</a>
								<#else>
									<a href="#" class="btn btn-block btn-success">没有上一题</a>
								</#if>
							</div>
							<div class="col-md-4">
								<#if after.id??>
									<a href="/detail_strengthen_order?knowledgeId=${knowledges.id}&typeId=${questionType.id}&num=${num}&qId=${after.id}" class="btn btn-block btn-success">下一题</a>
								<#else>
									<a href="#" class="btn btn-block btn-success">没有下一题</a>
								</#if>
							</div>
							<div class="col-md-4">
								<a  class="btn btn-block btn-info" onclick="submit_answer(${questionType.id},${index.id},${after.id!0},${knowledges.id},${num})">提交</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-md-push-4">
				<div class="box box-primary">
		            <div class="box-body box-profile">
		            	<div id="comment-title" style="margin-bottom:15px;">
							<i class="fa fa-comments"></i>
							<span> 学员评论 </span>
						</div>
		            </div>
		            <form class="comment-form">
						<textarea rows="" cols="" style="width:100%;height:95px;" placeholder="随便说点什么吧..."></textarea>
						<input class="btn btn-primary" type="button" value="发表评论" onclick="submit_comment(${index.id},${login_admin.id})">
					</form>
					<div class="content">
						<ul class="comment-list">
							<#list comments as view>
								<li class="comment-list-item">
									<div class="comment-user-container">
										<div>
											<img src="/ecms/img/photo.jpg" class="comment-user-img">
										</div>
									<div class="comment-user-info"><div>${view.user.username}</div>
									<div class="comment-date"><span>发表于：</span>${view.createTime}</div></div></div>
									<p class="comment-user-text">${view.content}</p>
								</li>
							</#list>
						</ul>
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
		<script type="text/javascript" src="${path}/plugins/iCheck/icheck.min.js"></script>
		<script type="text/javascript" src="${path}/plugins/layer-v3.0.3/layer/layer.js" ></script>
		<!--AdminLTE App-->
		<script type="text/javascript" src="${path}/dist/js/adminlte.min.js"></script>
		<!--<script type="text/javascript" src="${path}/dist/js/pages/dashboard.js" ></script>-->
		<script type="text/javascript">
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
		      checkboxClass: 'icheckbox_flat-green',
		      radioClass   : 'iradio_flat-green'
		    })
		    $("#pattern").click(function(){
		    	if($("#pattern b").html() == "显示答案"){
		    		$("#pattern b").html("关闭答案");
		    		$("#answer").show();
		    	}else{
		    		$("#pattern b").html("显示答案");
		    		$("#answer").hide();
		    	}
		    });
			function submit_answer(tId,qId,afterId,kId,num){
				var answer;
				if(tId==1||tId==3){
					answer = $(".comment-text .checked input").val();
				}else if(tId==2){
					var checkboxs = $(".comment-text .checked input");
					var tmp_v = "";
					for (var i = 0; i < checkboxs.length; i++) {
						tmp_v = tmp_v + checkboxs[i].value;
					}
					answer = tmp_v;
				}else{
					answer = $(".comment-text input").val();
				}
				
				$.ajax({
					url:"${path}/submit_question?qId="+qId+"&answer="+answer,
					type:'get',
					contentType:'application/x-www-form-urlencoded',
					encoding:'utf-8',
					cache:false,
					success:function(msg){
						if(msg.code == 0){
							num++;
							if(afterId>0){
								layer.msg('回答正确,快去做下一道题吧！', {icon:6,time:2000});
								window.location.href = "/detail_strengthen_order?knowledgeId="+kId+"&typeId="+tId+"&num="+num+"&qId="+afterId;
							}else{
								layer.msg('回答正确！', {icon:6,time:1000});
								window.location.href = "/detail_strengthen_order?knowledgeId="+kId+"&typeId="+tId+"&num="+num+"&qId="+qId;
							}
						}else{
							layer.msg('回答错误！', {icon:6,time:1000});
							$("#pattern b").html("关闭答案");
				    		$("#answer").show();
						}
					},
					error:function(msg){
						layer.msg('系统正忙，请稍后再试！', {icon:6,time:1000});
					}
				});
			}
			Date.prototype.Format = function (fmt) { //author: meizz 
	            var o = {
	                "M+": this.getMonth() + 1, //月份 
	                "d+": this.getDate(), //日 
	                "h+": this.getHours(), //小时 
	                "m+": this.getMinutes(), //分 
	                "s+": this.getSeconds(), //秒 
	                "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	                "S": this.getMilliseconds() //毫秒 
	            };
	            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	            for (var k in o)
	            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	            return fmt;
	        }
			function submit_comment(qId,uId) {
					var content = $(".comment-form textarea").val();
					
					if(content==null||content==""){
						layer.msg('评论不能为空！', {icon:6,time:1000});
						return false;
					}else if(content.length > 140){
						layer.msg('不能超过140个字！', {icon:6,time:1000});
						return false;
					}
					
					$.ajax({
						url:"/submit_comment",
						type:'get',
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						data : {
							content:content,
							qId:qId,
							uId:uId
						},
						cache:false,
						success : function(msg) {
							
							if (msg.code == 0) {
								var view = msg.data;
								var time = new Date(msg.data.createTime).Format("yyyy-MM-dd  hh:mm:ss ");
								$(".comment-list").append(
									"<li class=\"comment-list-item\">\n"+
										"<div class=\"comment-user-container\">\n"+
											"<div>\n"+
												"<img src=\"/ecms/img/photo.jpg\" class=\"comment-user-img\">\n"+
											"</div>\n"+
											"<div class=\"comment-user-info\">\n"+
												"<div>"+view.user.username+"</div>\n"+
												"<div class=\"comment-date\"><span>发表于：</span>"+time+"</div>\n"+
											"</div>\n"+
										"</div>\n"+
										"<p class=\"comment-user-text\">"+view.content+"</p>\n"+
									"</li>\n"
								);
								
							} else {
								layer.msg('提交失敗，请稍后再试！', {icon:6,time:1000});
							}
						},
						error : function(msg) {
							layer.msg('系统正忙，请稍后再试！', {icon:6,time:1000});
						}
					});
					
				};
		</script>
	</body>

</html>
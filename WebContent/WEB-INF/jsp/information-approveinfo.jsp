<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${hrpath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="InfoDisplayServlet.do?method=addInformation" method="post" class="form form-horizontal" id="form-member-add">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="10%">审核编码</th>
				<th width="10%">受审档案编码</th>
				<th width="10%">审核人编码</th>
				<th width="10%">审核人</th>
				<th width="25%">审核时间</th>
				<th width="">审核意见</th>
				<th width="10%">审核状态</th>
				<th width="10%">档案状态</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${Appro }" var="appro">
			<tr>
				<td><input type="checkbox" value="1" name=""></td>
				<td>${appro.approveno }</td>
				<td>${appro.infono }</td>
				<td>${appro.userno }</td>
				<td>${appro.realname }</td>
				<td>${appro.approtime }</td>
				<td>${appro.approdesc }</td>
				<td class="td-status"><span class="label label-success radius">${appro.checkstatus }</span></td>
				<td class="td-status"><span class="label label-success radius">${appro.infostatus }</span></td>
				 </td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
			
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" >
			<span style="padding-left: 180px;">&nbsp;</span>
				<input style="width: 80px;" class="btn btn-primary radius"  id="resetButton" type="button" value="返回">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 

<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">


$(function(){
		$("#resetButton").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			layer_close();
		});
		$("").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			window.parent.location.href="InfoDisplayServlet.do?method=displayAllInfo";  
			 layer_close(); 
		});
		
		/*关闭弹出框口*/
		function layer_close(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}  
	});
	$(function(){
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});
		
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
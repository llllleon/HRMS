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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 人事管理 <span class="c-gray en">&gt;</span> 我的审核 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="InfoDisplayServlet.do?method=selectByTime&flag=myApproveInfo" method="post" id="form-member-bytime">
		<div class="text-c"> 
		<!-- 错误提示 -->		
			<div style="color: red;">
			${error }
			</div>
		审核状态：
      <select name="checkstatus" id="u451_input" style="width:120px;" class="input-text Wdate">
        <option value="%%">-- 请选择 --</option>
        <option value="起草">起草</option>
        <option value="审核中">审核中</option>
        <option value="审核通过">审核通过</option>
        <option value="驳回">驳回</option>
        <option value="变更">变更</option>
        <option value="变更审核中">变更审核中</option>
      </select>
	  档案状态：
      <select name="infostatus"  id="u468_input" style="width:120px;" class="input-text Wdate">
        <option value="%%">-- 请选择 --</option>
        <option value="试用期">试用期</option>
        <option value="正式员工">正式员工</option>
        <option value="已删除">已删除</option>
        <option value="实习员工">实习员工</option>
      </select>
		建档日期：
		<input name="begintimetxt" value="${begintimetxt }" type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:100px;">
		-
		<input name="endtimetxt" value="${endtimetxt }" type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:100px;">
		<button type="submit" class="btn btn-success radius" id="selectByTime" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	</form>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="60">档案编码</th>
				<th width="40">姓名</th>
				<th width="40">性别</th>
				<th width="90">所属部门</th>
				<th width="90">职位</th>
				<th width="50">送审人</th>
				<th width="90">建档时间</th>
				<th width="90">审核状态</th>
				<th width="90">档案状态</th>
				<th >审核语</th>
				<th width="90">骚操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allList }" var="AllList">
			<tr>
				<td><input type="checkbox" value="1" name=""></td>
				<td>${AllList.infono }</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">${AllList.infoname }</u></td>
				<td>${AllList.sex }</td>
				<td>${AllList.dsname }</td>
				<td>${AllList.pname }</td>
				<td>${AllList.uname }</td>
				<td>${AllList.infotime }</td>
				<td class="td-status"><span class="label label-success radius">${AllList.checkstatus }</span></td>
				<td class="td-status"><span class="label label-success radius">${AllList.infostatus }</span></td>
				<td>${AllList.inforemark }</td>
				<td class="td-manage">
				<i class="Hui-iconfont"></i></a>
				 <a title="编辑" href="javascript:;" onclick="member_edit('编辑','${hrpath }/info/modifyInfo?infono=${AllList.infono }&checkMine=mine','','','510')" class="ml-5" style="text-decoration:none">
				 <i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="member_add('查看审批历史','${hrpath }/info/findApproveInfo?infono=${AllList.infono }','','510')" href="javascript:;" title="查看审批历史">
				 <i class="Hui-iconfont">&#xe63f;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/* 日期模糊查询 */
/* $(function(){
	$("").click(function(){
		var min=$("#datemin").val();
		var max=$("#datemax").val();
		if(min!="" || max!=""){
		  $.ajax({
			url:"InfoDisplayServlet.do?method=selectByTime",
			type:"post",
			datatype:"json",
			data:$("#form-member-bytime").serialize(),
			success:function(rsData){
		 		console.log(rsData);
		 			if(rsData!=""){
					window.location.href ="${pageContext.request.contextPath}/information-list.jsp";
				}
			}
		}) 
		}
	});
	
});
 */

$(function(){
	var userno="${user.userno}";
	
		 $(".delete01").hide();

	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,id,w,h);
	
	
	
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script> 
</body>
</html>
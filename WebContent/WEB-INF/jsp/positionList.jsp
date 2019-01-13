<%@ page isELIgnored="false" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <!-- 锚点 -->
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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>岗位管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 岗位管理 <span class="c-gray en">&gt;</span>岗位列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
<form action="${hrpath }/position/findPoByArgs" method="post" id="formSearId">
	<div class="text-c"> 
		<input type="text" name="posno"  id="logmin" class="input-text " style="width:120px;" value="${position.posno}" placeholder="职位编码">
		<input type="text" name="pname" id="logmax" class="input-text " style="width:120px;"  value="${position.pname}" placeholder="职位名称">
		<input type="text" name="ptype" id="" placeholder="职位分类" style="width:250px" value="${position.ptype}" class="input-text">
		<button name="" id="jobId" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>职位检索</button>
	</div>
</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" id="delId" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	<a class="btn btn-primary radius" onclick="picture_add('添加岗位','${hrpath}/position/findByPtype')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加岗位</a></span> 
	<span class="r">共有数据：<strong>${countAll}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr height="5" class="text-c">
					<th width="30"><input name="" type="checkbox" value=""></th>
					<th width="120">职位编码</th>
					<th width="120">职位名称</th>
					<th width="120">职位分类</th>
					<th>职位描述</th>
					<th width="120">备注</th>
					<th width="120">组织编码</th>
					<th width="120">是否启用</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 遍历查询所有数据的循环 -->
				<c:forEach var="position" items="${findAll }">
					<tr class="text-c">
						<td><input name="chk" type="checkbox" value=""></td>
						<td>${position.posno }</td>
						<td>${position.pname }</td>
						<td>${position.ptype }</td>
						<td>${position.pdesc }</td>
						<td>${position.premark }</td>
						<td>${position.deptno }</td>
						<c:choose>
							<c:when test="${position.status=='启用'}">
								<td class="td-status"><span class="label label-success radius">启用</span></td>
							</c:when>
							<c:otherwise>
								<td class="td-status"><span class="label label-success radius">未启用</span></td>
							</c:otherwise>
						</c:choose>
						<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="picture_del(this,${position.posno })" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});

/*图片-添加*/
function picture_add(title,url){
	/* var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index); */
	layer_show(title,url);
	/* layer.closeAll('iframe'); */
}
/* 批量删除 */
 $("#delId").click(function(){
	 var toDelArr=$("input[name=chk]:checked");
	 if(toDelArr.length==0){
		 alert("请至少选中一行");
	 }else{
		 var flag=window.confirm("是否确认删除？");
		 if(flag==true){
				toDelArr.parent().parent().remove();
			}
	 }
 })
/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-审核*/
function picture_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}

/*图片-下架*/
function picture_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*图片-发布*/
function picture_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}

/*图片-申请上线*/
function picture_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*图片-编辑*/
function picture_edit(title,url,id){
	/* alert(url); */
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
	});
	layer.full(index);
}
/*数据-删除*/
function picture_del(obj,id){
	var flag=confirm("确定删除该行数据？");
	if(flag){
		$.ajax({
			type: 'POST',
			url: "${hrpath}/position/dropByPosno",
			dataType: 'json',
			data:"posno="+id,
			success: function(rsData){
				if(rsData.code==1){
					alert(rsData.info);
					window.location.reload();
				}else if(data.num==0){
					alert(rsData.info);
				}
				/* if(data.num>=1){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
					error:function(data) {
						console.log(data.msg);
					}
				} */
			}
		});		
	}
}
</script>
</body>
</html>
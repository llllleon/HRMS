<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
    <title>My JSP 'salStandardList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<style type="text/css">
	.audit{}
</style>
<title>薪酬标准管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 薪酬管理 <span class="c-gray en">&gt;</span> 薪酬标准管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form id="formCondition" class="Huiform" method="post" action="${hrpath }/salstand/findSalStandByCondition" target="_self">
			薪资标准编号：<input type="text" name="standno" placeholder="薪资标准编号" value="${standno }" class="input-text" style="width:120px">
			<span class="btn-upload form-group">
			<div class="text-c">&emsp;登记时间：
				<input name="beginTime" type="text" value="${beginTime }" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd' })" id="logmin" class="input-text Wdate" readonly="readonly" style="width:120px;">
				-
				<input name="endTime" type="text" value="${endTime }" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'2099-12-31 23:59:59',dateFmt:'yyyy-MM-dd' })" id="logmax" readonly="readonly" class="input-text Wdate" style="width:120px;">
			</div>
			</span>&emsp;审核状态：<span class="select-box" style="width:150px">
			<select class="select" id="salaudit" name="salaudit" size="1">
				<option value="0">--请选择--</option>
				<option value="1">审核中</option>
				<option value="2">起草</option>
				<option value="3">通过</option>
				<option value="4">驳回</option>
			</select>
			</span>&emsp;<button type="button" class="btn btn-success" id="" name="" onClick="findSalStandByCondition();"><i class="Hui-iconfont">&#xe600;</i> 查询</button>
		</span>&emsp;<button type="button" class="btn btn-primary" id="" name="" onClick="exportSalStand();"><i class="Hui-iconfont">&#xe644;</i> 导出</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>&emsp;</span> 
	<a class="btn btn-primary radius" onclick="addSalStand('薪酬登记','salstandardAdd.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增标准</a>
	<span class="r">共有数据：<strong>${count }</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-sort" >
			<thead>
				<tr class="text-c">
					<th width="60"><input type="checkbox" name="" value=""></th>
					<th width="120">薪酬标准ID</th>
					<th width="150">薪酬标准职称</th>
					<th width="100">审核状态</th>
					<th width="130">登记时间</th>
					<th width="80">标准明细</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="salStand" items="${standList }">
				<tr class="text-c">
					<td><input name="" type="checkbox" value=""></td>
					<td>${salStand.standno }</td>
					<td>${salStand.standname }</td>
					<td>${salStand.salaudit }</td>
					<td>${salStand.standtime }</td>
					<td>
						<a style="text-decoration:none" class="ml-5"  onclick="findSalStandItem('明细查看','${hrpath }/salstand/findItem?standno=${salStand.standno }')" href="javascript:;" title="明细">
						<i class="Hui-iconfont">&#xe627;</i>查看明细</a>
					</td>
					<td class="f-14 product-brand-manage">
					<c:if test="${user.posno==3 }">
						<a id="auditid" style="text-decoration:none" class="ml-5 audit" onClick="auditSalStand('薪资标准审核','${hrpath }/salstand/toAuditStand?standno=${salStand.standno }')" href="javascript:;" title="审核">
						<i class="Hui-iconfont">&#xe606;</i></a>
					</c:if>
						<a id="updateid" style="text-decoration:none" onClick="findThisStand('薪资标准修改','${hrpath }/salstand/findItem?standno=${salStand.standno }')" href="javascript:;" title="编辑">
						<i class="Hui-iconfont">&#xe6df;</i></a> 
						<a id="deleteid" style="text-decoration:none" class="ml-5" onClick="deleteSalStand('删除','${hrpath }/salstand/deleteStand?standno=${salStand.standno }')" href="javascript:;" title="删除">
						<i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hrpath }/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hrpath }/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hrpath }/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hrpath }/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hrpath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${hrpath }/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${hrpath }/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				//demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,4]}// 制定列不参与排序
	]
});
/*薪酬-薪酬标准-添加*/
function addSalStand(title,url,w,h){
	window.location.href="${hrpath}/salstand/findSalStandName";
	/* layer_show(title,url,w,h); */
}
/*薪酬标准修改*/
function findThisStand(title,url,w,h){
	layer_show(title,url,w,h);
}
/*查看明细*/
function findSalStandItem(title,url,w,h){
	layer_show(title,url,900,h);
}
/*审核薪资标准*/
function auditSalStand(title,url,w,h){
	layer_show(title,url,900,h);
}
/*删除薪资标准*/
function deleteSalStand(title,url,w,h){
	/* layer_show(title,url,900,h); */
	layer.confirm("确认删除本条薪资标准吗？",function(index){
		$.ajax({
			url:url,
			type:"post",
			dataType:"json",
			success:function(rsData){
				if(rsData.code==1){
					/* $.Huimodalalert(rsData.info,1500); */
					layer.close(index);
					layer.alert(rsData.info+' 薪酬标准已删除',{icon:6,time:1000});
					setTimeout(function(){history.go(0);}, 1500);
				}else if(rsData.code==0){	
					layer.alert(rsData.info+' 请稍后再试',{icon:2,time:1000});
				}else{
					layer.alert('服务器开小差了，喝杯茶休息一会~',{icon:2,time:1000});
				}
			}
		})
	});
}

</script>
<script type="text/javascript">
	$(function() {
		/* 权限管理
		var posno="${user.posno}";
		var uname="${user.uname}";
		if (posno!=3) {//如果不是薪酬主任，隐藏审批
			$(".audit").hide();
		} */
		// 条件记忆  选中下拉框
		var selectVal='${salaudit }';
		if(""!=selectVal){
			$("#salaudit option[value=${salaudit }]").attr("selected","selected");
			/* $("#salaudit option").each(function() {
				if($(this).val() == selectVal){
					$(this).attr("selected","selected");
				}
			}) */
		}
		
	})
	function findSalStandByCondition() {
		$("#formCondition").submit();
	}
	function exportSalStand() {
		layer.confirm("确认导出全部薪资标准吗？",function(index){
			layer.close(index);
			window.location.href="${hrpath }/salstand/exportSalStand";
		});
	}
</script>
</body>
</html>





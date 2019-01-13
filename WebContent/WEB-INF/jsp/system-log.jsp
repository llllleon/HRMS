<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${hrpath }/lib/html5shiv.js"></script>
<script type="text/javascript" src="${hrpath }/lib/respond.min.js"></script>
<![endif]-->
  <c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${hrpath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
  <style>
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}
ul.pagination li a.active {
    background-color: #4CAF50;
    color: white;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;}
</style>
<title>系统日志</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	系统管理
	<span class="c-gray en">&gt;</span>
	系统日志
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form action="${hrpath }/log/logListByConditionWithPage?currPage=1" method="post">
		<div class="text-c"> 日期范围：
			<input type="text" value="${beginTime }" name="beginTime" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" value="${endTime }" name="endTime" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
			<input type="text" value="${logname }" name="logname" id="" placeholder="用户名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜日志</button>
		</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		</span>
		<span class="r">显示${pageUtil.startrow+1 }到${pageUtil.startrow+pageUtil.pagesize }&emsp;&emsp;共有数据：<strong>${pageUtil.rowcount }</strong> 条</span>
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="17%">真实姓名</th>
				<th>客户端IP</th>
				<th width="120">所属职位</th>
				<th width="120">时间</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="log" items="${pageUtil.pageData }">
				<tr class="text-c">
				<td><input type="checkbox" value="" name=""></td>
				<td>${log.logid }</td>
				<td>${log.logname }</td>
				<td>${log.realname }</td>
				<td>${log.logip }</td>
				<td>${log.pname }</td>
				<td>${log.lasttime }</td>
				<td><a title="详情" href="javascript:;" onclick="system_log_show(this,'10001')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>
					<a title="删除" href="javascript:;" onclick="system_log_del(this,'10001')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div id="pageNav" class="pageNav">
		
		<ul class="pagination" style="text-align: right">
		<c:if test="${pageUtil.currnav != pageUtil.begin }">
			<li><a href="${hrpath }/log/logListByConditionWithPage?currPage=${pageUtil.first}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">首页</a></li>
			<li><a href="${hrpath }/log/logListByConditionWithPage?currPage=${pageUtil.prev}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">«</a></li>
		</c:if>
		<c:forEach var="i" begin="${pageUtil.begin }" end="${pageUtil.end }">
			<c:choose>
				<c:when test="${i == pageUtil.currnav }">
			 		 <li><a class="active" href="${hrpath }/log/logListByConditionWithPage?currPage=${i}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">${i }</a></li>
				</c:when>
				<c:otherwise>
				  <li><a href="${hrpath }/log/logListByConditionWithPage?currPage=${i}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageUtil.currnav != pageUtil.end }">
			<li><a href="${hrpath }/log/logListByConditionWithPage?currPage=${pageUtil.next}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">»</a></li>
			<li><a href="${hrpath }/log/logListByConditionWithPage?currPage=${pageUtil.last}&logname=${logname}&beginTime=${beginTime}&endTime=${endTime}">尾页</a></li>
		</c:if>
			<li><a href="javaScript:;">共${pageUtil.navcount }页</a></li>
		</ul>
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

$('.table-sort').dataTable({
	"lengthMenu":false,//显示数量选择 
	"bFilter": false,//过滤功能
	"bPaginate": false,//翻页信息
	"bInfo": false,//数量信息
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
	]
});

/*查看日志*/
function system_log_show(){
	
}
/*日志-删除*/
function system_log_del(obj,id){
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
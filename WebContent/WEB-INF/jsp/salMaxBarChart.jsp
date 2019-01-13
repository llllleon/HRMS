<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${hrpath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${hrpath}/lib/respond.min.js"></script>
<![endif]-->
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${hrpath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hrpath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hrpath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hrpath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hrpath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${hrpath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>3D饼状图</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 数据分析 <span class="c-gray en">&gt;</span> 最高薪资占比3D饼状图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="line" style="color: red"></div>
	<div class="f-24 c-primary mt-10">薪酬统计</div>
	<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hrpath}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${hrpath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hrpath}/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${hrpath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hrpath}/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="${hrpath}/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="${hrpath}/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">
﻿﻿$(function () {
	var stand=new Array();
	var data1=[];
	var data2=[];
	$.ajax({
		url:"${hrpath}/salstand/salPieChart",
		datdatype:"json",
		type:"post",
		success:function(result){
			for(var i in result){
				var stdname=result[i].standname;
				var stdsum=result[i].standsum;
				var obj=[];
				data1.push(stdname);
				data2.push(stdsum);
			}
			docharts2();
		}
	});
	function docharts2() {  
		   var chart = {      
		      type: 'column',
		      margin: 75,
		      options3d: {
		         enabled: true,
		         alpha: 10,
		         beta: 25,
		         depth: 70
		      }
		   };
		   var legend = {
				align: 'right',
				verticalAlign: 'top',
				x: 0,
				y: 100
		   };
		   var title = {
		      text: '岗位最高工资'   
		   };
		   var subtitle = {
		      text: '忽略职称'  
		   };
		   var xAxis = {
		       categories: data1 
		   };
		   var yAxis = {
		      title: {
		         text: 'salMax'
		      }
		   };   
		   var series= [{
		      name: 'positions',
		      data: data2
		   }];     
		      
		   var json = {};   
		   json.chart = chart; 
		   json.title = title;   
		   json.subtitle = subtitle;    
		   json.xAxis = xAxis; 
		   json.yAxis = yAxis; 
		   json.series = series;
		   json.legend = legend;   
		   $('#container').highcharts(json);
		}
});
</script>
</body>
</html>
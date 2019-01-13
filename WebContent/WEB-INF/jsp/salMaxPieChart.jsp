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
	<div id="container" style="min-width:700px;height:400px"></div>
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
	$.ajax({
		url:"${hrpath}/salstand/salPieChart",
		datdatype:"json",
		type:"post",
		success:function(result){
			console.log(result);
			console.log(typeof result);
			for(var i in result){
				var stdname=result[i].standname;
				var stdsum=result[i].standsum;
				if(i==1){
					var obj={};
					obj.name=stdname;
					obj.y=stdsum;
					obj.sliced=true;
					obj.selected=true;
					stand.push(obj);
					continue;
				}
				var obj=[];
				obj.push(stdname);
				obj.push(stdsum);
				stand.push(obj);
			}
			console.log(stand);
			dochasts();
		}
	});
	
    function dochasts(){
    	$('#container').highcharts({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: '关于本公司各岗位最高薪资占比的3D饼状图'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    /* stacking:'normal', */
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Highter Sal',
                data: stand
            }]
        });
    }
    
});
</script>
</body>
</html>
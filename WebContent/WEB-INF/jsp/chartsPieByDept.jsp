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
<title></title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i><span class="c-gray en">&gt;</span><span class="c-gray en">&gt;</span>档案分布图<a class="btn btn-success radius r" style="line-height:2.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="å·æ°" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="f-14 c-error">档案分布图</div>
	<div id="container" style="min-width:550px;height:400px"></div>
</div>
<!--_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->

<!--è¯·å¨ä¸æ¹åæ­¤é¡µé¢ä¸å¡ç¸å³çèæ¬-->
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript">
$(function () {
	
	var deptList=[];
	var NumList=[];
	$.ajax({
		url:"${hrpath}/info/chartsByDept",
		datdatype:"json",
		type:"post",
		async:false,
		success:function(result){
			for(var i in result){
				var dsname1=result[i].dsname;
				var count1=result[i].count;
				deptList.push(dsname1);
				NumList.push(count1);
			}
	
	
		console.log(deptList);
		console.log(NumList);
		}
	});
    $('#container').highcharts({
        chart: {
        	type: 'column',
		      margin: 75,
		      options3d: {
		         enabled: true,
		         alpha: 10,
		         beta: 25,
		         depth: 70
		      }
            
        },
        title: {
            text: '档案分布图'
        },
        subtitle: {
            text: 'bjsxt.com'
        },
        xAxis: {
            categories: deptList,
        },
        yAxis: {
            min: 0,
            title: {
                text: '人数'
            }
        },
         tooltip: {
            headerFormat: '<span style="font-size:15px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:red;padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>名</b></td></tr>',
            footerFormat: '</table>',
            shared: false,
            useHTML: false
        }, 
        plotOptions: {
            column: {
                pointPadding: 0.1,
                borderWidth: 1
            }
        },
        series: [{
            name: ':',
            data:NumList,
        }]
    });

});				
</script>
</body>
</html>
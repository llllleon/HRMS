<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<!DOCTYPE html>
<html>
<head>
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="${hrpath }/js/echarts.js" type="text/javascript"  charset="UTF-8"></script>
    <script type="text/javascript" src="${hrpath }/js/jquery.js"></script>
</head>

<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" align="center"  style="width: 700px;height:600px; "></div>
    <script type="text/javascript">
    
    var pnames=[];
	var recnums=[];
	//Ajax发送数据给后台 
	$.ajax({ 
		//url地址
		url :"${hrpath}/rec/findEcharts",
		//请求类型
		type : "post", 
		//返回数据的类型
		datatype : "json", 
		success : function (rsData){ 
			for(var i in rsData){
				var pname=rsData[i].pname;
				var recnum=rsData[i].recnum;
				pnames.push(pname);
				recnums.push(recnum);
				console.log(pnames);
				console.log(recnums);
				showcharts();
			}
		} 
	}); 

       function showcharts(){
    	   // 基于准备好的dom，初始化echarts实例
           var myChart = echarts.init(document.getElementById('main'));

           // 指定图表的配置项和数据
           var option = {
               title: {
                	
                   text: '招聘职位及人数统计图'
               },
               tooltip: {},
               legend: {
                   data:['Type']
               },
               xAxis: {
                   data: pnames        
               },
               yAxis: {},
               series: [{
                   name: '人数',
                   type: 'bar',
                   data: recnums
               }]
           };

           // 使用刚指定的配置项和数据显示图表。
           myChart.setOption(option);
       }
    </script>
</body>
</html>
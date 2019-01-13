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
    
    <title>My JSP 'salstandItem.jsp' starting page</title>
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title></title>
</head>
<body>
<div class="page-container">
	<form id="formid" action="" method="post" class="form form-horizontal" id="form-category-add">
		<div id="tab-category" class="HuiTab">
			<div class="tabBar cl">
				<span>薪酬标准明细查看</span>
			</div>
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3" >薪酬标准编号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" readonly="readonly" class="input-text" value="${salstand.standno }" >
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3" >登记时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" readonly="readonly" class="input-text" value="${salstand.standtime }" >
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">薪酬标准名称：</label>
					<div class="formControls col-xs-8 col-sm-9" >
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text"  readonly="readonly" value="${salstand.standname }" >
					</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">制定人：</label>
					<div class="formControls col-xs-8 col-sm-9">
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text"  readonly="readonly" value="${salstand.creatno }" >
					</div>
					</div>
				</div>
				<div class="row cl" >
					<label class="form-label col-xs-4 col-sm-3">登记人：</label>
					<div class="formControls col-xs-8 col-sm-9">
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" readonly="readonly"  value="${salstand.uname }" >
					</div>
					</div>
				</div>
					
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">基本薪酬总额：</label>
					<div class="formControls col-xs-8 col-sm-9" >
					<div class="formControls col-xs-8 col-sm-9" >
						<input type="text" class="input-text" readonly="readonly" value="${salstand.standsum }">
					</div>
					</div>
				</div>
			</div>
			<br/>
			<span style="font-size: 18 ;color: purple;"> &emsp; &emsp;&emsp;&emsp;&emsp;&emsp;工资标准明细：</span>
			<div id="saldiv" align="center">
				<table class="table table-border table-bordered table-bg table-sort" style="width: 600px;">
					<thead>
						<tr class="text-c">
							<th width="30">序号</th>
							<th width="40">薪酬项目名称</th>
							<th width="30">金额</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-c">
							<td>1</td>
							<td>基本工资</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="base" type="text" value="${standItem.base }" ></td>
						</tr>
						<tr class="text-c">
							<td>2</td>
							<td>绩效奖金</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="comm" type="text" value="${standItem.comm }" ></td>
						</tr>
						<tr class="text-c">
							<td>3</td>
							<td>交通补助</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="traffic" type="text" value="${standItem.traffic }" ></td>
						</tr>
						<tr class="text-c">
							<td>4</td>
							<td>通讯补助</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="mobile" type="text" value="${standItem.mobile }" ></td>
						</tr>
						<tr class="text-c">
							<td>5</td>
							<td>餐补</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="eat" type="text" value="${standItem.eat }" ></td>
						</tr>
						<tr class="text-c">
							<td>6</td>
							<td>住房补助</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="house" type="text" value="${standItem.house }" ></td>
						</tr>
						<tr class="text-c">
							<td>7</td>
							<td>出差补助</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="travel" type="text" value="${standItem.travel }" ></td>
						</tr>
						<tr class="text-c">
							<td>8</td>
							<td>加班补助</td>
							<td><input  class="input-text"  readonly="readonly" style="width: 200px;" name="overwork" type="text" value="${standItem.overwork }"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<input class="btn btn-primary radius" type="button" id="bankbtn" value="&nbsp;&nbsp;返回&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});
		
		$("#tab-category").Huitab({
			index:0
		});
		$("#form-category-add").validate({
			rules:{
				
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
				//$(form).ajaxSubmit();
				var index = parent.layer.getFrameIndex(window.name);
				//parent.$('.btn-refresh').click();
				parent.layer.close(index);
			}
		});
	});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
		$(function() {
			// 返回页面 bankbtn
			$("#bankbtn").bind("click",function(){
				/* window.opener.location.href="${pageContext.request.contextPath}/salStandardList.jsp"; */
				// 返回上一页面
				/* window.location.href="JavaScript:history.go(-1)";  */
				/* window.location.href=""; */
				layer_close();// 关闭弹窗
			})
		})
		/*关闭弹出框口*/
		function layer_close(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	</script>
</body>
</html>

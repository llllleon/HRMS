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
    <title>My JSP 'salstandardAdd.jsp' starting page</title>
    
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
<style type="text/css">
	.error{
		color: red
	}
</style>
<title></title>
</head>
<body>
<div class="page-container">
	<form  action="" method="post" class="form form-horizontal" id="form-salstand-add">
		<div id="tab-category" class="HuiTab">
			<div class="tabBar cl">
				<span>薪酬标准登记</span>
			</div>
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3" >薪酬标准编号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text"readonly="readonly" class="input-text" value="-----自动生成-----" id="" name="">
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3" >登记时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" readonly="readonly" class="input-text" value="${standtime }" id="" name="standtime">
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">薪酬标准名称：</label>
					<div class="formControls col-xs-8 col-sm-9" >
					<div class="formControls col-xs-8 col-sm-9">
						<span class="select-box">
							<select name="standname" class="select">
								<c:forEach var="pname" items="${pnames }">
									<option value="${pname.ptname }">${pname.ptname }</option>
								</c:forEach>
							</select>
							</span>
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">制定人：</label>
					<div class="formControls col-xs-8 col-sm-9">
					<div class="formControls col-xs-8 col-sm-9">
						<span class="select-box">
							<select name="creatno" id="creatno" class="select">
								<c:forEach var="creatno" items="${creatnos }">
									<option value="${creatno.uname }">${creatno.realname }------${creatno.userdesc }</option>
								</c:forEach>
							</select>
							</span>
					</div>
					</div>
				</div>
				<div class="row cl" >
					<label class="form-label col-xs-4 col-sm-3">登记人：</label>
					<div class="formControls col-xs-8 col-sm-9">
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id=""  class="input-text" value="${user.realname }" readonly="readonly">
						<input type="hidden" id="uname" value="${user.uname }" name="uname">
					</div>
					</div>
				</div>
					
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">基本薪酬总额：</label>
					<div class="formControls col-xs-8 col-sm-9" >
					<div class="formControls col-xs-8 col-sm-9" >
						<input type="text" class="input-text" readonly="readonly" value="" placeholder="自动计算" id="salsumid" name="standsum">
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
							<th width="40">金额</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-c">
							<td>1</td>
							<td>基本工资</td>
							<td><input  class="input-text" style="width: 200px;" name="base"  id="base" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>2</td>
							<td>绩效奖金</td>
							<td><input  class="input-text" style="width: 200px;" name="comm"  id="comm" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>3</td>
							<td>交通补助</td>
							<td><input  class="input-text" style="width: 200px;" name="traffic"  id="traffic" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>4</td>
							<td>通讯补助</td>
							<td><input  class="input-text" style="width: 200px;" name="mobile"  id="mobile" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>5</td>
							<td>餐补</td>
							<td><input  class="input-text" style="width: 200px;" name="eat"  id="eat" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>6</td>
							<td>住房补助</td>
							<td><input  class="input-text" style="width: 200px;" name="house"  id="house" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>7</td>
							<td>出差补助</td>
							<td><input  class="input-text" style="width: 200px;" name="travel"  id="travel" type="text" value="0"></td>
						</tr>
						<tr class="text-c">
							<td>8</td>
							<td>加班补助</td>
							<td><input  class="input-text" style="width: 200px;" name="overwork"  id="overwork" type="text" value="0"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
			&emsp;&emsp;
				<input class="btn btn-primary radius" type="button" id="counbtn" value="&nbsp;&nbsp;验证金额&nbsp;&nbsp;">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<input class="btn btn-primary radius" type="button" id="savebtn" value="&nbsp;&nbsp;保存当前&nbsp;&nbsp;">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<input class="btn btn-primary radius" type="submit" id="submintbtn" value="&nbsp;&nbsp;提交审核&nbsp;&nbsp;">
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
		// 声明表单验证方法
		$("#form-salstand-add").validate({
				rules:{
					creatno: {required: true},
					   salsumid: { required: true, number:true,  min:1000 , 
						   max:99999,minlength: 4,  maxlength: 8 },
					   base:{ required: true, number:true, min:1000 , 
						   max:20000, minlength: 4, maxlength: 5 },
					   comm:{ required: true,  number:true  , maxlength: 5 },
					   traffic:{ required: true, number:true  , maxlength: 5 },
					   mobile:{ required: true,  number:true  , maxlength: 5 },
					   eat:{ required: true, number:true  , maxlength: 5 },
					   house:{ required: true, number:true  , maxlength: 5 },  
					   travel:{ required: true, number:true  , maxlength: 5 }, 
					   overwork:{ required: true, number:true  , maxlength: 5 }
				},
				messages:{
					creatno: { required: "请选择制定人"},
						salsumid: { required: "必须计算总额",number:"必须是数字", min:"最小工资不能小于1000",
							max:"最大工资不能超过99999",minlength: "最小长度为4", maxlength: "最大长度为8"},
						base:{required:"基础工资不能为零", number:"必须是数字", min:"基础工资不能小于1000", 
							max:"基础工资不能大于20000", minlength:"基础工资最小长度为4", maxlength:"最大长度为5"},
						comm:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5"  },
						traffic:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5" },
						mobile:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5" },
						eat:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5" },
						house:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5"  },
						travel:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5" },
						overwork:{required:"必须填写金额", number:"必须是数字", maxlength: "最大长度为5" }
				},
				onkeyup:false,
				success:"valid",
				errorElement:"div",
				errorClass:"error",
				focusCleanup:true,
				focusInvalid:false,
				submitHandler:function(form){
					// 计算当前总额与总额文本域的数值是否一致
					var sum=0;
					$("#saldiv input").each(function() {
						var item=$(this).val();
						sum += Number(item);
					})
					// 验证通过后，发送ajax
					if($("#salsumid").val()==sum){
					// 发送ajax请求的函数
						// 获取form表单对象，直接序列化
						var formData=$("#form-salstand-add").serialize();
						$.ajax({
							url:"${hrpath}/salstand/addSalStand",// 由于提交的是序列化的对象，method参数也可以放在url之后  
							type:"post",
							data:formData+"&option=1",// 此时的数据已经是序列化之后的对象，格式：add=add&admin=admin...,不可以使用json对象的格式书写
							dataType:"json",
							success:function(rsData){
								if(rsData.code==1){// 添加成功
									layer.alert(rsData.info+" 薪酬标准已添加",{icon:6,time:1000});
									// 跳转salStandardList.jsp
									setTimeout(function(){
										window.location.href="${hrpath }/salstand/findAllSalstand";
									},1000);
								}else if(rsData.code==0){
									// 提示添加失败
									layer.alert(rsData.info+"请检查后重新尝试！",{icon:2,time:1000});
									// 刷新当前页面
									/* window.location.reload(); */
								}else{
									layer.alert("服务器开小差了，休息一会吧！",{icon:2,time:1000});
								}
							}
						}) // ajax end
					}else{
						layer.alert("必须手动验证薪资总额！",{icon:7,time:1000});
					}
				}// submithhandler  end
			});// 表单验证end
		
	
	});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
		$(function() {
			// 计算金额
			$("#counbtn").bind("click",function(){
				var sum=0;
				$("#saldiv input").each(function() {
					var item=$(this).val();
					sum += Number(item);
				})
				$("#salsumid").val(sum);
			})
			// 返回页面 bankbtn
			$("#bankbtn").bind("click",function(){
				/* window.opener.location.href="${pageContext.request.contextPath}/salStandardList.jsp"; */
				// 返回上一页面
				window.location.href="JavaScript:history.go(-1)"; 
			})
			
			// 提交审核申请
			$("#savebtn").bind("click",function(){
				// 自动验证薪资总额
				var sum=0;
				$("#saldiv input").each(function() {
					var item=$(this).val();
					sum += Number(item);
				})
				$("#salsumid").val(sum);
				// 获取form表单对象，直接序列化
				var formData=$("#form-salstand-add").serialize();
				$.ajax({
					url:"${hrpath}/salstand/addSalStand",// 由于提交的是序列化的对象，method参数也可以放在url之后  
					type:"post",
					data:formData+"&option=2",// 此时的数据已经是序列化之后的对象，格式：add=add&admin=admin...,不可以使用json对象的格式书写
					dataType:"json",
					success:function(rsData){
						if(rsData.code==1){// 添加成功
							layer.alert(rsData.info+" 薪酬标准已保存",{icon:6,time:1000});
							// 跳转salStandardList.jsp
							setTimeout(function(){
								window.location.href="${hrpath }/salstand/findAllSalstand";
							},1000);
						}else if(rsData.code==0){
							// 提示添加失败
							layer.alert(rsData.info+"请检查后重新尝试！",{icon:2,time:1000});
						}else{
							layer.alert("服务器开小差了，休息一会吧！",{icon:2,time:1000});
						}
					}
				})
			})
		})
	</script>
</body>
</html>

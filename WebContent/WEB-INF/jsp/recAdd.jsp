<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>

  <base href="<%=basePath%>">
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
<script type="text/javascript" src="${hrpath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
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

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="${hrpath }/rec/addRec" method="post" class="form form-horizontal" id="form">
<!-- 错误提示 -->		
			<div style="color: red;">
			${error }
			</div>
<!-- 部门-档案状态 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
				<label class="col-xs-3 col-sm-0" >
					<select class="select" size="1" name="dsname" style="width: 150px;height: 32px;">
						<option value="">请选择部门</option>
					<c:forEach items="${deptName }" var="deptName">
						<option value="${deptName.dsname}">${deptName.dsname }</option>
					</c:forEach>
					</select>
				</label>
				
			<label style="width: 120px;" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘类型：</label>
				<label class="col-xs-3 col-sm-0" >
				<select class="select" size="1" name="rectype" style="width: 150px;height: 32px;">
						<option value="">请选择类型</option>
						<option value="社招">社招</option>
						<option value="校招">校招</option>
						<%-- <c:forEach var="recType" items="${recType }">
							<option value="${recType.rectype }">${recType.rectype }</option>
						</c:forEach> --%>
				</select>
				</label>
		</div>
<!-- 职位 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位名称：</label>
				<label class="col-xs-3 col-sm-0">
					<select id="pname" class="select" size="1" name="pname" style="width: 150px;height: 32px;">
						<option value="">请选择职位</option>
					<c:forEach items="${pname }" var="pname">
						<option value="${pname.pname }">${pname.pname }</option>
					</c:forEach>
					</select>
				</label>
				<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>招聘人数：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text"  placeholder="" id="recnum" name="recnum">
				</label>
		</div>
		<!-- 	<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>职位编码：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text"  name="email" id="">
				</label> -->
		</div>
<!-- 姓名性别 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>职位编码：</label>
				<label class="formControls col-xs-3 col-sm-0">
				<input type="text" readonly="readonly"  style="width: 150px;height: 30px;" class="input-text"  placeholder="" id="posno" name="posno">
				</label>
			
			
		</div>
<!-- email -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>职位分类：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" readonly="readonly" style="width: 150px;height: 30px;"  class="input-text"  placeholder="" id="postype" name="postype">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red"></span>登记人：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" value="${user.realname }" style="width: 150px;" class="input-text"  readonly="readonly" id="uname" >
				<input type="hidden" value="${user.uname }" style="width: 150px;" class="input-text"  name="uname">
				</label>
		</div>

<!-- 身份证号 -->
		<%Date date=new Date(); SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); String nowdate=sdf.format(date); %>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>登记时间：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" readonly="readonly" style="width: 150px;"  class="input-text" value="<%=nowdate %>" placeholder="" id="" name="rectime">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>截止日期：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" onfocus="WdatePicker()"    placeholder="" id="" name="endtime">
			</label>
		</div>

<!-- 个人履历介绍-->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘描述：</label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<textarea name="recdesc"  cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符"  onKeyUp="$.Huitextarealength(this,100)"></textarea>
				</label>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘要求：</label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<textarea name="requirement"  cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)"></textarea>
				</label>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" >
			<span style="padding-left: 180px;">&nbsp;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input readonly="readonly" style="width: 80px;" onclick="yn()"  class="btn btn-primary radius" id="submitButton" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input readonly="readonly" style="width: 80px;" class="btn btn-primary radius"  id="resetButton" type="reset" value="重置">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 

<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
/*提交所有的数据  */
/* 新的知识点，，获取表单序列化数据为字符串 */
	 /*   $(function(){
		$("#fromButton").click(function(){
			var list=$("#form-member-add").serialize(); 
			console.log(list);
			$.ajax({
				url:"InfoDisplayServlet.do?method=addInformation",
				type:"post",
				datatype:"json",
				data:list,
				success:function(rsData){
			 		console.log(rsData);
			 			if(rsData==true){
						window.location.href ="InfoDisplayServlet.do?method=displayAllInfo";
					}else{
						// 刷新页面
						window.location.href = window.location.href ;
					} 
				}
			}) 
	
		});
		
	});   */

	function yn(){
		 var mymessage=confirm("确认提交吗 ？");
		    if(mymessage==true)
		    	/* 弹框反馈添加信息 */

						//Ajax发送数据给后台 
						$.ajax({ 
							//url地址
							url :"${hrpath}/rec/addRec",
							//请求类型
							type : "post", 
							//返回数据的类型
							datatype : "json", 
							//传入的参数  以及  它的格式
							data : $('#form').serialize(),
							success : function (rsData){ 
								if(rsData.code=="1"){
									alert(rsData.info);
									window.location.href = '${hrpath}/rec/findAllRec';
								}else if(rsData.code=="0"){
									alert(rsData.info);
									
								}
							} 
						}); 
			

		
		
	}
	
	
	
 	
	
	//自动填表
	$("#pname").change(function(){
		
		 var pname=$("#pname").val();
		//Ajax发送数据给后台 
		$.ajax({ 
			url :"${hrpath}/rec/findpname",
			type : "post", 
			datatype : "json", 
			data : "pname="+pname, 
			success : function (rsDate){ 
				$("#posno").val(rsDate.posno);
				$("#postype").val(rsDate.ptype);
			} 
		}); 
    });
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
$(function(){
		$("#resetButton").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			layer_close();
		});
		$("").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			window.parent.location.href="InfoDisplayServlet.do?method=displayAllInfo";  
			 layer_close(); 
		});
		
		/*关闭弹出框口*/
		function layer_close(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}  
	});
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form").validate({
		 rules:{
		   infoname:{
				required:true,
				minlength:2,
				maxlength:16
			},
		 	dsname:{
				required:true
			},
			rectype:{
				required:true
			},
			pname:{
				required:true
			},
			recnum:{
				required:true
			},
			recdesc:{
				required:true
			}, 
			uname:{
				required:true
			},
			rectime:{
				required:true
			},
			endtime:{
				required:true
			},
			requirement:{
				required:true
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid"
/* 		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		} */
	});
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
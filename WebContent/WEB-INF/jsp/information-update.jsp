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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hrpath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>修改档案- H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="" method="post" enctype="multipart/form-data"  class="form form-horizontal" id="form-member-add">
<!-- 错误提示 -->		
			<div id="error" style="color:  red;size: 20px;">
			${error }
			</div>
<!-- 部门-档案状态 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
				<label class="col-xs-3 col-sm-0" >
					<select class="select" size="1" name="deptno" style="width: 150px;height: 32px;">
						<option value="${info.deptno }">${info.dsname }</option>
					<c:forEach items="${finddept }" var="Finddept">
						<option  class="op" value="${Finddept.deptno }">${Finddept.dsname }</option>
					</c:forEach>
					</select>
				</label>
				
			<label style="width: 120px;" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>档案状态：</label>
				<label class="col-xs-3 col-sm-0" >
				<select class="select" size="1" name="infostatus" style="width: 150px;height: 32px;">
						<option value="${info.infostatus }">${info.infostatus }</option>
						<option  class="op" value="试用期">试用期</option>
						<option  class="op" value="正式员工">正式员工</option>
						<option class="op"  style="display: none;" value="离职">离职</option>
						<option  class="op" style="display: none;" value="已删除">已删除</option>
						<option  class="op" value="实习员工">实习员工</option>
				</select>
				</label>
		</div>
<!-- 职位 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span><a  href="javascript:open('index.html','','width=500,height=230,left=300,top=300,location=0,scrollbars=0,resizable=0')" class="tablelink">职位名称：</a></label>
				<label class="col-xs-3 col-sm-0">
					<select class="select" size="1" name="posno" style="width: 150px;height: 32px;">
						<option value="${info.posno }">${info.pname }</option>
					<c:forEach items="${findPtype }" var="FindPtype">
						<option  class="op" value="${FindPtype.posno }">${FindPtype.pname }</option>
					</c:forEach>
					</select>
				</label>
				<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class=""></span>住址：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text"  value="${info.address }" placeholder="" id="" name="address">
				</label>
		</div>
		<!-- 	<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>职位编码：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text"  name="email" id="">
				</label> -->
		</div>
<!-- 姓名性别 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
				<label class="formControls col-xs-3 col-sm-0">
				<input type="text"  style="width: 150px;height: 30px;" class="input-text" value="${info.infoname }" placeholder="" id="mobile" name="infoname">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>性别：</label>
				<label class="col-xs-3 col-sm-0">
						<input  class="input-sex" name="sex" type="radio" value="男" id="sex-1">
						<label for="sex-1">男</label>
						<input type="radio" id="sex-2" value="女" name="sex">
						<label  class="input-sex" for="sex-2">女</label>
				</label>
		</div>
<!-- email -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>Email：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;height: 30px;" placeholder="@" class="input-text" value="${info.email }" placeholder="" id="" name="email">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>联系电话：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.phone }" placeholder="" id="mobile" name="phone">
				</label>
		</div>

<!-- 身份证号 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;"  class="input-text" value="${info.idcard }" placeholder="" id="" name="idcard">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>户口地址：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.homeaddress }" placeholder="" id="" name="homeaddress">
			</label>
		</div>
<!-- 政治面貌学校 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>政治面貌：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" placeholder="" class="input-text" value="${info.politics }" placeholder="" id="" name="politics">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>毕业院校：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.school }" placeholder="" id="" name="school">
				</label>
		</div>
<!-- 专业学历 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" placeholder="" class="input-text" value="${info.professional }" placeholder="" id="" name="professional">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>学历：</label>
				<label class="col-xs-3 col-sm-0">
				<select class="select1" size="1" name="education" style="width: 150px;height: 32px;">
						<option value="${info.education }" >${info.education }</option>
						<option  class="op1" value="硕士">硕士</option>
						<option  class="op1" value="博士">博士</option>
						<option  class="op1" value="博士后">博士后</option>
					</select>
				</label>
		</div>
<!-- 薪酬标准 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪级标准：</label>
				<label class="col-xs-3 col-sm-0">
				<select class="select" size="1" name="ptno" style="width: 150px;height: 32px;">
						<option value="${info.ptno }" >${info.ptname }</option>
						<option  class="op"  value="" >定薪标准</option>
					<c:forEach items="${findPtitle }" var="FindPtitle">
						<option   class="op" value="${FindPtitle.ptno }">${FindPtitle.ptname }</option>
					</c:forEach>
				</select>
				</label>
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>开户行：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.bank }" placeholder="" id="" name="bank">
				</label>
		</div>
<!-- 卡号 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>社保卡号：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.hospital }" placeholder="" id="" name="hospital">
				</label>
			
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>银行卡号：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.bankno }" placeholder="" id="" name="bankno">
				</label>
		</div>
<!-- 登记人建档时间 -->
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>建档时间：</label>
				<label class="col-xs-3 col-sm-0">
					<input type="text" value="${info.infotime }" style="width: 150px;" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="" class="input-text Wdate" name="infotime" style="width:100px;">
			</label>
				
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>合同年限：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text"  style="width: 140px;" class="input-text" value="${info.invalidtime }" placeholder="5" id="" name="invalidtime">年
			</label> 
		</div>
<!--隐藏  -->
		<input name="infono" value="${info.infono }" style="display:none">
<!-- 简历 -->	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简历：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group" >
				<input disabled="disabled" class="input-text upload-url" style="width: 150px;" type="text" value="${info.infofile }" name="infofile" id="uploadfile" nullmsg="请添加附件！" style="width:200px;">
				<a  href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" id="uploadfile1" disabled="disabled" name="fileResume" class="input-file">
				</span> </div>
		
		</div>
<!-- 个人履历介绍-->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>履历：</label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<input style="width: 640px;" name="information" value="${info.information }" cols="" rows="" class="textarea" >
				</label>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" ><span class="c-red">审批备注(*)：</span></label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<input style="height:40px;;width: 640px;" name="inforemark" value="${info.inforemark }" cols="" rows="" class="">
				</label>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" >
			<span style="padding-left: 180px;">&nbsp;</span>
			<input style="width: 80px; display: none;" class="btn btn-primary radius" id="modify" type="button" value="修改">
			<input style="width: 80px; display: none;" class="btn btn-primary radius" id="change" type="button" value="员工变动">
			<a href="javascript:void(0)"  style="display: none;" class="btn btn-primary radius" id="savemodify">保存修改</a>
			<a href="javascript:void(0)" style="display: none;" class="btn btn-primary radius" id="savechange">保存变动</a>
			<a href="javascript:void(0)" style="display: none;" class="btn btn-primary radius" id="check">确认复核</a>
			<a href="javascript:void(0)" style="display: none;" class="btn btn-primary radius" id="back">驳回</a>
			<a href="javascript:void(0)" style="display: ;" class="btn btn-primary radius" id="resetButton">返回上页</a>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hrpath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.form.js"></script> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 

<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
/*保存修改  */
$(function(){
		$("#savemodify").click(function(){
			/* var list=$("#form-member-add").serialize(); */
			$("#form-member-add").ajaxSubmit({
				url:"${hrpath}/info/MyupdateInformation",
				type:"post",
				datatype:"json",
				data:{'flag':'update'},
				async:false,
				success:function(rsData){
			 			if(rsData.code == '1'){
			 				window.parent.location.reload();
			 				layer_close();
					}else{
						$("#error").val(rsData.info);
					} 
				}
			}) 
	
		});
		/*变更  */
		$("#savechange").click(function(){
			$("#form-member-add").ajaxSubmit({
				url:"${hrpath}/info/MychangeInformation",
				type:"post",
				datatype:"json",
				data:{'flag':'change'},
				success:function(rsData){
			 			if(rsData.code == '1'){
			 				window.parent.location.reload();
			 				layer_close();
						//window.parent.href ="InfoDisplayServlet.do?method=displayMyApproveinfo";
					}else{
						$("#error").val(rsData.info);
					} 
				}
			}) 
		});
		/*驳回  */
		$("#back").click(function(){
			var list=$("#form-member-add").serialize(); 
			var infono="${info.infono}";/*档案编号  */
			var checkstatus="${info.checkstatus}"/*审核状态  */
			
			$.ajax({
				url:"${hrpath}/info/backCheckInformation?flag=back&infono="+infono+"&checkstatus="+checkstatus,
				type:"post",
				datatype:"json",
				data:list,
				success:function(rsData){
			 		if(rsData.code == '1'){
			 				window.parent.location.reload();
			 				layer_close();
						//window.parent.href ="InfoDisplayServlet.do?method=displayMyApproveinfo";
					}else{
						$("#error").val(rsData.info);
					} 
				}
			}) 
		});
		/*复核--这时候就需要档案的当前审核状态了-修改（到） */
		$("#check").click(function(){
			var list=$("#form-member-add").serialize(); 
			var infono="${info.infono}";/*档案编号  */
			var checkstatus="${info.checkstatus}"/*审核状态  */
			$.ajax({
				url:"${hrpath}/info/backCheckInformation?flag=check&infono="+infono+"&checkstatus="+checkstatus,
				type:"post",
				datatype:"json",
				data:list,
				success:function(rsData){
			 			if(rsData.code == '1'){
			 				window.parent.location.reload();
			 				layer_close();
						//window.parent.href ="InfoDisplayServlet.do?method=displayMyApproveinfo";
					}
						// 关闭
			 			layer_close();
				}
			}) 
		});
		
		/*关闭弹出框口*/
		function layer_close(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}  
	});  

$(function(){
	$(".input-text,.textarea,.Wdate,.upload-url").attr("readonly",true);
	$(".op,.op1,input-sex").attr("disabled",true);
	var posno="${user.posno}"; 
	var sex="${info.sex}";
	var checkflag="${checkmine }";
	if (sex=="男") {
		$("#sex-1").attr("checked","checked");
	}else if(sex=="女"){
		$("#sex-1").attr("disabled",true);
		$("#sex-2").attr("checked","checked");
	}
	
	if(posno==4){ /*人事专员  */
		$("#modify").show();
		$("#change").show();
	}else if(posno==1||posno==200){/*、经理、总裁  */
		if(checkflag=="mine"){
			$("#back").show();
			$("#check").show();
		}
	}else if(posno==2){/* 主管 */
		if(checkflag=="mine"){
			$("#back").show();
			$("#check").show();
			$("#modify").show();
		}
			$("#change").show();/* 主管也可以变更 */
		
	}
	
	/*修改  */
	
	$("#modify").click(function(){
		$('.input-text,.textarea,.Wdate,.upload-url,.input-sex').attr('readonly',false);
		$(".input-sex").attr("disabled",false);
		$("#uploadfile").attr("disabled",false);
		$("#uploadfile1").attr("disabled",false);
		$(".op1").attr("disabled",false); 
		$("#savemodify").show();
		$("#modify").hide();
		$("#change").hide();
	});
	$("#change").click(function(){
		$(".op").attr("disabled",false); 
		$("#savechange").show();
		$("#change").hide();
		$("#modify").hide();
	});
	/*回撤  */
	$("#resetButton").click(function(){
		/* window.parent.location.reload(); */
		/* window.close(); */
		layer_close();
	});
	/*关闭弹出框口*/
	function layer_close(){
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}  
	});
$(function(){
/* 	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	}); */
	
	$("#form-member-add").validate({
		 rules:{
		   infoname:{
				required:true,
				minlength:2,
				maxlength:16
			},
		 	phone:{
				required:true,
				isMobile:true
			},
			email:{
				required:true,
				email:true
			},
			uploadfile:{
				required:true
			},
			deptno:{
				required:true
			},
			infostatus:{
				required:true
			},
			posno:{
				required:true
			}, 
			 infoname:{
				required:true
			},
			idcard:{
				required:true
			},
			homeaddress:{
				required:true
			},
			sex:{
				required:true
			},
			politics:{
				required:true
			},
			school:{
				required:true
			},
			professional:{
				required:true
			},
			education:{
				required:true
			},
			ptno:{
				required:true
			},    
			infotime:{
				required:true
			}  ,
			hospital:{
				required:true
			},
			bankno:{
				required:true
			}, 
			inforemark:{
				required:true
			}, 
			userno:{
				required:true
			}, 
			invalidtime:{
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
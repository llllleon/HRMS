<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<c:set var="hrpath" value="${pageContext.request.contextPath}"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	
	<form action="${hrpath}/info/addInfo" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-member-add">
<!-- 错误提示 -->		
			<div style="color: red;">
			${error }
			
			</div>
<!-- 部门-档案状态 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
				<label class="col-xs-3 col-sm-0" >
					<select class="select" size="1" name="deptno" style="width: 150px;height: 32px;">
						<option value="">请选择部门</option>
					<c:forEach items="${finddept }" var="Finddept">
						<option value="${Finddept.deptno }">${Finddept.dsname }</option>
					</c:forEach>
					</select>
				</label>
				
			<label style="width: 120px;" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>档案状态：</label>
				<label class="col-xs-3 col-sm-0" >
				<select class="select" size="1" name="infostatus" style="width: 150px;height: 32px;">
						<option value="">请选择</option>
						<option value="试用期">试用期</option>
						<option value="正式员工">正式员工</option>
						<option style="display: none;" value="离职">离职</option>
						<option style="display: none;" value="已删除">已删除</option>
						<option value="实习员工">实习员工</option>
				</select>
				</label>
		</div>
<!-- 职位 -->		
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span><a  href="javascript:open('index.html','','width=500,height=230,left=300,top=300,location=0,scrollbars=0,resizable=0')" class="tablelink">职位名称：</a></label>
				<label class="col-xs-3 col-sm-0">
					<select class="select" size="1" name="posno" style="width: 150px;height: 32px;">
						<option value="">请选择职位</option>
					<c:forEach items="${findPtype }" var="FindPtype">
						<option value="${FindPtype.posno }">${FindPtype.pname }</option>
					</c:forEach>
					</select>
				</label>
				<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class=""></span>住址：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" class="input-text" value="${info.address }" placeholder="" id="" name="address">
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
	
						<input name="sex" type="radio" value="男" id="sex-1">
						<label for="sex-1">男</label>
						<input type="radio" id="sex-2" value="女" name="sex">
						<label for="sex-2">女</label>
				</label>
		</div>
<!-- email -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>Email：</label>
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
				<select class="select" size="1" name="education" style="width: 150px;height: 32px;">
						<option value="" >请选择学历</option>
						<option value="硕士">硕士</option>
						<option value="博士">博士</option>
						<option value="博士后">博士后</option>
					</select>
				</label>
		</div>
<!-- 薪酬标准 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪级标准：</label>
				<label class="col-xs-3 col-sm-0">
				<select class="select" size="1" name="ptno" style="width: 150px;height: 32px;">
						<option value="" >定薪标准</option>
						<c:forEach items="${findPtitle }" var="FindPtitle">
						<option value="${FindPtitle.ptno }">${FindPtitle.ptname }</option>
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
				<input type="text" readonly="readonly"  style="width: 150px;" class="input-text" value="${infotime }" placeholder="" id="infotime" name="infotime">
				</label>
				
			<label style="width: 120px;" class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>合同年限：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text"  style="width: 140px;" class="input-text" value="${info.invalidtime }" placeholder="5" id="" name="invalidtime">年
			</label> 
		</div>
<!-- 简历 -->	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span></span>简历：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" style="width: 150px;" type="text" value="${info.infofile }" name="infofile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" name="fileResume" class="input-file">
				</span> </div>
		</div>
<!-- 登记人 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
				<label class="col-xs-3 col-sm-0">
				<input type="text" style="width: 150px;" readonly="readonly" class="input-text" value="${user.uname }" placeholder="" id="uname" name="uname">
				</label>
		</div>
	
		
<!-- 个人履历介绍-->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>履历：</label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<textarea style="height: 40px;" name="information" value="${info.information }" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)"></textarea>
				</label>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>备注：</label>
				<label class="col-xs-3 col-sm-0" style="width: 48%;" >
				<textarea style="height: 40px;" name="inforemark" value="${info.inforemark }" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)"></textarea>
				</label>
		</div>
<!--照片  -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span></span>照片：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" style="width: 300px;" type="text" value="${info.photo }" name="photo" id="uploadfile" readonly nullmsg="">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 加载照片</a>
				<input type="file" name="filePhoto" class="input-file">
				</span>
				<a href="javascript:void();" class="btn btn-primary radius" id="checkPhoto">预览校核</a>
			 	<input style="width: 280px;border: none;" type="text" value="请上传2寸且小于200KB的照片" readonly>
			 </div>
		</div>
<!--照片展示区  -->
		<div class="row cl" id="divPhoto" style=" display:none;">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>照片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<img src="" style="margin-left:15px;width: 150px;height: 150px;" id="img1">
				<input type="text" style="left:50px;color:red;width: 250px;  display:none;"  class="input-text" value="123" placeholder="" id="photoError" name="">
			</div>
		</div>
<!--提交  -->	
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" >
			<span style="padding-left: 180px;">&nbsp;</span>
				<input style="width: 80px;" class="btn btn-primary radius" id="submitButton" type="submit" value="提交保存">
				<input style="width: 80px;" class="btn btn-primary radius"  id="resetButton" type="button" value="撤销">
			</div>
		</div>
	</form>
	
	
	
<%-- 
	<form action="${hrpath}/info/addInfo" id="pageForm" method="post" enctype="multipart/form-data">
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span></span>照片：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" style="width: 150px;" type="text" value="${info.photo }" name="photo1" id="photo1" readonly nullmsg="" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 加载照片</a>
				<input type="file" name="filePhoto" class="input-file">
				</span> </div>
				<input style="width: 80px;" class="btn btn-primary radius" id="submitButton" type="submit" value="提交保存">
				<a href="javascript:void();" class="btn btn-primary radius" id="checkPhoto">预览</a>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>照片：</label>
				<img src="" style="width: 200px;" id="img1">
				<input type="text" style=" color:red;width: 250px; display:none;" class="input-text" value="123" placeholder="" id="photoError" name="">
		</div>

	</form> --%>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.form.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 

<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
/*照片复核  */
$(function(){
	 	$("#checkPhoto").click(function(){
	 		var path = "${hrpath}/img/";
			$("#form-member-add").ajaxSubmit({
				url:"${hrpath}/info/displayPhoto",
				type:"post",
				datatype:"json",
				success:function(rsData){
					$("#divPhoto").css("display","block");
					if (rsData.code=="1") {
				 		var path1=path+rsData.info;
				 		$("#img1").attr('src',path1); 
				 		$("#photoError").hide();
					} else {
						$("#photoError").css("display","block");
						$("#photoError").attr("value",rsData.info); 
					}
				}
			}) 
	
		});
});   

$(function(){
		$("#resetButton").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			layer_close();
		});
		$("submitButton").click(function(){
			/* window.parent.location.reload(); */
			/* window.close(); */
			window.parent.location.href="${hrpath }/info/findAllInfo";  
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
	
	$("#form-member-add").validate({
		 rules:{
		   infoname:{
				required:true,
				minlength:2,
				maxlength:16
			},
		 	phone:{
				required:true
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
			userno:{
				required:true
			}, 
			photo:{
				required:true
			}, 
			infofile:{
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
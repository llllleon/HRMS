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
    <title>人力资源后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="${hrpath}/styles.css">
	-->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
	<title>登录界面</title>
    <link href="${hrpath}/css/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="${hrpath}/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${hrpath}/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${hrpath}/css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class='login'>
	  <div class='login_title'>
	    <span>管理员 / 员工登录</span>
	  </div>
		  <form action="" mehtod="post" id="formid">
			  <div class='login_fields'>
			    <div class='login_fields__user'>
			      <div class='icon'>
			        <img alt="" src='${hrpath}/img/user_icon_copy.png'>
			      </div>
			      <input name="uname" placeholder='用户名' maxlength="16" type='text' autocomplete="on" value="${uname }"/>
			        <div class='validation'>
			          <img alt="" src='${hrpath}/img/tick.png'>
			        </div>
			    </div>
			    <div class='login_fields__password'>
			      <div class='icon'>
			        <img alt="" src='${hrpath }/img/lock_icon_copy.png'>
			      </div>
			      <input name="pwd" placeholder='密码' maxlength="16" type='text' value="${pwd }" autocomplete="off" id="pwd" />
			      <div class='validation'>
			        <img alt="" src='${hrpath}/img/tick.png'>
			      </div>
			    </div>
			    <div class='login_fields__password'>
			      <div class='icon'>
			        <img alt="" src='${hrpath}/img/key.png'>
			      </div>
			      <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
			      <div class='validation' style="opacity: 1; right: -90px;top: -3px;">
		          		<canvas class="J_codeimg" id="myCanvas" onclick="Code();">
		          		对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
			      </div>
			      <div class='validation' style="opacity: 1; right: -70px;top: 30px;">
		          		<span style="font-size: 10px; color: blank" onclick="Code();"><br/>不清楚？换一张</span>
			      </div>
			    </div>
			    <div class='login_fields__submit'>
			      <input type='button' id="btnid" value='登录'>
			    </div>
			  </div>
		  </form>
	  <div class='success'>
	  </div>
	   <!--照片  -->
		  <input type="text" id="info" name="info" value="" style="display: none;">
	  <div class='disclaimer'>
	    <p>欢迎登陆人力资源后台管理系统</p>
	  </div>
	</div>
	<div class='authent'>
	  <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
        </div>
	  <p>认证中...</p>
	</div>
	<div class="OverWindows"></div>
    <link href="${hrpath}/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="${hrpath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src='${hrpath}/js/stopExecutionOnTimeout.js?t=1'></script>
    <script src="${hrpath}/layui/layui.js" type="text/javascript"></script>
    <script src="${hrpath}/js/Particleground.js" type="text/javascript"></script>
    <script src="${hrpath}/js/Treatment.js" type="text/javascript"></script>
    <script src="${hrpath}/js/jquery.mockjax.js" type="text/javascript"></script>
		
		
	<script type="text/javascript">
	
	 function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}else{
				showCheck(createCode(""));
			}
	    }
		var canGetCookie = 1;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//登陆
        var JsonData = {};
		var url = "";
		
		var CodeVal = 0;
	    Code();
	   
	    // 验证码获得
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="pwd"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="login"],input[name="pwd"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
	    var flag=false;
	    var open = 0;
	    layui.use('layer', function () {
			var msgalert = '&nbsp;&nbsp;欢迎进入<br/>&emsp;尚学堂人力资源管理中心';
    		var index = layer.alert(msgalert, { icon: 6, time: 2500, offset: 't', closeBtn: 0, title: '你是最靓的仔', btn: [], anim: 2, shade: 0 });  
			layer.style(index, {
				color: 'blue',
				background:'#fff'
			}); 
	        //非空验证
	        $('input[type="button"]').bind("click",function () {
	            var login = $('input[name="login"]').val();
	            var pwd = $('input[name="pwd"]').val();
	            var code = $('input[name="code"]').val();
	            if (login == '') {
	                ErroAlert('请输入您的账号');
	            } else if (pwd == '') {
	                ErroAlert('请输入密码');
	            } else if (code == '' || code.length != 4) {
	                ErroAlert('输入验证码');
	            } else {
	                //认证中..
	               /*  fullscreen(); *///全屏效果
	                $('.login').addClass('test'); //倾斜特效
	                setTimeout(function () {
	                    $('.login').addClass('testtwo'); //平移特效
	                }, 300);
	                setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	                JsonData = {code: code };
					if(JsonData.code.toUpperCase() == CodeVal.toUpperCase()){
						$.ajax({
							sync:false,
							url:"${hrpath}/log/loginVvalidte",
							type:"post",
							data:$("#formid").serialize(),
							dataType:"json",
							success:function(rsData){
								console.log(rsData.info);
								if(rsData.info != ""){
									$("#info").val(rsData.info);
									flag=true;
								}
								if(rsData.code==1){
									url = "Ajax/Login";
								}else{
									url = "Ajax/LoginFalse";
								}
								AjaxP(url);
								setTimeout(Code(),1000);
							},
							error:function(){url = "Ajax/False";AjaxP(url);Code();}// 重置验证码
						});
					} else{
						url = "Ajax/CodeFalse";
						AjaxP(url);
						setTimeout(Code(),1000);
					}
	            }// else结束
	        })// click结束
	    })// layer结束
	    
	 // 开始特效的ajax内部方法
		function AjaxP(url){
            AjaxPost(url, JsonData,
                            function () {
            					//ajax加载中
			                	
                            },
                            function (data) {
                                //ajax返回 
                                //认证完成
                                setTimeout(function () {
                                    $('.authent').show().animate({ right: 90 }, {
                                        easing: 'easeOutQuint',
                                        duration: 600,
                                        queue: false
                                    });
                                    $('.authent').animate({ opacity: 0 }, {
                                        duration: 200,
                                        queue: false
                                    }).addClass('visible');
                                    $('.login').removeClass('testtwo'); //平移特效
                                }, 1700);
                                setTimeout(function () {
                                    $('.authent').hide();
                                    $('.login').removeClass('test');
                                    if (data.Status == 'ok') {
                                        //登录成功
                                        $('.login div').fadeOut(100);
                                        $('.success').fadeIn(1000);
                                        $('.success').html(data.Text);
                                        var path=$("#info").val();
                                        var path1='${hrpath}/img/'+path;
                                        $("#img1").attr('src',path1);
                                        if(!flag){
                                        	$("#img1").hide();
                                        }
										//跳转操作
										setTimeout(function(){
											window.location.href="${hrpath}/log/loginIn";
										},2000);
                                    } else {
                                        AjaxErro(data);
                                    }
                                }, 2100);
           })// ajaxPost结束
		}//AjaxP结束
	    
	    var fullscreen = function () {
	        elem = document.body;
	        if (elem.webkitRequestFullScreen) {
	            elem.webkitRequestFullScreen();
	        } else if (elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.requestFullScreen) {
	            elem.requestFullscreen();
	        } else {
	            //浏览器不支持全屏API或已被禁用  
	        }
	    }  
		if(ajaxmockjax == 1){
			$.mockjax({  
				url: 'Ajax/Login',  
				status: 200,  
				responseTime: 10,
				responseText: {"Status":"ok","Text":"登录成功<br /><br />正在跳转...<br /><br /><img src='' style='margin-left:15px;width: 150px;height: 150px;' id='img1'>"}  
			});
			$.mockjax({  
				url: 'Ajax/LoginFalse',  
				status: 200,  
				responseTime: 10,          
				responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
			});   
			$.mockjax({  
				url: 'Ajax/CodeFalse',  
				status: 200,  
				responseTime: 10,          
				responseText: {"Status":"Erro","Erro":"验证码的输入错误"}
			});   
			$.mockjax({  
				url: 'Ajax/False',  
				status: 200,  
				responseTime: 10,          
				responseText: {"Status":"Erro","Erro":"服务器去火星了"}
			});   
		}
		
		// 验证码定时刷新,30min
		setInterval(Code(),1000*60*30);
		//页面加载时，点击密码表单域
		$(function () {
			$('input[name="pwd"]').attr('type', 'password');
		})
    </script>
</body>
</html>
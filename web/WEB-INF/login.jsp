<%@ page import="cn.gjp0609.ams.utils.SecurityUtils" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.21
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<html lang="zh">
<head>
    <title>zpark教学互动系统主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/" value="/css/bootstrap.min.css"/>">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            font-family: "微软雅黑", monospace;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/" value="/css/bootstrap-responsive.min.css"/>">
    <link rel="shortcut icon" href="<s:url value="favicon.ico"/>">
</head>
<%
    String code = SecurityUtils.getRandomCode(4);
    session.setAttribute("code", code);
    System.out.println("code : " + code);
%>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#"><span style="color: orange">zpark教学互动系统</span></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li><a href="#">关于</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能菜单 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="divider"></li>
                            <li class="nav-header">其它功能</li>
                            <li><a href="#">注册</a></li>
                            <li><a href="#">离开</a></li>
                        </ul>
                    </li>
                    <li class="active"></li>
                    <li>
                        <form class="navbar-form pull-right" onsubmit="return checkAll()"
                              action="<s:url namespace="/user" action="userLogin"/>" method="post">

                            <select title="123" name="role" class="span3" id="sele"
                                    style="width: 80px; margin-left: 10px; border-radius:4px;">
                                <option value="stu" selected="selected">学生</option>
                                <option value="tea">教职工</option>
                            </select>
                            <input class="span2" type="text" name="user.name" placeholder="请输入用户名"
                                   id="username" style="height: 30px;width:100px">
                            <input class="span2" type="password" name="user.password" placeholder="请输入登录密码"
                                   id="password" style="height: 30px;width:120px">
                            <input class="span2" type="text" name="vcode"
                                   placeholder="请输入验证码"
                                   id="vcode" style="height: 30px;width:100px">
                            <a href="">
                                <img id="codeImg" src="<s:url namespace="/"
                                            action="getVCode"/>?name=userLogin&code=<s:property
                                            value="#session.code"/>"/>
                            </a>
                            <input type="submit" class="btn btn-success" value="登录">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="hero-unit">
        <title>滚动公告</title>
        <div align=center><p style="font-family:'黑体','monospace'"><strong>百知学院公告栏</strong></p></div>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
            <tr>
                <th>
                    <marquee direction=up height=160px width=100% id=m onmouseout=m.start() onMouseOver=m.stop()
                             scrollamount=2 align="center">
                        <h3>Welcome !</h3>
                        <p>欢迎使用zpark教学互动系统，本系统将采用流行的开源框架技术：Mybatis, Strust2, JSP 构建，具有良好的可扩展性和可维护性...</p><br>
                        <p>[7-16]热烈庆祝百知学院65班开班</p>
                        <p>[7-16]热烈庆祝百知学院64班开班</p>
                        <p>[7-16]热烈庆祝百知学院63班开班</p>
                        <p>[7-16]热烈庆祝百知学院62班开班</p>
                        <p>[7-16]热烈庆祝百知学院61班开班 </p>
                    </marquee>
                </th>
            </tr>
        </table>
        <br>
        <p><a href="<s:url namespace="/" action="register.action"/>" class="btn btn-primary btn-large">请您注册体验
            &raquo;</a></p>
    </div>
    <hr>
    <div class="alert alert-error" id="fail">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>错误! </strong> <span>错误提示信息</span>
    </div>
    <div class="alert alert-success" id="success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>消息! </strong> <span>保存成功</span>
    </div>
    <footer>
        <p>&copy; Company 2016</p>
    </footer>

</div> <!-- /container -->
<script type="text/javascript" src="<s:url value="/js/jquery-1.5.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/bootstrap.js"/>"></script>


<script>
    code = "<s:property value="#session.code"/>";
    failS = $("#fail");
    successS = $("#success");
    failMsg = failS.find("span");
    succMsg = successS.find("span");

    $("#abc").bind("click", function () {
        var abc = open("www.baidu.com");
        abc.close();
    });

    // onload
    $(function () {
        failS.hide();
        successS.hide();
    });

    un = $("#username");
    pw = $("#password");
    vc = $("#vcode");

    function checkUsername() {

        if (un.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("请输入用户名");
            failS.fadeIn();
            return false;
        } else return true;
    }

    var checkPassword = function () {
        if (pw.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("请输入密码");
            failS.fadeIn();
        } else return true;
        return false;
    };
    var checkVCode = function () {
        if (vc.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("请输入验证码");
            failS.fadeIn();
        } else if (!(vc.get(0).value.toLowerCase() === code.toLowerCase())) {
            failS.fadeOut();
            failMsg.html("验证码不正确 " + code);
            failS.fadeIn();
        } else return true;
        return false;
    };

    un.blur(checkUsername);
    pw.blur(checkPassword);
    vc.blur(checkVCode);

    function checkAll() {
        if (!checkUsername()) return false;
        else if (!checkPassword()) return false;
        else return checkVCode();
    }

    // 点击更新验证码
    $("#codeImg").click(function () {
        this.src = "<s:url namespace="/" action="getVCode"/>?name=userLogin&code=<s:property value="#session.code"/>";
    });

</script>
</body>
</html>

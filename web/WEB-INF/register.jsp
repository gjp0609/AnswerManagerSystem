<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.21
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <title>zpark教学互动系统主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/"  value="/css/bootstrap.min.css"/>">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            font-family: "微软雅黑", "monospace";
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-responsive.min.css"/>">
    <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#"><font color="Orange">zpark教学互动系统</font></a>
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
                            <li><a href="#">离开</a></li>
                        </ul>
                    </li>
                    <li class="active"></li>
                    <li>

                        <form class="navbar-form pull-right" onsubmit="return checkAll()"
                              action="<s:url namespace="/user" action="register" />" method="post">
                            <select class="span3" id="sele" name="user.role"
                                    style="width: 80px; margin-left: 10px; border-radius:4px;">
                                <option value="student" selected="selected">学生</option>
                                <option value="teacher">教职工</option>
                            </select>
                            <input class="span2" type="text" name="user.name" placeholder="请输入注册用户名"
                                   maxlength="15" id="username" style="height: 30px;width:125px">
                            <input class="span2" type="text" name="user.realName" placeholder="请输入真实姓名"
                                   id="realname" style="height: 30px;width:115px">
                            <input class="span2" type="password" name="user.password" placeholder="请输入注册密码"
                                   id="password" style="height: 30px;width:110px">
                            <select class="span2" id="college" name="user.college.id"
                                    style="width: 120px; margin-left: 10px; border-radius:4px;">
                                <option value="0" selected="selected">请选择学院</option>
                                <option value="20">计算机学院</option>
                                <option value="10">软件学院</option>
                                <option value="30">历史学院</option>
                            </select>
                            <input type="submit" class="btn btn-info" value="注册">
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
                        <p>[7-16]热烈庆祝百知学院61班开班</p>
                    </marquee>
                </th>
            </tr>
        </table>
        <br>
        <p><a href="<s:url namespace="/" action="login.action"/>" class="btn btn-primary btn-large">立即登陆
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

<script type="text/javascript" src="<s:url value="/js/jquery-1.5.2.min.js" />"></script>
<script type="text/javascript" src="<s:url value="/js/bootstrap.js" />"></script>

<script>
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
    rn = $("#realname");
    cl = $("#college");

    function checkUsername() {
        failS.fadeOut();
        if (un.get(0).value.length < 1) {
            failMsg.html("请输入注册用户名");
        } else if (un.get(0).value.length < 6) {
            failMsg.html("用户名长度至少为6位");
        } else if (!/^[a-zA-Z][a-zA-Z0-9]{5,15}$/.test(un.get(0).value)) {
            failMsg.html("用户名只支持字母和数字且以字母开头");
        } else {
            return true;
        }
        failS.fadeIn();
        return false;
    }

    var checkRealName = function () {
        if (rn.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("请输入真实姓名");
            failS.fadeIn();
        } else return true;
        return false;
    };

    var checkPassword = function () {
        if (pw.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("请输入密码");
            failS.fadeIn();
            return false;
        } else if (pw.get(0).value.length < 6) {
            failS.fadeOut();
            failMsg.html("密码长度不足6位");
            failS.fadeIn();
            return false;
        } else {
            failS.fadeOut();
            return true;
        }
    };


    var checkCollege = function () {
        if (cl.get(0).value === "0") {
            failS.fadeOut();
            failMsg.html("请选择学院");
            failS.fadeIn();
        } else return true;
        return false;
    };
    un.blur(checkUsername);
    rn.blur(checkRealName);
    pw.blur(checkPassword);
    cl.blur(checkCollege);

    function checkAll() {
        if (!checkUsername()) return false;
        else if (!checkPassword()) return false;
        else if (!checkRealName()) return false;
        else return checkCollege();
    }
</script>
</body>
</html>

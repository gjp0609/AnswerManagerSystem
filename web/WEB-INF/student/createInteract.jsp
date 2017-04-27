<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.21
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>创建互动</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/" value="/css/bootstrap.min.css"/>">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            font-family: "微软雅黑", "monospace";
        }
    </style>
    <script type="text/javascript" src="<s:url value="/js/jquery-1.5.2.min.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/js/bootstrap.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/" value="/css/bootstrap-responsive.min.css"/>">
    <link rel="shortcut icon" href="<s:url value="../favicon.ico"/>">

</head>

<body>

<hr/>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="<s:url namespace="/" action="login"/>"><span style="color:orange">zpark教学互动系统</span></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="#" style="color: white;">欢迎：<s:property value="#session.user.realName"/></a></li>
                    <li><a href="#">关于</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能菜单 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="divider"></li>
                            <li class="nav-header">其它功能</li>
                            <li><a href="#">修改密码</a></li>
                            <li><a href="#">离开</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container" style="width: 800px;">
    <h3>创建互动</h3>
    <form class="form-horizontal form-actions" action="<s:url namespace="/user" action="createInteract"/>"
          method="post" onsubmit="return checkAll()">
        <div style="font-size: 18px">请填写互动标题：</div>
        <div class="control-group">
            <textarea id="title" name="interact.title" title="请填写互动标题" rows="3"
            style="width:98% ;resize:none; height: 20px"></textarea>
        </div>

        <div class="control-group">
            <div style="font-size: 18px;">请填写互动详情：</div>
            <textarea title="请填写互动详情" id="textarea" name="interact.details" style="width:99%; height:150px;"></textarea>

        </div>

        <input type="hidden" name="interact.student.id" value="<s:property value="#session.user.id"/>"/>
        <input type="hidden" name="interact.teacher.id" value="<s:property value="#parameters.teacherId"/>"/>

        <input type="submit" class="btn" value="提交" style="margin-left: 65%; width:12%; margin-right: 5% "/>
        <input type="reset" class="btn" value="重置" style="width:12%"/>
    </form>

    <div class="alert alert-error" id="error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>错误! </strong><span id="erroSpan"> 错误信息提示</span>
    </div>

    <div class="alert alert-success" id="success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>消息! </strong> 保存成功
    </div>
    <hr>
    <footer>
        <p>&copy; Company 2016</p>
    </footer>

</div>
<script>
    failS = $("#error");
    successS = $("#success");
    failMsg = failS.find("span");
    succMsg = successS.find("span");
    // onload
    $(function () {
        failS.hide();
        successS.hide();
    });

    var checkTitle = function () {
        var title = $("#title");
        if (title.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("你还没写标题呢");
            failS.fadeIn();
            return false;
        } else {
            return true;
        }
    };

    var checkDetail = function () {
        var textarea = $("#textarea");
        if (textarea.get(0).value.length < 1) {
            failS.fadeOut();
            failMsg.html("详细描述一下问题才能得到想要的答案");
            failS.fadeIn();
            return false;
        } else {
            return true;
        }
    };

    var checkAll = function () {
        if (!checkTitle()) return false;
        return checkDetail();
    }
</script>
<s:debug/>
</body>
</html>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.24
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<meta name="content-type" content="text/html; charset=GBK">

<head>
    <title>我的全部互动</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.min.css"/>">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            font-family: "微软雅黑", "monospace";
        }

        #null {
            height: 200px;
            font-size: 20px;
            color: gray;
            text-align: center;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-responsive.min.css"/>">
    <link rel="shortcut icon" href="../favicon.ico">
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
            <a class="brand" href="<s:url namespace="/" action="login"/>">
                <span style="color:orange">zpark教学互动系统</span></a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="#">欢迎：xxx</a></li>
                    <li><a href="#">关于</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能菜单
                            <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<s:url namespace="/user" action="fuzzySelect"/>">创建互动</a></li>
                            <li class="divider">ro</li>
                            <li class="nav-header">其它功能</li>
                            <li><a href="#">离开</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <form action="<s:url namespace="/user" action="fuzzySelectInteract"/>" method="post" id="queryForm">

        <div class="input-append" style="padding-left:40px">
            <select title="" name="statusType" class="span3" id="sel"
                    style="width: 150px; margin-left: 10px; border-radius:4px;">
                <option value="-1" selected="selected">未回复</option>
                <option value="2">已回复</option>
            </select>
            <select title="" name="type" class="span3" id="sele"
                    style="width: 150px;margin-left: 10px; border-radius:4px;">
                <option value="-1" selected="selected">院系名称</option>
                <option value="2">教师姓名</option>
            </select>

            <input value="" class="span2" type="text" placeholder="请输入搜素信息" name="name"
                   style="width: 250px; height: 30px;margin-left: 10px; border-radius:4px;">&nbsp;
            <button class="btn" type="submit" style="margin-left: 10px; border-radius:10px;">搜索</button>
        </div>
    </form>

    <table class="table table-hover" style="height: 250px;">
        <thead>

        <tr>
            <th style="text-align: center;">
                <a href="javascript:void(0)" style="text-decoration: none; text-align: center">互动标题</a>
            </th>
            <th style="text-align: center;">
                <a href="javascript:void(0)" style="text-decoration: none;">教师名称</a></th>
            <th style="text-align: center;">
                <a href="javascript:void(0)" style="text-decoration: none;">学生名称</a></th>
            <th style="text-align: center;">
                <a href="javascript:void(0)" style="text-decoration: none;">是否回复</a></th>
            <!-- <th style="text-align: center;"><a href="javascript:void(0)"  style="text-decoration: none;">是否被举报</a></th> -->
            <th style="text-align: center;"><a href="javascript:void(0)" style="text-decoration: none;">操作</a></th>

        </tr>

        </thead>

        <!-- 展示数据 -->
        <tbody id="tbody">
        <tr style="display: none;">
            <th colspan="8">
                <div id="null">
                    <div style="margin-top: 50px">
                        亲～没有找到符合条件的互动～
                    </div>
                    <div style="font-size: 15px; margin-top: 6px">
                        <a href="#" style="text-decoration: none; margin-left: 100px;">那我创建一条</a>
                    </div>
                </div>
            </th>
            <s:iterator var="interact" value="interactList">
        <tr style="height: 20px">
            <th style="text-align: center;"><s:property value="#interact.title"/></th>
            <th style="text-align: center;"><s:property value="#interact.teacher.realName"/></th>
            <th style="text-align: center;"><s:property value="#interact.student.realName"/></th>
            <th style="text-align: center;"><s:property value="#interact.status"/></th>
            <th style="text-align: center; ">
                <a href="<s:url namespace='/user' action='interactDetails'/>?interactId=<s:property value="#interact.id"/>"
                   style="text-decoration: none;" class="btn btn-info">查看详情</a>
                &nbsp;&nbsp;&nbsp;
                <a href="<s:url namespace='/user' action='deleteInteract'/>?interactId=<s:property value="#interact.id"/>"
                   style="text-decoration: none;" class="btn btn-danger">删除</a>
            </th>
        </tr>
        </s:iterator>

        <%-- 确保结果太少时其他行高不变 --%>
        <tr style="height: auto"></tr>
        </tbody>
    </table>

    <div class="row">
        <div class="pagination" style="text-align: center;">
            <ul>
                <li class="disabled"><a href="javascript:void(0)">上一页</a></li>
                <li><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a></li>
                <li><a href="javascript:void(0)">下一页</a></li>
            </ul>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; Company 2016</p>
    </footer>

</div> <!-- /container -->
<script type="text/javascript" src="<s:url value="/js/jquery-1.5.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/bootstrap.js"/>"></script>
<s:debug/>
</body>
</html>

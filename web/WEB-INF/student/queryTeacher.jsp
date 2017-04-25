<%@ page import="java.util.List" %>
<%@ page import="cn.gjp0609.ams.entity.User" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.23
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <title>查询教师</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url namespace="/" value="/css/bootstrap.min.css"/>">
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
            <a class="brand" href="<s:url value="../login.jsp"/>"><span style="color:orange">zpark教学互动系统</span></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="#">欢迎：<s:property value="#session.user.realName"/></a></li>
                    <li><a href="#">关于</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能菜单 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">创建互动</a></li>
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
    <form action="<s:url namespace="/user" action="fuzzySelect"/>" method="post" id="queryForm">
        <div class="input-append" style="padding-left:40px">
            <select name="type" title="" class="span3" id="sele"
                    style="width: 150px;margin-left: 10px; border-radius:4px;">
                <option value="-1">院系名称</option>
                <option value="2">教师姓名</option>
            </select>

            <input value="" class="span2" type="text" placeholder="请输入名称" name="name" id="name"
                   style="width: 250px; height: 30px;margin-left: 10px; border-radius:4px;">&nbsp;
            <button class="btn" type="submit" style="margin-left: 10px; border-radius:10px;">搜索</button>
        </div>
    </form>

    <table class="table table-hover" style="height: 250px;">
        <thead>
        <tr>
            <th style="text-align: center;"><a href="javascript:void(0)"
                                               style="text-decoration: none; text-align: center;">教师用户名</a></th>
            <th style="text-align: center;"><a href="javascript:void(0)" style="text-decoration: none;">教师姓名</a></th>
            <th style="text-align: center;"><a href="javascript:void(0)" style="text-decoration: none;">所属院系</a></th>
            <th style="text-align: center;"><a href="javascript:void(0)" style="text-decoration: none;">课程名称</a></th>
            <th style="text-align: center;"><a href="javascript:void(0)"
                                               style="text-decoration: none;">操作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </th>
        </tr>
        </thead>
        <tbody id="tbody">
        <tr style="display: none;" id="none">
            <th colspan="5">
                <div id="null">
                    <div style="margin-top: 150px">
                        亲～没有找到符合条件的联系人呦～
                    </div>
                    <div style="font-size: 15px; margin-top: 10px;margin-right: 100px">
                        <a href="#" style="text-decoration: none; margin-left: 100px;">那我添加一条</a>
                    </div>
                </div>
            </th>
        </tr>
        <s:iterator value="userList" var="user">
            <tr style="height: 30px;">
                <th style="text-align: center;"><s:property value="#user.name"/></th>
                <th style="text-align: center;"><s:property value="#user.realName"/></th>
                <th style="text-align: center;"><s:property value="#user.college.name"/></th>
                <th style="text-align: center;">
                    <s:iterator value="#user.subjects" var="sub" status="st">

                        <s:if test="#st.last"> <s:property value="#sub.name"/> </s:if>

                        <s:else> <s:property value="#sub.name"/>, </s:else>

                    </s:iterator></th>
                <th style="text-align: center;">
                    <a href="<s:url namespace="/" action="createInteractStu"/>?teacherId=<s:property value="#user.id"/>"
                       style="text-decoration: none;"
                       class="btn btn-primary">发起提问</a>
                    &nbsp;&nbsp;&nbsp;
                </th>
            </tr>
        </s:iterator>
        <tr style="height: auto"></tr>
        </tbody>
    </table>

    <div class="row">
        <div class="pagination" style="text-align: center;">
            <ul>
                <s:if test="page.hasPrePage">
                <li><a href="<s:url namespace='/user' action='fuzzySelect'>
                            <s:param name="page.pageIndex" value="page.pageIndex-1"/></s:url>&type=<s:property value="type"/>&name=<s:property value="name"/>">上一页</a></s:if>
                </li>
                <s:else>
                    <li class="disabled"><a href="javascript:void(0)">上一页</a></li>
                </s:else>
                <%--------------------------------------------%>
                <s:iterator value="new int[page.totalPages]" status="st">
                    <s:if test="#st.index+1 == page.pageIndex">
                        <li class="disabled"><a class="disabled" href="javascript:void(0)">
                            <s:property value="#st.index+1"/></a></li>
                    </s:if>
                    <s:else>
                        <li><a href="<s:url namespace='/user' action='queryAll'>
                            <%-- ?page.pageIndex=3 --%>
                             <s:param name="page.pageIndex" value="#st.index+1"/>
                        </s:url>">
                            <s:property value="#st.index+1"/></a></li>
                    </s:else>
                </s:iterator>
                <%-------------------------------------------%>
                <s:if test="page.hasNextPage">
                    <li><a href="<s:url namespace='/user' action='fuzzySelect'>
                            <s:param name="page.pageIndex" value="page.pageIndex+1"/>
                            </s:url>&type=<s:property value="type"/>&name=<s:property value="name"/>">下一页</a>
                    </li>
                </s:if>
                <s:else>
                    <li class="disabled"><a href="javascript:void(0)">下一页</a></li>
                </s:else>
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

<script>
    //    $("#sele")
    var type = "<s:property value="type"/>";
    var name = "<s:property value="name"/>";
    $("#name").get(0).value = name;
    $(function () {
        if (type === "2") {
            $("#sele").find("option:last-child").get(0).selected = "selected";
        } else {
            $("#sele").find("option:first-child").get(0).selected = "selected";
        }
    });


    $(function () {
        var userList = "<s:property value="userList"/>";
        if (userList === "[]") $("#none").show();
        else $("#none").hide();
    });

</script>
</body>
</html>


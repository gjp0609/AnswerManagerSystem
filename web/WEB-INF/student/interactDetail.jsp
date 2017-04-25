<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.24
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <style type="text/css">
        ul {
            list-style-type: none;
        }

        #star {
            position: relative;
            width: 600px;
            margin: 10px auto;
        }

        #star ul, #star span {
            float: left;
            display: inline;
            height: 20px;
            line-height: 19px;
        }

        #star ul {
            margin: 0 10px;
        }

        #pf li {
            float: left;
            height: 20px;
            width: 20px;
            text-indent: -9999px;
            background: url("../../img/star.png") 1px 20px;

        }

        #star li {
            float: left;
            width: 30px;
            cursor: pointer;
            text-indent: -9999px;
            background: url(<s:url value="/img/star.png"/>) no-repeat;
        }

        #star strong {
            color: #f60;
            padding-left: 10px;
        }

        #star li.on {
            background-position: 0 -28px;
        }

        #star p {
            position: absolute;
            top: 20px;
            width: 159px;
            height: 60px;
            display: none;
            background: url(<s:url value="/img/icon.gif"/>) no-repeat;
            padding: 7px 10px 0;
        }

        #star p em {
            color: #f60;
            display: block;
            font-style: normal;
        }
    </style>
    <title>互动详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.min.css"/>">
    <script type="text/javascript" src="<s:url value="/js/jquery-1.5.2.min.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/js/bootstrap.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-responsive.min.css"/>">
    <link rel="shortcut icon" href="<s:url value="../favicon.ico"/>">

    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            font-family: "微软雅黑", "monospace";
        }
    </style>
</head>

<body>
<hr/>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse"
                    data-target=".nav-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="brand" href="<s:url namespace="/user" action="fuzzySelectInteract"/>"><span style="color: orange">zpark教学互动系统</span></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="#" style="color: white;">欢迎：<s:property value="#session.user.realName"/></a></li>
                    <li><a href="#">关于</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li class="dropdown active"><a href="#"
                                                   class="dropdown-toggle" data-toggle="dropdown">功能菜单 <b
                            class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">创建互动</a></li>
                            <li class="nav-header">其它功能</li>
                            <li><a href="#">离开</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container" style="width: 800px">
    <h3>互动详情</h3>
    <form class="form-horizontal form-actions" action="#" method="post"
          id="for" onsubmit="">
        <table cellpadding="5px">
            <tr>
                <td>
                    <div style="font-size: 18px; margin-left: 100px; ">互动标题:</div>
                </td>
                <td>
                    <div style="font-size: 15px;  margin-left: 25px"><s:property value="interactList[0].title"/></div>
                </td>
            </tr>

            <tr>
                <td>
                    <div style="font-size: 18px; margin-left: 100px">创建时间:</div>
                </td>
                <td>
                    <div style="font-size: 15px; margin-left: 25px">
                        <s:date name="interactList[0].createDate" format="yyyy年MM月dd日"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="font-size: 18px; margin-left: 100px">教师名称:</div>
                </td>
                <td>
                    <div style="font-size: 15px;margin-left: 25px">
                        <s:property value="interactList[0].teacher.realName"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="font-size: 18px; margin-left: 100px">学生名称:</div>
                </td>
                <td>
                    <div style="font-size: 15px; margin-left: 25px">
                        <s:property value="interactList[0].student.realName"/></div>
                </td>
            </tr>
            <tr>
                <td style="width: 230px">
                    <div style="font-size: 18px; margin-left: 100px;">问题详情内容:</div>
                </td>
                <td>
                    <div style="font-size: 15px;margin-left: 25px" id="interactDe">
                        <strong><s:property value="interactList[0].details"/></strong>
                    </div>
                </td>
            </tr>


            <tr id="answ">
                <td style="width: 230px">
                    <div style="font-size: 18px; margin-left: 100px;">教师回复内容:</div>
                </td>
                <td>
                    <div id="answer" style="font-size: 15px; margin-left: 25px"><s:property
                            value="interactList[0].answer"/></div>
                </td>
            </tr>
            <tr id="answd">
                <td style="width: 230px">
                    <div style="font-size: 18px; margin-left: 100px;">教师回复时间:</div>
                </td>
                <td>
                    <div id="answerDate" style="font-size: 15px; margin-left: 25px">
                        <s:date name="interactList[0].answerDate" format="yyyy年MM月dd日"/></div>
                </td>
            </tr>

        </table>
    </form>
    <hr style="border-bottom-color: gray;">


    <div class="alert alert-error" id="error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong id="errTip">错误! </strong><span id="erroSpan">错误信息提示</span>
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

    $(function () {
        var ans = "<s:property value="interactList[0].answer"/>";
        if (ans === "") {
            $("#answ").hide();
            $("#answd").hide();
            $("#errTip").html("");
            failMsg.html("教师还没有回答这个问题");
            failS.fadeIn();
        }
    });

</script>
<s:debug/>
</body>
</html>


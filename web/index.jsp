<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.21
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String url = response.encodeRedirectURL(request.getContextPath() + "/common/login.action");
    response.sendRedirect(url);
%>
</body>
</html>

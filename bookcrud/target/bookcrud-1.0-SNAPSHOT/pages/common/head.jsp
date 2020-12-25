<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String basePath = request.getScheme()
            +"://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>

<!-- 写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">

<%--引入jQuery--%>
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<%--引入bootstrap样式--%>
<!-- Bootstrap -->
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
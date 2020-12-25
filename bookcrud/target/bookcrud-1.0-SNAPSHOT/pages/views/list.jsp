<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jayzou11223
  Date: 2020/12/22
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题--%>
<%--以/开始的相对路径，找资源，以服务器的路径为标准，（http://localhost:3306）；--%>

<%--静态包含base标签，css，jQuery文件--%>
<%@include file="/pages/common/head.jsp"%>
<html>
<head>
    <title>首页</title>
</head>
<body>
    <%--搭建显示页面--%>
    <div class="container ">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SMM-Books-CRUD</h1>
            </div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-md-8 col-md-offset-8">
               <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>

        </div>
        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <%--添加bootstrap表格属性--%>
                <table class="table table-hover">
                    <tr>
                        <th>名称</th>
                        <th>价格</th>
                        <th>作者</th>
                        <th>销量</th>
                        <th>库存</th>
                        <th >操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="books">
                        <tr>
                            <th>${books.name}</th>
                            <th>${books.price}</th>
                            <th>${books.author}</th>
                            <th>${books.sales}</th>
                            <th>${books.stock}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <%--添加小图标--%>
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    删除</button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录
            </div>

            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="books?pn=1">首页</a></li>
                        <%--判断是否有上一页--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="books?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num==pageInfo.pageNum}">
                                <%--使得当前页不能被选中--%>
                                <li class="active" ><a href="#">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num!=pageInfo.pageNum}">
                                <li><a href="books?pn=${page_num}">${page_num}</a></li>
                            </c:if>
                        </c:forEach>

                        <%--判断是否有下一页--%>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="books?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="books?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>

        </div>

    </div>

</body>
</html>

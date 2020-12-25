<%--
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

<!-- 商品新增Modal -->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">商品添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookName</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="bookName_add_input" placeholder="bookName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookPrice</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="bookPrice_add_input" placeholder="bookPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookAuthor</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" id="bookAuthor_add_input" placeholder="bookAuthor">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookSales</label>
                        <div class="col-sm-10">
                            <input type="text" name="sales" class="form-control" id="bookSales_add_input" placeholder="bookSales">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookStock</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock" class="form-control" id="bookStock_add_input" placeholder="bookStock">
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="book_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

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
            <button class="btn btn-primary" id="book_add_modal_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <%--添加bootstrap表格属性--%>
            <table class="table table-hover" id="books_table">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>价格</th>
                    <th>作者</th>
                    <th>销量</th>
                    <th>库存</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>

        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>

    </div>
</div>

    <script type="text/javascript">

        var totalRecord;

        $(function (){
            to_page(66);
        });

        function to_page(pn){
            $.ajax({
                url:"${basePath}books",
                data:"pn="+pn,
                type:"GET",
                success:function (result){
                    // console.log(result);
                    build_books_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        }

        function build_books_table(result){
            //清空table表格
            $("#books_table tbody").empty();
            var books = result.extend.pageInfo.list;
            $.each(books,function (index,item){
                var bookNameTd = $("<td></td>").append(item.name);
                var bookPriceTd = $("<td></td>").append(item.price);
                var bookAuthorTd = $("<td></td>").append(item.author);
                var bookSalesTd = $("<td></td>").append(item.sales);
                var bookStockTd = $("<td></td>").append(item.stock);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                                .append("编辑");

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-remove"))
                    .append("删除");

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(bookNameTd)
                .append(bookPriceTd)
                .append(bookAuthorTd)
                .append(bookSalesTd)
                .append(bookStockTd)
                .append(btnTd)
                .appendTo("#books_table tbody");


            });
        }

        function build_page_info(result){
            //清空分页文字信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+
                    result.extend.pageInfo.pages+"页，总"+
                    result.extend.pageInfo.total+"条记录");
            totalRecord = result.extend.pageInfo.total;


        }

        function build_page_nav(result){
            //清空分页条表格page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disable");
                prePageLi.addClass("disable");

            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function (){
                    to_page(1);
                });
                prePageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disable");
                lastPageLi.addClass("disable");
            }else{
                nextPageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function (){
                    to_page(result.extend.pageInfo.pages)
                });
            }

            //添加首页 和前一页
            ul.append(firstPageLi).append(prePageLi);
            //添加中间页码
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function (){
                    to_page(item);
                });
                ul.append(numLi);
            });

            //ul内添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");

        }

        //点击新增按钮弹出模态框
        $("#book_add_modal_btn").click(function (){
            //可以在这里发送ajax请求，查询一些信息，显示在模态框里。

            //弹出模态框
            $("#bookAddModal").modal({
                backdrop:"static"
            });

        });

        $("#book_save_btn").click(function (){
            //模态框中填写的表单数据提交到服务器进行保存

            //发送ajax请求保存员工
            $.ajax({
                url:"book",
                type: "POST",
                data:$("#bookAddModal form").serialize(),
                success:function (result){
                    alert(result.msg);
                    $("#bookAddModal").modal('hide');
                    //处理页数合理化失效？
                    to_page(totalRecord);
                }
            });
        });



    </script>

</body>
</html>

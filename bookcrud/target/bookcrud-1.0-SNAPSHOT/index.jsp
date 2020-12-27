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

<%--静态包含base 标签，css，jQuery文件--%>
<%@include file="/pages/common/head.jsp"%>



<html>
<head>
    <title>首页</title>
</head>
<body>

<!-- 商品编辑Modal -->
<div class="modal fade" id="bookUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >商品修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookName</label>
                        <div class="col-sm-10">
                            <P class="form-control-static" id="bookName_update_static"></P>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookPrice</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="bookPrice_update_input" placeholder="bookPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookAuthor</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" id="bookAuthor_update_input" placeholder="bookAuthor">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookSales</label>
                        <div class="col-sm-10">
                            <input type="text" name="sales" class="form-control" id="bookSales_update_input" placeholder="bookSales">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookStock</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock" class="form-control" id="bookStock_update_input" placeholder="bookStock">
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="book_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

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
                            <span class="help-block">111111</span>
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
            <button class="btn btn-danger"id="book_delete_all_btn">删除</button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <%--添加bootstrap表格属性--%>
            <table class="table table-hover" id="books_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
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

        var totalRecord,currentPage;

        $(function (){
            to_page(1);
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
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");

                var bookNameTd = $("<td></td>").append(item.name);
                var bookPriceTd = $("<td></td>").append(item.price);
                var bookAuthorTd = $("<td></td>").append(item.author);
                var bookSalesTd = $("<td></td>").append(item.sales);
                var bookStockTd = $("<td></td>").append(item.stock);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                                .append("编辑");
                //为编辑按钮添加一个自定义数据，来表示当前商品的id
                editBtn.attr("edit-id",item.id);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-remove"))
                    .append("删除");

                //为删除按钮添加一个自定义数据，来表示当前商品的id
                delBtn.attr("del-id",item.id);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(checkBoxTd)
                .append(bookNameTd)
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
            currentPage = result.extend.pageInfo.pageNum;

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


        //清空表单样式和内容
        function reset_form(ele){
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }


        //点击新增按钮弹出模态框
        $("#book_add_modal_btn").click(function (){
            //可以在这里发送ajax请求，查询一些信息，显示在模态框里。
            reset_form("#bookAddModal form");
            //弹出模态框
            $("#bookAddModal").modal({
                backdrop:"static"
            });

        });


        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验商品名称是否可用
        $("#bookName_add_input").change(function (){
            //发送ajax请求校验商品名称是否可用
            var bookName = this.value;
            $.ajax({
                url:"checkBookName",
                data:"bookName="+bookName,
                type:"POST",
                success:function (result){
                    if(result.code == 100){
                        show_validate_msg("#bookName_add_input","success","商品名称可用");
                        $("#book_save_btn").attr("ajax-va","success");
                    }else {
                        show_validate_msg("#bookName_add_input","error",result.extend.va_msg);
                        $("#book_save_btn").attr("ajax-va","error");
                    }

                }
            });
        });




        //保存新增商品
        $("#book_save_btn").click(function (){
            //模态框中填写的表单数据提交到服务器进行保存

            //验证商品名称是否重复
            if($(this).attr("ajax-va")=="error"){
                return  false;
            }
            //发送ajax请求保存员工
            $.ajax({
                url:"book",
                type: "POST",
                data:$("#bookAddModal form").serialize(),
                success:function (result){
                    //alert(result.msg);
                    $("#bookAddModal").modal('hide');
                    //处理页数合理化失效？
                    to_page(totalRecord);
                }
            });
        });



        //修改商品信息
        //我们是在按钮创建之前想去用click绑定按钮，但是绑定不了
        //如果想在创建按钮的时候绑定，使用.live()
        //jQuery新版没有了live，使用on替代。
        $(document).on("click",".edit_btn",function (){
            //查出商品信息，显示信息在页面上
            getBook($(this).attr("edit-id"));
            //把商品的id传递给模态框的更新按钮,
            // 将需要更新的id传给后端，url上添加。
            $("#book_update_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#bookUpdateModal").modal({
                backdrop: "static"
            });

        });

        function getBook(id){
            $.ajax({
                url:"book/"+id,
                type:"GET",
                success:function (result){
                    var bookData = result.extend.books;
                    $("#bookName_update_static").text(bookData.name);
                    $("#bookPrice_update_input").text(bookData.price);
                    $("#bookAuthor_update_input").text(bookData.author);
                    $("#bookSales_update_input").text(bookData.sales);
                    $("#bookStock_update_input").text(bookData.stock);
                }
            });

        }


        $("#book_update_btn").click(function (){

            $.ajax({
                url:"book/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#bookUpdateModal form").serialize(),
                success:function (result){
                    //关闭对话框
                    $("#bookUpdateModal").modal("hide");
                    //回到本页
                    to_page(currentPage);
                }
            });
        });


        //单个删除
        $(document).on("click",".delete_btn",function (){
            //弹出是否确认删除的对话框，从0开始
            var bookName = $(this).parents("tr").find("td:eq(1)").text();
            var bookId = $(this).attr("del-id");
            if(confirm("确认删除【"+bookName+"】吗？")){
                $.ajax({
                    url:"book/"+bookId,
                    type:"DELETE",
                    success:function (result){
                        //alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });

        //全选、全不选
        $("#check_all").click(function (){
            //attr获取checked属性是undefined
            //attr主要是获取自定义的属性值
            //prop修改和读取dom属性的值
            //让全选的按钮的值来赋给单选框的值，就能实现全选、全不选
            //checked是属性名
            $(".check_item").prop("checked",$(this).prop("checked"));
        });

        $(document).on("click",".check_item",function (){
            //判断当前选择中的元素是否为当前页码的显示商品个数，
            //当本页面全部商品选中时，全选框也选中
            //   ：check选择器，可以得到选中的单选框
            //alert($(this).parents("tr").find("td:eq(6)").find("button:eq(1)").attr("del-id"));
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
        });

        //单击全部删除，就批量删除
        $("#book_delete_all_btn").click(function (){
            var bookNames ="";
            var del_idstr = "";
            $.each($(".check_item:checked"),function (){
                bookNames += $(this).parents("tr").find("td:eq(1)").text()+",";
                //有趣，前端的内容，只要你想得到，总归能得到的。加标签，加属性，遍历表单等等。哈哈
                //因为我没有在页面显示id信息，但是del-id标记了当前元素的id,那么就可以遍历得到，
                // 首先找到当前勾选框元素的父标签：tr标签，然后找到对应的这一行，
                // 然后在这一行里找第2个button，然后读取自定义的del-id值。
                del_idstr += $(this).parents("tr").find("td:eq(6)").find("button:eq(1)").attr("del-id")+"-";
                //$(this).parents("tr").find("td:eq(6)").attr("del-id")
            });

            //去除两个字符串最后多余的：， -
            bookNames = bookNames.substring(0,bookNames.length-1);
            del_idstr = del_idstr.substring(0,del_idstr.length-1);
            //alert(del_idstr);
            if(confirm("确认删除【"+del_idstr+"】吗？")){
                $.ajax({
                    url:"book/"+del_idstr,
                    type:"DELETE",
                    success:function (result){
                        alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });


    </script>

</body>
</html>

package com.company.crud.controller;

import com.company.crud.bean.Books;
import com.company.crud.bean.Msg;
import com.company.crud.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.RequestWrapper;
import java.util.ArrayList;
import java.util.List;

/**处理book的CRUD
 * @author jayzou
 * @create 2020-12-22 20:00
 */
@Controller
public class BooksController {

    @Autowired
    BookService bookService;

    @RequestMapping(value = "/book",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveBook(Books books){
        System.out.println(books);
        bookService.saveBook(books);
        return Msg.success();
    }


    @RequestMapping(value = "/book/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getBook(@PathVariable("id") Integer id){
        Books books = bookService.getBook(id);
        return Msg.success().add("books",books);
    }

    /**
     *
     *如果直接发送ajax=PUT形式的请求
     * 	 * 封装的数据
     * 	 * Employee
     * 	 * [empId=1014, empName=null, gender=null, email=null, dId=null]
     * 	 *
     * 	 * 问题：
     * 	 * 请求体中有数据；
     * 	 * 但是Employee对象封装不上；
     * 	 * update tbl_emp  where emp_id = 1014;
     * 	 *
     * 	 * 原因：
     * 	 * Tomcat：
     * 	 * 		1、将请求体中的数据，封装一个map。
     * 	 * 		2、request.getParameter("empName")就会从这个map中取值。
     * 	 * 		3、SpringMVC封装POJO对象的时候。
     * 	 * 				会把POJO中每个属性的值，利用request.getParamter("email")拿到;
     * 	 * AJAX发送PUT请求引发的血案：
     * 	 * 		PUT请求，请求体中的数据，request.getParameter("empName")拿不到
     * 	 * 		Tomcat一看是PUT，不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
     * 	 * org.apache.catalina.connector.Request--parseParameters() (3111);
     * 	 *
     * 	 * protected String parseBodyMethods = "POST";默认解析的时候，只看请求是否包含post字段
     * 	 * if( !getConnector().isParseBodyMethod(getMethod()) ) {
     *                 success = true;
     *                 return;
     *             }
     * 	 *
     * 	 *
     * 	 * 解决方案；
     * 	 *
     * 	 * 利用rest风格过滤器，HiddenHttpMenthodFilter，将普通的post请求，转为指定的delete或者put请求
     * 	 * 但是需要在ajax中type还是写成post，然后在data后面加上/method=PUT;
     * 	 *
     * 	 * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
     * 	 * 1、配置上HttpPutFormContentFilter；
     * 	 * 2、他的作用；将请求体中的数据解析包装成一个map。
     * 	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
     *
     *
     *
     * 更新商品信息
     * @param books
     * @return
     */
    @RequestMapping(value = "/book/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateBook(Books books){
        bookService.updateBooks(books);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/book/{ids}",method = RequestMethod.DELETE)
    public Msg deleteBook(@PathVariable("ids") String ids){
        //批量删除
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<Integer>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for(String str:str_ids){
                del_ids.add(Integer.parseInt(str));
            }
            bookService.deleteBooksBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            bookService.deleteBooks(id);
        }

        return Msg.success();
    }




    /**
     * 校验商品名称是否可用
     * @param bookName
     * @return
     */
    @RequestMapping("/checkBookName")
    @ResponseBody
    public Msg checkBookName(@RequestParam("bookName") String bookName){
        boolean b = bookService.checkBook(bookName);
        if(b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","商品名称重复");
        }

    }


    /**
     * 导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/books")
    @ResponseBody
    public Msg getBooksWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //引入分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage 后面紧跟的查询就是一个分页查询
        List<Books> books = bookService.getAll();
        //使用pageInfo 包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的页面信息，包括有我们查询的数据，传入连续显示的页数
        PageInfo page = new PageInfo(books,5);

        return Msg.success().add("pageInfo",page);
    }



    /**
     * 查询所有书籍(分页查询)
     * @return
     */

   // @RequestMapping("/books")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        //引入分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage 后面紧跟的查询就是一个分页查询
        List<Books> books = bookService.getAll();
        //使用pageInfo 包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的页面信息，包括有我们查询的数据，传入连续显示的页数
        PageInfo page = new PageInfo(books,5);
        model.addAttribute("pageInfo",page);

        return "views/list";
    }
}

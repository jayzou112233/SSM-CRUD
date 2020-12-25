package com.company.crud.controller;

import com.company.crud.bean.Books;
import com.company.crud.bean.Msg;
import com.company.crud.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.ws.RequestWrapper;
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

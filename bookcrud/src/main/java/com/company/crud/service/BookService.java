package com.company.crud.service;

import com.company.crud.bean.Books;
import com.company.crud.dao.BooksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author jayzou
 * @create 2020-12-22 20:07
 */
@Service
public class BookService {

    @Autowired
    BooksMapper booksMapper;

    /**
     * 查询所有书籍
     * @return
     */
    public List<Books> getAll() {

        return booksMapper.selectByExample(null);
    }

    public void saveBook(Books books) {
         booksMapper.insertSelective(books);

    }
}

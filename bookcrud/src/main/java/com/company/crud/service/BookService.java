package com.company.crud.service;

import com.company.crud.bean.Books;
import com.company.crud.bean.BooksExample;
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

    /**
     * 校验商品名称是否可用
     * @param bookName
     * @return
     */
    public boolean checkBook(String bookName) {
        //
        BooksExample booksExample = new BooksExample();
        //利用example中的criteria去拼装sql查询
        BooksExample.Criteria criteria = booksExample.createCriteria();
        criteria.andNameEqualTo(bookName);
        long count = booksMapper.countByExample(booksExample);
        return count == 0;

    }

    public Books getBook(Integer id) {
        Books books = booksMapper.selectByPrimaryKey(id);
        return books;
    }

    public void updateBooks(Books books) {
        booksMapper.updateByPrimaryKeySelective(books);
    }

    public void deleteBooksBatch(List<Integer> del_ids) {
        BooksExample example = new BooksExample();
        BooksExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        booksMapper.deleteByExample(example);
    }

    public void deleteBooks(Integer id) {
        booksMapper.deleteByPrimaryKey(id);
    }
}

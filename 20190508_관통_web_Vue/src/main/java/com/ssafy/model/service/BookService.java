/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Book;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public interface BookService {
	int insert(Book book);

	int update(Book book);

	int delete(String isbn);

	Book select(String isbn);

	List<Book> selectAll();

}

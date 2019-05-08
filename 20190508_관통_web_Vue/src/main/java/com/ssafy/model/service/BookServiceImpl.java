/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Book;
import com.ssafy.model.repository.BookRepository;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public class BookServiceImpl implements BookService {

	private BookRepository bookRepo;

	public BookServiceImpl(BookRepository repo) {
		bookRepo = repo;
	}

	@Override
	@Transactional
	public int insert(Book book) {
		return bookRepo.insert(book);
	}

	@Override
	@Transactional
	public int update(Book book) {
		return bookRepo.update(book);
	}

	@Override
	@Transactional
	public int delete(String isbn) {
		return bookRepo.delete(isbn);
	}

	@Override
	public Book select(String isbn) {
		return bookRepo.select(isbn);
	}

	@Override
	public List<Book> selectAll() {
		return bookRepo.selectAll();
	}

}

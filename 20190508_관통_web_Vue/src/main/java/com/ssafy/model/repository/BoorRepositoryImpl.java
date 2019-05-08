package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Book;

@Repository
public class BoorRepositoryImpl implements BookRepository {
	private static final Logger logger = LoggerFactory.getLogger(BoorRepositoryImpl.class);

	private static final String ns = "com.ssafy.model.mapper.Book.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(Book book) {
		String statement = ns + "insert";
		return template.insert(statement, book);
	}

	@Override
	public int update(Book book) {
		String statement = ns + "update";
		return template.update(statement, book);
	}

	@Override
	public int delete(String isbn) {
		String statement = ns + "delete";
		return template.delete(statement, isbn);
	}

	@Override
	public Book select(String isbn) {
		String statement = ns + "select";
		return template.selectOne(statement, isbn);
	}

	@Override
	public List<Book> selectAll() {
		String statement = ns + "selectAll";
		return template.selectList(statement);
	}
}

package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Book;
import com.ssafy.model.service.BookService;

@RestController
public class RestApiController {

	private static final Logger logger = LoggerFactory.getLogger(RestApiController.class);
	private static final String OK = "SUCCESS";
	private static final String FAIL = "FAIL";
	@Autowired
	BookService service;

	@GetMapping("/session/book")
	public Map<String, Object> getAllBooks() {
		Map<String, Object> map = new HashMap<>();
		try {
			List<Book> list = service.selectAll();
			map.put("status", OK);
			map.put("data", list);
		} catch (Exception e) {
			logger.error("도서 목록 조회 실패", e);
			map.put("status", FAIL);
			map.put("msg", e.getMessage());
		}
		return map;
	}

	@GetMapping(value="/session/book/{isbn}" )
	public Map<String, Object> getBook(@PathVariable String isbn) {
		logger.trace("getBook: {}", isbn);
		Map<String, Object> map = new HashMap<>();
		try {
			Book book = service.select(isbn);
			map.put("status", OK);
			map.put("data", book);
		} catch (Exception e) {
			logger.error("도서 조회 실패", e);
			map.put("status", FAIL);
			map.put("msg", e.getLocalizedMessage());
		}
		return map;
	}

	@PostMapping("/session/book")
	public Map<String, Object> insertBook(@RequestBody Book book) {
		logger.trace("post: {}", book);
		Map<String, Object> map = new HashMap<>();
		try {
			service.insert(book);
			map.put("status", OK);
			map.put("data", service.selectAll());
		} catch (Exception e) {
			logger.error("도서 추가 실패", e);
			map.put("status", FAIL);
			map.put("msg", e.getLocalizedMessage());
		}
		return map;
	}

	@PutMapping("/session/book/{isbn}")
	public Map<String, Object> updateBook(@RequestBody Book book, @PathVariable String isbn) {
		logger.trace("put: {}, {}", book, isbn);
		Map<String, Object> map = new HashMap<>();
		try {
			service.update(book);
			map.put("status", OK);
			map.put("data", service.selectAll());
		} catch (Exception e) {
			logger.error("도서 수정 실패", e);
			map.put("status", FAIL);
			map.put("msg", e.getLocalizedMessage());
		}
		return map;
	}

	@DeleteMapping("/session/book/{isbn}")
	public Map<String, Object> deleteBook(@PathVariable String isbn) {
		logger.trace("deleteBook: {}", isbn);
		Map<String, Object> map = new HashMap<>();
		try {
			service.delete(isbn);
			map.put("status", OK);
			map.put("data", service.selectAll());
		} catch (Exception e) {
			logger.error("도서 삭제 실패", e);
			map.put("status", FAIL);
			map.put("msg", e.getLocalizedMessage());
		}
		return map;
	}
}

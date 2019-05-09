package com.ssafy.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.aBoard;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.qBoard;
import com.ssafy.model.service.aBoardService;
import com.ssafy.model.service.qBoardService;

@RestController
public class RestApiController {

	private static final String OK = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	aBoardService aservice;
	
	@Autowired
	qBoardService qservice;

	@GetMapping("/getboards")
	public ResponseEntity<List<qBoard>> getAllqBoard() {
		List<qBoard> l = qservice.selectAll();
		System.out.println(l);
		return new ResponseEntity<List<qBoard>>(qservice.selectAll(), HttpStatus.OK);
	}
	

	@GetMapping("/getAnswers")
	public ResponseEntity<List<aBoard>> getAllaBoard() {
		List<aBoard> l = aservice.selectAll();
		System.out.println(l);
		return new ResponseEntity<List<aBoard>>(aservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/addQuestion")
	public ResponseEntity<String> addQuestion(@RequestBody qBoard qboard,HttpSession session) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Member m = (Member)session.getAttribute("user");
		qboard.setUserid(m.getId());
		qboard.setState(false);
		qboard.setDate(format.format(date));
		System.out.println(qboard);
		qservice.insert(qboard);
		System.out.println("추가완료");
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	/*
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
	}*/
}

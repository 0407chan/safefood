package com.ssafy.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.aBoard;
import com.ssafy.model.dto.qBoard;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.aBoardService;
import com.ssafy.model.service.qBoardService;

@RestController
public class RestApiController {

	private static final String OK = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	FoodService fservice;
	
	@Autowired
	aBoardService aservice;
	
	@Autowired
	qBoardService qservice;
	
	@GetMapping("/getboards")
	public ResponseEntity<List<qBoard>> getAllqBoard() {
		return new ResponseEntity<List<qBoard>>(qservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/getAnswers")
	public ResponseEntity<List<aBoard>> getAllaBoard() {
		return new ResponseEntity<List<aBoard>>(aservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/getFoods")
	public ResponseEntity<List<Food>> getAllFood() {
		return new ResponseEntity<List<Food>>(fservice.selectAll(), HttpStatus.OK);
	}
	
	@GetMapping("/findFoods/{name}")
	public ResponseEntity<List<Food>> findFoods(@PathVariable String name, HttpSession session){
		String s[] = name.replace("name=", "").replace("searchField=", "").split("&");
		List<Food> foods = null; 
		switch(s[1]) {
		case "whole":
			foods = fservice.searchAll(s[0].trim());
			break;
		case "name":
			foods = fservice.searchByName(s[0].trim());
			break;
		case "maker":
			foods = fservice.searchByMaker(s[0].trim());
			break;
		case "material":
			foods = fservice.searchByMaterial(s[0].trim());
			break;
		}
		
		return new ResponseEntity<List<Food>>(foods, HttpStatus.OK);
	}
	
	
/*	@PostMapping("/answerAddUI")
	public ResponseEntity<String> answerAddUI(@RequestBody aBoard aboard) {
		System.out.println(aboard);
		System.out.println("추가하러감");
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
*/	
	
	@PostMapping("/addAnswer")
	public ResponseEntity<String> addAnswer(@RequestBody aBoard aboard, HttpSession session) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Member m = (Member)session.getAttribute("user");
		qBoard qboard = qservice.select(aboard.getIdx());
		aboard.setUserid(m.getId());
		qboard.setState(true);
		aboard.setDate(format.format(date));
		qservice.update(qboard);
		aservice.insert(aboard);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/updateQuestion")
	public ResponseEntity<String> updateQuestion(@RequestBody qBoard qboard,HttpSession session) {
		int index = qboard.getIdx();
		qBoard q = qservice.select(index);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		q.setContent(qboard.getContent());
		q.setDate(format.format(date));
		
		qservice.update(q);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/addQuestion")
	public ResponseEntity<String> addQuestion(@RequestBody qBoard qboard,HttpSession session) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Member m = (Member)session.getAttribute("user");
		qboard.setUserid(m.getId());
		qboard.setState(false);
		qboard.setDate(format.format(date));
		qservice.insert(qboard);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteQuestion/{idx}")
	public ResponseEntity<String> deleteQuestion(@PathVariable int idx) {
		if(aservice.select(idx) != null)
			aservice.delete(idx);
		qservice.delete(idx);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteAnswer/{idx}")
	public ResponseEntity<String> deleteAnswer(@PathVariable int idx) {
		qBoard qboard = qservice.select(idx);
		qboard.setState(false);
		qservice.update(qboard);
		aservice.delete(idx);
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

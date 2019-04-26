package com.ssafy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.dto.Food;
import com.ssafy.model.service.FoodService;

@Controller
public class MainController {
	
	@Autowired
	FoodService service;
	
	@GetMapping("/index")
	public String mainForm(Model model) {
		return "../../index";
	}
	
	@GetMapping("/main")
	public String getmainForm(Model model) {
		service.loadData();
		
		List<Food> foods = service.selectAll();
		model.addAttribute("foods",foods);
		return "main/main";
	}
	
	
	@GetMapping("/foodadd")
	public String foodAddForm(Model model) {
		return "foodadd";
	}
	
	@GetMapping("/foodlist")
	public String foodListForm(Model model) {
		return "foodlist";
	}
	
	@PostMapping("foodAddAction")
	public String foodAddAction(Model model, Food p) {
		System.out.println(p + "잘 넣었다.");
		model.addAttribute("msg","물품이 등록 되었습니다.");
		service.insert(p);
		return "result";
	}
	
	@PostMapping("/food/search")
	public String booksearch(Model model,String searchField, String searchText) {
		List<Food> foods = null; 
		System.out.println(searchField+" "+searchText);
		switch(searchField) {
		case "whole":
			foods = service.selectAll();
			break;
		case "name":
			foods = service.searchByName(searchText);
			break;
		case "maker":
			foods = service.searchByMaker(searchText);
			break;
		case "material":
			foods = service.searchByMaterial(searchText);
			break;
		}
		model.addAttribute("foods", foods);
		return "main/main";
	}
	
	@GetMapping("/food/foodview")
	public String foodviewForm(Model model, int code) {
		Food food = service.select(code);
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	@RequestMapping("/main/main")
	public String main(Model model) { //기본페이지로 이동
		return "main/main";
	}
	
	@RequestMapping("/member/memberInfo")
	public String memberInfo(Model model) { //멤버정보 페이지로 이동
		return "member/memberInfo";
	}
	
	@RequestMapping("/member/memberInsert")
	public String memberInsert(Model model) { //멤버등록 페이지로 이동
		return "member/memberInsert";
	}
	
	@RequestMapping("/main/memberinsertaction")
	public String memberInsertAction(Model model) {	//멤버를 등록
		
		return "member/memberInsert";
	}
	
	@RequestMapping("/login/login")
	public String login(Model model) { //로그인
		return "member/memberInsert";
	}
	
	@RequestMapping("/login/logout")
	public String logout(Model model,HttpSession session) { //로그아웃
		if(session!=null) {
			session.invalidate();
		}
//			temp = sv.listFoods();
//		} catch (FoodException e) {
//			request.setAttribute("msg",e.getMessage());
//			에러페이지로 가거나
//		}
//		model.setAttribute("foods", temp);
		return "main/main";
	}
}


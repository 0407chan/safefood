package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
}

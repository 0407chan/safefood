package com.ssafy.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	FoodService service;
	
	@Autowired
	MemberService mService;
	
	@GetMapping("/index")
	public String mainForm(Model model) {
		List<Food> foods = service.selectAll();
		model.addAttribute("foods",foods);
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
	public String foodviewForm(Model model, int code,HttpSession session) {
		Food food = service.select(code);
		System.out.println(food);
		System.out.println("되었느냐");
		if(session.getAttribute("user")!=null) {
			Member m = (Member) session.getAttribute("user");
			System.out.println(m);
			String alg[] = m.getAllergy().split(",");
			System.out.println(Arrays.toString(alg));
			String str="";
			for(int i=0;i<alg.length;i++) {
				if(food.getMaterial().contains(alg[i])) {
					str+=alg[i];
				}
			}
			System.out.println(str);
			model.addAttribute("foodA",str);
		}
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	@PostMapping("/memberModify")
	public String memberModify(Model model, Member m) {
		mService.update(m);
		List<Food> foods = service.selectAll();
		System.out.println(m.getAllergies());
		model.addAttribute("foods",foods);
		return "main/main";
	}
	
	@GetMapping("/memberDelete")
	public String memberDelete(Model model,HttpSession session, String id) {
		mService.delete(id);
		List<Food> foods = service.selectAll();
		if(session!=null) {
			session.invalidate();
		}
		model.addAttribute("foods",foods);
		return "main/main";
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
	
	@RequestMapping("/member/memberinsertaction")
	public String memberInsertAction(Model model, Member m) {	//멤버를 등록
		mService.insert(m);
		model.addAttribute("msg","회원가입이 완료되었습니다. 로그인 해주세요.");
		return "login/login";
	}
	
	@RequestMapping("/login/login")
	public String login(Model model) { //로그인
		return "login/login";
	}
	
	@PostMapping("loginAction")
	public String loginAction(Model model, HttpSession session, String id, String pw) {
		if(id.length() == 0) {
			model.addAttribute("msg","아이디를 입력해주세요.");
			return "login/login";
		}else {
			if(pw.length() == 0) {
				model.addAttribute("msg","비밀번호를 입력해주세요.");
				return "login/login";
			}
		}
		System.out.println(mService.select(id));
		
		if(mService.select(id) == null) {
			model.addAttribute("msg","존재하지 않는 id 입니다.");
			return "login/login";
		}else {
			if(!mService.select(id).getPw().equals(pw)) {
				model.addAttribute("msg","잘못 된 pw 입니다.");
				return "login/login";
			}else {
				session.setAttribute("user", mService.select(id));
				List<Food> foods = service.selectAll();
				model.addAttribute("foods",foods);
				return "main/main";
			}
		}
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


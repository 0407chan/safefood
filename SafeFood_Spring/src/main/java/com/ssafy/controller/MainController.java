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
import com.ssafy.model.repository.memberExecption;
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
		model.addAttribute("msg","물품이 등록 되었습니다.");
		service.insert(p);
		return "result";
	}
	
	@PostMapping("/food/search")
	public String booksearch(Model model,String searchField, String searchText) {
		List<Food> foods = null; 
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
//		Member m = (Member) session.getAttribute("user");
//		String alg[] = m.getAllergy().split(",");
//		System.out.println(Arrays.toString(alg));
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	@PostMapping("/memberModify")
	public String memberModify(Model model, Member m,HttpSession session) {
		mService.update(m);
		Member t = (Member) session.getAttribute("user");
		t.setAllergy(m.getAllergy());
		session.setAttribute("user", t);
		List<Food> foods = service.selectAll();
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
		model.addAttribute("msg","");
		return "member/memberInsert";
	}
	
	@RequestMapping("/member/memberinsertaction")
	public String memberInsertAction(Model model, Member m) {	//멤버를 등록
		try {
			mService.insert(m);
			model.addAttribute("msg","회원가입이 완료되었습니다. 로그인 해주세요.");
			return "login/login";
		} catch (memberExecption e) {
			model.addAttribute("msg","["+m.getId()+"]는 이미 있는 아이디 입니다.");
			return "member/memberInsert";
		}
		
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
		
		if(mService.select(id) == null) {
			model.addAttribute("msg","["+id+"]는 존재하지 않는 아이디입니다.");
			return "login/login";
		}else {
			if(!mService.select(id).getPw().equals(pw)) {
				model.addAttribute("msg","잘못 된 비밀번호입니다.");
				return "login/login";
			}else {
				session.setAttribute("user", mService.select(id));
				List<Food> foods = service.selectAll();
				model.addAttribute("foods",foods);
				return "main/main";
			}
		}
	}
	
	@GetMapping("/findPW")
	public String findPassword(Model model) {
		return "login/findpassword";
	}
	
	@PostMapping("/findpasswordAction")
	public String findpasswordAction(Model model, String id, String name) {
		if(id.length() == 0) {
			model.addAttribute("msg","아이디를 입력해주세요.");
			return "login/findpassword";
		}else {
			if(name.length() == 0) {
				model.addAttribute("msg","이름을 입력해주세요.");
				return "login/findpassword";
			}
		}
		
		if(mService.select(id) == null) {
			model.addAttribute("msg","["+id+"]는 존재하지 않는 아이디입니다.");
			return "login/findpassword";
		}else {
			if(!mService.select(id).getName().equals(name)) {
				model.addAttribute("msg","이름이 일치하지 않습니다.");
				return "login/findpassword";
			}else {
				model.addAttribute("msg","회원님의 비밀번호는 ["+mService.select(id).getPw()+"] 입니다.");
				return "login/login";
			}
		}
	}
	
	@RequestMapping("/login/logout")
	public String logout(Model model,HttpSession session) { //로그아웃
		if(session!=null) {
			session.invalidate();
		}
		List<Food> foods = service.selectAll();
		model.addAttribute("foods",foods);
		return "main/main";
	}
}


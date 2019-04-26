package com.ssafy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
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
//		List<Food> temp=null;
//		try {
//			temp = sv.listFoods();
//		} catch (FoodException e) {
//			request.setAttribute("msg",e.getMessage());
//			에러페이지로 가거나
//		}
//		model.setAttribute("foods", temp);
		return "main/main";
		// 메인페이지로 가야함
	}
	
}














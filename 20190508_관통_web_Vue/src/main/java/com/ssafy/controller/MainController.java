package com.ssafy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.service.UserService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	UserService service;

	@GetMapping("/join")
	public String joinForm(Model model) {
		return "user/joinform";
	}

	@PostMapping("/join")
	public String join(Model model, RedirectAttributes redir, UserInfo info) {
		int result = service.joinDayTime(info);
		logger.trace("join: {}", result);
		redir.addFlashAttribute("alarm", "가입 성공, 로그인 후 사용");
		return "redirect:login";
	}

	@GetMapping("/login")
	public String loginForm(Model model, @CookieValue(required = false) String loginUser, HttpSession session) {
		logger.trace("login cookie: {}", loginUser);
		if (loginUser != null) {
			UserInfo info = service.select(loginUser);
			session.setAttribute("loginUser", info);
			return "session/main";
		} else {
			return "user/loginform";
		}
	}

	@PostMapping("/login")
	public String login(Model model, UserInfo info, HttpServletResponse res, HttpSession session) {
		logger.trace("info: {}", info);
		UserInfo result = service.login(info.getUserId(), info.getPassword());
		if (result != null) {
			Cookie cookie = new Cookie("loginUser", result.getUserId());
			cookie.setPath("/");
			cookie.setMaxAge(60 * 2);
			res.addCookie(cookie);
			session.setAttribute("loginUser", result);
			return "redirect:/session/main";
		} else {
			return "redirect:login";
		}
	}

	@GetMapping("/session/main")
	public String main(Model model) {
		return "session/main";
	}

	@GetMapping("/session/modify")
	public String modifyForm(Model model) {
		return "session/modifyform";
	}

	@PostMapping("/session/modify")
	public String modify(Model model, RedirectAttributes redir, UserInfo info, HttpSession session) {
		service.updateDayTime(info);
		session.setAttribute("loginUser", info);
		redir.addFlashAttribute("alarm", "수정성공");
		return "redirect:/session/main";
	}

	@GetMapping("/session/logout")
	public String logout(HttpServletResponse res, HttpSession session) {
		Cookie cookie = new Cookie("loginUser", "some");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		res.addCookie(cookie);
		session.invalidate();
		logger.trace("logout, {}", cookie);
		return "redirect:/login";
	}

	@ExceptionHandler(RuntimeException.class)
	public ModelAndView exceptionParameter(RuntimeException e, HttpServletRequest req) {
		Map<String, String> model = new HashMap<>();
		model.put("info", e.getMessage());
		ModelAndView mav = new ModelAndView("error/servererror", model);
		return mav;
	}
}

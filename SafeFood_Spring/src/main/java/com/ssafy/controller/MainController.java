package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.ExpFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.getAte;
import com.ssafy.model.repository.memberExecption;
import com.ssafy.model.service.AteFoodService;
import com.ssafy.model.service.BoardService;
import com.ssafy.model.service.ExpFoodService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;
import com.ssafy.model.service.qBoardService;

@Controller
public class MainController {
	
	@Autowired
	FoodService service;
	
	@Autowired
	MemberService mService;
	
	@Autowired
	AteFoodService afService;
	
	@Autowired
	BoardService bService;
	
	@Autowired
	qBoardService qservice;
	
	@Autowired
	ExpFoodService expservice;
	
	
	/**   Main으로 이동    */
	
	
	@GetMapping("/index")
	public String mainForm(Model model) {
		List<Food> foods = service.selectAll();
		model.addAttribute("foods",foods);
		return "../../index";
	}
	
	@GetMapping("/main")
	public String getmainForm(HttpSession session, Model model) {
		service.loadData();
		session.setAttribute("curr", "foodlist");
		return "main/main2";
	}
	
	@RequestMapping("/main/main2")
	public String main(Model model) { //기본페이지로 이동
		return "main/main2";
	}
	
	
	/**   QNA    */
	
	
	@GetMapping("/qna")
	public String qboardUI() {
		return "/qna/qna";
	}
	
	@GetMapping("/qna/view")
	public String qboardViewUI(Model model,int idx) {
		model.addAttribute("idx",idx);
		model.addAttribute("state","questionModify");
		return "/qna/qnaView";
	}
	
	@GetMapping("/addQuestion")
	public String addQuestionUI(Model model) {
		model.addAttribute("state","questionAdd");
		return "qna/qnaInsert";
	}
	
	@GetMapping("/answerModify")
	public String answerModify(Model model,int idx) {
		model.addAttribute("idx",idx);
		model.addAttribute("state","answerModify");
		return "/qna/qnaView";
	}
	
	@GetMapping("/answerAddUI")
	public String answerAddUI(Model model,String idx) {
		model.addAttribute("idx",idx);
		model.addAttribute("state","answerAdd");
		return "qna/qnaInsert";
	}
	
	
	
	/**   베스트 섭취 정보   */
	
	
	
	@GetMapping("/bestFoodForm")
	public String bestFoodForm() {
		return "food/bestfood";
	}
	
	
	
	/**   공지사항    */
	
	@GetMapping("/boardUI")
	public String board(Model model,HttpSession session) {
		List<Board> boards= bService.selectAll();
		model.addAttribute("boards",boards);
		return "main/board";
	}
	
	@GetMapping("/board/insert")
	public String boardinsert() {
		return "main/boardinsert";
	}
	
	@PostMapping("/board/insertaction")
	public String boardInsertAction(Model model,HttpSession session,String content,String title) {
		if(session.getAttribute("user")!=null) {
			Member m = (Member) session.getAttribute("user");
			if(m.getId().equals("admin")) {
				bService.insert(new Board(title,content,m.getId()));
			}
		}
		List<Board> boards= bService.selectAll();
		model.addAttribute("boards",boards);
		return "main/board";
	}
	
	@PostMapping("/board/update")
	public String boardupdate(Model model,Board board,HttpSession session) {
		Member m = (Member) session.getAttribute("user");
		if(m.getId().equals("admin")) {
			bService.update(board);
		}else {
			System.out.println("관리자가 아니면 수정이 불가능합니다.");
		}
		List<Board> boards= bService.selectAll();
		model.addAttribute("boards",boards);
		return "main/board";
	}
	
	@GetMapping("/board/delete")
	public String boarddelete(Model model,int idx,HttpSession session) {
		if(session!=null) {
			Member m = (Member) session.getAttribute("user");
			Board b = bService.select(idx);
			if(m.getId().equals("admin")) {
				bService.delete(idx);
			}
			List<Board> boards= bService.selectAll();
			model.addAttribute("boards",boards);
		}
		return "main/board";
	}
	
	@GetMapping("/board/view")
	public String boardview(Model model,int idx) {
		Board b = bService.select(idx);
		model.addAttribute("board",b);
		return "main/boardview";
	}
	
	
	
	/**   로그인    */
	
	
	
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
			model.addAttribute("msg","존재하지 않는 id 입니다.");
			return "login/login";
		}else {
			if(!mService.select(id).getPw().equals(pw)) {
				model.addAttribute("msg","잘못 된 pw 입니다.");
				return "login/login";
			}else {
				session.setAttribute("user", mService.select(id));
				return "../../index"; 
			}
		}
	}
	
	@RequestMapping("/login/logout")
	public String logout(Model model,HttpSession session) { //로그아웃
		if(session!=null) {
			session.invalidate();
		}
		service.loadData();
		return "../../index";
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
				return "login/findpassword";
			}
		}
	}
	
	
	
	/**    식품 관리       */
	
	
	
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
	
	@GetMapping("/food/foodview")
	public String foodviewForm(Model model, int code,HttpSession session) {
		Food food = service.select(code);
		int count = food.getCount();
		count++;
		food.setCount(count);
		service.update(food);
		String[] allergys={"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};		
		ArrayList<String> alglist = new ArrayList<>();
		for(int i=0;i<allergys.length;i++) {
			if(food.getMaterial().contains(allergys[i])) {
				alglist.add(allergys[i]);
			}
		}
		if(session.getAttribute("user")!=null) {
			Member m = (Member) session.getAttribute("user");
			if(m.getAllergy().length() > 0) {
				model.addAttribute("foodmyA",m.getAllergy());
			}
		}
		if(alglist.size()!=0) {
			String list[] = new String[alglist.size()];
			for(int i=0;i<list.length;i++) {
				list[i]=alglist.get(i);
			}
			model.addAttribute("foodA",list);
		}
		model.addAttribute("msg","");
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	@GetMapping("tofoodinfo")
	public String tofoodinfo() {
		return "food/foodinfo";
	}
	
	
	
	/**    회원 관리       */
	
	@RequestMapping("/member/memberInsert")
	public String memberInsert(Model model) { //멤버등록 페이지로 이동
		return "member/memberInsert";
	}
	
	@RequestMapping("/member/memberinsertaction")
	public String memberInsertAction(Model model, Member m) {	//멤버를 등록
		try {
			mService.insert(m);
			return "../../index";
		} catch (memberExecption e) {
			model.addAttribute("msg","["+m.getId()+"]는 이미 있는 아이디 입니다.");
			return "member/memberInsert";
		}
	}
	
	@PostMapping("/memberModify")
	public String memberModify(Model model, Member m,HttpSession session, String allergy) {
		Member t = (Member) session.getAttribute("user");
		t.setAllergy(m.getAllergy());
		t.setName(m.getName());
		t.setPw(m.getPw());
		mService.update(m);
		return "../../index";
	}
	
	@GetMapping("/memberDelete")
	public String memberDelete(Model model,HttpSession session, String id) {
		mService.delete(id);
		if(session!=null) {
			session.invalidate();
		}
		service.loadData();
		return "../../index";
	}
	
	@RequestMapping("/member/memberInfo")
	public String memberInfo(Model model, HttpSession session) { //멤버정보 페이지로 이동
		return "member/memberInfo";
	}
	
	
	
	/**   섭취 식품 관리    */
	
	
	@GetMapping("/atefoodform")
	public String atefoodform(Model model, HttpSession session){
		if(session==null) {
			session.invalidate();
			return "../../index";
		}else {
			return "food/atefood";
		}
	}
	
	@PostMapping("/addAteFood")
	public String addAteFood(Model model, int code, int number , HttpSession session) {
		Food food = service.select(code);
		Member m = (Member) session.getAttribute("user");
		String date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		int t = food.getAtecount();
		food.setAtecount(t + number);
		 
		service.updateAteCount(food);
		afService.insert(new AteFood(0,code,number,m.getId(),date));
		model.addAttribute("msg", service.select(code).getName()+" "+number+"개를 내 섭취 정보에 저장했습니다");
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	
	@PostMapping("/atefood/search")
	public String atefoodsearch(Model model,HttpSession session, String searchField, String searchText) {
		Member m = (Member) session.getAttribute("user");
		String date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		List<getAte> foods = new ArrayList<>();
		List<AteFood> f = new ArrayList<>();
		switch(searchField) {
		case "whole":
			f = afService.selectAll(m.getId());
			break;
		case "today":
			f = afService.searchByToday(date);
			break;
		case "day":
			f = afService.searchByDay(searchText);
			break;
		case "month":
			f = afService.searchByMonth(searchText);
			break;
		case "year":
			f = afService.searchByYear(searchText);
			break;
		}
		
		for (int i = 0; i < f.size(); i++) {
			if(f.get(i).getId().equals(m.getId())) {
				Food food = service.select(f.get(i).getCode());
				foods.add(new getAte(f.get(i).getAtekey(), food.getCode(), food.getImg(), food.getName(), f.get(i).getNum(), f.get(i).getDate()));  
			}
		}
		Collections.sort(foods, new Comparator<getAte>() {
			@Override
			public int compare(getAte o1, getAte o2) {
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		model.addAttribute("foods", foods);
		return "food/atefood";
	}
	
	
	
	/**  예상 섭취 관리   */
	
	
	
	@GetMapping("/addExpFood")
	public String addExpFood(Model model, int code, int number , HttpSession session) {
		Food food = service.select(code);
		Member m = (Member) session.getAttribute("user");
		
		if(expservice.select(code) == null)
			expservice.insert(new ExpFood(code,number,m.getId()));
		else {
			ExpFood f = expservice.select(code);
			int ft = f.getNum();
			f.setNum(ft + number);
			expservice.update(f);
		}
		
		model.addAttribute("msg", service.select(code).getName()+" "+number+"개를 예상 섭취 정보에 저장했습니다");
		model.addAttribute("food",food);
		return "food/foodinfo";
	}
	
	@GetMapping("/expfoodform")
	public String expfoodform(Model model, HttpSession session){
		if(session==null) {
			session.invalidate();
			return "../../index";
		}else {
			return "food/expfood";
		}
	}
	
}

